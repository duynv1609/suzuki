<div class="card card-stretch card-custom">
    <div class="card-header">
        <h3 class="card-title">@lang('dashboard.latest_vouchers')
            <label class="label label-danger label-square label-inline ml-2"> HOT</label></h3>
        <div class="card-toolbar">
            <a href="{{ route('vouchers-list') }}" class="btn btn-link">{{ __('dashboard.view_all') }}</a>
        </div>
    </div>
    <div class="card-body pb-0">
        @foreach($latestVouchers as $voucher)
            <div class="row mb-5">
                <div class="col-lg-3">
                    <img class="img-fluid rounded" src="{{ $voucher->image }}" alt="{{ $voucher->name }}"/>
                </div>
                <div class="col-lg-9">
                    <a href="{{ route('vouchers-show', ['id' => $voucher->id]) }}" class="font-weight-bold">{{ Str::words($voucher->name, 10) }}</a>
                </div>
            </div>
        @endforeach
    </div>
</div>