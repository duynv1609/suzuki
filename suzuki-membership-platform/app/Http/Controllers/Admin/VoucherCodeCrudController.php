<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\SMPHelper;
use App\Http\Controllers\Admin\Operations\ImportOperation;
use App\Http\Controllers\Admin\Operations\MarkAsUsedOperation;
use App\Http\Requests\VoucherCodeRequest;
use App\Models\Voucher;
use App\Models\VoucherCode;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/**
 * Class VoucherCodeCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VoucherCodeCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation;
    use UpdateOperation;

//    use DeleteOperation;
    use ShowOperation;
    use MarkAsUsedOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(VoucherCode::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.voucher_codes'));
        CRUD::setEntityNameStrings('Mã voucher', 'Mã Voucher');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        $this->crud->column('row_number')->type('row_number')->label('STT')->wrapper(['class' => 'text-muted']);
        CRUD::column('code')
            ->wrapper([
                'class' => 'text-uppercase font-weight-bold',
                'href'  => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.voucher_codes').'/'.$entry->id.'/edit');
                },
            ])
            ->label('Mã');
        CRUD::column('customer')->type('relationship')->label('Hội viên');
        CRUD::column('voucher')->type('relationship');
        CRUD::column('status')->label('Trạng thái')->type('model_function')->function_name('statusToLabel')->limit(200);
        CRUD::column('created_at')->wrapper(['class' => 'text-muted']);


        $this->crud->addFilter([
            'name'  => 'code',
            'type'  => 'text',
            'label' => 'Mã'
        ], false, function ($value) {
            $this->crud->addClause('where', 'code', 'like', "%$value%");
        });

        $this->crud->addFilter([
            'name'  => 'status',
            'type'  => 'dropdown',
            'label' => 'Trạng thái'
        ], [
            '1' => __('common.voucher_code_status_1'),
            '2' => __('common.voucher_code_status_2'),
            '3' => __('common.voucher_code_status_3'),
            '4' => __('common.voucher_code_status_4'),
            '5' => __('common.voucher_code_status_5'),
        ], function ($value) {
            $this->crud->addClause('where', 'status', $value);
        });
    }

    protected function setupShowOperation()
    {
        $this->crud->set('show.setFromDb', false);
        $this->crud->removeAllButtons();
        CRUD::addColumn([
            'name'    => 'code',
            'label'   => 'Mã:',
            'wrapper' => [
                'class' => 'text-uppercase font-weight-bold text-monospace text-danger'
            ]
        ]);
        CRUD::addColumn([
            'name'    => 'customer',
            'label'   => 'Khách hàng:',
            'wrapper' => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.customers').'/'.$related_key.'/edit');
                },
                'target' => "_blank",
                'title'  => 'Nhấn vào để xem thông tin khách hàng',
            ],
            'limit'   => '1000'
        ]);
        CRUD::addColumn([
            'name'     => 'remaining_quota',
            'label'    => 'Hạn mức còn lại trong năm:',
            'type'     => 'closure',
            'function' => function ($entry) {
                return SMPHelper::vnd_format($entry->customer->membership->remaining_quota);
            }
        ]);
        CRUD::addColumn(['name' => 'created_at', 'label' => 'Ngày mua:']);
        CRUD::addColumn([
            'name'    => 'voucher',
            'label'   => 'Tên voucher:',
            'wrapper' => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return route('vouchers-show', ['id' => $related_key]);
                },
                'target' => "_blank",
                'title'  => 'Nhấn vào để xem thông tin voucher',
            ],
        ]);
        CRUD::addColumn([
            'name'     => 'voucher',
            'label'    => 'Hình thức giảm',
            'key'      => 'discount_type',
            'type'     => 'closure',
            'function' => function ($entry) {
                return __('common.voucher_discount_type_'.$entry->voucher->discount_type);
            }
        ]);
        CRUD::addColumn([
            'name'      => 'voucher',
            'label'     => 'Mức giảm:',
            'key'       => 'discount_amount',
            'attribute' => 'discount_amount'
        ]);
        CRUD::addColumn([
            'name'     => 'voucher',
            'label'    => 'Trạng thái:',
            'key'      => 'status',
            'type'     => 'closure',
            'function' => function ($entry) {
                return $entry->statusToText();
            },
        ]);


    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(VoucherCodeRequest::class);

        CRUD::field('customer')->label('Hội viên sở hữu:');
        CRUD::field('voucher')->label('Voucher của mã này:');
        CRUD::field('purchased_at')->label('Ngày mua');
        CRUD::field('start_date')->label('Ngày khởi đầu:');
        CRUD::field('end_date')->label('Ngày hết hạn:');
        CRUD::field('note')->label('Ghi chú');
        CRUD::addField([
            'name'    => 'status',
            'type'    => 'select2_from_array',
            'options' => [
                '1' => __('common.voucher_code_status_1'),
                '2' => __('common.voucher_code_status_2'),
                '3' => __('common.voucher_code_status_3'),
                '4' => __('common.voucher_code_status_4'),
                '5' => __('common.voucher_code_status_5')
            ]
        ]);
        CRUD::field('applied_at')->label('Ngày sử dụng:');
        CRUD::field('dealer')->label('Đại lý sử dụng:');
    }

    protected function setupUpdateOperation()
    {
        $user = Auth::getUser();
        $this->setupCreateOperation();
        $entry = $this->crud->getCurrentEntry();
        $this->crud->setHeading(strtoupper($entry->code));
        $disabledFields = ['customer', 'voucher', 'purchased_at', 'start_date', 'end_date'];
        if ($user->isDealer()) {
            foreach ($disabledFields as $key => $name) {
                CRUD::modifyField($name, ['attributes' => ['disabled' => 'disabled']]);
            }
            CRUD::removeField('dealer');

            CRUD::addField([
                'allows_null' => true,
                'name'        => 'dealer_id',
                'options'     => [
                    $user->dealer_id => $user->dealer->name
                ],
                'type'        => 'select2_from_array',
                'default'     => 'null',
                'attributes'  => [
                    'readonly' => 'readonly'
                ]
            ]);
            CRUD::modifyField('status', [
                'options' => [
                    config('constants.voucher_code.status_new')  => __('common.voucher_code_status_1'),
                    config('constants.voucher_code.status_used') => __('common.voucher_code_status_2'),
                ]
            ]);
        }
    }
}
