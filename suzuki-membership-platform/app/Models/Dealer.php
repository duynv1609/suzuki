<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spiritix\LadaCache\Database\LadaCacheTrait;
use Znck\Eloquent\Traits\BelongsToThrough;

class Dealer extends Model
{
    use CrudTrait;
    use LadaCacheTrait;
    use BelongsToThrough;
    use SoftDeletes;

    protected $fillable = [
        'name',
        'website',
        'phone',
        'longitue',
        'latitude',
        'email',
        'district_id',
        'address'
    ];

    public function customers()
    {
        return $this->hasMany('App\Models\Customer');
    }

    public function vehicles()
    {
        return $this->hasMany('App\Models\Vehicle');
    }

    public function province()
    {
        return $this->belongsTo('App\Models\Province');
    }

    public function users()
    {
        return $this->hasMany('App\Models\User');
    }
}
