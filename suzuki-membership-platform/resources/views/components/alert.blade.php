@if($env == 'front')
    <div class="alert alert-custom alert-light-{{$type}} mb-5" role="alert">
        <div class="alert-icon"><i class="fas fa-{{ $icon }}"></i></div>
        <div class="alert-text">{!!  $message !!} </div>
    </div>
@else
    <div class="alert alert-{{$type}}" role="alert">
        <i class="fas fa-{{ $icon }}"></i> {!! $message !!}
    </div>
@endif