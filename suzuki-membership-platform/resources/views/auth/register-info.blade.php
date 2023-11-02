@extends('layout.login-register')
@section('form')
    <div class="login-form login-signup">
        <!--begin::Form-->
        <form class="form" novalidate="novalidate" id="kt_login_signup_form" method="POST" action="{{ route('register') }}">
            @csrf
            <div class="pb-13 pt-lg-0 pt-5">
                <h3 class="font-weight-bold text-dark font-size-h4 font-size-h1-lg">Xin chào, {{ $customer['name'] }}.</h3>
                <p class="text-muted font-size-h5">Việc đăng ký đã gần hoàn tất.
                    <br/>Để Việt Nam Suzuki có thể phục vụ bạn một cách tốt nhất, bạn vui lòng bổ sung những thông tin bên dưới nhé.
                </p>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark" for="id_number">Số CMND / CCCD:
                            <span class="text-danger">*</span></label>
                        <input id="id_number" class="form-control h-auto rounded-m @error('id_number') is-invalid @enderror" value="{{ old('id_number') }}" name="id_number" required="required" autocomplete="id_number" autofocus/>
                        @error('name')
                        <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark" for="id_number">Ngày cấp:
                            <span class="text-danger">*</span></label>
                        <input id="id_number" class="form-control h-auto rounded-m @error('id_number') is-invalid @enderror" value="{{ old('id_number') }}" name="id_number" required="required" autocomplete="id_number" autofocus/>
                        @error('name')
                        <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark" for="id_number">Nơi cấp:
                            <span class="text-danger">*</span></label>
                        <select id="id_number" class="form-control @error('province') is-invalid @enderror" name="id_number">
                            <option></option>
                            @foreach($provinces as $id => $name)
                                <option value="{{ $id }}" @if(old('province') == $id) selected @endif>{{ $name }}</option>
                            @endforeach
                        </select>
                        @error('province')
                        <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>
                </div>
            </div>

            <!--end::Form group-->
            <!--begin::Form group-->
            <div class="form-group">
                <button type="submit" id="kt_login_signup_submit" class="btn btn-primary font-weight-bold mr-2">Đăng ký</button>
                <a href="{{ route('homepage') }}" id="kt_login_signup_cancel" class="btn btn-light-primary font-weight-bold">Quay lại trang chủ</a>
            </div>
            <!--end::Form group-->
        </form>
        <!--end::Form-->
    </div>

@endsection