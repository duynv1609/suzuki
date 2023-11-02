<?php

namespace App\Providers;

use App\Models\Customer;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Lang;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('*', function ($view) {

            $viewData = $view->getData();

            //Get curent route name
            $view->with('currentRouteName', Route::currentRouteName());

            // Get customer information to display their names on header
            if (Auth::check() || Auth::viaRemember()) {
                if (!$currentUser = Session::get('currentUser')) {
                    $user = Auth::getUser();
                    if ($user->isCustomer()) {
                        $customer = $user->customer;
                        $currentUser['customerId'] = $customer->id;
                        $currentUser['userId'] = $user->id;
                        $currentUser['fullName'] = $customer->surname.' '.$customer->name;
                    } else {
                        $currentUser['fullName'] = $user->email;
                    }
                    Session::put('currentUser', $currentUser);
                } else {
                    $view->with('currentUser', $currentUser);
                }
            }

            if (empty($viewData['pageTitle'])) {
                if (Lang::has('pages.titles.'.Route::currentRouteName())) {
                    $pageTitle = __('pages.titles.'.Route::currentRouteName());
                    $view->with('pageTitle', $pageTitle);
                }
            }


        });

        Paginator::useBootstrap(); //Use Bootstrap template for paginations

        // Add Str::point macro for formatting point number
        Str::macro('point', function ($price) {
            return number_format($price, 0, ',', '.');
        });

        Str::macro('bare_url', function ($url) {
            return preg_replace('/((^https?:\/\/)?(www\.)?)|(\/$)/', '', trim($url));
        });

        Str::macro('standardizeMobileNumber', function ($number) {
            return str_replace(' ', '', '0'.preg_replace('/^(\+?)(84)?(0)?/', "", $number));
        });
    }
}
