<?php

namespace App\Http\Controllers\Admin\Operations;

use App\Models\VoucherCode;
use Exception;
use Illuminate\Support\Facades\Request;
use Illuminate\Support\Facades\Route;

trait ImportOperation
{
    /**
     * Define which routes are needed for this operation.
     *
     * @param  string  $segment  Name of the current entity (singular). Used as first URL segment.
     * @param  string  $routeName  Prefix of the route name.
     * @param  string  $controller  Name of the current CrudController.
     */
    protected function setupImportRoutes($segment, $routeName, $controller)
    {
        Route::get($segment.'/{id}/import', [
            'as'        => $routeName.'.import',
            'uses'      => $controller.'@getImport',
            'operation' => 'import',
        ]);

        Route::put($segment.'/{id}/import', [
            'as'        => $routeName.'.import',
            'uses'      => $controller.'@putImport',
            'operation' => 'import',
        ]);
    }

    /**
     * Add the default settings, buttons, etc that this operation needs.
     */
    protected function setupImportDefaults()
    {
        $this->crud->allowAccess('import');

        $this->crud->operation('import', function () {
            $this->crud->loadDefaultOperationSettingsFromConfig();
        });

        $this->crud->operation('list', function () {
            $this->crud->addButton('line', 'import', 'view', 'crud::buttons.import', 'end');
        });


    }

    public function getImport($id)
    {
        $this->crud->disableValidation();
        $this->crud->hasAccessOrFail('import');
        $id = $this->crud->getCurrentEntryId() ?? $id;
        $this->crud->setOperationSetting('fields', $this->crud->getUpdateFields());
        // prepare the fields you need to show
        $this->data['crud'] = $this->crud;
        $this->data['entry'] = $this->crud->getEntry($id);
        $this->data['title'] = $this->crud->getTitle() ?? 'import '.$this->crud->entity_name;
        $this->data['id'] = $id;

        return view('admin.voucher.import', $this->data);
    }

    public function putImport(Request $request)
    {
        $request = $this->crud->getRequest();
        $request->validate([
            'voucher_id'   => 'required',
            'voucher_code' => 'required'
        ]);
        try {
            $voucherCode = VoucherCode::create([
                'code'       => $request->voucher_code,
                'voucher_id' => $request->voucher_id,
                'status'     => config('constants.voucher_code.status_imported')
            ]);
            if ($voucherCode) {
                if ($request->recount) {
                    $voucher = $this->crud->getEntry($request->voucher_id);
                    $voucher->recountCode();
                }
                return response([
                    'status' => 'success'
                ]);
            }
        } catch (Exception $ex) {
            return response([
                'status'  => 'fail',
                'message' => $ex->getMessage()
            ], 500);
        }

    }
}
