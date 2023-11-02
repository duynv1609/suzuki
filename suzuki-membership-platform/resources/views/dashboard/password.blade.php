@extends('dashboard.right-column-card')

@section('card-title') {{ __('dashboard.change_password') }} @endsection
{{--@section('card-subtitle'){{ __('dashboard.personal_info_description') }}@endsection--}}

@section('card-content')
    <form method="post">
        <div class="card-body">
            @if ($errors->any())
                <div class="alert alert-custom alert-light-danger" role="alert">
                    <div class="alert-icon"><i class="la la-exclamation-triangle"></i></div>
                    <div class="alert-text">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            @endif
            @if (Session::has('password_changed'))
                <x-alert type="success" message="{{Session::get('password_changed')}}"/>
                {{-- <div class="alert alert-custom alert-light-success" role="alert">
                     <div class="alert-icon"><i class="fas fa-check fa-sm"></i></div>
                     <div class="alert-text">{{  }}</div>
                 </div>--}}
            @endif
            <div class="form-group row">
                <label class="col-lg-4 col-form-label" for="phone">Số điện thoại đăng nhập:</label>
                <div class="col-lg-8">
                    <input id="phone" class="form-control" name="phone" type="text" disabled value="{{ $customer->mobile }}">
                </div>
            </div>

            @csrf
            <div class="form-group row">
                <label class="col-lg-4 col-form-label" for="current-password">Mật khẩu hiện tại:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-8">
                    <input id="current-password" required class="form-control" name="current_password" type="password">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-lg-4 col-form-label" for="new-password">Mật khẩu mới:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-8">
                    <input id="new-password" required class="form-control" name="new_password" type="password">
                    <span class="form-text text-muted">Mật khẩu có độ dài tối thiểu 8 ký tự.</span>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-lg-4 col-form-label" for="new-password-confirmation">Nhập lại mật khẩu mới:
                    <span class="text-danger">*</span></label>
                <div class="col-lg-8">
                    <input id="new-password-confirmation" required class="form-control" type="password" name="new_password_confirmation">
                </div>
            </div>


        </div>
        <div class="card-footer">
            <button class="btn btn-primary">Lưu thay đổi</button>
        </div>
    </form>
@endsection