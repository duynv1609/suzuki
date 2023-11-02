<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\CustomerRequest;
use App\Models\Customer;
use App\Models\Membership;
use App\Models\PointHistory;
use App\Models\User;
use App\Models\Vehicle;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Str;

/**
 * Class CustomerCrudController
 *
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class CustomerCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation {
        store as traitStore;
    }
    use UpdateOperation {
        update as traitUpdate;
    }
    use ShowOperation;

//    use DeleteOperation;

    protected $user;

    public function setup()
    {
        CRUD::setModel(Customer::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/customers');
        CRUD::setEntityNameStrings('Khách hàng', 'Khách hàng');
        $this->crud->setEditView('admin/customer/edit');
        $this->crud->setShowView('admin/customer/edit');
        $this->user = Auth::getUser();
    }

    public function update()
    {

        $request = $this->crud->getRequest();
        $response = $this->traitUpdate();

        /*
         * Save vehicle information of this customer
         */
        $newVehicleIds = $request->input('vehicles');
        $currentVehicleIds = $this->crud->entry->vehicles->pluck('id')->toArray();
        if ($currentVehicleIds != $newVehicleIds) {
            Vehicle::whereIn('id', $currentVehicleIds)->update(['customer_id' => null]);
            Vehicle::whereIn('id', $newVehicleIds)->update(['customer_id' => $this->crud->entry->id]);
        }

        $newPassword = $request->input('new_password');
        if ($newPassword) {
            User::find($this->crud->entry->user_id)->update(['password' => Hash::make($newPassword)]);
        }


        return $response;
    }


    // select * from customers where district_id in (select id from districts where province_id = 11);

    public function store()
    {
        $user = Auth::getUser();
        $request = $this->crud->getRequest();
        $createMembership = $request->input('create_membership');
        $password = Str::random(8);

        $response = $this->traitStore();

        if ($createMembership && $user->can('Create Membership')) {

            $membership = Membership::create([
                'customer_id' => $this->crud->entry->id,
            ]);

            if ($membership->id) {
                PointHistory::firstOrCreate([
                    'customer_id' => $this->crud->entry->id,
                    'type'        => config('constants.point_history_type.first_topup'),
                    'amount'      => config('constants.customer.init_balance')
                ]);
            }

        }

        $newUser = User::create([
            'email'    => $this->crud->entry->email ? $this->crud->entry->email : null,
            'mobile'   => $this->crud->entry->mobile,
            'password' => Hash::make($password),
            'creator'  => Auth::getUser()->id,
        ]);

        if ($newUser->id) {
            $request->session()->flash('crudPassword', $password);
            $request->session()->flash('crudName', $this->crud->entry->name);
            $request->session()->flash('crudMobile', $this->crud->entry->mobile);
            $request->session()->flash('crudEmail', $this->crud->entry->email);

            $newUser->assignRole('Customer');
            $customer = Customer::find($this->crud->entry->id);
            $customer->user_id = $newUser->id;
            $customer->save();
        }


        return $response;
    }

    protected function setupListOperation()
    {
        $this->crud->addColumn(['name' => 'id', 'type' => 'text', 'label' => 'ID']);
        $this->crud->addColumn([
            'name'    => 'name',
            'type'    => 'text',
            'label'   => 'Họ tên',
            'wrapper' => [
                'href' => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.customers').'/'.$entry->id.'/edit');
                },
            ],
        ]);
        $this->crud->addColumn(['name' => 'email', 'type' => 'email', 'label' => 'Email']);
        $this->crud->addColumn(['name' => 'mobile', 'type' => 'phone', 'label' => 'Số điện thoại']);
//        $this->crud->addColumn([
//            'name'      => 'dealer',
//            'type'      => 'relationship',
//            'label'     => 'Đại lý',
//            'attribute' => 'name'
//        ]);
        $this->crud->addColumn(['name' => 'province', 'type' => 'relationship', 'label' => 'Địa phương']);
        $this->crud->addColumn(['name' => 'created_at', 'type' => 'date', 'label' => 'Ngày tạo', 'format' => 'DD/MM']);
        $this->crud->addColumn([
            'name'    => 'is_corporate',
            'type'    => 'boolean',
            'label'   => 'Loại người dùng',
            'options' => [
	            config('constants.customer.type.individual') => 'Cá nhân',
	            config('constants.customer.type.corporate')  => 'Công ty',
            ],

        ]);

        // Restrict customer list to Dealers only

        if ($this->user->isDealer()) {
            $this->crud->addClause('where', 'dealer_id', $this->user->dealer_id);
            View::share('info', 'Danh sách chỉ hiển thị những khách hàng của Đại lý đang đăng nhập.');
        }

