@extends('layout.default')

@section('content')
    <div class="container">
        @if(session('buy_successfully'))
            @include('partials.alert', ['type' => 'success', 'message' => session('buy_successfully')])
        @endif
        <div class="card card-custom mb-5">
            <div class="card-body">
                @if(!$customer->has_membership)
                    <x-alert type="info" :message="__('common.voucher_no_membership_notice', ['url' => route('dashboard-vehicle-add')])"/>
                @endif
                <div class="row">
                    <div class="col-sm-6 border-right">
                        <img class="img-fluid" src="{{asset($voucher->image) }}" alt="">
                    </div>
                    <div class="col-sm-6 pl-5">
                        <h1 class="card-title"><strong>{{ $voucher->name }}</strong></h1>
                        <div class="text-justify voucher-description mb-5">
                            {!! $voucher->description !!}
                        </div>
                        <div class="separator separator-solid"></div>
                        <div class="voucher-meta">
                            <table class="table table-sm table-borderless table-responsive text-dark-50 mt-4">
                                <tr>
                                    <td class="pl-0"><strong>Nhà cung cấp:</strong></td>
                                    <td>
                                        <a target="_blank" href="{{ $voucher->vendor->url }}">{{ $voucher->vendor->name }}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pl-0"><strong>Nơi áp dụng:</strong></td>
                                    <td>{{ $voucher->applyPlaceToText() }}</td>
                                </tr>
                                <tr>
                                    <td class="pl-0">
                                        <strong>@lang('common.expiry_date'): </strong>
                                        {{--@if($voucher->valid_duration)
                                            <i class="far fa-question-circle" data-toggle="tooltip" data-placement="top" data-theme="dark" title="Trong vòng {{ $voucher->valid_duration }} ngày sau khi mua, Hội viên cần phải sử dụng voucher, nếu không voucher sẽ hết hạn."></i>
                                        @endif--}}
                                    </td>
                                    <td>
                                        @if($voucher->valid_duration)
                                            {{  __('common.x_days_after_purchase', ['x' => $voucher->valid_duration]) }}
                                        @else Không giới hạn
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td class="pl-0"><strong>Số lần mua tối đa: </strong></td>
                                    <td>
                                        @if(intval($voucher->max_per_customer) > 0)
                                            @lang('common.x_times', ['x' => $voucher->max_per_customer])
                                            <i class="far fa-question-circle" data-toggle="tooltip" data-placement="top" data-theme="dark" title="Đây là Voucher có giới hạn. Mỗi Hội viên chỉ được mua Voucher này tối đa {{ $voucher->max_per_customer }} lần."></i>
                                        @else
                                            Không giới hạn
                                        @endif
                                    </td>
                                </tr>
                            </table>
                        </div>
                        @if(config('settings.enable_point'))
                            <div class="">
                                @if($customer->point_balance >= $voucher->price)
                                    <p class="text-success">
                                        <i class="fa fa-check fa-sm text-success"></i> Bạn đang có {{ number_format($customer->point_balance,0,',','.') }} điểm trong tài khoản.
                                    </p>
                                @endif
                            </div>
                        @endif
                        <div>
                            @if(is_array($canBuy))
                                @foreach($canBuy as $message)
                                    <p class="text-danger"><i class="fa fa-times fa-sm text-danger"></i> {{ $message }}
                                    </p>
                                @endforeach
                            @else
                                <p class="text-success">
                                    <i class="fa fa-check fa-sm text-success"></i> Bạn có thể mua voucher này. </p>
                            @endif
                        </div>
                        <div class="separator separator-solid mb-4"></div>
                        <div class="d-flex justify-content-between align-items-center">
                            @if(config('settings.enable_point'))
                                <p class="price font-size-h2 text-success font-weight-bold">
                                    @if($voucher->price === 0)
                                        Miễn phí
                                    @else
                                        {{ number_format($voucher->price,0,',','.') }} điểm
                                    @endif
                                </p>
                            @endif
                            @if($canBuy === true)
                                <div class="form-row">
                                    <div class="col">
                                        <a data-toggle="modal" data-target="#staticBackdrop" class="btn btn-primary">
                                            @lang('common.buy_this_voucher')
                                        </a>
                                    </div>
                                </div>

                                <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Xác nhận mua voucher</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <i aria-hidden="true" class="fa fa-times"></i>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn sẽ mua voucher <strong>{{ $voucher->name }}</strong> với chi phí là
                                                <strong>{{ $voucher->price }} điểm</strong>. Bạn xác nhận sẽ tiếp tục?
                                            </div>
                                            <div class="modal-footer">
                                                <form action="{{ route('vouchers-buy') }}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="voucher_id" value=" {{ $voucher->id }}"/>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <button class="btn btn-hover-bg-light mr-2" data-dismiss="modal">Hủy bỏ</button>
                                                            <button type="submit" class="btn btn-primary" id="btn-buy-voucher">
                                                                @lang('common.buy_this_voucher')
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @else
                                <button data-toggle="tooltip" data-theme="dark" title="{{ $canBuy[0] }}" class="btn btn-secondary disabled">
                                    <i class="fas fa-shopping-cart"></i>
                                    @lang('common.buy_this_voucher')
                                </button>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card card-custom gutter-b">
            <div class="card-header">
                <div class="card-title">Thông tin nhà cung cấp</div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-2">
                        <a href="{{ route('vendors-show', ['slug' => $voucher->vendor->slug])  }}">
                            <img class="img-fluid" src="{{ asset($voucher->vendor->image) }}" alt="Logo của {{ $voucher->vendor->name }}"/>
                        </a>
                    </div>
                    <div class="col-lg-10">
                        <h3><strong>
                                <a href="{{ route('vendors-show', ['slug' => $voucher->vendor->slug])  }}">{{ $voucher->vendor->name }}</a>
                            </strong>
                        </h3>
                        <p>{!!$voucher->vendor->short_description!!}</p>
                        <div>
                            <a href="{{ route('vendors-show', ['slug' => $voucher->vendor->slug]) }}" class="btn btn-secondary">Xem thêm</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        @if(!$voucherCodes->isEmpty())
            <div class="card card-custom">
                <div class="card-body">
                    <h3 class="card-title">Lịch sử mua Voucher này của bạn</h3>
                    <table class="table table-vertical-center">
                        <thead class="thead-light w-100">
                        <tr>
                            <th style="width: 50px">STT</th>
                            <th>Mã Voucher</th>
                            <th>Ngày mua</th>
                            <th>Ngày hết hạn</th>
                            <th>Thời gian sử dụng</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($voucherCodes as $code)
                            <tr>
                                <td class="table-vertical-center">{{ $loop->index + 1 }}</td>
                                <td><span class="text-uppercase"><strong>{{ $code->code }}</strong></span></td>
                                <td>{{ $code->created_at->format('d-m-Y') }}</td>
                                <td>{{ $code->end_date->format('d-m-Y') }}</td>
                                <td>{{ $code->applied_at ? $code->applied_at->format('d-m-Y') : ''}}</td>
                                <td>
                                    {{ Helper::statusLabel($code->status)  }}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @endif
    </div>
@endsection