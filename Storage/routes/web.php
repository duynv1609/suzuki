<?php

use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\VendorController;
use App\Http\Controllers\VoucherController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\IndexController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvide within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();
Route::get('/register/update-info',
    [RegisterController::class, 'updateInfo'])->name('register-info')->middleware('auth');
Route::get('/register/welcome',
    [RegisterController::class, 'registrationWelcome'])->name('register-welcome')->middleware('auth');


Route::get('/', [IndexController::class, 'index'])->name('homepage');
Route::get('/about', [IndexController::class, 'about'])->name('about');
Route::get('/contact', [IndexController::class, 'contact'])->name('contact');
Route::get('/privacy', [IndexController::class, 'privacy'])->name('privacy');

Route::group(['prefix' => 'vouchers', 'as' => 'vouchers-', 'middleware' => 'auth'], function () {
    Route::get('/', [VoucherController::class, 'index'])->name('list');
    Route::get('/{id}', [VoucherController::class, 'show'])->name('show')->where('id', '[0-9]+');;
    Route::post('/buy', [VoucherController::class, 'buy'])->name('buy');
});

Route::group(['prefix' => 'vendors', 'as' => 'vendors-', 'middleware' => 'auth'], function () {
    Route::get('/', [VendorController::class, 'index'])->name('list');
    Route::get('/{slug}', [VendorController::class, 'show'])->name('show')->where('id', '^[\w-]*$');;
});

Route::group(['prefix' => 'dashboard', 'as' => 'dashboard-', 'middleware' => 'auth'], function () {
    Route::get('/', [DashboardController::class, 'index'])->name('home');
    Route::match(['get', 'post'], '/info', [DashboardController::class, 'info'])->name('info');
    Route::get('/vouchers', [DashboardController::class, 'vouchers'])->name('vouchers');
    Route::get('/vouchers/code/{id}', [DashboardController::class, 'voucherCode'])->name('voucher-code');
    Route::get('/point-history', [DashboardController::class, 'history'])->name('history');
    Route::match(['get', 'post'], '/password', [DashboardController::class, 'password'])->name('password');
    Route::get('/vehicles', [DashboardController::class, 'vehicles'])->name('vehicles');
    Route::match(['get', 'post'], '/vehicles/add', [DashboardController::class, 'addVehicle'])->name('vehicle-add');
    Route::get('/service-history', [DashboardController::class, 'serviceHistory'])->name('services');
    Route::get('/service-history/{id}', [DashboardController::class, 'serviceHistoryDetail'])->name('services-detail');
});


//// Demo routes
//Route::get('/datatables', 'PagesController@datatables');
//Route::get('/ktdatatables', 'PagesController@ktDatatables');
//Route::get('/select2', 'PagesController@select2');
//Route::get('/icons/custom-icons', 'PagesController@customIcons');
//Route::get('/icons/flaticon', 'PagesController@flaticon');
//Route::get('/icons/fontawesome', 'PagesController@fontawesome');
//Route::get('/icons/lineawesome', 'PagesController@lineawesome');
//Route::get('/icons/socicons', 'PagesController@socicons');
//Route::get('/icons/svg', 'PagesController@svg');
//
//// Quick search dummy route to display html elements in search dropdown (header search)
//Route::get('/quick-search', 'PagesController@quickSearch')->name('quick-search');


//
//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


