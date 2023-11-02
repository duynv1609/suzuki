<?php

// --------------------------
// Custom Backpack Routes
// --------------------------
// This route file is loaded automatically by Backpack\Base.
// Routes you generate using Backpack\Generators will be placed here.

Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => array_merge(
        (array) config('backpack.base.web_middleware', 'web'),
        (array) config('backpack.base.middleware_key', 'admin')
    ),
    'namespace'  => 'App\Http\Controllers\Admin',
], function () { // custom admin routes
    Route::crud(config('constants.adminRoutes.users'), 'UserCrudController');
    Route::crud(config('constants.adminRoutes.provinces'), 'ProvinceCrudController');
    Route::crud(config('constants.adminRoutes.districts'), 'DistrictCrudController');
    Route::crud(config('constants.adminRoutes.vouchers'), 'VoucherCrudController');
    Route::crud(config('constants.adminRoutes.dealers'), 'DealerCrudController');
    Route::crud(config('constants.adminRoutes.customers'), 'CustomerCrudController');
    Route::crud(config('constants.adminRoutes.vehicles'), 'VehicleCrudController');
    Route::crud(config('constants.adminRoutes.voucher_codes'), 'VoucherCodeCrudController');
    Route::crud(config('constants.adminRoutes.vendors'), 'VendorCrudController');
    Route::crud(config('constants.adminRoutes.colors'), 'VehicleColorCrudController');
    Route::crud('vehicle_models', 'VehicleModelCrudController');
    Route::crud('point_histories', 'PointHistoryCrudController');
    Route::match(['get', 'post'], '/search', 'SearchController@index');
    Route::crud(config('constants.adminRoutes.membership'), 'MembershipCrudController');
    Route::crud(config('constants.adminRoutes.orders'), 'OrderCrudController');
    Route::crud(config('constants.adminRoutes.items'), 'ItemCrudController');
    Route::crud('vehiclecolor', 'VehicleColorCrudController');
    Route::get('/report', 'ReportController@index');
    Route::match(['get', 'post'], config('constants.adminRoutes.orders').'/import', 'OrderCrudController@import');
}); // this should be the absolute last line of this file