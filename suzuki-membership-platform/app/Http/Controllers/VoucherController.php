<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Vendor;
use App\Models\Voucher;
use App\Models\VoucherCode;
use ErrorException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class VoucherController extends Controller
{

    public function index()
    {
        $customer = Auth::getUser()->customer;
        $customerVehicleTypes = $customer->vehicle_type == 3 ? [1,2,3] : [$customer->vehicle_type];
	    $filterVoucherOfCustomer = Voucher::whereIsActive(1)
                ->where(function ($query) {
                    $query->where('remain', '<>', 0)
                          ->orwhere('remain','=',null);
		    })->whereIn('vehicle_types', $customerVehicleTypes)
              ->orderByDesc('id')
              ->with('vendor')
              ->paginate(10);
        // Collect voucher IDs to check if customer bought them
//        $voucherCodes = $customer->voucherCodes()->whereIn('voucher_id',
//            $vouchers->pluck('id')->toArray())->get()->pluck('id')->toArray();

        $vendors = Vendor::all();

        return view('voucher.index', [
            'page_title' => 'Danh sách Voucher',
            'vouchers'   => $filterVoucherOfCustomer,
            'customer'   => $customer,
            //            'voucherCodes' => $voucherCodes,
            'vendors'    => $vendors
        ]);
    }

    public function show(Request $request)
    {
        $errorMessages = [];
        $voucher = Voucher::with('vendor')->findOrFail($request->id);
        $customer = Auth::getUser()->customer;

        $voucherCodes = $customer->voucherCodes()->where([
            'voucher_id' => $voucher->id
        ])->orderbyDesc('purchased_at')->get();

        $canBuy = $customer->canBuyVoucher($voucher, $voucherCodes);

        return view('voucher.show', [
            'voucher'       => $voucher,
            'customer'      => $customer,
            'voucherCodes'  => $voucherCodes,
            'pageTitle'     => $voucher->name,
            'errorMessages' => $errorMessages,
            'canBuy'        => $canBuy
        ]);
    }

    public function buy(Request $request)
    {
        $customer = Auth::getUser()->customer;

        $validator = Validator::make($request->all(), [
            'voucher_id' => 'required|numeric|gt:0'
        ]);

        if ($validator->fails()) {
            abort(404);
        }

        $voucherId = $request->voucher_id;

        try {
            $voucher = Voucher::where('id', $voucherId)->firstOrFail();
        } catch (ModelNotFoundException $ex) {
            abort(404);
        }

        $canBuy = $customer->canBuyVoucher($voucher);

        if ($canBuy === true) {
            if ($voucher) {
                if ($voucher->createVoucherCode()) { // Voucher code is successfully created
                    // Decrease remaining number by 1
                    $voucher->recountCode();

                    return redirect()->back()->with('buy_successfully',
                        'Bạn đã mua thành công Voucher này!');
                }
            }
        } else {
            throw new ErrorException($canBuy[0]);
        }

//        $count = VoucherCode::where([
//            'customer_id' => $customer->id,
//            'voucher_id'  => $voucherId
//        ])->get()->count();
//
//        if ($voucher->max_per_customer !== null && $count >= $voucher->max_per_customer) {
//            // TODO Maximum limit reached
//            throw new \ErrorException('Cannot buy anymore.');
//        }
//
//        if ($customer->point_balance < $voucher->price) {
//            // TODO Not enough balance
//            throw new \ErrorException('Not enough balance.');
//        }
//        if ($voucher->quantity > 0 && $voucher->remain === 0) {
//            // TODO Out of stock
//            throw new \ErrorException('Out of stock.');
//        }


    }
}
