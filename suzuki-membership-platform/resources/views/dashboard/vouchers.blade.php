@extends('layout.dashboard')

@section('right-section')

    <div class="card card-custom">
        <div class="card-header py-3">
            <div class="card-title align-items-start flex-column">
                <h3 class="card-label font-weight-bolder text-dark">{{ __('Voucher của bạn') }}</h3>
                <span class="text-muted font-weight-bold font-size-sm mt-1">{{ __('Danh sách các voucher mà bạn đã mua') }}</span>
            </div>

            {{--            <h1 class="card-title font-size-h3 align-items-start flex-column">Các mã Voucher của bạn</h1>--}}
            <div class="card-toolbar">
                <a href="{{ route('vouchers-list') }}" class="btn btn-primary">
                    <i class="la la-plus"></i>Mua Voucher mới</a>
            </div>
        </div>

        @if($voucherCodes->isNotEmpty())
            <div class="card-body py-0">
                <div class="table-responsive">
                    <table class="table w-100 table-head-custom table-vertical-center">
                        <thead>
                        <tr>
                            <th>Ngày</th>
                            <th class="text-center">Ảnh</th>
                            <th>Tên</th>
                            <th class="text-nowrap text-center">Trạng thái</th>
                            <th class="text-nowrap text-center">Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($voucherCodes as $code)
                            <tr>
                                <td>{{ $code->purchased_at->format('d/m/Y') }}</td>
                                <td>
                                    <div class="symbol symbol-100">
                                        <div class="symbol-label" style="background-image: url('{{ asset($code->voucher->image) }}')"></div>
                                    </div>
                                </td>
                                <td>
                                    <a href="{{ route('dashboard-voucher-code', ['id' => $code->code]) }}"><strong>{{ $code->voucher->name }}</strong></a>
                                </td>
                                <td>{{ Helper::statusLabel($code->status) }}</td>
                                <td class="pr-0 text-center">
                            <span data-toggle="modal" data-target="#voucher-code-quickviewer-{{$code->code}}">
                                <a data-toggle="tooltip" data-title="Xem mã nhanh" data-theme="dark" data-status="{{ $code->status }}" class="btn-quick-view-code btn btn-light btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                            </span>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @else
            <div class="card-body py-5">
                <x:alert type="info" message="Bạn đang không có voucher nào."/>
            </div>
        @endif

        @if($voucherCodes->isNotEmpty())
            @foreach($voucherCodes as $code)
                <div class="modal fade" id="voucher-code-quickviewer-{{$code->code}}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p id="modal-voucher-name" class="font-size-lg text-center">
                                    <strong>{{ $code->voucher->name }}</strong></p>
                                <div class="form-group">
                                    <input id="modal-voucher-code" onClick="this.setSelectionRange(0, this.value.length)" type="text" class="form-control separator-dashed border-muted bg-light text-muted font-weight-boldest font-size-h1 text-center text-monospace" readonly="" value="{{ strtoupper($code->code) }}">
                                </div>
                                <p class="text-muted text-center">
                                    @if($code->status == config('constants.voucher_code.status_new'))
                                        Bạn hãy áp dụng mã này tại các đại lý để được hưởng ưu đãi.
                                    @elseif($code->status == config('constants.voucher_code.status_expired'))
                                        Voucher này đã hết hạn và không thể sử dụng.
                                    @elseif($code->status == config('constants.voucher_code.status_used'))
                                        Voucher này đã được sử dụng và không thể dùng lại.
                                    @endif
                                </p>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        @endif

        @if($voucherCodes->isNotEmpty() && $voucherCodes->links()->paginator->hasPages())
            <div class="card-footer">
                {{ $voucherCodes->links() }}
            </div>
        @endif
    </div>

@endsection