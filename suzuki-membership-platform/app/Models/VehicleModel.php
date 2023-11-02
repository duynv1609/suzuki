<?php

namespace App\Models;

use Awobaz\Mutator\Mutable;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spiritix\LadaCache\Database\LadaCacheTrait;

class VehicleModel extends BaseModel
{
    use LadaCacheTrait;
    use CrudTrait;
    use SoftDeletes;
    use Mutable;

    protected $keyType = 'string';

    protected $fillable = ['id', 'slug', 'name', '2w4w', 'year', 'image'];

    protected $mutators = [
        'image' => 'setImage',
    ];

    public function colors()
    {
        return $this->hasMany('App\Models\VehicleColor');
    }
}
