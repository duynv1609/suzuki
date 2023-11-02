<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Spiritix\LadaCache\Database\LadaCacheTrait;

class Province extends BaseModel
{
    use CrudTrait;
    use LadaCacheTrait;

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

    public function customers()
    {
        return $this->hasManyThrough('App\Models\Customer', 'App\Models\District');
    }

    public function districts()
    {
        return $this->hasMany('App\Models\District');
    }

    public function idOfProvince()
    {
        return $this->hasMany('App\Models\Customer', 'id_issue_province');
    }

    public function dealers()
    {
        return $this->hasManyThrough('App\Models\Dealer', 'App\Models\District');
    }

    public function getAllForSelection()
    {
        return $this::all()->sortBy('name')->keyBy('id')->pluck('name', 'id')->toArray();
    }
}
