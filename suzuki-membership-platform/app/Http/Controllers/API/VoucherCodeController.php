<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\VoucherCodeResource;
use App\Models\VoucherCode;
use Illuminate\Http\Request;

class VoucherCodeController extends Controller
{
    public function index(Request $request)
    {
        $searchTerm = $request->input('q');
        $formInputs = collect($request->input('form'))->pluck('value', 'name');
        $voucherCodes = VoucherCode::query();

        if ($searchTerm) {
            $voucherCodes->where('code', 'LIKE', '%'.$searchTerm.'%');
        }

//        $voucherCodes->where([
//            'customer_id' => $formInputs['customer_id'],
//            'status'      => config('constants.voucher_code.status_new'),
//            ['discount_type', '<>', config('constants.voucher.discount_type_none')]
//        ]);

        $voucherCodes->selectRaw('voucher_codes.id AS id, CONCAT(code, " - ", vouchers.name) AS code, discount_type AS `data-discount-type`, discount_amount AS `data-discount-amount`')
                     ->whereIn('voucher_id', function ($query) {
                         $query->select('id')
                               ->from('vouchers')
                               ->where('discount_type', '<>', config('constants.voucher.discount_type_none'))
                               ->where('vendor_id', 11); // Get only discountable vouchers from VISUCO
                     })
                     ->where([
                         'customer_id' => $formInputs['customer_id'],
                         'status'      => config('constants.voucher_code.status_new'),
                     ])
                     ->join('vouchers', 'voucher_id', '=', 'vouchers.id')
                     ->orderByDesc('purchased_at');

        return new VoucherCodeResource($voucherCodes->get());
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
