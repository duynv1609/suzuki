<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Admin\Operations\SMPFetchOperation;
use App\Http\Requests\MembershipRequest;
use App\Models\Membership;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class MembershipCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class MembershipCrudController extends CrudController
{
    use ListOperation;
//    use CreateOperation {
//        store as traitStore;
//    }

//    use UpdateOperation;
//    use DeleteOperation;
    use ShowOperation;
    use SMPFetchOperation;

    public function setup()
    {
        CRUD::setModel(Membership::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.membership'));
        CRUD::setEntityNameStrings('membership', 'memberships');
    }


    protected function setupListOperation()
    {

        CRUD::column('id')->label('Membership ID');
        CRUD::column('customer_id')->label('Customer ID');
        CRUD::column('customer')->type('relationship');
        CRUD::column('created_at');
        CRUD::addColumn([
            'name'          => 'stat',
            'label'         => 'Trạng thái',
            'type'          => 'model_function',
            'function_name' => 'statusToText',
        ]);
    }

    protected function setupCreateOperation()
    {
        $request = $this->crud->getRequest();
        CRUD::setValidation(MembershipRequest::class);

        if ($request->has('customer_id')) {
            CRUD::addField([
                'options' => (function ($query) {
                    return $query->where('id', $this->crud->getRequest()->customer_id)->get();
                }),
                'type'    => 'select2',
                'name'    => 'customer_id',
                'default' => $this->crud->getRequest()->customer_id,
                'label'   => 'Hội viên:'
            ]);
        } else {
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
            ]);
        }

        CRUD::addField([
            'type'                    => 'select2_from_ajax',
            'name'                    => 'vehicle_id',
            'label'                   => 'Xe của khách:',
            'entity'                  => 'vehicle',
            'minimum_input_length'    => 0,
            'placeholder'             => '- Chọn xe của khách hàng -',
            'data_source'             => url('api/vehicles'),
            'attribute'               => 'display_name',
            'dependencies'            => ['customer_id'],
            'include_all_form_fields' => true
        ]);

        CRUD::addField([
            'name'                => 'created_at',
            'label'               => 'Ngày bắt đầu:',
            'type'                => 'date_picker',
            'date_picker_options' => [
                'todayBtn' => 'linked',
                'format'   => 'dd/mm/yyyy'
            ],
            'default'             => now()->format('Y-m-d')
        ]);

        CRUD::addField([
            'name'                => 'ended_at',
            'label'               => 'Ngày hết hạn:',
            'hint'                => 'Membership mặc định có thời hạn 1 năm kể từ ngày tạo.',
            'type'                => 'date_picker',
            'date_picker_options' => [
                'todayBtn'    => 'linked',
                'format'      => 'dd/mm/yyyy',
                'defaultDate' => '1/1/1'
            ],
            'default'             => now()->addDays(365)->format('Y-m-d')
        ]);

        CRUD::addField([
            'name'    => 'level',
            'label'   => 'Cấp:',
            'type'    => 'select2_from_array',
            'default' => now()->addDays(365)->format('d/m/Y'),
            'options' => [
                '1' => 'Năm 1: Giảm '.config('constants.membership.discount.1').'% Service',
                '2' => 'Năm 2: Giảm '.config('constants.membership.discount.2').'% Service',
                '3' => 'Năm 3: Giảm '.config('constants.membership.discount.3').'% Service',
            ]
        ]);


    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
        CRUD::removeField('vehicle_id');
        CRUD::removeField('customer_id');
        CRUD::addField([
            'name'       => 'customer',
            'type'       => 'relationship',
            'attributes' => [
                'disabled' => 'disabled'
            ]
        ])->makeFirstField();
        CRUD::addField([
            'name'       => 'vehicle',
            'attributes' => [
                'disabled' => 'disabled'
            ]
        ])->afterField('customer');
    }

    public function store()
    {
        $request = $this->crud->getRequest();
        $request->request->remove('customer_id');
        $response = $this->traitStore();
        // do something after save
        return $response;
    }
}
