<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources([
    'districts'      => App\Http\Controllers\DistrictController::class,
    'vehicle-colors' => App\Http\Controllers\VehicleColorController::class,
    'vehicles'       => App\Http\Controllers\API\VehicleController::class,
    'memberships'    => App\Http\Controllers\API\MembershipController::class,
    'customers'      => App\Http\Controllers\API\CustomerController::class,
    'vouchers'       => App\Http\Controllers\API\VoucherController::class,
    'voucher-codes'  => App\Http\Controllers\API\VoucherCodeController::class,
]);