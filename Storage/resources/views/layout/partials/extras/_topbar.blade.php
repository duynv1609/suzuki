{{-- Topbar --}}
<div class="topbar">

    {{-- User --}}
    @guest
        <div class="header-menu d-none d-lg-block">
            <ul class="menu-nav">
                <li class="menu-item">
                    <a class="menu-link" href="{{ route('register') }}">
                        <span class="menu-text">Đăng ký</span>
                    </a>
                </li>
                <li class="menu-item">
                    <a class="menu-link" href="{{ route('login') }}">
                        <span class="menu-text">Đăng nhập</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="dropdown d-lg-none flex-grow-1">
            <div class="topbar-item flex-grow-1">
                <a href="{{ route('login') }}" class="btn btn-block btn-danger mr-3">Đăng nhập</a>
            </div>
            <div class="topbar-item flex-grow-1">
                <a href="{{ route('register') }}" class="btn btn-block btn-light">Đăng ký</a>
            </div>
        </div>
    @endguest
    @auth
        @hasanyrole('Admin|Dealer|Staff')
        <div class="dropdown mr-3">
            <div class="topbar-item">
                <a href="{{ url('smp-admin') }}" target="blank" class="btn btn-danger"><i class="fas fa-user-lock"></i> Admin Panel</a>
            </div>
        </div>
        @endrole
        <div class="dropdown d-md-block">
            <div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
                <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2">
                    <span class="symbol symbol-35">
                        <span class="symbol-label" style="background-image:url('{{ asset('images/no-avatar.png') }}')"></span>
                    </span>
                </div>
            </div>
            <div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-lg p-0">
                @include('layout.partials.extras.dropdown._user')
            </div>
        </div>
    @endauth
</div>
