@extends('dashboard.right-column-card')
@section('card-title') {{__('Lịch sử thực hiện dịch vụ')}} @endsection
@section('card-subtitle') {{__('Lịch sử thực hiện dịch vụ')}} @endsection

@section('card-content')

    @if($orders->isNotEmpty())
        <div class="card-body py-0">
            <div class="table-responsive">
                <table class="table table-head-custom table-vertical-center">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Xe</th>
                        <th>Ngày</th>
                        <th class="text-nowrap">Đại lý</th>
                        <th class="text-right">Giá trị</th>
                        <th class="text-nowrap text-right">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($orders as $order)
                        <tr>
                            <td>
                                <a href="{{ route('dashboard-services-detail', ['id' => $order->id])  }}"><strong>#{{ str_pad($order->id,7,'0', STR_PAD_LEFT) }}</strong></a>
                            </td>
                            <td>{{ $order->vehicle->model->name }}</td>
                            <td>{{ $order->ordered_at->format('d/m/Y') }}</td>
                            <td>
                                {{ $order->dealer->name  }}
                            </td>
                            <td class="text-right">
                                {!!  Helper::vnd_format($order->discounted_value) !!}
                            </td>

                            <td class="text-right">
                                <a class="btn btn-link" href="{{ route('dashboard-services-detail', ['id' => $order->id])  }}">Xem chi tiết</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    @else
        <div class="card-body py-5">
            <x-alert type="info" message="Bạn chưa sử dụng Dịch vụ nào tại Đại lý của Suzuki. Nếu bạn vừa sử dụng gần đây, hệ thống có thể cần tới 24 giờ để cập nhật."/>
        </div>
    @endif
@endsection