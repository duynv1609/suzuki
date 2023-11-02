<div class="card">
    <div class="card-body {{ $cardClass ?? '' }}">
        <div class="h1 text-muted text-right mb-4"><i class="la la-{{ $icon }}"></i></div>
        <div class="text-value">{{ $number }}</div>
        <small class="text-muted text-uppercase font-weight-bold">{{ $text }}</small>
    </div>
</div>