<?php

namespace App\Models;

use Awobaz\Mutator\Mutable;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spiritix\LadaCache\Database\LadaCacheTrait;

class Vendor extends BaseModel
{
    use CrudTrait;
    use HasFactory;
    use SoftDeletes;

    use LadaCacheTrait;
    use Mutable;

    protected $fillable = [
        'name',
        'slug',
        'address',
        'phone',
        'email',
        'website',
        'short_description',
        'description',
        'image',
        'contact_name',
        'contact_email',
        'contact_phone',
        'cover'
    ];

    protected $mutators = [
        'image' => 'setImage',
        'cover' => 'setImage',
    ];

//    protected $accessors = [
//        'image' => 'getImage',
//    ];

    public function vouchers()
    {
        return $this->hasMany('App\Models\Voucher');
    }

    protected static function booted()
    {

    }

    public function getUrlAttribute()
    {
        return route('vendors-show', ['slug' => $this->slug]);
    }
}
