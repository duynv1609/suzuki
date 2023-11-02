@extends('layout.dashboard')

@section('right-section')
    @if(Session::has('addSuccesfully') && !$customer->membership()->exists())
        <div class="alert alert-light-success alert-custom fade show">
            <div class="alert-icon"><i class="far fa-check-circle fa-sm"></i></div>
            <div class="alert-text">Bạn đã thêm xe mới thành công. Hãy thực hiện dịch vụ lần đầu tại Đại lý để kích hoạt gói Hội viên cho tài khoản của bạn.</div>
            <div class="alert-close">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">
                    <i class="fas fa-times"></i>
                </span>
                </button>
            </div>
        </div>
    @endif

    <div class="card card-custom">
        <div class="card-header py-3">
            <div class="card-title align-items-start flex-column">
                <h3 class="card-label font-weight-bolder text-dark">{{ __('Xe của bạn') }}</h3>
                <span class="text-muted font-weight-bold font-size-sm mt-1">{{ __('Xem thông tin những xe bạn đã thêm vào hệ thống') }}</span>
            </div>
            <div class="card-toolbar">
                <a href="{{ route('dashboard-vehicle-add') }}" class="btn btn-icon-primary btn-link-primary">
                    <i class="fa fa-plus fa-sm"></i>{{ __('Thêm xe mới') }}</a>
            </div>
        </div>
        <div class="card-body">
            @if($vehicles->isNotEmpty())
                @foreach($vehicles as $vehicle)
                    <div class="row mb-4 mt-4">
                        <div class="col-md-5">
                            <img class="img-fluid" src="{{ asset($vehicle->image) }}" alt="image">
                            {{--@if($vehicle->membership)
                                <h6 class="text-success text-center mt-5 mb-0">
                                    <i class="fa fa-check-circle text-success"></i> Xe đang có Membership</h6>
                            @endif--}}
                        </div>
                        <div class="col-md-7">
                            <h3 class="card-title font-weight-bolder text-dark mb-4">Suzuki {{ $vehicle->model->name }}
                                <span class="text-muted">({{ $vehicle->color->name }})</span></h3>
                            <table class="table table-borderless">
                                <tr>
                                    <td style="width:200px" class="font-weight-bolder px-0 py-1">Số khung:</td>
                                    <td class="text-monospace text-muted text-uppercase px-0 py-1">{{ $vehicle->frame_number }}</td>
                                </tr>
                                @if($vehicle->plate_number ?? '')
                                    <tr>
                                        <td class="font-weight-bolder px-0 py-1">Biển số:</td>
                                        <td class="text-muted text-uppercase px-0 py-1">{{ $vehicle->plate_number }}</td>
                                    </tr>
                                @endif
                                @if($vehicle->purchased_at ?? '')
                                    <tr>
                                        <td class="font-weight-bolder px-0 py-1">Ngày mua:</td>
                                        <td class="text-muted text-uppercase px-0 py-1">{{ $vehicle->purchased_at->format('d/m/Y') }}</td>
                                    </tr>
                                @endif
                                <tr>
                                    <td class="font-weight-bolder px-0 py-1">Nơi mua:</td>
                                    <td class="text-muted text-uppercase px-0 py-1">{{ $vehicle->dealer->name }}</td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bolder px-0 py-1">Hạn mức giảm còn lại:</td>
                                    <td class="text-muted px-0 py-1">{!! Helper::vnd_format($vehicle->remaining_quota) !!}.
                                        <a href="#" data-target="#quota-modal" data-toggle="modal">Tìm hiểu thêm</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    {{--@if($vehicle->membership)
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <p class="mb-2 text-center"><strong>Ngày bắt đầu</strong></p>
                                        <p>
                                            <span class="btn btn-light-success btn-block btn-sm font-weight-bold btn-text">{{ $vehicle->membership->created_at->format('d/m/Y') }}</span>
                                        </p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="mb-2 text-center"><strong>Ngày hết hạn</strong></p>
                                        <p>
                                            <span class="btn btn-light btn-block btn-sm font-weight-bold btn-text">{{ $vehicle->membership->ended_at->format('d/m/Y') }}</span>
                                        </p>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-7">
                                @php($eligibleOrders = $vehicle->membership->extensionEligibleOrders())
                                <p class="mb-2"><strong>Điều kiện duy trì</strong>
                                    @if($eligibleOrders >= config('constants.membership.minimum_order_to_maintain'))
                                        <span class="text-success">(<i class="fas fa-check text-success fa-sm"></i> Bạn đã đạt)</span>
                                    @else
                                        <span class="text-muted">(Bạn cần thêm <strong>{{ config('constants.membership.minimum_order_to_maintain') - $eligibleOrders }}</strong> lần nữa).</span>
                                    @endif
                                </p>
                                <p>Thực hiện dịch vụ
                                    <strong>{{ config('constants.membership.minimum_order_to_maintain') }}</strong> lần với giá trị tối thiểu
                                    <strong>{{ number_format(config('constants.membership.minimum_order_value'),0,',','.') }}đ</strong>/lần trước ngày {{ $vehicle->membership->ended_at->format('d/m/Y') }} để gia hạn Hội viên tới {{ $vehicle->membership->ended_at->addYear(1)->format('d/m/Y') }}.
                                </p>

                                <p></p>
                                --}}{{--<div class="d-flex align-items-center pt-2">
                                    @if($vehicle->membership->extensionEligibleOrders() >= config('constants.membership.minimum_order_to_maintain'))
                                        Bạn đã
                                    @endif
                                    @php($ratio = round($vehicle->membership->created_at->diffInDays(now())/$vehicle->membership->created_at->diffInDays($vehicle->membership->ended_at)*100))
                                    <div class="progress progress-xs mt-2 mb-2 w-100">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: {{$ratio}}%;" aria-valuenow="{{$ratio}}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <span class="ml-3 font-weight-bolder">{{ $ratio }}%</span>
                                </div>--}}{{--
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <h6>Quyền lợi:</h6>
                                <ul class="fa-ul line-height-xl">
                                    <li>
                                        <span class="fa-li"><i class="fa fa-check text-success fa-sm"></i></span>
                                        Sử dụng các voucher giảm giá.
                                        <strong>Hạn mức còn lại trong kỳ: </strong>{{number_format($vehicle->membership->remaining_quota,0,',','.')}}đ.
                                        <a href="#" data-target="#quota-modal" data-toggle="modal">Tìm hiểu thêm</a>
                                    </li>
                                    <li>
                                        <span class="fa-li"><i class="fa fa-check text-success fa-sm"></i></span> Tích điểm khi thực hiện dịch vụ tại đại lý có áp dụng chương trình Hội viên Suzuki
                                    </li>
                                    <li>
                                        <span class="fa-li"><i class="fa fa-check text-success fa-sm"></i></span> Đổi điểm và nhận các voucher giảm giá, quà tặng hấp dẫn
                                    </li>
                                    <li>
                                        <span class="fa-li"><i class="fa fa-check text-success fa-sm"></i></span> Sử dụng các voucher độc quyền dành cho Hội viên Suzuki
                                    </li>
                                </ul>
                            </div>
                        </div>
                    @else
                        <x:alert type="info" message="Membership sẽ được kích hoạt khi xe thực hiện dịch vụ lần đầu tại Đại lý có áp dụng chương trình Hội viên Suzuki. Giao dịch đó sẽ vẫn được tích điểm."/>
                    @endif--}}
                    @if(!$loop->last)
                        <hr class="mb-5"/>
                    @endif
                @endforeach
        </div>
        @else
            <x:alert type="info" message="Bạn chưa có xe Suzuki nào trong hệ thống. Hãy bắt đầu thêm xe của bạn vào để hưởng những ưu đãi dành cho Hội viên Suzuki."></x:alert>
        @endif
    </div>
    <div class="modal fade" id="quota-modal" tabindex="-1" role="dialog" aria-labelledby="quota-modal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-justify">
                    <p>Tổng số tiền được giảm giá mỗi năm (tính từ ngày thực hiện giao dịch có tích điểm đầu tiên) không vượt quá
                        <strong>{{ number_format(config('constants.membership.annual_quota'),0,',','.') }}đ</strong>. Khi đã vượt, các hóa đơn tiếp theo sẽ không được áp dụng voucher giảm giá.
                    </p>
                    @if($customer->membership)
                        <p>Chu kỳ hiện tại tính từ <strong>{{ $customer->membership->created_at->format('d/m/Y') }}</strong> tới <strong>{{ $customer->membership->created_at->addDays(365)->format('d/m/Y') }}</strong>.</p>
                    @else
                    @endif
                    <p>Bạn có thể xem số tiền được giảm cho từng hóa đơn dịch vụ tại trang
                        <a href="{{ route('dashboard-services') }}">Lịch sử thực hiện dịch vụ.</a></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary text-center" data-dismiss="modal">Tôi đã hiểu</button>
                </div>
            </div>
        </div>
    </div>
@endsection