<?php

namespace App\Models;

use Awobaz\Mutator\Mutable;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spiritix\LadaCache\Database\LadaCacheTrait;

class VehicleColor extends Model
{
    use LadaCacheTrait;
    use CrudTrait;
    use Mutable;

    protected $fillable = ['code', 'name', 'image', 'status'];

    protected $mutators = [
        'image' => 'setImage',
    ];

//    protected $keyType = 'string';

    public function vehicles()
    {
        return $this->hasMany('App\Models\Vehicle');
    }

    public function vehicle_model()
    {
        return $this->belongsTo('App\Models\VehicleModel');
    }
}
