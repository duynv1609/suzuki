<?php

namespace App\Providers;

use Awobaz\Mutator\Facades\Mutator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;
use Intervention\Image\ImageManagerStatic as Image;

class MutatorServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //Register your custom accessors/mutators extensions here.

        Mutator::extend('setImage', function ($model, $value, $key) {
            $modelName = $model->getTable();
            $disk = 'public';
            $destination_path = 'images'.date('/y', time()).date('/m', time());
            if ($value === null) { // Remove data
                Storage::disk($disk)->delete(Str::replaceFirst('storage/', '', $model->{$key}));
                $model->{$key} = null;
            }

            if (Str::startsWith($value, 'data:image')) {
                if (Str::startsWith($value, 'data:image/png')) {
                    $ext = '.png';
                    $image = Image::make($value)->encode('png');
                } else {
                    $ext = '.jpg';
                    $image = Image::make($value)->encode('jpg', 100);
                }
                $filename = $modelName.'-'.md5($key.'-'.$model->id.'-'.time()).$ext;
                Storage::disk($disk)->put($destination_path.'/'.$filename, $image->stream());
                Storage::disk($disk)->delete(Str::replaceFirst('storage/', '', $model->{$key}));
//            $public_destination_path = Str::replaceFirst('app/public/', '', $destination_path);
                return 'storage/'.$destination_path."/".$filename;
            }

            return $model->{$key};
        });

//        Mutator::extend('getImage', function ($model, $value, $key) {
//            if ($value) {
//                if (Str::startsWith($value, 'http') | Str::startsWith($value, '//')) {
//                    return $value;
//                }
//                return Storage::disk()->url($value);
//            }
//            return $value;
//        });
    }
}
