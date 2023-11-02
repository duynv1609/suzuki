@extends('layout.default', ['useBlankLayout' => true])

@section('styles')
    <link rel="stylesheet" href="{{ asset('css/pages/login/login-1.css') }}"/>
@endsection

@section('content')
    <div class="d-flex flex-column flex-root">
        <!--begin::Login-->
        <div class="login login-1 login-signin-on d-flex flex-column flex-lg-row flex-column-fluid bg-white" id="kt_login">
            <!--begin::Aside-->
            <div class="login-aside d-flex flex-column flex-row-auto bg-primary">
                <!--begin::Aside Top-->
                <div class="d-flex flex-column-auto flex-column pt-lg-40 pt-15">
                    <!--begin::Aside header-->
                    <a href="{{ route('homepage') }}" class="text-center mb-10">
                        <img src="{{ asset('images/logo-membership.svg') }}" class="w-50" alt="Logo Suzuki World"/>
                    </a>
                    <!--end::Aside header-->
                    <!--begin::Aside title-->
                    <h3 class="font-weight-light text-center text-white font-size-h4 font-size-h1-lg">Cùng bạn sẵn sàng
                        <br/>cho những khởi đầu mới</h3>
                    <!--end::Aside title-->
                </div>
                <!--end::Aside Top-->
                <!--begin::Aside Bottom-->
                <div class="aside-img d-flex flex-row-fluid bgi-no-repeat bgi-position-y-bottom bgi-position-x-center" style="background-image: url('{{asset('images/login-visual-1.svg')}}')"></div>
                <!--end::Aside Bottom-->
            </div>
            <!--begin::Aside-->
            <!--begin::Content-->
            <div class="login-content flex-row-fluid d-flex flex-column justify-content-center position-relative overflow-hidden p-7 mx-auto">
                <!--begin::Content body-->
                <div class="d-flex flex-column-fluid flex-center">
                    @yield('form')
                </div>
                <!--end::Content body-->
                <!--begin::Content footer-->
                <div class="d-flex justify-content-lg-start justify-content-center align-items-end py-7 py-lg-0">
                    <div class="text-dark-50 font-size-lg font-weight-bold mr-10">
                        <span>&copy; {{ date("Y") }}</span>
                        <a href="https://suzuki.com.vn" target="_blank" class="text-dark-75 text-hover-primary">Suzuki World</a><br/>
                    </div>
                    <a href="{{ route('about') }}" class="text-primary font-weight-bold font-size-lg">Giới thiệu chương trình</a>
                </div>
                <!--end::Content footer-->
            </div>
            <!--end::Content-->
        </div>
        <!--end::Login-->
    </div>
@endsection
