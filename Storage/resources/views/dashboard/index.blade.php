@extends('layout.dashboard')

@section('right-section')
<div class="row">
    <div class="col-lg-6">
        @include('dashboard.index-card-membership')
    </div>
    <div class="col-lg-6">
        @include('dashboard.index-card-history', ['customer_histories' => true])
    </div>
</div>
<div class="row">
    <div class="col-lg-6">
        @include('dashboard.index-card-vehicles')
    </div>
    <div class="col-lg-6">
        @include('dashboard.index-card-vouchers')
    </div>
</div>
@endsection
