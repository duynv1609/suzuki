<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Admin\Operations\ImportOperation;
use App\Http\Requests\VoucherRequest;
use App\Models\Voucher;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Backpack\CRUD\app\Library\CrudPanel\Traits\Buttons;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/**
 * Class VoucherCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VoucherCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation;
    use UpdateOperation {
        update as traitUpdate;
    }
    use DeleteOperation;
    use ShowOperation {
        show as traitShow;
    }
    use ImportOperation;

    protected $user;

    public function setup()
    {
        $this->user = Auth::getUser();
        CRUD::setModel(Voucher::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.vouchers'));
        CRUD::setEntityNameStrings('voucher', 'vouchers');

        if ($this->user->isDealer()) {
            $this->crud->denyAccess(['create', 'delete', 'edit', 'import']);
        }

    }

    protected function setupListOperation()
    {

        CRUD::column('id')->label('ID');

        $this->crud->column('image')->type('image')->width('100px')->height('100px');
        $this->crud->column('name')->type('text')->limit(50)
                   ->wrapper([
                       'href' => function ($crud, $column, $entry, $related_key) {
                           return backpack_url(config('constants.adminRoutes.vouchers').'/'.$entry->id.'/edit?action=preview');
                       }
                   ]);
        $this->crud->column('vendor')
                   ->wrapper([
                       'href' => function ($crud, $column, $entry, $related_key) {
                           return backpack_url(config('constants.adminRoutes.vendors').'/'.$related_key.'/edit');
                       },
                   ]);
        $this->crud->column('type')->type('model_function')->function_name('typeToText');
        $this->crud->addColumn([
            'name'    => 'vehicle_types',
            'type'    => 'text',
            'label'   => 'Loại xe',
            'options' => [
	            config('constants.customer.vehicle_type.2w')   => '2 bánh',
	            config('constants.customer.vehicle_type.4w')   => '4 bánh',
            ],

        ]);
        $this->crud->column('created_at');

        $this->crud->addFilter(
            [
                'type'  => 'simple',
                'name'  => 'is_active',
                'label' => 'Active vouchers only'
            ],
            false, // the simple filter has no values, just the "Draft" label specified above
            function () { // if the filter is active (the GET parameter "draft" exits)
                $this->crud->addClause('where', 'is_active', 1);
            }
        );

        $this->crud->addButtonFromModelFunction('bottom', 'open_google', 'importButton', 'beginning');

    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(VoucherRequest::class);

        CRUD::addField([
            'name'       => 'name',
            'label'      => 'Tên voucher:',
            'attributes' => [
                'class' => 'form-control font-weight-bold',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-12'
            ],
            'tab'        => 'Thông tin cơ bản'
        ]);

        CRUD::addField([
            'label'   => 'Nhà cung cấp:',
            'name'    => 'vendor_id',
            'type'    => 'relationship',
            'wrapper' => [
                'class' => 'form-group col-md-12'
            ],
            'tab'     => 'Thông tin cơ bản'
        ]);

        CRUD::addField([
            'label'      => 'Giới thiệu ngắn:',
            'name'       => 'intro',
            'type'       => 'wysiwyg',
            'attributes' => [
                'class' => '',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-12'
            ],
            'tab'        => 'Thông tin cơ bản'
        ]);

        CRUD::addField([
            'label'      => 'Mô tả:',
            'name'       => 'description',
            'type'       => 'wysiwyg',
            'attributes' => [
                'class' => '',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-12'
            ],
            'tab'        => 'Thông tin cơ bản'
        ]);

        // image
        CRUD::addField([
            'label'      => "Hình ảnh:",
            'name'       => "image",
            'type'       => 'image',
            'attributes' => [
                'class' => 'form-control',
            ],
            'hint'       => 'Để hiển thị tốt nhất, hãy cung cấp ảnh ở tỉ lệ 1:1.',
            'tab'        => 'Thông tin cơ bản'
            // 'prefix'    => 'uploads/images/profile_pictures/' // in case your db value is only the file name (no path), you can use this to prepend your path to the image src (in HTML), before it's shown to the user;
        ]);

        CRUD::addField([
            'label'      => 'Voucher này có hiệu lực',
            'name'       => 'is_active',
            'type'       => 'checkbox',
            'attributes' => [
                'class' => '',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-12'
            ],
            'hint'       => 'Nếu không có hiệu lực, voucher sẽ không hiển thị, không mua và không sử dụng được.',
            'tab'        => 'Thông tin cơ bản'
        ]);

        CRUD::addField([
            'label'       => 'Áp dụng cho loại xe:',
            'name'        => 'vehicle_types',
            'type'        => 'select_from_array',
            'attributes'  => [
                'class' => 'form-control',
            ],
            'wrapper'     => [
                'class' => 'form-group col-md-12'
            ],
            'options'     => [
	            config('constants.customer.vehicle_type.2w')   => __('common.vehicle_type_2'),
	            config('constants.customer.vehicle_type.4w')   => __('common.vehicle_type_1'),
                config('constants.customer.vehicle_type.2w4w') => __('common.vehicle_type_3')
            ],
            'allows_null' => false,
            'default'     => '0',
            'tab'         => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Loại voucher:',
            'name'       => 'type',
            'type'       => 'select2_from_array',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'options'    => [
                config('constants.voucher.type_internal') => __('common.voucher_type_1'),
                config('constants.voucher.type_external') => __('common.voucher_type_2'),
            ],
            'tab'        => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Giá:',
            'name'       => 'price',
            'type'       => 'number',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'suffix'     => 'Điểm',
            'tab'        => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Giảm trực tiếp trên hóa đơn:',
            'name'       => 'discount_type',
            'type'       => 'select2_from_array',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'options'    => [
                config('constants.voucher.discount_type_none')    => __('common.voucher_discount_type_0'),
                config('constants.voucher.discount_type_percent') => __('common.voucher_discount_type_1'),
                config('constants.voucher.discount_type_fixed')   => __('common.voucher_discount_type_2')
            ],
            //            'hint'       => 'Chỉ áp dụng tại Direct Shop',
            'allow_null' => false,
            'default'    => '0',
            'tab'        => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Giá trị giảm:',
            'name'       => 'discount_amount',
            'type'       => 'number',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'hint'       => '',
            'suffix'     => 'VND / %',
            'tab'        => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Số lượng mã voucher:',
            'name'       => 'quantity',
            'type'       => 'number',
            'attributes' => [
                'class' => 'form-control',
            ],
            'hint'       => 'Bỏ trống nếu số lượng không giới hạn.',
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],

            'tab' => 'Thông tin chi tiết'
        ]);

        CRUD::addField([
            'label'      => 'Số mã voucher còn lại:',
            'name'       => 'remain',
            'type'       => 'number',
            'attributes' => [
                'class'    => 'form-control',
                'disabled' => true
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'tab'        => 'Thông tin chi tiết'
        ]);
        CRUD::addField([
            'label'      => 'Nơi sử dụng:',
            'name'       => 'applicable_at',
            'type'       => 'select2_from_array',
            'options'    => [
                config('constants.voucher.apply_all')      => __('common.voucher_apply_all'),
                config('constants.voucher.apply_dealer')   => __('common.voucher_apply_dealer'),
                config('constants.voucher.apply_external') => __('common.voucher_apply_external'),
            ],
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'tab'        => 'Giới hạn'
        ]);
        CRUD::addField([
            'label'      => 'Chỉ được sử dụng tại đại lý:',
            'name'       => 'dealer',
            'type'       => 'relationship',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'hint'       => 'Chỉ áp dụng khi nơi sử dụng là "Đại lý nhất định"',
            'tab'        => 'Giới hạn'
        ]);
        CRUD::addField([
            'label'      => 'Prefix của voucher code:',
            'name'       => 'code_prefix',
            'type'       => 'text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'tab'        => 'Thông tin chi tiết'
        ]);
        CRUD::addField([
            'label'      => 'Độ dài của phần code sinh ra tự động:',
            'name'       => 'code_length',
            'type'       => 'number',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'tab'        => 'Thông tin chi tiết'
        ]);
        CRUD::addField([
            'label'      => 'Hình thức giới hạn:',
            'name'       => 'limit_mode',
            'type'       => 'select_from_array',
            'attributes' => [
                'class' => 'form-control',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'options'    => collect(config('constants.voucher.limit_mode'))->flip(),
            'tab'        => 'Giới hạn'
        ]);

        CRUD::addField([
            'label'      => 'Số lần mua tối đa / người:',
            'name'       => 'max_per_customer',
            'type'       => 'number',
            'attributes' => [
                'class' => 'form-control',
            ],
            'hint'       => 'Bỏ trống nếu có thể mua không giới hạn.',
            'wrapper'    => [
                'class' => 'form-group col-md-6'
            ],
            'suffix'     => 'lần',
            'tab'        => 'Giới hạn'
        ]);


        CRUD::addField([
            'label'   => 'Thời hạn sử dụng voucher kể từ ngày mua:',
            'name'    => 'valid_duration',
            'type'    => 'number',
            'wrapper' => [
                'class' => 'form-group col-md-6'
            ],
            'suffix'  => 'ngày',
            'tab'     => 'Giới hạn',
            'hint'    => 'Quyền ưu tiên cao hơn ngày hết hạn.',
        ]);

        CRUD::addField([
            'label'   => 'Ngày hết hạn:',
            'name'    => 'expiry_date',
            'type'    => 'date',
            'hint'    => 'Nếu voucher có thời hạn sử dụng tính theo ngày thì mục này không áp dụng.',
            'wrapper' => [
                'class' => 'form-group col-md-6'
            ],
            'suffix'  => 'ngày',
            'tab'     => 'Giới hạn'
        ]);

    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
        $voucher = Voucher::find($this->crud->getRequest()->id);
        $this->crud->setHeading($voucher->name);

        if ($this->user->isDealer()) {
            $fields = $this->crud->getFields();
            foreach ($fields as $field) {
                CRUD::modifyField($field['name'], ['attributes' => ['disabled' => 'disabled']]);
            }
        }

    }

    protected function setupImportOperation()
    {
        $this->crud->disableValidation();
        $this->crud->setSubheading('');
//        $request = $this->crud->getRequest();
//        $voucher = $this->crud->getCurrentEntry();
        $this->crud->setHeading('Import voucher codes');

        $this->crud->field('id')->attributes(['readonly' => 'readonly'])->label('Voucher ID:');
        $this->crud->field('name')->attributes(['disabled' => 'disabled'])->label('Tên voucher:');
        $this->crud->field('voucher_codes')->label('Voucher code cần nhập:')->type('textarea')
                   ->hint('Mỗi code một dòng.');

    }

//    public function show($id)
//    {
////        return redirect(route('vouchers - show', ['id' => $id]));
//    }

    public function update()
    {
        // TODO Flashback Update Error
        $request = $this->crud->getRequest();
        $requestParams = $this->crud->getRequest()->request;

        $voucher = Voucher::find($request->id);

        if ($request->quantity) {
            if ($request->quantity < ($voucher->quantity - $voucher->remain)) {
                // New quantity must be larger than or equal to number of bought codes
                throw new \ErrorException('New quantity is slower than current quantity');
            } else {
                $requestParams->add(['remain' => $request->quantity - ($voucher->quantity - $voucher->remain)]);
            }
        }

        $response = $this->traitUpdate();

        $voucher->recountCode();

        return $response;
    }

}
