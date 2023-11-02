<?php

namespace App\Http\Controllers\Admin;

use Alert;
use App\Helpers\SMPHelper;
use App\Http\Requests\OrderRequest;
use App\Imports\OrderImport;
use App\Models\Customer;
use App\Models\Membership;
use App\Models\Order;
use App\Models\Province;
use App\Models\Vehicle;
use App\Models\VoucherCode;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\FetchOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Helper;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;
use Validator;

/**
 * Class OrderCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class OrderCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation {
        store as TraitStore;
    }
    use UpdateOperation {
        update as TraiUpdate;
    }

//    use UpdateOperation {
//        update as TraiUpdate;
//    }

    use DeleteOperation;

    use ShowOperation;
    use FetchOperation;

    public function setup()
    {
        CRUD::setModel(Order::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.orders'));
        CRUD::setEntityNameStrings('Order', 'Orders');
        if (Auth::getUser()->hasPermissionTo('Delete Order')) {
            $this->crud->allowAccess(['delete']);
        } else {
            $this->crud->denyAccess(['delete']);
        }
    }

    protected function setupListOperation()
    {
        CRUD::addColumn(['name' => 'id', 'label' => 'Mã đơn', 'type' => 'text']);
        CRUD::addColumn(['name' => 'invoice_code', 'label' => 'Mã kế toán']);
        CRUD::addColumn(['name' => 'customer', 'label' => 'Khách hàng', 'attribute' => 'name']);
        CRUD::addColumn([
            'name'    => 'vehicle',
            'label'   => 'Xe',
            'wrapper' => ['class' => 'text-monospace']
        ]);
//        CRUD::addColumn([
//            'name'  => 'dealer',
//            'label' => 'Đại lý tạo đơn'
//        ]);
        CRUD::addColumn(['name' => 'original_value', 'label' => 'Giá gốc', 'type' => 'number']);
        CRUD::addColumn(['name' => 'discounted_value', 'label' => 'Giá sau giảm', 'type' => 'number',]);
        CRUD::addColumn([
            'name'   => 'ordered_at',
            'label'  => 'Thời gian tạo',
            'type'   => 'datetime',
            'format' => ' HH:MM:ss, DD/MM/Y'
        ]);

        CRUD::addFilter([
            'type'  => 'text',
            'name'  => 'frame_number',
            'label' => 'Filter by VIN'
        ], false, function ($value) {
            $this->crud->addClause('whereHas', 'vehicle', function ($query) use ($value) {
                $query->where('frame_number', 'LIKE', '%'.$value.'%');
            });
        });
        CRUD::addFilter([
            'type'  => 'date_range',
            'name'  => 'date_range',
            'label' => 'Date range'
        ], false, function ($value) {
            $dates = json_decode($value);
            $this->crud->addClause('where', 'ordered_at', '>=', $dates->from);
            $this->crud->addClause('where', 'ordered_at', '<=', $dates->to.' 23:59:59');
        });

    }

    protected function setupShowOperation()
    {
        $entry = $this->crud->getCurrentEntry();
        CRUD::set('show.setFromDb', false);
        $this->crud->setHeading('View Order Detail');
        $this->crud->setSubheading('Order #'.$entry->id);
        CRUD::addColumn([
            'type'  => 'text',
            'label' => '<span class="text-primary text-uppercase">Thông tin đơn hàng</span>'
        ]);
        self::setupListOperation();
        CRUD::removeColumn('customer');
        CRUD::modifyColumn('vehicle', [
            'wrapper' => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.vehicles').'/'.$related_key.'/edit');
                },
                'target' => '_blank',
                'class'  => ''
            ]
        ]);
        if ($entry->voucherCode) {
            CRUD::addColumn(['label' => '<span class="text-primary text-uppercase">Thông tin Voucher</span>']);
            CRUD::addColumn([
                'label'   => 'Voucher:',
                'type'    => 'relationship',
                'name'    => 'voucher',
                'wrapper' => [
                    'href'   => function ($crud, $column, $entry, $related_key) {
                        return route('vouchers-show', ['id' => $related_key]);
                    },
                    'target' => '_blank'
                ]
            ]);
            CRUD::addColumn([
                'label'    => 'Mã voucher:',
                'type'     => 'closure',
                'function' => function ($entry) {
                    return $entry->voucherCode ? $entry->voucherCode->code : 'Không có';
                }
            ]);
            CRUD::addColumn([
                'label'    => 'Hình thức giảm:',
                'type'     => 'closure',
                'function' => function ($entry) {
                    return $entry->voucher->discountTypeToText();
                }
            ]);

        }

        CRUD::addColumn(['label' => '<span class="text-primary text-uppercase">Thông tin khách hàng</span>']);
        CRUD::addColumn(['label' => 'Mã KH ở Membership Platform:', 'name' => 'customer', 'attribute' => 'id']);
        CRUD::addColumn([
            'name'      => 'customer',
            'key'       => 'full_name',
            'label'     => 'Họ & tên',
            'attribute' => 'name',
            'wrapper'   => [
                'href'   => function ($crud, $column, $entry, $related_key) {
                    return backpack_url('customers/'.$related_key.'/edit');
                },
                'target' => '_blank'
            ]
        ]);
        CRUD::addColumn(['label' => 'Email:', 'name' => 'customer', 'key' => 'email', 'attribute' => 'email']);
        CRUD::addColumn([
            'label'     => 'Số điện thoại:',
            'name'      => 'customer',
            'key'       => 'mobile',
            'attribute' => 'mobile'
        ]);
        CRUD::addColumn([
            'label'     => 'Địa chỉ:',
            'name'      => 'customer',
            'key'       => 'full_address',
            'attribute' => 'full_address'
        ]);
        CRUD::addColumn([
            'label'    => 'CMND/CCCD:',
            'type'     => 'closure',
            'function' =>
                function ($entry) {
                    return $entry->customer->id_number.', cấp ngày '.$entry->customer->id_issue_date->format('d/m/Y').' tại '.Province::find($entry->customer->id_issue_province)->name;
                }
        ]);
        CRUD::addColumn(['label' => 'Ngày tạo tài khoản:', 'name' => 'customer.created_at', 'type' => 'text']);
        CRUD::addColumn([
            'label' => 'Khách của Đại lý:',
            'name'  => 'customer.dealer',
            'type'  => 'relationship',
        ]);
        CRUD::addColumn([
            'type'  => 'text',
            'label' => '<span class="text-primary text-uppercase">Thông tin Membership</span>'
        ]);
        CRUD::addColumn([
            'label'     => 'Ngày bắt đầu:',
            'attribute' => 'created_at',
            'name'      => 'customer.membership',
        ]);
        CRUD::addColumn([
            'label'     => 'Ngày kết thúc',
            'key'       => 'ended_at',
            'attribute' => 'ended_at',
            'name'      => 'customer.membership',
        ]);
        CRUD::addButtonFromView('line', 'print', 'print', 'end');
    }

    protected function setupCreateOperation()
    {
//        $customer = Auth::getUser()->customer;
//        $membership = $customer->membership;
        CRUD::setValidation(OrderRequest::class);
        CRUD::addField([
            // TODO Filter customer list by Dealer ID or based on roles
            'type'                 => 'select2_from_ajax',
            'name'                 => 'customer_id',
            'label'                => 'Khách hàng:',
            'entity'               => 'customer',
            'minimum_input_length' => 3,
            'placeholder'          => '- Chọn khách hàng -',
            'data_source'          => url('api/customers'),
            'attribute'            => 'admin_display_name',
            'attributes'           => [
                'id'       => 'order-customer-selector',
                'required' => 'required',
            ]
        ]);

        /* Select dealers from database, which is not required at this time */
        /*
        CRUD::addField([
            'name'       => 'dealer_id',
            'label'      => 'Đại lý:',
            'entity'     => 'dealer',
            'attributes' => [
                'required' => 'required',
            ]
        ]); */

        CRUD::addField([
            'name'        => 'dealer_id',
            'label'       => "Đại lý:",
            'type'        => 'select_from_array',
            'options'     => [config('constants.dealer.direct_shop_id') => 'Suzuki World'],
            'allows_null' => false,
            'default'     => config('constants.dealer.direct_shop_id'),
            //            'minimum_input_length' => 'Infinity',
            'attributes'  => [
                'id'       => 'dealer-selector',
                'readonly' => 'readonly'
            ]
        ]);

        CRUD::addField([
            'label'                   => 'Xe:',
            'name'                    => 'vehicle_id',
            'type'                    => 'select2_from_ajax',
            'entity'                  => 'vehicle',
            'attribute'               => 'display_name',
            'placeholder'             => 'Chọn xe',
            'minimum_input_length'    => 0,
            'data_source'             => url("api/vehicles"),
            'dependencies'            => 'customer_id',
            'include_all_form_fields' => 'true',
            'attributes'              => [
                'id'       => 'order-vehicle-id',
                'required' => 'required',
            ],
        ]);
        CRUD::addField([
            'name'       => 'original_value',
            'type'       => 'text',
            'label'      => 'Giá trị hóa đơn (chưa VAT):',
            'attributes' => [
                'id'           => 'original-value',
                'class'        => 'form-control text-right',
                'autocomplete' => 'off'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ]
        ]);
        CRUD::addField([
            'label'      => 'Hình thức giảm giá:',
            'name'       => 'discount_type',
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ],
            'default'    => 'Không có',
            'attributes' => [
                'id'       => 'discount-type',
                'disabled' => 'disabled',
            ]
        ]);
        CRUD::addField([
            'label'                   => 'Áp dụng Voucher:',
            'type'                    => 'select2_from_ajax',
            'name'                    => 'voucher_code_id',
            'entity'                  => 'voucherCode',
            'attribute'               => 'code',
            'placeholder'             => 'Chọn voucher',
            'minimum_input_length'    => '0',
            'data_source'             => url("api/voucher-codes?discount_only=1"),
            'include_all_form_fields' => true,
            'dependencies'            => ['customer_id'],
            'wrapper'                 => [
                'class' => 'form-group col-md-6'
            ],
            'attributes'              => [
                'id' => 'order-voucher-selector'
            ],
            'hint'                    => 'Chỉ hiển thị các voucher có thể sử dụng được'
        ]);

        CRUD::addField([
            'name'       => 'discount_amount',
            'type'       => 'text',
            'label'      => 'Số tiền được giảm:',
            'hint'       => 'Hạn mức còn trong năm: <strong><span id="quota-left"></span></strong>',
            'attributes' => [
                'disabled' => 'disabled',
                'id'       => 'discount-amount',
                'class'    => 'form-control text-right',
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ]
        ]);
        CRUD::addField([
            'name'       => 'discounted_value',
            'type'       => 'text',
            'label'      => 'Giá trị hóa đơn sau giảm:',
            'attributes' => [
                'disabled' => 'disabled',
                'id'       => 'new-value',
                'class'    => 'form-control text-right'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ]
        ]);

        CRUD::addField([
            'name'       => 'tax_value',
            'type'       => 'text',
            'label'      => 'Thuế VAT 10%:',
            'hint'       => '',
            'attributes' => [
                'disabled' => 'disabled',
                'id'       => 'tax-value'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ]
        ]);
        CRUD::addField([
            'name'       => 'total_value',
            'type'       => 'text',
            'label'      => 'Tổng tiền phải trả:',
            'attributes' => [
                'disabled' => 'disabled',
                'id'       => 'total-value',
                'class'    => 'form-control text-danger text-right font-weight-bold'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3 text-danger'
            ]
        ]);
        CRUD::addField([
            'name'       => 'ordered_at',
            //            'type'       => 'number',
            'label'      => 'Ngày của hóa đơn:',
            'attributes' => [
                'id' => 'ordered_at'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ],
            'default'    => now()
        ]);
        CRUD::addField([
            'name'       => 'converted_point',
            'type'       => 'number',
            'label'      => 'Điểm tích lũy từ hóa đơn này:',
            'hint'       => 'Tính trên giá trị hóa đơn sau giảm. Mỗi 100.000 VND = 1 điểm, bỏ phần dư',
            'attributes' => [
                'disabled' => 'disabled',
                'id'       => 'converted-point'
            ],
            'wrapper'    => [
                'class' => 'form-group col-md-3'
            ]
        ]);

        CRUD::addField([
            'name'    => 'invoice_code',
            'label'   => 'Số chứng từ:',
            'hint'    => 'Nhập mã hóa đơn trong hệ thống kế toán, phục vụ cho giải trình.',
            'wrapper' => [
                'class' => 'form-group col-md-3'
            ]
        ]);
        CRUD::addField([
            'name'  => 'detail',
            'label' => 'Chi tiết sửa chữa:'
        ]);
        CRUD::addField([
            'name'  => 'note',
            'label' => 'Ghi chú nội bộ:',
        ]);
        CRUD::addField([
            'name'  => 'separator',
            'type'  => 'custom_html',
            'value' => '<div class="alert alert-warning">Kiểm tra kỹ thông tin vì order sau khi tạo sẽ không sửa được.</div>'
        ]);

        /*        CRUD::addField([
                    'name'  => 'membership_only',
                    'type'  => 'hidden',
                    'value' => 1
                ]);*/

