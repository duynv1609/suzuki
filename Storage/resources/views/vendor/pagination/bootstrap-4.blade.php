@if ($paginator->hasPages())
    <div class="d-flex justify-content-between align-items-center flex-wrap">
        <div>
            <span class="text-muted">
                {!! __('Showing') !!}
                <span class="font-medium">{{ $paginator->firstItem() }}</span>
                {!! __('to') !!}
                <span class="font-medium">{{ $paginator->lastItem() }}</span>
                {!! __('of') !!}
                <span class="font-medium">{{ $paginator->total() }}</span>
                {!! __('results') !!}
            </span>
        </div>
        <nav class="">
            {{-- Previous Page Link --}}
            @if ($paginator->onFirstPage())
{{--                <button aria-disabled="true" aria-label="{{__('pagination.previous')}}" disabled class="btn btn-icon btn-sm btn-light mr-2 my-1">--}}
{{--                    <i class="la la-angle-left icon-xs"></i>--}}
{{--                </button>--}}
            @else
                <a href="{{ $paginator->previousPageUrl() }}" aria-label="{{ __('pagination.previous') }}" rel="prev" class="btn btn-icon btn-sm btn-light mr-2 my-1">
                    <i class="fa fa-angle-left"></i>
                </a>
            @endif

            {{-- Pagination Elements --}}
            @foreach ($elements as $element)
                {{-- "Three Dots" Separator --}}
                @if (is_string($element))
                    <li class="page-item disabled" aria-disabled="true"><span class="page-link">{{ $element }}</span>
                    </li>
                @endif

                {{-- Array Of Links --}}
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                            <a aria-current="page" class="btn btn-icon btn-sm border-0 btn-light btn-hover-primary active mr-2 my-1">{{ $page }}</a>
                        @else
                            <a href="{{ $url }}" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">{{ $page }}</a>
                        @endif
                    @endforeach
                @endif
            @endforeach

            {{-- Next Page Link --}}
            @if ($paginator->hasMorePages())
                <a href="{{ $paginator->nextPageUrl() }}" aria-label="@lang('pagination.next')" rel="next" class="btn btn-icon btn-sm btn-light mr-2 my-1">
                    <i class="fa fa-angle-right"></i>
                </a>
            @else
{{--                <button aria-disabled="true" aria-label="@lang('pagination.next')" disabled class="btn btn-icon btn-sm btn-light mr-2 my-1">--}}
{{--                    <i class="la la-angle-right icon-xs"></i>--}}
{{--                </button>--}}
            @endif
        </nav>
    </div>
@endif
