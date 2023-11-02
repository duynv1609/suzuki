<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\ImageManagerStatic as Image;

class BaseModel extends Model
{
//    use LadaCacheTrait;


//    public function setImageAttribute($value)
//    {
//
//    }
//
//    public function getImageAttribute($value)
//    {
//        if ($value) {
//            if (Str::startsWith($value, 'http') | Str::startsWith($value, '//')) {
//                return $value;
//            }
//            return Storage::disk()->url($value);
//        }
//        return null;
//    }
}