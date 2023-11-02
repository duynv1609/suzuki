<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class VoucherCode extends BaseModel
{
    use CrudTrait;
    use SoftDeletes;

    protected $keyType = 'string';

    protected $fillable = [
        'customer_id',
        'purchased_at',
        'start_date',
        'end_date',
        'status',
        'code',
        'voucher_id',
        'applied_at',
        'dealer_id',
        'note'
    ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'purchased_at',
        'start_date',
        'end_date',
        'applied_at'
    ];


    public function voucher()
    {
        return $this->belongsTo('App\Models\Voucher');
    }

    public function pointHistory()
    {
        return $this->hasOne('App\Models\PointHistory');
    }

    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

    public function dealer()
    {
        return $this->belongsTo('App\Models\Dealer');
    }

    public function order()
    {
        return $this->belongsTo('App\Models\Order');
    }

    public function generate($voucherId, $userId, $duration)
    {

    }

    public function statusToText()
    {
        return __('common.voucher_code_status_'.$this->status);
    }

    public function statusToLabel()
    {
        switch ($this->status) {
            case config('constants.voucher_code.status_imported'):
                $class = 'secondary';
                break;
            case config('constants.voucher_code.status_new'):
                $class = 'success';
                break;
            case config('constants.voucher_code.status_used'):
                $class = 'info';
                break;
            case config('constants.voucher_code.status_expired'):
                $class = 'light';
                break;
            default:
                $class = '';
        }
        return "<span class=\"badge badge-$class\">{$this->statusToText()}</span>";
    }

    public function markAsUsed()
    {
        $this->status = config('constants.voucher_code.status_used');
        $this->applied_at = now();
    }

    public function isUsable()
    {
        if ($this->status == config('constants.voucher_code.status_new') &&
            $this->voucher->vendor_id == config('constants.vendor.visuco_id')) {
            return true;
        }
        return false;
    }
}