//        $this->crud->addFilter([
//            'type'  => 'select2',
//            'name'  => 'province',
//            'label' => 'Tỉnh thành'
//        ], function () {
//            return Province::all()->keyBy('id')->pluck('name', 'id')->toArray();
//        }, function ($value) {
//            $this->crud->query = $this->crud->query->whereIn('district_id')
//        });

        // daterange filter
        $this->crud->addFilter([
            'type'  => 'date_range',
            'name'  => 'from_to',
            'label' => 'Ngày tạo tài khoản'
        ],
            false,
            function ($value) { // if the filter is active, apply these constraints
                $dates = json_decode($value);
                $this->crud->addClause('where', 'created_at', '>=', $dates->from);
                $this->crud->addClause('where', 'created_at', '<=', $dates->to.' 23:59:59');
            });

        // dropdown filter
        $this->crud->addFilter([
            'name'  => 'is_corporate',
            'type'  => 'dropdown',
            'label' => 'Nhóm khách hàng',
        ], [
            config('constants.customer.type.individual') => 'Cá nhân',
            config('constants.customer.type.corporate')  => 'Công ty',
        ],
            function ($value) { // if the filter is active
                $this->crud->addClause('where', 'is_corporate', $value);
            });

        $this->crud->addFilter([
            'name'  => 'vehicle_type',
            'type'  => 'dropdown',
            'label' => 'Loại xe khách sử dụng',
        ], [
            config('constants.customer.vehicle_type.none') => 'Chưa có xe',
            config('constants.customer.vehicle_type.4w')   => '4W',
            config('constants.customer.vehicle_type.2w')   => '2W',
            config('constants.customer.vehicle_type.2w4w') => '2W4W',
        ],
            function ($value) { // if the filter is active
                $this->crud->addClause('where', 'vehicle_type', $value);
            });
    }

    protected function setupShowOperation()
    {
        $this->setupUpdateOperation();
        $this->crud->setHeading($this->crud->getCurrentEntry()->name);
        $customer = $this->crud->getCurrentEntry();
        View::share('customer', $customer);
    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
        CRUD::setValidation(CustomerRequest::class);
        $user = Auth::getUser();

        $request = $this->crud->getRequest();
        $customer = $this->crud->getCurrentEntry();

        if ($user->isDealer() && $customer->dealer_id != $user->dealer_id) {
            abort(401);
        }

        // This field is used when creating new Customer only
//        $this->crud->removeField('create_membership');

        $this->crud->modifyField('vehicles', [
            'options' => (function ($query) {
                return $query->where('customer_id', $this->crud->entry->id)->orWhere('customer_id',
                    null)->get();
            }),
        ]);

        foreach ($this->crud->getFields() as $formField) {
            CRUD::modifyField($formField['name'], ['tab' => 'Thông tin cá nhân']);
        }

        CRUD::field('login_username')
            ->type('text')
            ->label('Tài khoản đăng nhập:')->attributes(['disabled' => 'disabled'])
            ->tab('Thông tin đăng nhập');

        CRUD::field('new_password')
            ->type('password')
            ->label('Mật khẩu mới:')
            ->hint('Mật khẩu phải dài tối thiểu 8 ký tự. Để trống nếu không đổi mật khẩu.')
            ->tab('Thông tin đăng nhập');

        CRUD::field('new_password_confirmation')
            ->type('password')
            ->label('Nhập lại mật khẩu mới:')
            ->tab('Thông tin đăng nhập');

        // Disable all fields for preview purpose by looping through all fields
        if ($user->isDealer()) {
            foreach ($this->crud->getFields() as $field) {
                CRUD::modifyField($field['name'], ['attributes' => ['disabled' => 'disabled']]);
            }
        }

        $pointHistory = $customer->pointHistory->take(5);

        $this->crud->setHeading($customer->name);
        $this->crud->setSubheading('Mã số Hội viên: '.$customer->id);

        View::share('customer', $customer);
        View::share('pointHistory', $pointHistory);


    }

    protected function setupCreateOperation()
    {
        $user = Auth::getUser();
        CRUD::setValidation(CustomerRequest::class);

        CRUD::field('name')->type('text')->label('Họ tên:')->wrapper(['class' => 'form-group col-md-8'])->attributes(['required' => 'required']);
        CRUD::field('birthday')->type('date')->label('Ngày tháng năm sinh:')->wrapper(['class' => 'form-group col-md-4'])->attributes(['required' => 'required']);
        CRUD::addField([
            'name'       => 'gender',
            'type'       => 'select2_from_array',
            'label'      => 'Giới tính:',
            'wrapper'    => ['class' => 'form-group col-md-4'],
            'allow_null' => false,
            'attributes' => ['required' => 'required'],
            'options'    => [
	            config('constants.customer.gender.male') => 'Nam',
	            config('constants.customer.gender.female') => "Nữ"
            ]
        ]);
        CRUD::field('mobile')
            ->type('text')
            ->label('Số điện thoại:')
            ->wrapper(['class' => 'form-group col-md-4'])
            ->attributes(['required' => 'required'])
            ->hint('Cú pháp 10 số, không có +84 ở đầu.');

        CRUD::field('email')->type('email')
            ->label('Email:')
            ->wrapper(['class' => 'form-group col-md-4'])
            ->hint('Thông tin đăng nhập sẽ được gửi về email này.');

        CRUD::field('address')->type('text')->label('Địa chỉ của khách:')->wrapper(['class' => 'form-group col-md-12'])->hint('Không nhập tên tỉnh thành, quận huyện.')->attributes(['required' => 'required']);

        CRUD::field('province')->type('relationship')->label('Tỉnh thành:')->wrapper(['class' => 'form-group col-md-6'])->placeholder('Chọn tỉnh thành')->attributes(['required' => 'required']);

        CRUD::field('district_id')->type('select2_from_ajax')
            ->label('Quận / Huyện / Thị xã:')
            ->data_source(url('api/districts'))
            ->placeholder('Chọn địa phương')
            ->include_all_form_fields(true)
            ->minimum_input_length(0)
            ->dependencies(['province'])
            ->wrapper(['class' => 'form-group col-md-6'])->attributes(['required' => 'required']);

        CRUD::field('id_number')->type('text')->label('Số CMND/CCCD:')->wrapper(['class' => 'form-group col-md-4'])->attributes(['required' => 'required']);

        CRUD::field('id_issue_date')->type('date')->label('Ngày cấp:')->wrapper(['class' => 'form-group col-md-4'])->attributes(['required' => 'required']);

        CRUD::field('province_of_id')->type('relationship')->label('Nơi cấp:')->wrapper(['class' => 'form-group col-md-4'])->attributes(['required' => 'required']);

        CRUD::field('dealer')->type('relationship')->label('Khách của Đại lý:')->wrapper(['class' => 'form-group col-md-12'])->attributes(['required' => 'required']);

        $this->crud->addField([
            'name'      => 'vehicles',
            'type'      => 'relationship',
            'label'     => 'Phương tiện:',
            'options'   => (function ($query) {
                return $query->whereNull('customer_id')->get();
            }),
            'attribute' => 'display_name',
            'hint'      => 'Chỉ hiển thị các xe chưa có ai sở hữu.'
        ]);

        /*if ($user->can('Create Membership')) {
            CRUD::field('create_membership')->type('checkbox')->wrapper(['class' => 'form-group col-md-12'])
                ->label('Tạo Membership đồng thời cho khách hàng này <strong>('.Str::point(config('constants.customer.init_balance')).' điểm)</strong>.')
                ->default(1);
        }*/

        /*
         * Dealer restrictions
         */

        if ($user->isDealer()) {
            CRUD::modifyField('dealer', [
                'options' => function ($query) use ($user) {
                    return $query->where('id', $user->dealer_id);
                },
                'default' => $user->dealer_id,
            ]);
            CRUD::modifyField('vehicles', [
                'options' => function ($query) use ($user) {
                    return $query->where('dealer_id', $user->dealer_id);
                },
                'hint'    => 'Chỉ hiển thị các xe chưa có ai sở hữu và được mua ở Đại lý này.'
            ]);
        }
    }
}
