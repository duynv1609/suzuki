{{-- Header --}}
<div id="kt_header" class="header header-fixed {{ Metronic::printClasses('header', false) }}" {{ Metronic::printAttrs('header') }}>

    {{-- Container --}}
    <div class="container d-flex align-items-center justify-content-between">
        @if (config('layout.header.self.display'))
            {{-- Header Menu --}}
            <div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
                @if(config('layout.aside.self.display') == false)
                    <div class="header-logo">
                        <a href="{{ url('/') }}">
                            <img alt="{{ config('app.name') }}" src="{{ asset('images/logo-membership.svg') }}" style="height: 40px"/>
                        </a>
                    </div>
                @endif

                <div id="kt_header_menu" class="header-menu header-menu-mobile {{ Metronic::printClasses('header_menu', false) }}" {{ Metronic::printAttrs('header_menu') }}>
                    <ul class="menu-nav {{ Metronic::printClasses('header_menu_nav', false) }}">
                        {{--                        {{ Menu::renderHorMenu(config('menu_header.items')) }}--}}
                        <ul class="menu-nav ">
                            <li class="menu-item @if(Route::currentRouteName() === 'homepage') menu-item-active @endif" aria-haspopup="true">
                                <a href="{{ route('homepage') }}" class="menu-link "><span class="menu-text">Trang chủ</span></a>
                            </li>
                            @auth
                                <li class="menu-item @if(Route::currentRouteName() === 'vouchers-list') menu-item-active @endif" aria-haspopup="true">
                                    <a href="{{ route('vouchers-list') }}" class="menu-link "><span class="menu-text">Vouchers</span></a>
                                </li>
                            @endauth
                            <li class="menu-item @if(Route::currentRouteName() === 'about') menu-item-active @endif" aria-haspopup="true">
                                <a href="{{ route('about') }}" class="menu-link "><span class="menu-text">Thông tin chương trình</span></a>
                            </li>
                            <li class="menu-item @if(Route::currentRouteName() === 'contact') menu-item-active @endif" aria-haspopup="true">
                                <a href="{{ route('contact') }}" class="menu-link "><span class="menu-text">Liên hệ</span></a>
                            </li>

                        </ul>
                    </ul>
                </div>
            </div>

        @else
            <div></div>
        @endif

        @include('layout.partials.extras._topbar')
    </div>
</div>
