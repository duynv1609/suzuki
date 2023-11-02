<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CustomerResource;
use App\Models\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{

    public function index(Request $request)
    {
        $formInputs = collect($request->input('form'))->pluck('value', 'name');
        $customers = Customer::query();

        if ($searchQuery = $request->input('term')) {
            $customers->selectRaw('*, CONCAT(name, " - ", mobile, " - ", email) AS name');
            $customers->where('name', 'LIKE', '%'.$searchQuery.'%');
            $customers->orWHere('mobile', 'LIKE', '%'.$searchQuery.'%');
        } elseif ($searchQuery = $request->input('q')) {
            $customers->selectRaw('*, CONCAT(name, " - ", mobile, " - ", email) AS admin_display_name');
            $customers->where('name', 'LIKE', '%'.$searchQuery.'%');
            $customers->orWHere('mobile', 'LIKE', '%'.$searchQuery.'%');
        }


        return new CustomerResource($customers->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
