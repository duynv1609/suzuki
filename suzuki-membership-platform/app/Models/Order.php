<?php

namespace App\Models;

use App\Observers\OrderObserver;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Znck\Eloquent\Traits\BelongsToThrough;

class Order extends Model
{
    use CrudTrait;
    use SoftDeletes;
    use BelongsToThrough;

    protected $keyType = 'string';

    protected $dates = ['ordered_at'];

    protected $fillable = [
        'customer',
        'customer_id',
        'dealer',
        'dealer_id',
        'items',
        'original_value',
        'discounted_value',
        'invoice_code',
        'voucher_code_id',
        'note',
        'user_id',
        'vehicle_id',
        'ordered_at',
        'detail'
    ];

    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

    public function dealer()
    {
        return $this->belongsTo('App\Models\Dealer');
    }

    public function items()
    {
        return $this->belongsToMany('App\Models\Item');
    }

    public function vehicle()
    {
        return $this->belongsTo('App\Models\Vehicle');
    }

    public function voucherCode()
    {
        return $this->belongsTo('App\Models\VoucherCode');
    }

    public function voucher()
    {
        return $this->belongsToThrough('App\Models\Voucher', 'App\Models\VoucherCode');
    }

    public function pointHistory()
    {
        return $this->hasOne('App\Models\PointHistory');
    }

//    public function membership()
//    {
//        return $this->belongsToThrough('App\Models\Membership', 'App\Models\Vehicle');
//    }

//    public function getIdAttribute($value)
//    {
////        return str_pad($value, 7, '0', STR_PAD_LEFT);
//    }

    protected static function booted()
    {
        Order::observe(OrderObserver::class);
    }

    public function calculateDiscountedValue()
    {
        if ($this->voucher_code_id) {
            $voucherCode = VoucherCode::with('voucher')->find($this->voucher_code_id);
            $vehicle = $this->vehicle;

            $limit = $vehicle->remaining_quota;

            if ($voucherCode->voucher->discount_type === config('constants.voucher.discount_type_percent')) {
                $tempDiscount = round($voucherCode->voucher->discount_amount / 100 * $this->original_value);
                if ($tempDiscount < $limit) {
                    $this->discounted_value = $this->original_value - $tempDiscount;
                } else {
                    $this->discounted_value = $limit;
                }
            } elseif ($voucherCode->voucher->discount_type === config('constants.voucher.discount_type_fixed')) {
                if ($voucherCode->voucher->discount_amount < $limit) {
                    $this->discounted_value = $this->original_value - $voucherCode->voucher->discount_amount;
                } else {
                    $this->discounted_value = $limit;
                }
            }
        } else {
            $this->discounted_value = $this->original_value;
        }
    }

}
