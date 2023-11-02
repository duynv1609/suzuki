<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\PointHistoryRequest;
use App\Models\PointHistory;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;

/**
 * Class PointHistoryCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class PointHistoryCrudController extends CrudController
{
    use ListOperation;

//    use CreateOperation;
//    use UpdateOperation;
    use ShowOperation;

    protected $user;

    public function setup()
    {
        CRUD::setModel(PointHistory::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/point_histories');
        CRUD::setEntityNameStrings('Giao dịch', 'Giao dịch');
        $this->user = Auth::getUser();
    }

    protected function setupListOperation()
    {
        CRUD::column('id')->label('Mã giao dịch');
        CRUD::column('customer_id')->label('Mã khách hàng');
        CRUD::column('customer')->label('Tên khách hàng')->wrapper([
            'href'   => function ($crud, $column, $entry, $related_key) {
                return backpack_url(config('constants.adminRoutes.customers').'/'.$related_key.'/edit');
            },
            'target' => 'blank'
        ]);
        CRUD::column('amount')->label('Biến động')->type('number')->dec_point(',')->thousands_sep('.');
        CRUD::column('type')->label('Loại')->type('model_function')->function_name('typeName');
        CRUD::column('created_at')->label('Thời gian')
            ->type('date')
            ->format('H:M, DD/M')
            ->wrapper(['class' => 'text-muted font-size-sm']);

        CRUD::addFilter([
            'name'  => 'customer_id',
            'type'  => 'text',
            'label' => 'Mã khách hàng'
        ], false, function ($value) {
            $this->crud->addClause('where', 'customer_id', $value);
        });

        CRUD::addFilter([
            'name'  => 'type',
            'type'  => 'dropdown',
            'label' => 'Loại giao dịch'
        ], [
            config('constants.point_history_type.buy_voucher') => __('dashboard.short_transaction_type_1'),
            config('constants.point_history_type.first_topup') => __('dashboard.short_transaction_type_2')
        ], function ($value) {
            $this->crud->addClause('where', 'type', $value);
        });

        if ($this->user->isDealer()) {
            $this->crud->addClause('whereIn', 'customer_id', function ($query) {
                $query->select('id')->from('customers')->where('dealer_id', $this->user->dealer_id);
            });
            View::share('info', 'Chỉ hiển thị các giao dịch từ Khách hàng của Đại lý.');
        }


    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(PointHistoryRequest::class);
//
//        CRUD::field('customer');
//        CRUD::addField([
//            'name'      => 'voucherCode',
//            'type'      => 'relationship',
//            'attribute' => 'code',
//            'options' => function()
//        ]);
//        CRUD::field('amount');
//        CRUD::field('type');

    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }

    protected function setupShowOperation()
    {
        $this->crud->set('show.setFromDb', false);
        $this->setupListOperation();
        CRUD::addColumn([
            'name'    => 'voucher',
            'label'   => 'Voucher',
            'wrapper' => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.vouchers').'/'.$related_key.'/edit');
                },
                'target' => 'blank'
            ]
        ]);

    }
}
