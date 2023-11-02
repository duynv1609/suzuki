@extends('layout.login-register')

@section('form')
    <div class="login-form login-signup">
        <!--begin::Form-->
        <form class="form" id="kt_login_signup_form" method="POST" action="{{ route('register') }}" autocomplete="off">
            @csrf
            <div class="pb-13 pt-lg-0 pt-5">
                <h3 class="font-weight-bold text-dark font-size-h4 font-size-h1-lg">Đăng ký Hội viên Suzuki</h3>
                <span class="text-muted font-size-h5">Bạn đã có tài khoản?
                    <a href="{{ route('login') }}" id="kt_login_signup"
                       class="text-primary font-weight-bold">Đăng nhập</a></span>
            </div>
            <div class="row pb-3">
                <div class="col-md-5 col-sm-5 col-xs-5">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark type"
                               data-personal="Khách hàng:"
                               data-corporate="Khách hàng:"
                               for="is_corporate">Khách hàng:
                            <span class="text-danger">*</span></label>
                        <select onchange="replaceTexts()" class="form-control" id="is_corporate" name="is_corporate">
                            <option data-user-type="personal" id="personal" name="is_corporate"
                                    value="0" selected>Cá nhân
                            </option>
                            <option data-user-type="corporate" id="corporate" name="is_corporate"
                                    value="1">Doanh nghiệp
                            </option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5" id="gender">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark type"
                               onclick="replaceTexts(this)"
                               data-personal="Danh xưng:"
                               data-corporate="Danh xưng:"
                               for="gender">Danh xưng:
                            <span class="text-danger">*</span></label>
                        <select class="form-control" name="gender">
                            <option value="1" @if(old('gender') == 1) selected @endif>Mr.</option>
                            <option value="2" @if(old('gender') == 2) selected @endif>Ms.</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark type"
                               onclick="replaceTexts(this)"
                               data-personal="Họ và tên:"
                               data-corporate="Tên công ty:"
                               id="name" for="name">
                            Họ và tên:
                        </label> <span class="text-danger">*</span>
                        <input id="name" class="form-control h-auto rounded-m @error('name') is-invalid @enderror"
                               value="{{ old('name') }}" name="name" required autocomplete="off"/>
                        @error('name')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-5" id="id_number-show">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark type"
                               onclick="replaceTexts(this)"
                               data-personal="Số CMND / Căn cước công dân:"
                               data-corporate="Mã số công ty:"
                               for="id_number" id="id_number">
                            Số CMND / Căn cước công dân:
                        </label> <span class="text-danger">*</span>
                        <input id="id_number"
                               class="form-control h-auto rounded-m @error('id_number') is-invalid @enderror"
                               value="{{ old('id_number') }}" name="id_number"
                               autocomplete="id-number"/>
                        @error('id_number')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Địa chỉ email:"
                               data-corporate="Địa chỉ email:"
                               id="email"
                               for="email">Địa chỉ email:
                            <span class="text-danger">*</span></label>
                        <input id="email" class="form-control h-auto rounded-m @error('email') is-invalid @enderror"
                               value="{{ old('email') }}" type="email" name="email" required/>
                        {{--                        <span class="form-text text-muted">Vui lòng cung cấp địa chỉ email thật để nhận email xác nhận.</span>--}}
                        @error('email')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-3" id="birthday">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Ngày sinh:"
                               data-corporate=""
                               id="birthday" for="birthday">Ngày sinh:
                            <span class="text-danger">*</span></label>
                        <input id="birthday"
                               class="form-control h-auto rounded-m @error('birthday') is-invalid @enderror"
                               value="{{ old('birthday') }}" type="date"
                               max="{{now()->toDateString()}}"
                               name="birthday"/>
                        {{--                        <span class="form-text text-muted">Sau này bạn có thể đăng nhập bằng email hoặc số điện thoại.</span>--}}
                        @error('birthday')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Số điện thoại:"
                               data-corporate=""
                               for="mobile">Số điện thoại:
                            <span class="text-danger">*</span></label>
                        <input id="mobile" class="form-control h-auto rounded-m @error('mobile') is-invalid @enderror"
                               value="{{ old('mobile') }}" type="text" name="mobile" required="required"/>
                        {{--                        <span class="form-text text-muted">Sau này bạn có thể đăng nhập bằng email hoặc số điện thoại.</span>--}}
                        @error('mobile')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Địa chỉ:"
                               data-corporate=""
                               id="address" for="address">Địa chỉ:
                            <span class="text-danger">*</span></label>
                        <input id="address" class="form-control h-auto rounded-m @error('address') is-invalid @enderror"
                               value="{{ old('address') }}" name="address" required="required"/>
                        @error('address')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Tỉnh/Thành phố:"
                               data-corporate="Tỉnh/Thành phố:"
                               for="province">Tỉnh/Thành phố:
                            <span class="text-danger">*</span></label>
                        <select id="province" class="form-control @error('province') is-invalid @enderror"
                                name="province">
                            <option></option>
                            @foreach($provinces as $id => $name)
                                <option value="{{ $id }}"
                                        @if(old('province') == $id) selected @endif>{{ $name }}</option>
                            @endforeach
                        </select>
                        @error('province')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="font-size-h6 font-weight-bold text-dark"
                           onclick="replaceTexts(this)"
                           data-personal="Quận / Huyện / Thị xã:"
                           data-corporate=""
                           for="district">Quận / Huyện / Thị xã:
                        <span class="text-danger">*</span></label>
                    <select id="district" class="form-control @error('district') is-invalid @enderror" name="district">
                        @if($oldDistricts)
                            @foreach($oldDistricts as $distID => $distName)
                                <option value="{{ $distID }}"
                                        @if(old('district') == $distID) selected @endif>{{ $distName }}</option>
                            @endforeach
                        @endif
                    </select>
                    @error('district')
                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                    @enderror
                </div>
            </div>
            <div class="row">
                <div class="col-md-5" id="id_number-hidden">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark type"
                               onclick="replaceTexts(this)"
                               data-personal="Số CMND / Căn cước công dân:"
                               data-corporate="Mã số công ty:"
                               for="id_number" id="id_number">
                            Số CMND / Căn cước công dân:
                        </label> <span class="text-danger">*</span>
                        <input id="id_number"
                               class="form-control h-auto rounded-m @error('id_number') is-invalid @enderror"
                               value="{{ old('id_number') }}" name="id_number" min="9"
                               autocomplete="id-number"/>
                        @error('id_number')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-3" id="id_issue_date">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Ngày cấp"
                               data-corporate=""
                               id="id_issue_date" for="id_issue_date">Ngày cấp:
                            <span class="text-danger">*</span></label>
                        <input id="id_issue_date" type="date"
                               class="form-control h-auto rounded-m @error('id_issue_date') is-invalid @enderror"
                               value="{{ old('id_issue_date') }}"
                               name="id_issue_date"
                               autocomplete="id_issue_date"/>
                        @error('id_issue_date')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-4" id="id_issue_province">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Nơi cấp:"
                               data-corporate=""
                               id="id_issue_province" for="id_issue_province">Nơi cấp:
                            <span class="text-danger">*</span>
                        </label>
                        <select id="id_issue_province"
                                class="form-control @error('id_issue_province') is-invalid @enderror"
                                name="id_issue_province">
                            <option></option>
                            @foreach($provinces as $id => $name)
                                <option value="{{ $id }}"
                                        @if(old('province') == $id) selected @endif>{{ $name }}</option>
                            @endforeach
                        </select>
                        @error('id_issue_province')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Mật khẩu đăng nhập:"
                               data-corporate=""
                               for="password">Mật khẩu đăng nhập:
                            <span class="text-danger">*</span></label>
                        <input id="password"
                               class="form-control h-auto rounded-m @error('password') is-invalid @enderror"
                               value="{{ old('password') }}" type="password" name="password" required="required"/>
                        <span class="form-text text-muted">Mật khẩu có độ dài tối thiểu là 8 ký tự.</span>
                        @error('password')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="form-group">
                        <label class="font-size-h6 font-weight-bold text-dark"
                               onclick="replaceTexts(this)"
                               data-personal="Xác nhận lại mật khẩu:"
                               data-corporate=""
                               for="password-confirmation">Xác nhận lại mật khẩu:
                            <span class="text-danger">*</span></label>
                        <input id="password-confirmation"
                               class="form-control h-auto rounded-m @error('password_confirmation') is-invalid @enderror"
                               type="password" value="{{ old('password_confirmation') }}" name="password_confirmation"
                               required="required"/>
                        @error('password_confirmation')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <div class="checkbox-inline">
                            <label class="checkbox">
                                <input type="checkbox" name="agree" @if(old('agree')) checked @endif />
                                <span></span>
                                Tôi đồng ý với <a href="{{ route('about') }}">&nbspĐiều khoản chương trình</a>.
                            </label>
                        </div>
                        @error('agree')
                        <span class="invalid-feedback d-block" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
            </div>
            <!--end::Form group-->
            <!--begin::Form group-->
            <div class="form-group">
                <button type="submit" id="kt_login_signup_submit" class="btn btn-primary font-weight-bold mr-2">Gửi
                    thông tin
                </button>
                <a href="{{ route('homepage') }}" id="kt_login_signup_cancel"
                   class="btn btn-light-primary font-weight-bold">Quay lại trang chủ</a>
            </div>
            <!--end::Form group-->
        </form>
        <!--end::Form-->
    </div>
@endsection

@push('scripts')
    <script type="text/javascript">
        $(document).ready(function () {
            init();
            SMPUtil.initProvinceSelector();
        })

        function init() {
            replaceTexts();
        }

        function replaceTexts() {
            const radios = $('#is_corporate').val();
            var type = $(".type")
            for (var i = 0; i < type.length; i++) {
                if (radios === '0') {
                    type[i].innerHTML = type[i].getAttribute('data-personal');
                    $("#id_issue_province").css({display:"inline"});
                    $("#id_issue_date").css({display:"inline"});
                    $("#birthday").css({display:"inline"});
                    $("#gender").css({display:"block"});
                    $("#id_number-hidden").css({display:"block"});
                    $("#id_number-show").css({display:"none"});
                }
                if (radios === '1') {
                    type[i].innerHTML = type[i].getAttribute('data-corporate');
                    $("#id_issue_province").css({display:"none"});
                    $("#birthday").css({display:"none"});
                    $("#id_issue_date").css({display:"none"});
                    $("#gender").css({display:"none"});
                    $("#id_number-hidden").css({display:"none"});
                    $("#id_number-show").css({display:"block"});
                }
            }
        }

    </script>
@endpush
