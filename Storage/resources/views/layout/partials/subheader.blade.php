@if(Route::currentRouteName() != 'homepage' || (isset($exception) && $exception->getStatusCode() !== 404))
    @if((!empty($pageTitle) && Breadcrumbs::exists()))
        <div class="subheader subheader-fixed py-1 py-lg-2 subheader-solid" id="kt_subheader">
            <div class="container d-flex align-items-center flex-wrap flex-sm-nowrap">
                <button class="burger-icon mr-4 d-inline-block d-lg-none" id="kt_subheader_mobile_toggle">
                    <span></span>
                </button>
                <div class="mr-2">
                    @if(!empty($pageTitle))
                        <h2 class="text-dark font-weight-bolder mt-1 mb-1 mr-3">{{ $pageTitle }}</h2>
                    @endif
                    {{--                    @if(Route::currentRouteName() == 'vouchers-show')--}}
                    {{--                        {{ Breadcrumbs::render($currentRouteName, $voucher) }}--}}
                    {{--                    @else--}}
                    {{ Breadcrumbs::render() }}
                    {{--                    @endif--}}
                </div>
            </div>
        </div>
    @endif
@endif