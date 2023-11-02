@extends('layout.login-register')

@section('form')
    <div class="login-form login-signin">
        <form class="form" novalidate="novalidate" id="kt_login_signin_form" method="POST" action="{{ route('login') }}">
            @csrf
            <div class="pb-13 pt-lg-0 pt-5">
                <h3 class="font-weight-bolder text-dark font-size-h4 font-size-h1-lg">Chào mừng Quý Hội viên Suzuki World</h3>
                <span class="text-muted font-size-h5">Bạn chưa có tài khoản?
                    <a href="{{ route('register') }}" id="kt_login_signup" class="text-primary font-weight-bold">Đăng ký Hội viên</a></span>
            </div>
            @if($errors->any())
                <div class="alert alert-custom alert-light-danger">
                    <div class="alert-icon"><i class="la la-warning"></i></div>
                    <div class="alert-text">{{$errors->first()}}</div>
                </div>
            @endif
            <div class="form-group">
                <label class="font-size-h6 font-weight-bold text-dark" for="username">Email / Số điện thoại</label>
                <input tabindex="2" id="username" class="form-control h-auto @error('username') is-invalid @enderror" type="text" name="username"/>
                @error('username')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>
            <div class="form-group">
                <div class="d-flex justify-content-between mt-n5">
                    <label class="font-size-h6 font-weight-bold text-dark pt-5" for="password">Mật khẩu</label>
                    <a href="{{ route('password.request') }}" class="text-primary font-size-h6 font-weight-bold text-hover-primary pt-5" tabindex="5" id="kt_login_forgot">Quên mật khẩu?</a>
                </div>
                <input tabindex="3" id="password" class="form-control h-auto" type="password" name="password"/>
                @error('password')
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                </span>
                @enderror
            </div>
            <div class="form-group">
                <div class="d-flex justify-content-between mt-5">
                    <div class="form-check">
                        <input tabindex="4" class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember">
                            Ghi nhớ đăng nhập
                        </label>
                    </div>
                </div>
            </div>
            <div class="pb-lg-0 pb-5">
                <button tabindex="4" type="submit" id="kt_login_signin_submit" class="btn btn-primary font-size-h6 px-8 py-4 my-3 mr-3">Đăng nhập</button>
            </div>
        </form>
    </div>
@endsection
