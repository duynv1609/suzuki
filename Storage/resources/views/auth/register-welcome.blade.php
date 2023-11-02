@extends('layout.login-register')
@section('form')
    <div class="login-form login-signup">
        <!--begin::Form-->
        <div class="pb-13 pt-lg-0 pt-5">
            <h3 class="font-weight-bold text-dark font-size-h4 font-size-h1-lg">Xin chào, {{ $customer['name'] }}.</h3>
            <p class="font-size-h5">Việc đăng ký Hội viên Suzuki World của bạn chỉ còn một bước nữa thôi là hoàn tất.</p>
            <p class="font-size-h5 text-justify">Để có thể tận hưởng những ưu đãi dành riêng cho Hội viên Suzuki, xe Suzuki mà bạn đang sở hữu cần được bổ sung vào hệ thống. Sau khi thêm thành công, chức năng tích điểm và các voucher ưu đãi sẽ tự động được kích hoạt khi xe thực hiện dịch vụ lần tiếp theo và có ghi nhận hóa đơn tại các Đại lý đang áp dụng chương trình Hội viên Suzuki. </p>
            <p class="font-size-h5 text-justify">Để bắt đầu thêm xe và hoàn tất quá trình đăng ký, vui lòng nhấn nút bên dưới.</p>
            <p><a href="{{ route('dashboard-vehicle-add') }}" class="btn btn-primary">Thêm xe Suzuki vào hệ thống</a>
{{--            <a href="{{ route('dashboard-home') }}" class="btn btn-link">Tạm thời bỏ qua bước này</a></p>--}}
        </div>
    </div>

@endsection