<?php
/*
 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
 * @package Suzuki Membership Platform
 * @copyright 2020. Vietnam Suzuki Corporation (VISUCO)
 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
 * @link https://suzuki.com.vn
 */

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\VoucherCode;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Str;

class SearchController extends Controller
{
    public function index(Request $request)
    {
        $view = view('admin.search.index');
        if ($request->method() == 'POST') {
            if ($request->has('voucher_code')) {
                try {
                    $code = VoucherCode::where('code', $request->voucher_code)->firstOrFail();
                    return redirect(backpack_url(config('constants.adminRoutes.voucher_codes')).'/'.$code->id.'/show');
                } catch (ModelNotFoundException $ex) {
                    return redirect()->back()->with('error',
                        'Không tìm thấy voucher với mã <span class="text-monospace font-weight-bold text-uppercase">'.$request->voucher_code.'</span>.')->withInput();
                }
            } elseif ($request->has('search_term')) {
                $query = Customer::query();
                $term = $request->search_term;

                if (is_numeric($term)) {
                    if (Str::length($term) == 9 || Str::length($term) == 12) { // CMND / CCCD
                        $query = $query->where('id_number', $term);
                    }
                    if (Str::length($term) == 10) { // Mobile
                        $query = $query->where('mobile', $term);
                    }
                } elseif (Str::contains($term, '@')) { // Email
                    $query = $query->where('email', $term);
                } else {
                    return redirect()->to(url()->previous().'#'.$request->active_tab)->withInput()->with('error',
                        'Nội dung tìm kiếm không đúng định dạng.');
                }
                try {
                    $customer = $query->firstOrFail();
                } catch (ModelNotFoundException $ex) {
                    return redirect()->to(url()->previous().'#'.$request->active_tab)->withInput()->with('error',
                        'Không có kết quả nào phù hợp.');
                }
                return redirect()->to(backpack_url(config('constants.adminRoutes.customers')).'/'.$customer->id.'/edit');

            }
        }
        return $view;
    }
}