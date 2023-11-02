{{-- Header Mobile --}}
<div id="kt_header_mobile" class="header-mobile {{ Metronic::printClasses('header-mobile', false) }}" {{ Metronic::printAttrs('header-mobile') }}>
    <div class="mobile-logo">
        <a href="{{ url('/') }}">
            <img alt="{{ config('app.name') }}" src="{{ asset('images/logo-membership.svg') }}" class="w-50 h-auto"/>
        </a>
    </div>
    <div class="d-flex align-items-center">

        @if (config('layout.aside.self.display'))
            <button class="btn btn-dark p-0 burger-icon burger-icon-left" id="kt_aside_mobile_toggle"><span></span>
            </button>
        @endif

        @if (config('layout.header.menu.self.display'))
            <button class="btn btn-icon btn-lg" id="kt_header_mobile_toggle"><i class="fa fa-bars"></i></button>
        @endif

        {{--<div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
            <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2">
                    <span class="symbol symbol-35">
                        <span class="symbol-label" style="background-image:url('{{ asset('images/no-avatar.png') }}')"></span>
                    </span>
            </div>
        </div>--}}

        {{--        <button class="btn  btn-icon btn-lg btn-hover-text-primary " --}}
        @guest
            <button class="btn btn-icon btn-lg btn-hover-text-primary" id="kt_header_mobile_topbar_toggle">>
                <i class="fa fa-user"></i>
            </button>
        @endguest
        @auth
            <div class="dropdown">
                {{-- Toggle --}}
                <div class="topbar-item" data-toggle="dropdown" data-offset="0px,0px">
                    <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2">
                    <span class="symbol symbol-35">
                        <span class="symbol-label" style="background-image:url('{{ asset('images/no-avatar.png') }}')"></span>
                    </span>
                    </div>
                </div>

                {{-- Dropdown --}}
                <div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-lg p-0">
                    @include('layout.partials.extras.dropdown._user')
                </div>
            </div>
        @endauth
    </div>
</div>
