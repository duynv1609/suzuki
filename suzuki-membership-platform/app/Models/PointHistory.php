<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Point;
use Znck\Eloquent\Traits\BelongsToThrough;

class PointHistory extends BaseModel
{
    use CrudTrait;
    use BelongsToThrough;
    use SoftDeletes;

    protected $fillable = [
        'type',
        'amount',
        'customer_id',
        'voucher_code_id',
        'sufficiency_reached',
        'expired_at',
        'created_at'
    ];

    protected $dates = ['expired_at'];

    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

    public function voucherCode()
    {
        return $this->belongsTo('App\Models\VoucherCode');
    }

    public function voucher()
    {
        return $this->belongsToThrough('App\Models\Voucher', 'App\Models\VoucherCode');
    }

    public function order()
    {
        return $this->belongsTo('App\Models\Order');
    }

    /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        /**
         * @var PointHistory $pointHistory
         */
        static::created(function (PointHistory $pointHistory) {

            /*
             * Update customer point balance
             */
            $customer = $pointHistory->customer;
//            $customer->point_balance += $pointHistory->amount;
//            $customer->save();
//            $customer->refresh();

            /*
             * Check if this balance has reached any milestone and mark
             */
            $newMilestone = PointHistory::checkMilestone($customer->point_balance);

            if ($newMilestone) {

                // Customer only needs to have one mark per milestone reached
                $check = $customer->pointHistory()->where('sufficiency_reached', $newMilestone)->get();

                // If this milestone was not marked, mark it
                if ($check->isEmpty()) {
                    $pointHistory->sufficiency_reached = $newMilestone;
                    $pointHistory->save();
                }

                // Remove all older & higher milestones because they're not used anymore
                $customer->pointHistory()->where('sufficiency_reached', '>',
                    $newMilestone)->update(['sufficiency_reached' => null]);

            } else {
                //Remove all milestones because customer has not reached any.
                $customer->pointHistory()->update(['sufficiency_reached' => null]);
            }

        });

        static::saved(function (PointHistory $pointHistory) {
            $customer = $pointHistory->customer;
            $customer->updatePointBalance($pointHistory);
        });

        static::deleted(function (PointHistory $pointHistory) {
            $customer = $pointHistory->customer;
            $customer->updatePointBalance($pointHistory);
        });
    }

    public function typeName()
    {
        return __('dashboard.short_transaction_type_'.$this->type);
    }


    /**
     * @param $point
     * @return mixed
     */
    public static function checkMilestone($point)
    {
        return Arr::last(Arr::sort(config('constants.point.milestones')), function ($value, $key) use ($point) {
            return $value <= $point;
        });
    }
}
