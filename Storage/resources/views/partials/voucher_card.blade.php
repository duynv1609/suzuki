<div class="card voucher-card card-custom mb-4" id="voucher-{{ $voucher->id }}">
    <div class="card-body">
        <div class="row">
            <div class="voucher-card-media col-4 ml-0">
                <a href="{{ route('vouchers-show', ['id' => $voucher->id]) }}">
                    <img class="img-fluid rounded" src="{{ $voucher->image }}" alt=""/>
                </a>
            </div>
            <div class="voucher-card-body col-8">
                <h2 class="font-weight-bolder line-height-md">
                    <a class="text-body text-hover-primary" href="{{ route('vouchers-show', ['id' => $voucher->id]) }}">{{ $voucher->name }}</a>
                </h2>
                {{--@if(in_array($voucher->id, $voucherCodes))
                    <p class="voucher-meta text-success">
                        <i class="fa fa-check fa-sm"></i> Bạn đã từng mua voucher này.</p>
                @endif--}}
                <table class="table table-responsive table-sm text-dark-50 table-borderless mb-3">
                    <tr>
                        <td class="voucher-meta font-weight-bold">Cung cấp bởi:</td>
                        <td class="text-primary"><a href="{{ $voucher->vendor->url }}">{{ $voucher->vendor->name }}</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="voucher-meta font-weight-bold">Đại lý áp dụng:</td>
                        <td> Suzuki World</td>
                    </tr>
                    <tr>
                        <td class="voucher-meta font-weight-bold">Hạn sử dụng:</td>
                        <td>@if($voucher->valid_duration)
                                {{ $voucher->valid_duration }} ngày kể từ ngày mua
                            @else
                                Không giới hạn
                            @endif
                        </td>
                    </tr>
                </table>
                <p class="card-text">{!! $voucher->description  !!}
                <p class="voucher-price font-size-h3 text-success">
                    <strong>@if($voucher->price === 0) Miễn phí @else {{ Helper::number_format($voucher->price) }} điểm @endif</strong>
                </p>
                {{--<p>
                    <a href="{{ route('vouchers-show', ['id' => $voucher->id]) }}" class="btn btn-primary btn-sm">Xem chi tiết</a>
                </p>--}}
            </div>
        </div>
    </div>
</div>
