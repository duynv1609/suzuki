<?php

use App\Models\Order;
use App\Models\Voucher;
use Illuminate\Support\Facades\Route;

Breadcrumbs::for('homepage', function ($trail) {
    $trail->push(__('pages.home.title'), route('homepage'), [
        'icon' => 'fas fa-home'
    ]);
});

Breadcrumbs::for('dashboard-home', function ($trail) {
    $trail->parent('homepage');
    $trail->push(__('pages.titles.dashboard-home'), route('dashboard-home'));
});

Breadcrumbs::for('dashboard-info', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('pages.titles.dashboard-info'), route('dashboard-info'));
});

Breadcrumbs::for('dashboard-history', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('pages.titles.dashboard-history'), route('dashboard-history'));
});

Breadcrumbs::for('dashboard-password', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('pages.titles.dashboard-password'), route('dashboard-password'));
});

Breadcrumbs::for('dashboard-vouchers', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('Voucher của bạn'), route('dashboard-vouchers'));
});

Breadcrumbs::for('dashboard-voucher-code', function ($trail, $id) {
    $trail->parent('dashboard-vouchers');
    $trail->push(__('pages.titles.dashboard-voucher-code'), route('dashboard-voucher-code', $id));
});

Breadcrumbs::for('dashboard-vehicles', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('pages.titles.dashboard-vehicles'), route('dashboard-vehicles'));
});

Breadcrumbs::for('dashboard-vehicle-add', function ($trail) {
    $trail->parent('dashboard-vehicles');
    $trail->push(__('pages.titles.dashboard-vehicle-add'), route('dashboard-vehicle-add'));
});

Breadcrumbs::for('dashboard-services', function ($trail) {
    $trail->parent('dashboard-home');
    $trail->push(__('pages.titles.dashboard-services'), route('dashboard-services'));
});

Breadcrumbs::for('dashboard-services-detail', function ($trail, $id) {
//    $order = Order::findOrFail($id);
    $trail->parent('dashboard-services');
    $trail->push(__('pages.titles.dashboard-services-detail'), route('dashboard-services-detail', $id));
});

Breadcrumbs::for('vouchers-list', function ($trail) {
    $trail->parent('homepage');
    $trail->push(__('pages.titles.vouchers-list'), route('vouchers-list'));
});

Breadcrumbs::for('vouchers-show', function ($trail, $id) {
    $voucher = Voucher::find($id);
    $trail->parent('vouchers-list');
    $trail->push($voucher->name, route('vouchers-show', $id));
});

Breadcrumbs::for('about', function ($trail) {
    $trail->parent('homepage');
    $trail->push('Thông tin chương trình', route('about'));
});

Breadcrumbs::for('privacy', function ($trail) {
    $trail->parent('homepage');
    $trail->push('Chính sách về Quyền riêng tư', route('privacy'));
});

Breadcrumbs::for('contact', function ($trail) {
    $trail->parent('homepage');
    $trail->push('Liên hệ', route('contact'));
});

//Breadcrumbs::for('vendors-show', function ($trail, $vendor) {
//    $trail->parent('homepage');
//    $trail->push($vendor->name, route('vendors-show', $vendor));
//});


//
//// Home > Blog
//Breadcrumbs::for('blog', function ($trail) {
//    $trail->parent('home');
//    $trail->push('Blog', route('blog'));
//});
//
//// Home > Blog > [Category]
//Breadcrumbs::for('category', function ($trail, $category) {
//    $trail->parent('blog');
//    $trail->push($category->title, route('category', $category->id));
//});
//
//// Home > Blog > [Category] > [Post]
//Breadcrumbs::for('post', function ($trail, $post) {
//    $trail->parent('category', $post->category);
//    $trail->push($post->title, route('post', $post->id));
//});