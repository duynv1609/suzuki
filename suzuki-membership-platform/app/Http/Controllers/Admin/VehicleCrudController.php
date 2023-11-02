<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\SMPHelper;
use App\Http\Requests\VehicleRequest;
use App\Models\Vehicle;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\InlineCreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;

/**
 * Class VehicleCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VehicleCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation;
    use UpdateOperation;

//    use DeleteOperation;
    use ShowOperation;
    use InlineCreateOperation;

    protected $user;

    public function setup()
    {
        CRUD::setModel(Vehicle::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.vehicles'));
        CRUD::setEntityNameStrings('Xe', 'Xe');
        $this->user = Auth::getUser();

    }

    protected function setupListOperation()
    {
        $this->crud->column('model')->label('Dòng xe');
        $this->crud->column('color')->label('Màu sắc');
        CRUD::addColumn([
            'name'      => 'customer',
            'label'     => 'Chủ sở hữu',
            'attribute' => 'name',
            'wrapper'   => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.customers').'/'.$related_key.'/show');
                },
                'target' => '_blank',
            ]
        ]);
//                   ->
        $this->crud->column('purchased_at')->label('Ngày mua')->type('date')->format('DD-MM-Y');
        CRUD::addCOlumn([
            'name'  => 'plate_number',
            'label' => 'Biển số'
        ]);
        CRUD::addColumn([
            'name'      => 'membership',
            'label'     => 'Ngày mở Membership',
            'attribute' => 'created_at'
        ]);
        $this->crud->column('frame_number')->label('Số khung')->wrapper(['class' => 'text-uppercase text-monospace text-info']);

        if ($this->user->isDealer()) {
            $this->crud->addClause('where', 'dealer_id', $this->user->dealer_id);
            View::share('info', 'Chỉ hiển thị các Xe bán ra tại Đại lý.');
        }

        CRUD::addFilter([
            'type'  => 'simple',
            'name'  => 'created_at',
            'label' => 'Xe có Membership'
        ],
            false,
            function () {
                $this->crud->addClause('whereHas', 'membership');
            }
        );

        CRUD::addFilter([
            'type'        => 'select2_ajax',
            'name'        => 'customer_id',
            'label'       => 'Chủ sở hữu',
            'attribute'   => 'admin_display_name',
            'placeholder' => 'Nhập tên hoặc số điện thoại của khách cần tìm'
        ],
            url('api/customers'),
            function ($value) { // if the filter is active
                $this->crud->addClause('where', 'customer_id', $value);
            }
        );

        CRUD::addFilter([
            'type'  => 'text',
            'name'  => 'plate_number',
            'label' => 'Biển số',
        ], false, function ($value) {
            $this->crud->addClause('where', 'plate_number', 'LIKE', '%'.$value.'%');
        });

        CRUD::addFilter([
            'type'  => 'text',
            'name'  => 'frame_number',
            'label' => 'VIN'
        ], false, function ($value) {
            $this->crud->addClause('where', 'frame_number', 'LIKE', '%'.$value.'%');
        });
    }

    protected function setupShowOperation()
    {
        $this->crud->set('show.setFromDb', false);
        $this->crud->setTitle('Xem thông tin xe', 'show');
        $this->crud->setHeading('Thông tin xe');
        $this->crud->setSubheading($this->crud->getCurrentEntry()->frame_number);
        if (!Auth::getUser()->isAdmin()) {
            $this->crud->removeAllButtons();
        }

        CRUD::addCOlumn(['name' => 'model', 'label' => 'Dòng xe:', 'attribute' => 'name']);
        CRUD::addCOlumn(['name' => 'color', 'label' => 'Màu sắc:', 'attribute' => 'name']);
        CRUD::addCOlumn(['name' => 'plate_number', 'label' => 'Biển số:']);
        CRUD::addCOlumn(['name' => 'frame_number', 'label' => 'VIN:']);
        CRUD::addCOlumn(['name' => 'year', 'label' => 'Đời:']);
        CRUD::addCOlumn(['name' => 'customer', 'label' => 'Chủ sở hữu:']);
        CRUD::addCOlumn(['name' => 'purchased_at', 'label' => 'Ngày mua:']);
        CRUD::addCOlumn(['name' => 'dealer', 'label' => 'Nơi mua:']);
        CRUD::addCOlumn([
            'name'     => 'membership',
            'label'    => 'Membership:',
            'type'     => 'closure',
            'function' => function ($entry) {
                if (!$entry->membership) {
                    return 'Không có';
                } else {
                    return 'Từ '.$entry->membership->created_at->format('d-m-Y').' đến '.$entry->membership->ended_at->format('d-m-Y');
                }
            }
        ]);
        CRUD::addColumn([
            'name'     => 'membership',
            'key'      => 'remaining_quota',
            'label'    => 'Hạn mức giảm còn lại:',
            'type'     => 'closure',
            'function' => function ($entry) {
                return SMPHelper::vnd_format($entry->membership->remaining_quota);
            },
        ]);
        CRUD::addColumn([
            'name'     => 'view_all_transactions',
            'label'    => 'Giao dịch',
            'type'     => 'closure',
            'function' => function ($entry) {
                return 'Xem tất cả giao dịch của xe này';
            },
            'wrapper'  => [
                'href' => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(
                        config('constants.adminRoutes.orders'),
                        ['frame_number' => $entry->frame_number]
                    );
                }
            ]
        ]);
    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(VehicleRequest::class);
        $this->crud->field('frame_number')->label('Số khung:');
        $this->crud->field('customer')->label('Chủ sở hữu:')->type('relationship')->wrapper(['class' => 'form-group col-md-12']);
        $this->crud->field('model')->label('Mẫu xe:')->type('relationship')->wrapper(['class' => 'form-group col-md-6']);
        CRUD::field('vehicle_color_id')->type('select2_from_ajax')->label('Màu xe:')
            ->model('App\Models\VehicleColor')
            ->data_source(url('api/vehicle-colors'))
            ->placeholder('Chọn màu xe')
            ->include_all_form_fields(true)
            ->minimum_input_length(0)
            ->dependencies(['model'])
            ->wrapper(['class' => 'form-group col-md-6'])
            ->attribute('name');
        $this->crud->field('dealer')->label('Xe mua tại Đại lý:')->type('relationship')->wrapper(['class' => 'form-group col-md-12']);
        $this->crud->field('purchased_at')->label('Ngày mua xe:')->type('date')->wrapper(['class' => 'form-group col-md-12']);

        if ($this->user->isDealer()) {
            CRUD::modifyField('customer', [
                'options' => function ($query) {
                    return $query->where('dealer_id', $this->user->dealer_id)->get();
                },
                'hint'    => 'Chỉ hiển thị những khách hàng do Đại lý tạo tài khoản.'
            ]);
            CRUD::modifyField('dealer', [
                'options' => function ($query) {
                    return $query->where('id', $this->user->dealer_id);
                },
                'default' => $this->user->dealer_id,
            ]);
        }

    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
        $this->crud->field('display_name')->label('Tên hiển thị:')->attributes([
            'disabled' => 'disabled'
        ])->type('text')->hint('Nội dung này được tạo tự động với mục đích tra cứu.');
    }

    protected function setupInlineCreateOperation()
    {

    }
}
