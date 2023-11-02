@extends('layout.dashboard')

@section('right-section')
    <div class="card card-custom gutter-b">
        <div class="card-body p-0">
            <!-- begin: Invoice-->
            <!-- begin: Invoice header-->
            <div class="row justify-content-center px-5 px-md-20 pt-5 pt-md-20 pb-5">
                <div class="col-12">
                    <h1 class="display-5 font-weight-bolder mb-10 text-uppercase">Chi tiết dịch vụ: #{{ str_pad($order->id,7,'0',STR_PAD_LEFT) }}</h1>
                    <p class="font-weight-bolder mb-2 text-uppercase text-muted">Hội viên</p>
                    <h5>{{ $customer->name  }}</h5>
                    <p>{{ $customer->full_address }}</p>
                    <div class="border-bottom w-100"></div>
                    <div class="row pt-5">
                        <div class="col-4 col-md-4">
                            <p class="font-weight-bolder mb-2 text-uppercase">Ngày</p>
                            <p>{{ $order->created_at->format('d/m/yy') }}</p></div>
                        <div class="col-4 col-md-4 text-center">
                            <p class="font-weight-bolder mb-2 text-uppercase">Mã đơn hàng</p>
                            <p>{{ str_pad($order->id,7,'0',STR_PAD_LEFT) }}</p>
                        </div>
                        <div class="col-4 col-md-4 text-right">
                            <p class="font-weight-bolder mb-2 text-uppercase">Đại lý</p>
                            <p class="">{{ $order->dealer->name }}</p></div>
                        <div class="col-6 col-md-4">
                            <p class="font-weight-bolder mb-2 text-uppercase">Xe</p>
                            <p>{{ $order->vehicle->model->name }}</p></div>

                        <div class="col-6 col-md-4 text-center">
                            <p class="font-weight-bolder mb-2 text-uppercase">Biển số</p>
                            <p>@if($order->vehicle->plate_number){{ $order->vehicle->plate_number }}@else Chưa cập nhật @endif</p>
                        </div>
                        <div class="col-6 col-md-4 text-right">
                            <p class="font-weight-bolder mb-2 text-uppercase">Số khung</p>
                            <p class=" text-uppercase">{{ $order->vehicle->frame_number }}</p>
                        </div>
                        @if($order->detail)
                            <div class="col-12">
                                <p class="font-weight-bolder mb-2 text-uppercase">Nội dung sửa chữa</p>
                                <p>{{ $order->detail }}</p>
                            </div>
                        @endif
                    </div>
                </div>
            </div>
            <!-- end: Invoice header-->
            <!-- begin: Invoice body-->
        <!--
            <div class="row justify-content-center py-5 px-5 py-md-5 px-md-0">
                <div class="col-md-10">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="pl-0 font-weight-bold text-muted text-uppercase">Hạng mục</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($order->items as $item)
            <tr class="font-weight-bold">
                <td class="border-0 pl-0 d-flex align-items-center">
                    <div class="symbol symbol-40 flex-shrink-0 mr-4 bg-light">
                        <div class="symbol-label">{{ $loop->index + 1 }}</div>
                                        </div>
                                        {{ $item->name }}
                    </td>
                </tr>
@endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
-->
            <!-- end: Invoice body-->
            <!-- begin: Invoice footer-->
            <div class="row justify-content-center bg-gray-100 py-5 px-5 py-md-5 px-md-0 mx-0">
                <div class="col-md-5 align-self-center ">
                    <img src="{{ asset($order->vehicle->image) }}" class="img-fluid" alt=""/>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-borderless table-sm">
                            <thead>
                            <tr>
                                <th></th>
                                <th style="width: 200px"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text-right">
                                <td class="font-weight-bolder">Ngày thực hiện:</td>
                                <td>{{ $order->created_at->format('d/m/Y') }}</td>
                            </tr>
                            <tr class="text-right">
                                <td class="font-weight-bolder">Mã giảm giá:</td>
                                <td class="text-uppercase">@if($order->voucherCode) {{ $order->voucherCode->code }} @else Không có @endif</td>
                            </tr>
                            <tr class="text-right">
                                <td class="font-weight-bolder">Tiền hàng:</td>
                                <td>{{ number_format($orderValue,0,',','.') }} VND</td>
                            </tr>
                            <tr class="text-right">
                                <td class="font-weight-bolder">Mức giảm:</td>
                                <td>@if($order->voucherCode){{ $order->voucher->discount_amount  }}% @else 0 @endif</td>
                            </tr>
                            @if($order->voucherCode)
                                <tr class="text-right">
                                    <td class="font-weight-bolder">Số tiền được giảm:</td>
                                    @if($order->voucher->type == config('constants.voucher.discount_type_percent'))
                                        <td>{{ number_format($order->voucher->discount_amount / 100 * $order->original_value,0,',','.') }}đ</td>
                                    @endif
                                </tr>
                            @endif
                            <tr class="text-right">
                                <td class="font-weight-bolder">Tiền hàng sau giảm:</td>
                                <td>{{ number_format($valueAfterDiscount,0,',','.') }} VND</td>
                            </tr>
                            <tr class="text-right">
                                <td class="font-weight-bolder">Thuế GTGT 10%:</td>
                                <td class="pb-4">{{ number_format($tax,0,',','.') }} VND</td>
                            </tr>
                            <tr class="text-right border-top">
                                <td class="font-size-h5 font-weight-bolder pt-3">Tổng</td>
                                <td class="font-size-h5 font-weight-bolder pt-3">{{ number_format($total,0,',','.') }} VND</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- end: Invoice footer-->
            <!-- begin: Invoice action-->
            <div class="row justify-content-center py-8 px-8 py-md-10 px-md-0">
                <div class="col-md-10">
                    <div class="d-flex justify-content-between">
                        <a class="btn btn-light-primary font-weight-bold" href="{{ route('dashboard-services') }}">Quay lại Lịch sử sử dụng</a>
                        {{--                        <button type="button" class="btn btn-primary font-weight-bold" onclick="window.print();">Print Order Details</button>--}}
                    </div>
                </div>
            </div>
            <!-- end: Invoice action-->
            <!-- end: Invoice-->
        </div>
    </div>
@endsection