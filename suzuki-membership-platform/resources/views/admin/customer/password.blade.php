{{-- Show newly-created user information --}}
@if(Session::has('crudPassword'))
    <div class="card border-success" role="alert">
        <div class="card-header bg-success">
            <span class=""><i class="la la-check la-fw"></i> Tài khoản đã được tạo</span>
        </div>
        <div class="card-body">
            <p>Tài khoản của khách hàng <strong>{{ session('crudName') }}</strong> đã được tạo thành công.</p>
            <p>Thông tin đăng nhập đã được gửi đến email <strong>{{ session('crudEmail') }}</strong>.</p>
            <p>Đại lý hãy gửi thông tin đến khách hàng bằng cách khác nếu họ không có email.</p>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="login-username">Tài khoản:</label>
                <div class="col-sm-10">
                    <input type="text" id="login-username" class="form-control form-inline d-inline" value="{{ session('crudMobile') }}" readonly/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="login-password">Mật khẩu:</label>
                <div class="col-sm-10">
                    <input type="text" id="login-password" class="form-control form-inline d-inline" value="{{session('crudPassword')}}" readonly/>
                </div>
            </div>
            <div class="alert alert-info">
                <i class="la la-info"></i> Thông tin đăng nhập & mật khẩu chỉ được hiển thị duy nhất lúc này. Sau này Đại lý sẽ phải reset mật khẩu cho khách nếu có yêu cầu.
            </div>
        </div>
    </div>
@endif