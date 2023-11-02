<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Membership;
use Illuminate\Http\Request;

class MembershipController extends Controller
{

    public function index(Request $request)
    {
        $memberships = Membership::query();
        if ($request->has('customer_id')) {
            $memberships->where('customer_id', $request->vehicle_id);
        }
        $membership = $memberships->first();
        if ($membership) {
            return $membership->toJson();
        } else {
            return collect(['remaining_quota' => config('constants.membership.annual_quota')])->toJson();
        }
//        foreach ($memberships as $membership) {
//            $membership->ratio = config('constants.membership.discount.'.$membership->level);
//        }
//        $membership->remaining_quota = number_format($membership->remaining_quota, 0, ',', '.');
//        return $membership->toJson();
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
