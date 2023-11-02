@unless ($breadcrumbs->isEmpty())

    <ol class="breadcrumb breadcrumb-transparent font-weight-bold breadcrumb-dot p-0 my-1 font-size-sm">
        @foreach ($breadcrumbs as $breadcrumb)
            @if (!is_null($breadcrumb->url) && !$loop->last)
                <li class="breadcrumb-item">
                    <a href="{{ $breadcrumb->url }}" class="text-muted">
                        @if(!empty($breadcrumb->icon))
                            <i class="font-size-lg {{$breadcrumb->icon}}"></i>
                        @else
                            {{ $breadcrumb->title }}
                        @endif
                    </a>
                </li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif

        @endforeach
    </ol>

@endunless