@extends('layout.default')

@section('content')
    <div class="container h-100 d-flex align-items-center justify-content-center">
        <div class="text-center">
            <h1 class="error-title font-weight-boldest">404</h1>
            <p class="font-size-h1 font-weight-bol text-dark-75">@lang('common.404_primary')</p>
            <p class="font-size-h5 line-height-md">@lang('common.404_help')</p>
            <p><a href="{{ route('homepage') }}" class="btn btn-primary btn-lg">Về trang chủ</a>
        </div>
    </div>
@endsection