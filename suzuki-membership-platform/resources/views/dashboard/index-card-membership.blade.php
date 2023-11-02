<div class="card card-dashboard gutter-b card-dashboard-membership card-custom card-stretch ">
    <div class="card-header">
        <h4 class="card-title">{{ __('dashboard.membership_info') }}</h4>
    </div>
    <div class="card-body">
        @if(config('settings.enable_point'))
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <p class="pt-2">{{ __('dashboard.your_balance') }}</p>
                <p class="font-weight-bold font-size-h3 @if($customer->point_balance > 0) text-success @endif">{{ Helper::number_format($customer->point_balance) }} Điểm</p>
            </div>
        @endif
        <div class="d-flex justify-content-between align-items-center flex-wrap">
            <p class="">Trạng thái Hội viên:</p>
            @if($customer->membershipStatus() == config('constants.membership.none'))
                <p><span class="text-muted">Chưa kích hoạt</span></p>
            @elseif($customer->membershipStatus() == config('constants.membership.expired'))
                <p><span class="text-muted">Đã hết hạn</span></p>
            @else
                <p><span class="text-success">Có hiệu lực</span></p>
            @endif

        </div>
        @if($customer->point_balance > 0)
            <div class="alert alert-custom alert-outline-secondary">
                <div>
                    <h6 class="alert-heading">{{ Helper::number_format($customer->point_balance) }} điểm hết hạn vào {{ $customer->point_expires_at->format('d/m/Y') }}</h6>
                    <p>Bạn chỉ cần có 1 giao dịch tích điểm trước ngày hết hạn để mở rộng thời gian duy trì điểm.</p>
                    <p class="mb-0 font-weight-bold"><a href="#">Tìm hiểu thêm</a></p>
                </div>
            </div>
        @endif
        @if (!$customer->membership()->exists())
                <div class="alert alert-custom alert-outline-secondary">
                    <div>
{{--                        <h6 class="alert-heading">Bạn chưa kích hoạt gói Hội viên</h6>--}}
                        <p>Gói Hội viên Suzuki sẽ được kích hoạt sau khi bạn thực hiện dịch vụ tại Đại lý.</p>
                        <p class="mb-0 font-weight-bold"><a href="#">Tìm hiểu thêm</a></p>
                    </div>
                </div>
        @endif
        {{--<div class="d-flex justify-content-between align-items-center flex-wrap">
            <p class="">Ngày hết hạn:</p>
            @if($customer->membershipStatus() != config('constants.membership.active'))
                <p><span class="text-muted">Không áp dụng</span></p>
            @else
                <p><span class="text-muted">{{ $customer->membership->created_at->addDays(365)->format('d/m/Y') }}</span></p>
            @endif
        </div>--}}
    </div>
    {{--    @if($customer->membershipStatus() != config('constants.membership.none'))
            <div class="card-footer d-flex align-items-center justify-content-between text-right">

                <a href="{{ route('vouchers-list') }}" class="btn btn-block btn-light-primary">
                    Mua Voucher
                </a>
            </div>
        @endif--}}
</div>