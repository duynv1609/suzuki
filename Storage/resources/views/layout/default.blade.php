<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" {{ Metronic::printAttrs('html') }} {{ Metronic::printClasses('html') }}>
<head>
    <meta charset="utf-8"/>
    <title>@yield('title', $page_title ?? '') {{ config('app.name') }}</title>
    <meta name="description" content="@yield('page_description', $page_description ?? '')"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    {{--    <link rel="shortcut icon" href="{{ asset('media/logos/favicon.ico') }}"/>--}}
{{--    {!!  Metronic::getGoogleFontsInclude() !!}--}}
    @foreach(config('layout.resources.css') as $style)
        <link href="{{ asset($style) }}" rel="stylesheet" type="text/css"/>
    @endforeach
    @foreach (Metronic::initThemes() as $theme)
        <link href="{{ asset($theme) }}" rel="stylesheet" type="text/css"/>
    @endforeach
    <script src="https://kit.fontawesome.com/7205ea919f.js" crossorigin="anonymous"></script>
    @yield('styles')
</head>

<body {{ Metronic::printAttrs('body') }} {{ Metronic::printClasses('body') }}>

@if (config('layout.page-loader.type') != '')
    @include('layout.partials._page-loader')
@endif

@include('layout.base._layout')

{{--<script>var HOST_URL = "{{ route('quick-search') }}";</script>--}}
<script>
    var KTAppSettings = {!! json_encode(config('layout.js'), JSON_PRETTY_PRINT|JSON_UNESCAPED_SLASHES) !!};
</script>
@foreach(config('layout.resources.js') as $script)
    <script src="{{ asset($script) }}" type="text/javascript"></script>
@endforeach
@stack('scripts')

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-10642629-55"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-10642629-55');
</script>


</body>
</html>

