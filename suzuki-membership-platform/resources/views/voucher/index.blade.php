@extends('layout.default')

@section('content')
    <div class="container pt-4">
        <div class="row">
            <div class="col-lg-9">
                @if(!$customer->has_membership)
                    <x-alert type="info" :message="__('common.voucher_no_membership_notice', ['url' => route('dashboard-vehicle-add')])"/>
                @endif
                @foreach($vouchers as $voucher)
                    @include('partials.voucher_card',['voucher' => $voucher])
                @endforeach
                @if($vouchers->hasPages())
                    <div class="card card-custom">
                        <div class="card-body py-7">
                            {{ $vouchers->links() }}
                        </div>
                    </div>
                @endif
            </div>
            {{--            <div class="col-lg-3">
                            <div class="card card-custom">
                                <div class="card-body p-2">
                                    <img class="img-fluid rounded" src="https://suzuki.com.vn/images/2020/11/Homepage-XL7-CTKM-11.2020-550x800.jpg"/>
                                </div>
                            </div>
                        </div>--}}
        </div>
    </div>
@endsection
