@extends('dashboard.right-column-card')

@section('card-title') Lịch sử sử dụng điểm @endsection
@section('card-subtitle'){{ __('dashboard.personal_info_description') }}@endsection

@section('card-content')
    <div class="card-body">
        @if(!$pointHistory->isEmpty())
            <table class="table table-head-custom table-vertical-center">
                <thead>
                <tr>
                    <th scope="col" style="width: 120px" class="text-nowrap">Thời gian</th>
                    <th scope="col">Nội dung</th>
                    <th scope="col" class="text-nowrap text-right">Số điểm</th>
                </tr>
                </thead>
                @foreach($pointHistory as $history)
                    <tr style="height:60px">
                        <td>
                            {{ $history->created_at->format('d/m/Y') }}
                        </td>
                        <td>@lang('dashboard.transaction_type_'. $history->type)
                            @if($history->voucher_id && $history->type == config('constants.point_history_type.buy_voucher'))
                                <a href="{{ route('vouchers-show', ['id' => $history->voucher_id]) }}"><strong>{{ $history->voucher_name }}</strong></a>
                            @endif
                        </td>
                        @if($history->amount > 0)
                            <td class="text-right font-weight-boldest text-success">+{{ number_format($history->amount,0,',','.') }}</td>
                        @else
                            <td class="text-right font-weight-boldest text-danger">{{ number_format($history->amount,0,',','.') }}</td>
                        @endif

                    </tr>
                @endforeach
            </table>
            {{ $pointHistory->links() }}
        @else
            <x:alert type="info" message="Bạn chưa có giao dịch điểm nào."/>
        @endif
    </div>

@endsection