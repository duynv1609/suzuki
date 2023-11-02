<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Znck\Eloquent\Traits\BelongsToThrough;

class Membership extends Model
{
    use CrudTrait;
//    use SoftDeletes;
    use BelongsToThrough;

    protected $active;
    protected $status;

    protected $fillable = [
        'customer_id',
        'created_at',
        'ended_at',
        'creator',
    ];

    protected $dates = ['ended_at'];

    public function vehicle()
    {
        return $this->belongsTo('App\Models\Vehicle');
    }

    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

//    public function orders()
//    {
//        return $this->hasManyThrough('App\Models\Order', 'App\Models\Vehicle');
//    }

    public function isActive()
    {
        if ($this->ended_at->gt(now())) {
            return true;
        } else {
            return false;
        }
    }

    public function statusToText()
    {
        if ($this->isExpired()) {
            return 'Đã hết hạn';
        } else {
            return 'Còn hiệu lực';
        }
    }

    public function isExpired()
    {
        if ($this->ended_at < now()) {
            return true;
        }
        return false;
    }

    public function getStatusAttribute()
    {

    }

    public static function getCurrentActiveMembership($vehicleID)
    {
        $query = self::query();
        try {
            $result = $query->where([
                ['vehicle_id', '=', $vehicleID],
                ['ended_at', '>', now()]
            ])->orderByDesc('ended_at')->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return false;
        }
        return $result;
    }

    public function getDiscountRatioAttribute()
    {
        return config('constants.membership.discount.'.$this->level);
    }


    /**
     * Check conditions to maintain membership
     * @return boolean
     * @var
     */
    public function extensionEligibleOrders()
    {
        return $this->vehicle->orders()->where([
            ['original_value', '>=', config('constants.membership.minimum_order_value')]
        ])->whereBetween('created_at', [$this->created_at, $this->ended_at])->get()->count();
    }

    protected static function booted()
    {

        static::creating(function (Membership $membership) {

            if (empty($membership->ended_at)) {
                $membership->ended_at = now()->addDays(365);
            }

            if (empty($membership->creator)) {
                $membership->creator = Auth::id();
            }

            if (empty($membership->remaining_quota)) {
                $membership->remaining_quota = config('constants.membership.annual_quota');
            }
        });

        /*static::created(function (Membership $membership) {

            $membership->updateRemainingQuota();

        });*/
    }


}
