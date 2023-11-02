<?php

namespace App\Http\Controllers;

use App\Models\Vendor;
use App\Models\Voucher;
use Illuminate\Http\Request;

class VendorController extends Controller
{
    public function show($slug)
    {
        $vendor = Vendor::where('slug', $slug)->firstOrFail();
        $vouchers = Voucher::where('vendor_id', $vendor->id)->orderByDesc('created_at')->get();

        return view('supplier.show', [
            'vendor'   => $vendor,
            'vouchers' => $vouchers,
        ]);
    }
}
