<div class="d-flex align-items-center p-8 rounded-top">
    <div class="text-dark m-0">
        <a class="font-size-h5" href="{{ route('dashboard-home') }}">{{ $currentUser['fullName'] }}</a>
        <p class="mb-0">{{ Auth::getUser()->email }}</p>
    </div>
</div>
<div class="separator separator-solid"></div>
<div class="navi navi-spacer-x-0 pt-5">
    {{-- Item --}}
    <a href="{{ route('dashboard-home') }}" class="navi-item px-8">
        <div class="navi-link">
            <div class="navi-icon mr-1">
                <i class="fas fa-window-maximize"></i>
            </div>
            <div class="navi-text">
{{--                <div class="font-weight-bold">--}}
                    {{ __('common.header.dashboard') }}
{{--                </div>--}}
            </div>
        </div>
    </a>

    {{-- Item --}}
    <a href="{{ route('dashboard-info') }}" class="navi-item px-8">
        <div class="navi-link">
            <div class="navi-icon mr-1">
                <i class="fas fa-user"></i>
            </div>
            <div class="navi-text">
{{--                <div class="font-weight-bold">--}}
                    Thông tin cá nhân
{{--                </div>--}}
            </div>
        </div>
    </a>

    {{-- Item --}}
    <a href="{{ route('dashboard-history') }}" class="navi-item px-8">
        <div class="navi-link">
            <div class="navi-icon mr-1">
                <i class="fas fa-history"></i>
            </div>
            <div class="navi-text">
{{--                <div class="font-weight-bold">--}}
                    Lịch sử sử dụng điểm
{{--                </div>--}}
            </div>
        </div>
    </a>

    {{-- Item --}}
    <a href="{{ route('dashboard-vouchers') }}" class="navi-item px-8">
        <div class="navi-link">
            <div class="navi-icon mr-1">
                <i class="fas fa-file-invoice-dollar"></i>
            </div>
            <div class="navi-text">
{{--                <div class="font-weight-bold">--}}
                    {{ __('Voucher của bạn') }}
{{--                </div>--}}
            </div>
        </div>
    </a>

    {{-- Footer --}}
    <div class="navi-separator mt-3"></div>
    <div class="navi-footer px-8 py-5 justify-content-end">
        {{--        <a href="#" target="_blank" class="btn btn-clean font-weight-bold">Upgrade Plan</a>--}}
        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();" target="_blank" class="btn btn-light-primary font-weight-bold">Đăng xuất</a>
    </div>

    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        {{ csrf_field() }}
    </form>
</div>
