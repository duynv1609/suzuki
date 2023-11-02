<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\DealerRequest;
use App\Models\Dealer;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class DealerCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class DealerCrudController extends CrudController
{
    use ListOperation;
    use CreateOperation;
    use UpdateOperation;
    use DeleteOperation;
    use ShowOperation;


    public function setup()
    {
        CRUD::setModel(Dealer::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.dealers'));
        CRUD::setEntityNameStrings('dealer', 'dealers');
    }

    protected function setupListOperation()
    {

        $this->crud->addColumn('id');
        $this->crud->column('name')->limit(500)->label('Tên ngắn');
        $this->crud->column('province')->type('relationship')->label('Khu vực');

    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(DealerRequest::class);
        CRUD::addField('name');
        CRUD::addField('website');
        CRUD::addField([
            'name'   => 'province',
            'type'   => 'relationship',
        ]);
        CRUD::addField('address');
        CRUD::addField(['name' => 'phone', 'type' => 'text']);
        CRUD::addField('email');
    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
//        CRUD::addField('id');

    }
}
