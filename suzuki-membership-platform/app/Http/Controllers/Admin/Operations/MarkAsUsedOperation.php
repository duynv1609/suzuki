<?php

namespace App\Http\Controllers\Admin\Operations;

use Illuminate\Support\Facades\Route;

trait MarkAsUsedOperation
{
    /**
     * Define which routes are needed for this operation.
     *
     * @param  string  $segment  Name of the current entity (singular). Used as first URL segment.
     * @param  string  $routeName  Prefix of the route name.
     * @param  string  $controller  Name of the current CrudController.
     */
    protected function setupMarkAsUsedRoutes($segment, $routeName, $controller)
    {
        Route::get($segment.'/{id}/mark-as-used', [
            'as'        => $routeName.'.markAsUsed',
            'uses'      => $controller.'@markAsUsed',
            'operation' => 'markAsUsed',
        ]);
    }


    protected function setupMarkAsUsedDefaults()
    {
        $this->crud->allowAccess('markAsUsed');

        $this->crud->operation('markAsUsed', function () {
            $this->crud->loadDefaultOperationSettingsFromConfig();
        });

        $this->crud->operation('list', function () {
            // $this->crud->addButton('top', 'markasused', 'view', 'crud::buttons.markasused');
            $this->crud->addButton('line', 'markAsUsed', 'view', 'crud::buttons.mark-as-used');
        });
    }

    public function markAsUsed()
    {
        $this->crud->hasAccessOrFail('markAsUsed');

        // prepare the fields you need to show
        $this->data['crud'] = $this->crud;
        $this->data['title'] = $this->crud->getTitle() ?? 'markAsUsed '.$this->crud->entity_name;

        // load the view
        return view("admin.voucher_code.mark-as-used", $this->data);
    }
}
