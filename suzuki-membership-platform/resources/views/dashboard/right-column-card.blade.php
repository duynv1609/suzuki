@extends('layout.dashboard')

@section('right-section')
    <div class="card card-custom">
        <div class="card-header py-3">
            <div class="card-title align-items-start flex-column">
                <h3 class="card-label font-weight-bolder text-dark">@yield('card-title')</h3>
                <span class="text-muted font-weight-bold font-size-sm mt-1">@yield('card-subtitle')</span>
            </div>
        </div>
        @yield('card-content')
    </div>

@endsection

{{--@yield('scripts')--}}
@section('scripts')
    @stack('scripts-stack')
@endsection