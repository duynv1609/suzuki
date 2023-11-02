<div class="card card-custom card-stretch">
    <div class="card-header">
        <h3 class="card-title">Xe của Hội viên</h3>
        @if(!$vehicles->isEmpty())
            <div class="card-toolbar">
                <a href="{{ route('dashboard-vehicles') }}" class="btn btn-link">{{ __('dashboard.view_detail') }}</a>
            </div>
        @endif
    </div>
    <div class="card-body pb-0">
        @if(!$vehicles->isEmpty())
            @foreach($vehicles as $vehicle)
                <div class="single-vehicle-container mb-5">
                    <p><img class="img-fluid" src="{{ asset($vehicle->image) }}" alt=""/></p>
                    <h5 class="font-weight-bolder text-center font-size-h5">Suzuki {{$vehicle->model->name}}</h5>
                    {{--            <div class="d-flex justify-content-between align-items-center">--}}
                    {{--                <p class="">{{ __('dashboard.vehicle_model') }}</p>--}}
                    {{--                <p class="font-weight-boldest font-size-h5">Suzuki {{$vehicle->model->name}}</p>--}}
                    {{--            </div>--}}
                    @if ($vehicle->plate_number ?? '')
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="">Biển số:</span>
                            <span class="text-muted">{{ $vehicle->plate_number }}</span>
                        </div>
                    @endif
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="">Số khung:</span>
                        <span class="text-muted">{{ $vehicle->frame_number }}</span>
                    </div>
                    @if ($vehicle->purchased_at ?? '')
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="">Ngày mua:</span>
                            <span class="text-muted">{{  $vehicle->purchased_at->format('d/m/yy') }}</span>
                        </div>
                    @endif
                </div>
            @endforeach
        @else
            <p class="text-muted">{{ __('dashboard.no_vehicle_please_add_one') }}</p>
            <p class="text-center">
                <a class="btn btn-primary" href="{{ route('dashboard-vehicle-add') }}">Thêm xe ngay</a></p>
        @endif
    </div>
</div>