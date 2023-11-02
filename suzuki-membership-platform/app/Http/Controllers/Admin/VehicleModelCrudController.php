<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\VehicleModelRequest;
use App\Models\VehicleModel;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Support\Facades\Validator;

/**
 * Class VehicleModelCrudController
 *
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VehicleModelCrudController extends CrudController
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
        CRUD::setModel(VehicleModel::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/vehicle_models');
        CRUD::setEntityNameStrings('Mẫu xe', 'Mẫu xe');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {

        $this->crud->column('image')->label('Hình ảnh')->type('image')->width('100px')->height('100px');
        $this->crud->column('id')->label('Mã');
        $this->crud->column('name')->label('Tên');


        /**
         * Columns can be defined using the fluent syntax or array syntax:
         * - CRUD::column('price')->type('number');
         * - CRUD::addColumn(['name' => 'price', 'type' => 'number']);
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
        $this->crud->field('id')
            ->label('Mã của mẫu xe:')
            ->attributes(['readonly' => 'readonly']);

    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(VehicleModelRequest::class);

        CRUD::addField([
            'name' => 'id',
            'label' => 'Mã của mẫu xe:',
            'type' => 'text',
        ]);
        CRUD::addField([
            'name' => 'slug',
            'label' => 'Slug của mẫu xe:',
            'type' => 'text',
        ]);
        $this->crud->field('name')->label('Tên  của mẫu xe:');
        CRUD::addField([
            'name' => '2w4w',
            'label' => 'Loại xe',
            'type' => 'select2_from_array',
            'options' => [
	            config('constants.vehicle_model.2w4w.4w') => 'Xe 4 bánh',
	            config('constants.vehicle_model.2w4w.2w') => 'Xe 2 bánh',
            ]
        ]);
        $this->crud->field('year')->label('Năm (đời) của mẫu xe:')->type('number');
        $this->crud->field('image')->type('image')->label('Hình mẫu xe');
        /**
         * Fields can be defined using the fluent syntax or array syntax:
         * - CRUD::field('price')->type('number');
         * - CRUD::addField(['name' => 'price', 'type' => 'number']));
         */
    }
}
