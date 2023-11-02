<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Order;
use App\Models\PointHistory;
use App\Models\User;
use App\Models\Voucher;
use App\Models\VoucherCode;
use Carbon\Traits\Creator;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        if ($request->start_date) {
            $startDate = new Carbon($request->start_date);
            $startDate = $startDate->startOfDay();
        } else {
            $startDate = now()->subDays(30)->startOfDay()->toDateTimeString();
        }
        if ($request->end_date) {
            $endDate = new Carbon($request->end_date);
            $endDate = $endDate->endOfDay();
        } else {
            $endDate = now()->endOfDay()->toDateTimeString();
        }


        // Tong so luong member moi
        $totalRegistrations = User::whereHas('roles', function ($query) {
            return $query->where('name','=', 'Customer');
        })->whereBetween('created_at', [$startDate, $endDate])->get()->count();

        // Tong so luong member da su dung tich diem
        $totalEarnedCustomers = PointHistory::whereBetween('created_at', [$startDate, $endDate])
                                            ->where('amount', '>', 0)->where('type',
                config('constants.point_history_type.earn_from_order'))->count('customer_id');

        // So luong member da su dung voucher giam gia
        $usedVoucherCodes = VoucherCode::whereBetween('applied_at', [$startDate, $endDate])
                                       ->whereIn('voucher_id', function ($query) {
                                           $query->select('id')->from('vouchers')
                                                 ->where('discount_type', '<>',
                                                     config('constants.voucher.discount_type_none'));
                                       })->count('customer_id');

        // So luong member da su dung voucher cua vendor khac
        $usedExternalVoucherCodes = VoucherCode::whereBetween('applied_at', [$startDate, $endDate])
                                               ->whereIn('voucher_id', function ($query) {
                                                   $query->select('id')->from('vouchers')
                                                         ->where('vendor_id', '<>',
                                                             config('constants.vendor.visuco_id'));
                                               })->count('customer_id');

        // Tổng số tiền KH đã chi trả & được ghi nhận trong membership
        $totalOrderValue = Order::whereBetween('ordered_at', [$startDate, $endDate])->sum('original_value');

        //Tổng số tiền đã discount cho KH
        $totalDiscountValue = $totalOrderValue - Order::whereBetween('ordered_at', [$startDate, $endDate])->sum('discounted_value');

        // Tổng số lần thực hiện discount của cả hệ thống
        $totalDiscountTimes = Order::whereBetween('ordered_at', [$startDate, $endDate])->where('discounted_value', '<',
            'original_value')->count();

        // Tổng số voucher discount được đổi
        $boughtVoucherCodeCount = VoucherCode::whereBetween('purchased_at', [$startDate, $endDate])
                                             ->whereIn('voucher_id', function ($query) {
                                                 $query->select('id')->from('vouchers')
                                                       ->where('vendor_id', '=',
                                                           config('constants.vendor.visuco_id'));
                                             })->count();

        // Tổng số voucher của vendor ngoài được đổi
        $boughtExternalVoucherCodeCount = VoucherCode::whereBetween('purchased_at', [$startDate, $endDate])
                                                     ->whereIn('voucher_id', function ($query) {
                                                         $query->select('id')->from('vouchers')
                                                               ->where('vendor_id', '<>',
                                                                   config('constants.vendor.visuco_id'));
                                                     })->count();

        return view('admin.report.index', [
            'totalRegistrations'             => $totalRegistrations,
            'totalEarnedCustomers'           => $totalEarnedCustomers,
            'usedVoucherCodes'               => $usedVoucherCodes,
            'usedExternalVoucherCodes'       => $usedExternalVoucherCodes,
            'totalOrderValue'                => $totalOrderValue,
            'totalDiscountValue'             => $totalDiscountValue,
            'totalDiscountTimes'             => $totalDiscountTimes,
            'boughtVoucherCodeCount'         => $boughtVoucherCodeCount,
            'boughtExternalVoucherCodeCount' => $boughtExternalVoucherCodeCount,
            'startDate'                      => $startDate,
            'endDate'                        => $endDate,
        ]);
    }
}
