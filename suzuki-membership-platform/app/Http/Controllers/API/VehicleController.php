<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\VehicleColorResource;
use App\Http\Resources\VehicleResource;
use App\Models\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class VehicleController extends Controller
{
    public function index(Request $request)
    {
        $searchTerm = $request->input('q');
        $form = collect($request->input('form'))->pluck('value', 'name');
        $vehicles = Vehicle::query();

        if (empty($form['customer_id']) && empty($form['vehicle_id'])) {
            return [];
        }

        if (isset($form['customer_id'])) {
            $vehicles = $vehicles->where('customer_id', $form['customer_id']);
            return new VehicleResource($vehicles->get());
        }

        if (isset($form['vehicle_id'])) {
            $vehicles = $vehicles->find($form['vehicle_id']);
            return new VehicleResource($vehicles);
        }

        /*if (isset($form['membership_only']) && $form['membership_only']) {
            $vehicles = $vehicles->select(['vehicles.*', 'memberships.id as membership_id', 'level']);
            $vehicles = $vehicles->join('memberships', 'vehicle_id', '=', 'vehicles.id');
            $vehicles = $vehicles->where('memberships.ended_at', '>', now());
        }*/

        return [];

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        return new VehicleResource(Vehicle::find($id));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
