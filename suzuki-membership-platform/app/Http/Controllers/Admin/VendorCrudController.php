<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\VendorRequest;
use App\Models\Vendor;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
use Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanel;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class VendorCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class VendorCrudController extends CrudController
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
        CRUD::setModel(Vendor::class);
        CRUD::setRoute(config('backpack.base.route_prefix').'/'.config('constants.adminRoutes.vendors'));
        CRUD::setEntityNameStrings('Nhà cung cấp', 'Nhà cung cấp');
    }

    protected function setupListOperation()
    {
        $this->crud->addColumn(['name' => 'id', 'label' => 'ID']);
        $this->crud->addColumn([
            'name'    => 'name',
            'label'   => 'Tên',
            'wrapper' => [
                'href' => function ($crud, $column, $entry, $related_key) {
                    return backpack_url(config('constants.adminRoutes.vendors').'/'.$entry->id.'/edit');
                }
            ]
        ]);
        $this->crud->addColumn(['name' => 'address', 'label' => 'Địa chỉ', 'limit' => 500]);
    }

    protected function setupCreateOperation()
    {
        CRUD::setValidation(VendorRequest::class);
        $this->crud->field('name')->type('text')->label('Tên nhà cung cấp:')->tab('Thông tin công khai');
        $this->crud->field('slug')->type('text')->label('Slug:')->tab('Thông tin công khai');
        $this->crud->field('address')->type('text')->label('Địa chỉ:')->tab('Thông tin công khai');
        $this->crud->field('phone')->type('text')->label('Số điện thoại:')->tab('Thông tin công khai');
        $this->crud->field('email')->type('email')->label('Email:')->tab('Thông tin công khai');
        $this->crud->field('website')->type('url')->label('Website:')->tab('Thông tin công khai');
        $this->crud->field('short_description')->type('textarea')->label('Giới thiệu ngắn:')->tab('Thông tin công khai');
        $this->crud->field('description')->type('wysiwyg')->label('Giới thiệu đầy đủ:')->tab('Thông tin công khai');
        $this->crud->field('image')->type('image')->label('Logo:')->tab('Thông tin công khai');
        $this->crud->field('cover')->type('image')->label('Ảnh cover:')->tab('Thông tin công khai');

        $this->crud->field('contact_name')->type('text')->label('Tên người liên hệ:')->tab('Thông tin nội bộ');
        $this->crud->field('contact_phone')->type('number')->label('Số điện thoại liên hệ:')->tab('Thông tin nội bộ');
        $this->crud->field('contact_email')->type('email')->label('Email liên hệ:')->tab('Thông tin nội bộ');
    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
