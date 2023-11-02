<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spiritix\LadaCache\Database\LadaCacheTrait;
use Znck\Eloquent\Traits\BelongsToThrough;

class Vehicle extends Model
{
    use LadaCacheTrait;
    use CrudTrait;
    use HasFactory;
    use BelongsToThrough;

    protected $fillable = [
        'id',
        'customer_id',
        'vehicle_color_id',
        'creator',
        'purchased_at',
        'dealer_id',
        'creator',
        'frame_number',
        'remaining_quota'
    ];
    public $identifiableAttribute = 'display_name';
    protected $dates = [
        'purchased_at',
    ];

    public function color()
    {
        return $this->belongsTo('App\Models\VehicleColor', 'vehicle_color_id');
    }

    public function model()
    {
        return $this->belongsToThrough('App\Models\VehicleModel', 'App\Models\VehicleColor');
    }

    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

    public function dealer()
    {
        return $this->belongsTo('App\Models\Dealer');
    }

    public function orders()
    {
        return $this->hasMany('App\Models\Order');
    }

    /*    public function membership()
        {
            return $this->hasOne('App\Models\Membership');
        }
    */

    protected function getFrameNumberAttribute($value)
    {
        return mb_strtoupper($value);
    }

    protected function getEngineNumberAttribute($value)
    {
        return mb_strtoupper($value);
    }

    public function updateRemainingQuota()
    {
        $membership = $this->customer->membership;
//        dd($membership);
        $total = $this->orders()->selectRaw('SUM(original_value) AS total, SUM(discounted_value) as discount')
                      ->whereBetween('ordered_at', [$membership->created_at, $membership->created_at->addDays(365)])
                      ->first()->toArray();

        $this->remaining_quota = config('constants.membership.annual_quota') - ($total['total'] - $total['discount']);

        if ($this->remaining_quota < 0) {
            $this->remaining_quota = 0;
        }
        $this->save();
    }

    protected function getImageAttribute()
    {
        if ($colorImage = $this->color->image) {
            return $colorImage;
        } elseif ($modelImage = $this->model->image) {
            return $modelImage;
        } else {
            return false;
        }
    }

    protected static function booted()
    {
        static::saving(function ($vehicle) {
            // Create Display Name automatically
            $modelName = $vehicle->model->name;
            $modelColor = $vehicle->color->name;
            $vehicle->display_name = $modelName.' - '.$modelColor.' - '.strtoupper($vehicle->frame_number);
//            $vehicle->saveQuietly();
        });
        static::creating(function ($vehicle) {
            $vehicle->remaining_quota = config('constants.membership.annual_quota');
        });

//        static::created(function($vehicle, \Request $request){
//            if($vehicle->customer->vehicle_type == 0 || $vehicle->customer->vehicle_type == $request->type){
//                //$type = $request->type;
//                $type = [
//                  'vehicle_type'  => $request->type,
//                ];
//            }else{
//                //$type = 3;
//                $type = [
//                    'vehicle_type'  => 3,
//                ];
//            }
//            $vehicle->customer->update($type);
//            //$vehicle->customer->save();
//        });
    }
}
