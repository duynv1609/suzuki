<div class="footer container-fluid bg-primary py-4 d-flex flex-lg-column {{ Metronic::printClasses('footer', false) }}" id="kt_footer">
    <div class="container <?php Metronic::printClasses('footer-container',
        false) ?> d-flex flex-column flex-md-row align-items-center justify-content-between">
        <div class="text-white order-2 order-md-1">
            <span class="font-weight-bolder">&copy; {{ date("Y") }}</span>
            <a href="https://suzuki.com.vn" target="_blank" class="text-white"><strong> Suzuki World</strong></a><br/>
            Địa chỉ: Số 02 Phổ Quang, Phường 2, quận Tân Bình, TP. Hồ Chí Minh<br/>
        </div>
        <ul class="nav order-1 order-md-2 ">
            <li class="nav-item">
                <a href="{{ route('about') }}" class="text-white nav-link px-3">Điều khoản sử dụng</a>
            </li>
            <li class="nav-item">
                <a href="{{ route('privacy') }}" class="text-white nav-link pl-3 pr-0">Quyền riêng tư</a>
            </li>
            <li class="nav-item">
                <a href="{{ route('contact') }}" class="text-white nav-link pl-3 pr-0">Liên hệ</a>
            </li>
        </ul>
    </div>
</div>
