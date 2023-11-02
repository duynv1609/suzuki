@extends('layout.default')

@section('content')
    <div class="container col-lg-6 col-md-9">
        <div class="card card-custom">`
            <div class="card-body text-justify">
                <h1 class="text-center display-4 font-weight-bolder mb-5 text-uppercase text-primary">Chương trình Hội viên Suzuki World</h1>
                <p><img src="{{ asset('images/cover-suzuki-world-membership.jpg') }}" class="img-fluid" alt=""/></p>
                <h2>I - Giới thiệu</h2>
                <p>Hội viên Suzki World là chương trình tri ân của Suzuki World (Số 02 Phổ Quang, Phường 2, quận Tân Bình, TP. HCM) dành cho khách hàng mua xe ô tô và/hoặc thực hiện Dịch vụ cho ô tô tại đây.</p>
                <p>Với mỗi hóa đơn dịch vụ, Hội viên sẽ được tích lũy một số điểm nhất định. Điểm được tích lũy có thể dùng để mua các voucher giảm giá, voucher khuyến mãi hoặc đổi những phần quà hấp dẫn.</p>
                <p>Ngoài ra, những Hội viên có lịch sử thực hiện dịch vụ nhiều lần còn được xem xét và tặng một số quyền lợi dành riêng cho khách hàng thân thiết.</p>
                <h2>II - Các điều khoản của chương trình</h2>
                <div style="padding-left: 20px">
                    <h3>1. Đối tượng áp dụng</h3>
                    <ul>
                        <li>Khách hàng mua xe ô tô mới tại Suzuki World</li>
                        <li>Khách hàng sử dụng dịch vụ cho xe ô tô Suzuki tại Suzuki World</li>
                    </ul>
                </div>
                <div style="padding-left: 20px">
                    <h3>2. Tích lũy và sử dụng điểm</h3>
                    <p>Với mỗi hóa đơn thực hiện dịch vụ tại Suzuki World, Hội viên sẽ được tích điểm vào tài khoản dựa trên tổng số tiền trước thuế của hóa đơn. Tỷ lệ quy đổi: Mỗi 100.000 VND = 1 điểm.</p>
                    <p>Lưu ý: Số dư dưới 100.000 VND sẽ không được cộng dồn để tích điểm. Ví dụ: Hóa đơn có tổng số tiền 980.000 VND (trước thuế) sẽ được tích lũy 9 điểm.</p>
                    <p>Tích lũy điểm không áp dụng cho các trường hợp liên quan tới bảo hiểm.</p>
                </div>
                <div style="padding-left: 40px">
                    <h5>a) Giá trị đổi điểm:</h5>
                    <ul>
                        <li>30 điểm: Đổi được 01 voucher giảm 5% phí dịch vụ trước thuế tại Suzuki World.</li>
                        <li>45 điểm: Đổi được 01 voucher giảm 10% phí dịch vụ trước thuế tại Suzuki World.</li>
                    </ul>
                    <h5>b) Cách đổi điểm:</h5>
                    <ol>
                        <li>Hội viên vào trang "Vouchers" để đổi lấy voucher giảm giá tương ứng với số điểm hiện có.</li>
                        <li>Hội viên xuất trình voucher và thông tin khách hàng trước khi thanh toán hóa đơn tại Suzuki World để được giảm giá.</li>
                    </ol>
                    <h5>c) Điều kiện đổi và sử dụng điểm:</h5>
                    <p>Voucher giảm giá KHÔNG được sử dụng trong tháng đạt đủ điểm quy đổi mà phải sử dụng vào tháng kế tiếp. Ví dụ: Hội viên đạt 30 điểm trong tháng 4/2021 thì sẽ được sử dụng voucher giảm giá kể từ tháng 5/2021.</p>
                </div>
                <hr/>
                <h2 class="text-center text-uppercase my-5 text-primary"><strong>Những câu hỏi thường gặp (FAQ)</strong>
                </h2>

                <h4>Đăng ký Hội viên Suzuki World như thế nào?</h4>
                <p>Mọi khách hàng đang sở hữu xe ô tô Suzuki đều có thể đăng ký trở thành Hội viên Suzuki World. Sau khi đăng ký thành công, Hội viên cần thêm xe đang sở hữu vào hệ thống và có giao dịch tích lũy điểm đầu tiên để kích hoạt gói Hội viên.</p>
                <p>
                    <a class="btn btn-light-primary" href="{{ route('register') }}" target="_blank">Đăng ký tại đây</a>
                </p>

                <h4>Làm sao để tích lũy điểm?</h4>
                <p>Với mỗi hóa đơn dịch vụ tại Suzuki World, Hội viên sẽ được tích lũy điểm theo tỷ lệ 100.000VND = 01 điểm. </p>
                <p>Điểm sẽ được tự động cập nhật vào hệ thống trong vòng 24 giờ kể từ thời điểm phát sinh giao dịch.</p>

                <h4>Điểm được sử dụng như thế nào?</h4>
                <p>Điểm tích lũy có thể được sử dụng để đổi các voucher với giá trị sử dụng hấp dẫn tại danh sách Vouchers của Suzuki World, ví dụ như: giảm % hóa đơn, sử dụng dịch vụ của các nhà cung cấp bên ngoài với chi phí ưu đãi...</p>

                <h4>Điểm có thời hạn sử dụng trong bao lâu?</h4>
                <p>Thời hạn có hiệu lực của điểm tích lũy là 6 tháng kể từ tháng có giao dịch tích lũy điểm gần nhất.</p>

                <h4>Hội viên có thể chuyển điểm sang cho người khác không?</h4>
                <p>Hiện tại, Hội viên không thể chuyển điểm sang cho người khác.</p>

                <h4>Hội viên có cần phải tự mình theo dõi điểm không?</h4>
                <p>Không. Mỗi khi thực hiện hóa đơn dịch vụ tại Suzuki World, chúng tôi sẽ cập nhật điểm và lịch sử giao dịch của bạn vào hệ thống trong vòng 24 giờ. Bạn có thể xem lịch sử tích lũy / sử dụng điểm tại trang cá nhân sau khi đăng nhập.</p>
            </div>
        </div>
    </div>
@endsection