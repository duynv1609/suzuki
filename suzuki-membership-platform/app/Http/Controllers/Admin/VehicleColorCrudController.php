<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\VehicleColorRequest;
use App\Models\VehicleColor;
use App\Models\VehicleModel;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class VehicleColorCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VehicleColorCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation;
    use UpdateOperation;
    use DeleteOperation;
    use ShowOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(VehicleColor::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.colors'));
        CRUD::setEntityNameStrings('Vehicle Color', 'Vehicle Colors');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::addColumn([
            'name'   => 'image',
            'type'   => 'image',
            'height' => '256px',
            'width'  => '256px',
            'orderable' => false,
        ]);
        CRUD::addColumn('name');
        CRUD::addColumn('code');
        CRUD::addColumn([
            'label'     => 'Model Name',
            'type'      => 'relationship',
            'name'      => 'vehicle_model',
            'attribute' => 'name',

        ]);

        $this->crud->addFilter([
            'name'  => 'vehicle_model_id',
            'type'  => 'dropdown',
            'label' => 'Filter by Models'
        ], function () {
            return VehicleModel::orderBy('name')->get()->pluck('name', 'id')->toArray();
        }, function ($value) {
            $this->crud->addClause('where', 'vehicle_model_id', $value);
        });
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(VehicleColorRequest::class);
        CRUD::addField('code');
        CRUD::addField('name');
        CRUD::addField('vehicle_model');
        CRUD::addField(['name' => 'image', 'type' => 'image', 'label' => 'Hình ảnh']);
        CRUD::addField([
            'name'    => 'status',
            'type'    => 'radio',
            'label'   => 'Trạng thái',
            'options' => [
                0 => "Không sử dụng",
                1 => "Sử dụng"
            ],
            'inline'  => true
        ]);

        /**
         * Fields can be defined using the fluent syntax or array syntax:
         * - CRUD::field('price')->type('number');
         * - CRUD::addField(['name' => 'price', 'type' => 'number']));
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
