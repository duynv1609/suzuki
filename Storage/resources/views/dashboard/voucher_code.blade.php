@extends('layout.dashboard')

@section('right-section')
    <div class="card card-custom">
        <div class="card-body">
            <h3 class="card-title">Mã Voucher:
                <code class="text-primary voucher-code font-size-h2">{{ strtoupper($voucherCode->code) }}</code></h3>
            <div class="border-bottom w-100"></div>
            <div class="row pt-6">
                <div class="col-md-4">
                    <span class="font-weight-bolder">Ngày mua</span>
                    <p class="text-muted">{{ $voucherCode->created_at->format('d/m/Y') }}</p>
                </div>
                <div class="col-md-4">
                    <span class="font-weight-bolder">Ngày hết hạn</span>
                    <p class="text-muted">{{ $voucherCode->end_date->format('d/m/Y')  }}</p>
                </div>
                <div class="col-md-4">
                    <span class="font-weight-bolder">Phạm vi sử dụng</span>
                    <p class="text-muted">Đại lý Suzuki World</p>
                </div>


            </div>
            <div class="row">
                <div class="col-md-4">
                    <span class="font-weight-bolder">Tình trạng</span>
                    <p class="text-muted">{{ $voucherCode->statusToText()  }}</p>
                </div>
                <div class="col-md-4">
                    <span class="font-weight-bolder">Ngày sử dụng</span>
                    <p class="text-muted">{{ $voucherCode->applied_at ? $voucherCode->applied_at->format('d/m/Y') : 'Chưa có'  }}</p>
                </div>
                <div class="col-md-4">
                    <span class="font-weight-bolder">Nơi sử dụng</span>
                    <p class="text-muted">{{ $voucherCode->dealer->name ?? 'Chưa có'}}</p>
                </div>
            </div>
            {{--            <div class="border-bottom w-100"></div>--}}
            <div class="row">
                <div class="col-12">
                    <p class="text-uppercase text-muted font-weight-bold">Thông tin về Voucher</p>
                </div>
                <div class="col-4">
                    <img class="img-fluid rounded" alt="Hình ảnh" src="{{ asset($voucherCode->voucher->image) }}"/>
                </div>
                <div class="col-8">
                    <h4>
                        <a href="{{ route('vouchers-show', ['id' => $voucherCode->voucher->id]) }}" target="_blank">{{ $voucherCode->voucher->name }}</a>
                    </h4>
                    <p class="text-muted font-weight-bold">Nhà cung cấp:
                        <span class="font-weight-bold"><a href="{{ route('vendors-show', ['slug' => $voucherCode->voucher->vendor->slug]) }}" target="_blank">{{ $voucherCode->voucher->vendor->name }}</a></span>
                    </p>
                    <div class="text-justify">{!!  $voucherCode->voucher->description  !!}</div>
                </div>
            </div>
            <!-- begin: Invoice action-->
            <div class="row justify-content-between py-8 px-8 py-md-10 px-md-0">
                <div class="col-12">
                    <div class="d-flex justify-content-between">
                        <a href="{{ route('dashboard-vouchers') }}" class="btn  btn-primary font-weight-bold">Danh sách mã voucher</a>
                        <a href="{{ route('vouchers-show', ['id' => $voucherCode->voucher->id]) }}" class="btn btn-light font-weight-bold">Xem thêm thông tin Voucher</a>
                    </div>
                </div>
            </div>
            <!-- end: Invoice action-->
            <!-- end: Invoice-->
        </div>
    </div>

@endsection