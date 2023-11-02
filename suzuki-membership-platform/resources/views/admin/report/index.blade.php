@extends(backpack_view('blank'))

@php
    $defaultBreadcrumbs = [
      trans('backpack::crud.admin') => backpack_url('dashboard'),
      'Thống kê' => false,
    ];

    // if breadcrumbs aren't defined in the CrudController, use the default breadcrumbs
    $breadcrumbs = $breadcrumbs ?? $defaultBreadcrumbs;
@endphp

@section('header')
    <section class="container-fluid">
        <h2>
            <span class="text-capitalize">Thống kê</span>
        </h2>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <div>
                            <h4 class="card-title mb-0">Khách hàng</h4>
                            <div class="small text-muted">Từ {{ $startDate }} đến {{ $endDate }}</div>
                        </div>
                        <div class="btn-toolbar d-none d-md-block" role="toolbar">
                            <form method="get" id="date-picker-form">
                                <a id="reportrange" class="btn-secondary btn">
                                    <span></span> <i class="la la-caret-down"></i>
                                </a>
                                <input type="hidden" name="start_date" value="{{ request('start_date', null) }}">
                                <input type="hidden" name="end_date" value="{{ request('end_date', null) }}">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $totalRegistrations, 'text' => 'Tài khoản tạo mới', 'icon' => 'user-plus', 'cardClass' => 'text-info'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $totalEarnedCustomers, 'text' => 'Member đã tích điểm', 'icon' => 'user-check', 'cardClass' => 'text-info'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $boughtVoucherCodeCount, 'text' => 'Voucher giảm giá được đổi', 'icon' => 'comment-dollar', 'cardClass' => 'text-info'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $boughtExternalVoucherCodeCount, 'text' => 'Voucher của vendor ngoài được đổi', 'icon' => 'comments-dollar', 'cardClass' => 'text-info'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $usedVoucherCodes, 'text' => 'Member sử dụng voucher giảm giá', 'icon' => 'user-tag', 'cardClass' => 'text-info'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => $usedExternalVoucherCodes, 'text' => 'Member sử dụng voucher vendor ngoài', 'icon' => 'gift', 'cardClass' => 'text-info'])
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => Helper::number_format($totalOrderValue), 'text' => 'Tổng số tiền khách đã trả', 'icon' => 'money-bill', 'cardClass' => 'text-success'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => Helper::number_format($totalDiscountTimes), 'text' => 'Tổng số lần giảm giá', 'icon' => 'cart-arrow-down', 'cardClass' => 'text-success'])
                        </div>
                        <div class="col-sm-6 col-md-2">
                            @include('admin.report.card-small', ['number' => Helper::number_format($totalDiscountValue), 'text' => 'Tổng số tiền đã giảm', 'icon' => 'coins', 'cardClass' => 'text-success'])
                        </div>
                    </div>
                    {{--                    <div class="table-responsive">--}}
                    {{--                        <table class="table table-bordered" style="width: 50%">--}}
                    {{--                            <tr>--}}
                    {{--                                <td>Tổng số lượng member đã đăng ký:</td>--}}
                    {{--                                <td><strong>{{ $totalRegistrations }}</strong></td>--}}
                    {{--                            </tr>--}}
                    {{--                            <li>Tổng số lượng member đã được tích điểm: <strong>{{ $totalEarnedCustomers }}</strong>--}}
                    {{--                            </li>--}}
                    {{--                            <li>Tổng số lượng member đã dùng voucher giảm giá: <strong>{{ $usedVoucherCodes }}</strong>--}}
                    {{--                            </li>--}}
                    {{--                            <li>Tổng số lượng member đã dùng voucher của vendor khác:--}}
                    {{--                                <strong>{{ $usedExternalVoucherCodes }}</strong></li>--}}
                    {{--                            <li>Tổng số tiền KH đã chi trả & được ghi nhận trong membership:--}}
                    {{--                                <strong>{{ Helper::number_format($totalOrderValue) }}</strong></li>--}}
                    {{--                            <li>Tổng số tiền đã discount cho KH:--}}
                    {{--                                <strong>{{ Helper::number_format($totalDiscountValue) }}</strong></li>--}}
                    {{--                            <li>Tổng số lần thực hiện discount của cả hệ thống:--}}
                    {{--                                <strong>{{ Helper::number_format($totalDiscountTimes) }}</strong></li>--}}
                    {{--                        </table>--}}
                    {{--                    </div>--}}
                </div>
                {{--                <div class="card-footer">--}}

                {{--                </div>--}}
            </div>
        </div>
    </div>
@endsection

@push('after_scripts')
    <script>
        var startDate = moment('{{ $startDate }}');
        var endDate = moment('{{ $endDate }}');

        function cb(start, end) {
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }

        let datePicker = $('#reportrange').daterangepicker({
            startDate: startDate,
            endDate: endDate,
            alwaysShowCalendars: true,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 days': [moment().subtract(6, 'days'), moment()],
                'Last 30 days': [moment().subtract(29, 'days'), moment()],
                'This month': [moment().startOf('month'), moment().endOf('month')],
                'Last month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                'Lifetime': [moment('2021-04-20'), moment()]
            }
        }, cb);

        cb(startDate, endDate);

        datePicker.on('apply.daterangepicker', function (e, picker) {
            $('input[name="start_date"]').val(picker.startDate.format('YYYY-MM-DD'))
            $('input[name="end_date"]').val(picker.endDate.format('YYYY-MM-DD'))
            $('#date-picker-form').submit();
        });
    </script>
@endpush