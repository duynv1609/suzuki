@extends('layout.login-register')

@section('form')
    <div class="login-form">
        <form class="form" id="kt_login_forgot_form" method="POST" action="{{ route('password.email') }}">
            @csrf
            <div class="pb-5 pb-lg-15">
                <h3 class="font-weight-bolder text-dark font-size-h2 font-size-h1-lg">Bạn đã quên mật khẩu?</h3>
                <p class="text-muted font-size-h4">Nhập vào địa chỉ emai bạn đã đăng ký để đặt lại.</p>
            </div>
            @if (session('status'))
                <div class="alert alert-success" role="alert">
                    {{ session('status') }}
                </div>
            @endif
            <div class="form-group">
                <input class="form-control @error('email') is-invalid @enderror h-auto py-7 px-6 rounded-lg font-size-h6" type="email" placeholder="Email" name="email" required autocomplete="off">
                @error('email')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>
            <div class="form-group d-flex flex-wrap">
                <button type="submit" id="kt_login_forgot_form_submit_button" class="btn btn-primary font-weight-bold font-size-h6 px-8 py-4 my-3 mr-4">Gửi đi</button>
                <a href="{{ route('login') }}" id="kt_login_forgot_cancel" class="btn btn-light-primary font-weight-bolder font-size-h6 px-8 py-4 my-3">Hủy</a>
            </div>
        </form>
    </div>
@endsection
