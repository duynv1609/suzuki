@extends('layout.default')

@section('content')
    @if($vendor->cover ?? '')
        <div class="container-fluid mx-0 p-0 bgi-position-center bgi-size-cover" style="height: 500px;background-image: url('{{asset($vendor->cover)}}')"></div>
    @endif
    <div class="container pt-5" @if($vendor->cover ?? '')style="margin-top: -100px"@endif>
        <div class="card card-custom gutter-b">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2">
                        @if($vendor->image ?? '')
                            <img class="img-fluid" src="{{ asset($vendor->image) }}" alt=""/>
                        @else
                            <div class="symbol symbol-150 symbol-secondary mr-3">
                                <span class="symbol-label"><i class="la display-3 text-muted la-building"></i></span>
                            </div>
                        @endif
                    </div>
                    <div class="col-md-10">
                        <h1 class="font-weight-bolder">{{ $vendor->name }}</h1>
                        <div class="row">
                            <div class="col-md-9">
                                <table class="table table-borderless table-sm">
                                    @if($vendor->address)
                                        <tr>
                                            <td class="font-weight-bold">Địa chỉ:</td>
                                            <td>{{ $vendor->address }}</td>
                                        </tr>
                                    @endif
                                    @if($vendor->website)
                                        <tr>
                                            <td class="font-weight-bold">Website:</td>
                                            <td>
                                                <a href="{{ $vendor->website }}" target="_blank">{{ Str::bare_url($vendor->website) }}</a>
                                                <i class="la la-external-link-alt"></i></td>
                                        </tr>
                                    @endif
                                    @if($vendor->email)
                                        <tr>
                                            <td class="font-weight-bold">Email:</td>
                                            <td>
                                                <a href="mailto:{{ $vendor->email }}" target="_blank">{{ $vendor->email }}</a>
                                            </td>
                                        </tr>
                                    @endif
                                    @if($vendor->phone)
                                        <tr>
                                            <td class="font-weight-bold">Điện thoại:</td>
                                            <td>
                                                <a href="mailto:{{ $vendor->phone }}" target="_blank">{{ $vendor->phone }}</a>
                                            </td>
                                        </tr>
                                    @endif
                                </table>
                            </div>
                            <div class="col-3">
                                <a href="{{ route('vouchers-list') }}" class="btn btn-primary btn-block btn-lg">Xem tất cả Voucher</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="card card-custom card-stretch">
                    <div class="card-header">
                        <h4 class="card-title">Giới thiệu</h4>
                    </div>
                    <div class="card-body text-justify">
                        {!! $vendor->description !!}
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-custom  card-stretch">
                    <div class="card-header">
                        <h4 class="card-title">Voucher mới</h4>
                    </div>
                    <div class="card-body">
                        @foreach($vouchers as $voucher)
                            <a href="{{ route('vouchers-show', ['id' => $voucher->id]) }}">
                                <img class="img-fluid w-100 pb-3" src="{{ asset($voucher->image) }}" alt="{{ $voucher->name }}"/>
                            </a>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection