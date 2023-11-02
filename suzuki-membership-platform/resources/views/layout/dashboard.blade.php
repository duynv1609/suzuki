@extends('layout.default')

@section('content')
    <div class="container">
        <div class="row">
            <div class="offcanvas-mobile col-md-4" id="kt_profile_aside">
                <div class="card card-custom card-stretch shadow-none gutter-b">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="image-input symbol symbol-60 symbol-xxl-100 mr-5 align-self-start align-self-xxl-center">
                                <div class="symbol-label" data-toggle="tooltip" title="Tính năng thay đổi ảnh đại diện đang được xây dựng." data-theme="dark" style="background-image:url('{{ asset('images/no-avatar.png') }}'); cursor: pointer"></div>
                            </div>
                            <div>
                                <a href="{{ route('dashboard-home') }}" class="font-weight-bolder font-size-h4 text-dark-75 text-hover-primary">{{ $customer->name }}</a>
                                @if($customer->membershipStatus() == config('constants.membership.active'))
                                    <p>
                                        <span class="text-success font-weight-bold">{{ __('dashboard.membership') }}</span>
                                        <br/>
                                        <span>{{ number_format($customer->point_balance, 0, ',', '.') }} điểm</span>
                                    </p>
                                @else
                                    <div class="text-muted">
                                        <a title="Bạn chưa bổ sung xe Suzuki vào hệ thống hoặc chưa có xe nào thực hiện dịch vụ tại Đại lý sau khi thêm." data-toggle="tooltip" data-theme="dark">
                                            Chưa kích hoạt Hội viên Suzuki <i class="la la-info-circle"></i>
                                        </a>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="py-9">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="font-weight-bold mr-2">Email:</span>
                                <a href="#" class="text-muted text-hover-primary">{{ $customer->email }}</a>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <span class="font-weight-bold mr-2">{{ __('dashboard.phone') }}</span>
                                <span class="text-muted">{{ $customer->mobile }}</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="font-weight-bold text-nowrap mr-2">{{ __('dashboard.location') }}</span>
                                @php($location = $customer->location())
                                <span class="text-muted">{{ $location['district_name'] }}</span>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="text-muted"></span>
                                <span class="text-muted">{{ $location['province_name'] }}</span>
                            </div>
                        </div>
                        <div class="navi navi-bold navi-link-rounded navi-active">
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-home') }}" class="navi-link py-4 @if($currentRouteName === 'dashboard-home')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-window-maximize"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('dashboard.profile_overview') }}</span>
                                </a>
                            </div>
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-info') }}" class="navi-link py-4 @if($currentRouteName === 'dashboard-info')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-user-alt"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('dashboard.personal_info') }}</span>
                                </a>
                            </div>
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-vehicles') }}" class="navi-link py-4 @if($currentRouteName == 'dashboard-vehicles' || $currentRouteName == 'dashboard-vehicle-add')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-car"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('Xe của bạn') }}</span>
                                </a>
                            </div>
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-vouchers') }}" class="navi-link py-4 @if($currentRouteName == 'dashboard-vouchers' || $currentRouteName == 'dashboard-voucher-code')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-qrcode"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('Voucher của bạn') }}</span>
                                </a>
                            </div>
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-services') }}" class="navi-link py-4 @if($currentRouteName == 'dashboard-services' || $currentRouteName === 'dashboard-services-detail')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-file-invoice-dollar"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('Lịch sử thực hiện dịch vụ') }}</span>
                                </a>
                            </div>
                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-history') }}" class="navi-link py-4 @if($currentRouteName === 'dashboard-history')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-history"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('Lịch sử điểm') }}</span>
                                </a>
                            </div>

                            <div class="navi-item mb-2">
                                <a href="{{ route('dashboard-password') }}" class="navi-link py-4 @if($currentRouteName === 'dashboard-password')active @endif">
                                    <span class="navi-icon mr-2">
                                        <i class="fas fa-key"></i>
                                    </span>
                                    <span class="navi-text font-size-lg">{{ __('Thay đổi mật khẩu') }}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                @yield('right-section')
            </div>
        </div>
    </div>

@endsection

{{-- Scripts Section --}}
@push('scripts')
    @yield('scripts')
@endpush