<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Item extends Model
{
    use CrudTrait;
    use SoftDeletes;

    protected $fillable = ['name', 'description'];

    public function orders()
    {
        return $this->belongsToMany('App\Models\Order');
    }
}
