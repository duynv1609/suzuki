@extends('layout.default')

@section('content')
    @include('index.carousel')
    <div class="container-fluid bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 p-5">
                    @guest
                        <h3>Chào mừng đến với Hội viên Suzuki World.</h3>
                        <p class="lead text-muted mb-0">Hãy đăng ký tham gia để được hưởng các quyền lợi hấp dẫn.</p>
                    @endguest
                    @auth
                        <h3>Chào mừng Hội viên đã quay trở lại.</h3>
                        <p class="lead text-muted mb-0">Hãy bắt đầu sử dụng các quyền lợi của bạn.</p>
                    @endauth
                </div>
                <div class="col-md-6  p-5 text-center text-md-right">
                    @guest
                        <a href="{{ url('/register') }}" class="btn btn-primary my-2 d-md-none">Đăng ký</a>
                        <a href="{{ url('/register') }}" class="btn btn-primary btn-lg my-2 d-none d-md-inline">Đăng ký</a>
                        <a href="{{ url('/login') }}" class="ml-5 btn btn-lg btn-link font-weight-bold">Đăng nhập</a>
                    @endguest
                    @auth
                        <a href="{{ route('vouchers-list') }}" class="btn btn-primary my-2 btn-block d-md-none">Mua Voucher</a>
                        <a href="{{ route('vouchers-list') }}" class="btn btn-primary btn-lg my-2 d-none d-md-inline">Mua Voucher</a>
                        <a href="#" class="ml-5 btn btn-link font-weight-bold">Tìm hiểu thêm</a>
                    @endauth
                </div>
            </div>
        </div>
    </div>
    <div class="container marketing mt-5">
        <div class="row featurette align-items-center">
            <div class="col-md-7">
                <h2 class="featurette-heading text-red font-size-sm-h1">Đặc quyền.
                    <span class="text-muted">Dành riêng cho khách hàng của Suzuki World.</span></h2>
                <p class="lead text-justify">Chỉ cần sở hữu xe hơi của Việt Nam Suzuki, Quý khách sẽ được hưởng những ưu đãi độc đáo, nhiều quyền lợi của Chương trình Hội viên Suzuki World.</p>
            </div>
            <div class="col-md-5">
                <img class="img-fluid" src="{{ asset('images/home-loyalty-1.jpg') }}" alt=""/>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette align-items-center">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading text-blue">Chi phí tối thiểu.
                    <span class="text-muted">Quyền lợi tối đa.</span></h2>
                <p class="lead">Khách hàng mua ô tô của Việt Nam Suzuki tại Suzuki World sẽ được tạo tài khoản Hội viên miễn phí và bắt đầu tích điểm để nhận những ưu đãi dành riêng.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <img class="img-fluid" alt="" src="{{ asset('images/home-loyalty-2.jpg') }}"/>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette align-items-center">
            <div class="col-md-7">
                <h2 class="featurette-heading text-red">Bao phủ rộng.
                    <span class="text-muted">Nhiều đối tác.</span></h2>
                <p class="lead">Không chỉ giới hạn tại Suzuki World, các voucher còn có thể sử dụng tại các cửa hàng và dịch vụ do nhiều đối tác cung cấp.</p>
            </div>
            <div class="col-md-5">
                <img src="{{ asset('images/home-loyalty-3.jpg') }}" alt="" class="img-fluid"/>
            </div>
        </div>
        {{--        <hr class="featurette-divider">--}}
    </div>
@endsection
