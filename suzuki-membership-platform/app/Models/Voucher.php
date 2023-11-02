<?php

namespace App\Models;

use Awobaz\Mutator\Mutable;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\ImageManagerStatic as Image;


class Voucher extends BaseModel
{
    use CrudTrait;
    use HasFactory;
    use SoftDeletes;

    use Mutable;

    protected $fillable = [
    	'vehicle_types',
        'name',
        'vendor_id',
        'description',
        'intro',
        'image',
        'valid_duration',
        'price',
        'discount_type',
        'discount_amount',
        'quantity',
        'max_per_customer',
        'is_active',
        'remain',
        'type',
        'applicable_at',
        'code_prefix',
        'code_length',
        'expiry_date',
        'limit_mode',
    ];

    protected $dates = ['expiry_date'];

    protected $mutators = [
        'image' => 'setImage',
    ];

    public function vendor()
    {
        return $this->belongsTo('App\Models\Vendor');
    }

    public function voucherCodes()
    {
        return $this->hasMany('App\Models\VoucherCode');
    }

    public function dealer()
    {
        return $this->belongsTo('App\Models\Dealer');
    }

    public function orders()
    {
        return $this->hasManyThrough('App\Models\Order', 'App\Models\VoucherCode');
    }

    public function createVoucherCode()
    {
        $user = Auth::getUser()->customer;
        $customer = $user;
        if ($this->type === config('constants.voucher.type_internal')) { //This voucher generates code automatically
            $code = $this->genCode();
            $voucherCode = $this->voucherCodes()->create([
                'customer_id'  => $customer->id,
                'purchased_at' => now(),
                'start_date'   => now(),
                'end_date'     => $this->expiry_date ?? now()->addDays($this->valid_duration)->endOfDay(),
                'status'       => config('constants.voucher_code.status_new'),
                'code'         => $code,
            ]);
        } else {
            try {
                $voucherCode = $this->voucherCodes()->where('status',
                    config('constants.voucher_code.status_imported'))->orderBy('id')->firstOrFail();
                $voucherCode->customer_id = $customer->id;
                $voucherCode->purchased_at = now();
                $voucherCode->start_date = now();
                $voucherCode->end_date = $this->expiry_date ?? now()->addDays($this->valid_duration)->endOfDay();
                $voucherCode->status = config('constants.voucher_code.status_new');
                $voucherCode->save();

            } catch (ModelNotFoundException $ex) {
                return false;
            }

        }

        if ($voucherCode !== false) { //Successfully save code to DB

            // Create history for this transaction
            $transaction = new PointHistory([
                'type'            => Config::get('constants.point_history_type.buy_voucher'),
                'amount'          => -$this->price,
                'customer_id'     => $customer->id,
                'voucher_code_id' => $voucherCode->id
            ]);
            $transaction->save();

            return true;
        } else {
            return false;
        }

    }

    public function genCode()
    {
        $code = $this->code_prefix ?? $this->id.'S';
        $code .= empty($this->code_length) ? Str::random(config('constants.voucher.default_code_length')) : Str::random($this->code_length);
        if (VoucherCode::where('code', $code)->count()) {
            $this->genCode();
        } else {
            return $code;
        }
    }

    public function typeToText()
    {
        if ($this->type) {
            return __('common.voucher_type_'.$this->type);
        } else {
            return __('common.voucher_type_1');
        }
    }

    public function discountTypeToText()
    {
        return __('common.voucher_discount_type_'.$this->type);
    }

    public function recountCode()
    {
        if ($this->type == config('constants.voucher.type_external')) {
            // Count only if this voucher has pre-imported voucher codes, otherwise get from database.
            $this->quantity = $this->voucherCodes()->count();
        }
        $this->remain = $this->quantity - ($this->voucherCodes()->whereNotNull('purchased_at')->count());
        $this->save();
    }

    public function applyPlaceToText()
    {
        switch ($this->applicable_at) {
            case config('constants.voucher.apply_all'):
//                return __('common.voucher_apply_all');
                return 'Suzuki World, Số 02 Phổ Quang, Phường 2, Tân Bình, TP.HCM';
            case config('constants.voucher.apply_dealer'):
//                return __('common.voucher_apply_dealer');
                return 'Suzuki World, Số 02 Phổ Quang, Phường 2, Tân Bình, TP.HCM';
            case config('constants.voucher.apply_external'):
                return __('common.voucher_apply_external');
        }
    }

    public function limitToText()
    {
        if (!$this->limit_mode) {
            $string = 'Không giới hạn';
        } else {
            $string = $this->max_per_customer.' lần';
            switch ($this->limit_mode) {
                case config('constants.voucher.limit_mode.monthly') :
                    $string .= ' mỗi tháng';
                    break;
                case config('constants.voucher.limit_mode.quarterly') :
                    $string .= ' mỗi quý';
                    break;
                case config('constants.voucher.limit_mode.yearly') :
                    $string .= ' mỗi năm';
                    break;
            }
        }
        return $string;
    }

    public function importButton($crud = false)
    {
        return '<a class="btn btn-secondary btn-sm">Hello</a>';
    }

}
