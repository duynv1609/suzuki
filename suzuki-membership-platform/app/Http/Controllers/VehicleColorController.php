<?php

namespace App\Http\Controllers;

use App\Http\Resources\VehicleColorResource;
use App\Models\VehicleColor;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class VehicleColorController extends Controller
{
    public function index(Request $request)
    {
        $searchTerm = $request->input('q');
        $form = collect($request->input('form'))->pluck('value', 'name');
        $colors = VehicleColor::query();

        if (!$form['model']) {
            return [];
        }

        if ($form['model']) {
            $colors = $colors->where('vehicle_model_id', $form['model']);
        }

        if ($searchTerm) {
            $colors = $colors->where('name', 'LIKE', '%'.$searchTerm.'%');
        }

        return new VehicleColorResource($colors->get()->sortBy('name'));
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
        //
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
        //
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