//        if (!$this->crud->getRequest()->old('customer_id')) {
//            CRUD::modifyField('voucher_code_id', [
//                'attributes' => [
//                    'disabled' => 'disabled',
//                    'id'       => 'order-voucher-selector'
//                ]
//            ]);
//        }
    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();

        CRUD::removeField('customer_id');
        CRUD::removeField('dealer_id');
        CRUD::removeField('vehicle_id');

        CRUD::addField([
            'name'       => 'customer_name',
            'label'      => 'Tên khách hàng:',
            'type'       => 'text',
            'default'    => $this->crud->getCurrentEntry()->customer->name,
            'attributes' => [
                'disabled' => 'disabled',
            ]
        ])->makeFirstField();

        CRUD::addField([
            'name'       => 'dealer_name',
            'label'      => 'Tên đại lý:',
            'type'       => 'text',
            'default'    => $this->crud->getCurrentEntry()->dealer->name,
            'attributes' => [
                'disabled' => 'disabled',
            ]
        ])->afterField('customer_name');


        CRUD::addField([
            'name'       => 'vehicle_name',
            'label'      => 'Phương tiện',
            'type'       => 'text',
            'default'    => $this->crud->getCurrentEntry()->vehicle->display_name,
            'attributes' => [
                'disabled' => 'disabled',
            ]
        ])->afterField('dealer_name');

        CRUD::addField([
            'name'  => 'customer_id',
            'type'  => 'hidden',
            'value' => $this->crud->getCurrentEntry()->customer->id
        ]);
        CRUD::addField([
            'name'  => 'dealer_id',
            'type'  => 'hidden',
            'value' => $this->crud->getCurrentEntry()->dealer->id
        ]);
        CRUD::addField([
            'name'  => 'vehicle_id',
            'type'  => 'hidden',
            'value' => $this->crud->getCurrentEntry()->vehicle->id
        ]);
    }

    public function fetchCustomer()
    {
        return $this->fetch([
            'model'                 => Customer::class,
            'searchable_attributes' => ['name', 'mobile', 'email'],
            'paginate'              => 10, // items to show per page
            'query'                 => function ($model) {
                return $model->selectRaw('name AS admin_display_name, customers.id, mobile, email, name, level')
                             ->join('memberships', 'customers.id', '=', 'memberships.customer_id');
            }
        ]);
    }

    public function store()
    {
        $this->crud->setOperationSetting('saveAllInputsExcept',
            ['_token', '_method', 'http_referrer', 'current_tab', 'save_action']);

        $request = $this->crud->getRequest();
        $rawOriginalValue = intval(str_replace('.', '', $request->original_value));

        /* Move to OrderRequest */

        /*        if ($request->voucher_code_id) {
                    $voucherCodeID = $request->voucher_code_id;
                    try {
                        $voucherCode = VoucherCode::findOrFail($voucherCodeID);
                    } catch (ModelNotFoundException $ex) {
                        Alert::add('error', 'Mã voucher không đúng')->flash();
                        return redirect()->back()->withInput();
                    }
                    if (!$voucherCode->isUsable()) {
                        Alert::add('error', 'Không thể sử dụng mã voucher này.')->flash();
                        return redirect()->back()->withInput();
                    }
                }*/

        $request->request->add(['original_value' => $rawOriginalValue]);
//        $vehicleID = $request->vehicle_id;
//        $membership = Membership::getCurrentActiveMembership($vehicleID);
//        if ($membership) {
//            $request->request->add(['discounted_value' => $discountedValue]);
        return $this->traitStore();
//        } else {
//        return redirect()->back()->with('error', 'Xe đã chọn không có membership.');
//        }
    }

    public function update()
    {
        $request = $this->crud->getRequest();
        $rawOriginalValue = intval(str_replace('.', '', $request->original_value));
        $request->request->add(['original_value' => $rawOriginalValue]);
        return $this->TraiUpdate();
    }

    public function import(Request $request)
    {
        if ($request->getMethod() == 'GET') {
            return view('admin.order.import');
        }
        if ($request->getMethod() == 'POST') {
            $isPreview = $request->action == 'preview';
            $isImport = $request->action == 'import';

            if ($isPreview || $isImport) {

                $file = $request->file('excel-file');
                $collection = Excel::toCollection(new OrderImport, $file)->get(0);
                $returnedData = new Collection();

                // Skip the first header row
                for ($i = 1; $i < $collection->count(); $i++) {

                    $data = [];
                    $data['name'] = trim($collection[$i][0]);
                    $data['vin'] = trim($collection[$i][5]);
                    $data['date'] = gmdate('Y-m-d', Helper::dateFromExcel(intval(trim($collection[$i][10]))));
                    $data['code'] = trim($collection[$i][11]);
                    $data['detail'] = trim($collection[$i][15]);
                    $data['amount'] = trim(intval($collection[$i][16]));

                    $validator = Validator::make($data, [
                        'vin'    => 'bail|exists:vehicles,frame_number',
                        'code'   => ['bail', 'required', 'alpha_num', 'not_regex:/BH.+/', 'unique:orders,invoice_code'],
                        'name'   => 'required',
                        'date'   => 'date_format:Y-m-d',
                        'amount' => 'numeric|gt:0',
                    ], [
                        'code.not_regex' => 'Hóa đơn Bảo hành / Bảo hiểm sẽ không được nhập.',
                        'exists'         => ':attribute chưa có trong hệ thống.',
                        'unique'         => ':attribute đã tồn tại.'
                    ], [
                        'vin'  => 'VIN',
                        'code' => 'Số chứng từ'
                    ]);

                    if ($validator->fails()) {
                        $data['messages'] = $validator->messages()->getMessages();
                    } else {
                        if ($isImport) {
                            $vehicle = Vehicle::with('customer')->where('frame_number', $data['vin'])->first();
                            $vehicle->orders()->create([
                                'customer_id'    => $vehicle->customer->id,
                                //TODO: Remove Direct Shop ID with real Dealer ID
                                'dealer_id'      => config('constants.dealer.direct_shop_id'),
                                'original_value' => round(intval($data['amount']) / 1.1, 0, PHP_ROUND_HALF_DOWN),
                                'invoice_code'   => $data['code'],
                                'ordered_at'     => $data['date'],
                                'detail'         => $data['detail'],
                            ]);
                            $data['success'] = 'Import thành công';
                        }
                    }
                    $returnedData->add($data);
                }
//                dd($returnedData);
                echo view('admin.import-preview',
                    ['rows' => $returnedData, 'isImport' => $isImport, 'isPreview' => $isPreview]);
            }

        }
        return false;
    }
}
