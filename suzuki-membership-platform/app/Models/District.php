<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spiritix\LadaCache\Database\LadaCacheTrait;

class District extends BaseModel
{
    use CrudTrait;
    use LadaCacheTrait;

    public function customers()
    {
        return $this->hasMany('App\Models\Customer');
    }

    public function province()
    {
        return $this->belongsTo('App\Models\Province');
    }

    public function allInProvince()
    {
        return $this->hasMany('App\Models\District', 'province_id', 'province_id')->orderBy('name');
    }

}
