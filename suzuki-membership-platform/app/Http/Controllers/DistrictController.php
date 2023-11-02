<?php

namespace App\Http\Controllers;

use App\Http\Resources\DistrictResource;
use App\Models\District;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class DistrictController extends Controller
{
    public function index(Request $request)
    {
        $searchTerm = $request->input('q');
        $frontend = false;

        if ($request->has('province')) {
            $frontend = true;
            $provinceId = $request->province;
        } else {
            $form = collect($request->input('form'))->pluck('value', 'name');
            if (!$form['province']) {
                return [];
            }
            $provinceId = $form['province'];
        }

        $district = District::query();

        if ($frontend) {
            $district->select(['id', 'name as text']); //Used for Select2
        }

        if ($provinceId) {
            $district = $district->where('province_id', intval($provinceId));
        }

        if ($searchTerm) {
            $district = $district->where('name', 'LIKE', '%'.$searchTerm.'%');
        }

        $district->orderBy('name');

        return new DistrictResource($district->get());
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
