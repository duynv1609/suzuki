<div class="card card-custom card-stretch gutter-b">
    <div class="card-header">
        <h3 class="card-title">
            {{ __('dashboard.point_histories') }}
        </h3>
        @if($pointHistory ?? '')
            <div class="card-toolbar">
                <a href="{{ route('dashboard-history') }}" class="btn btn-link">{{ __('dashboard.view_all') }}</a>
            </div>
        @endif
    </div>

    <div class="card-body pb-0 mt-n3">
        @if($pointHistory ?? '')
            <table class="table table-head-custom table-borderless table-vertical-center">
                <tbody>
                @foreach($pointHistory as $transaction)
                    <tr>
                        <td class="">
                            <span class="label label-inline mr-2">{{ $transaction->created_at->format('d/m') }}</span>
                            <span class="">@lang('dashboard.short_transaction_type_'. $transaction->type)</span>
                        </td>
                        @if(config('settings.enable_point'))
                            <td class="text-right">
                                @if($transaction->amount <= 0)
                                    <span class="text-danger text-nowrap">{{ Str::point($transaction->amount) }} Điểm</span>
                                @else
                                    <span class="text-success text-nowrap">+{{ Str::point($transaction->amount) }} Điểm</span>
                                @endif
                            </td>
                        @endif
                    </tr>
                @endforeach
                </tbody>
            </table>
        @else
            <div class="align-self-center">
                <p class="text-muted">{{ __('dashboard.no_transaction') }}</p>
            </div>
        @endif
    </div>
</div>