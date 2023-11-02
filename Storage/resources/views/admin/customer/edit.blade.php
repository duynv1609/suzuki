@extends(backpack_view('blank'))@php
    $defaultBreadcrumbs = [
      trans('backpack::crud.admin') => backpack_url('dashboard'),
      $crud->entity_name_plural => url($crud->route),
      trans('backpack::crud.edit') => false,
    ];

    // if breadcrumbs aren't defined in the CrudController, use the default breadcrumbs
    $breadcrumbs = $breadcrumbs ?? $defaultBreadcrumbs;
@endphp

@section('header')
    <div class="d-none d-print-block m-5"></div>
    <section class="container-fluid ">
        <div class="d-flex justify-content-between col-lg-8">
            <h2 class="d-none d-print-block">Thông tin Hội viên</h2>
            <h2 class="font-weight-bold">
                <span class="text-capitalize">{!! $crud->getHeading() ?? $crud->entity_name_plural !!}</span>
                <small class="">{!! $crud->getSubheading() ?? trans('backpack::crud.edit').' '.$crud->entity_name !!}.</small>

                @if ($crud->hasAccess('list'))
                    <small><a href="{{ url($crud->route) }}" class="d-print-none font-sm"><i class="fa fa-angle-double-{{ config('backpack.base.html_direction') == 'rtl' ? 'right' : 'left' }}"></i> {{ trans('backpack::crud.back_to_all') }}
                    <small><a href="{{ url($crud->route) }}" class="d-print-none font-sm"><i class="fa fa-angle-double-{{ config('backpack.base.html_direction') == 'rtl' ? 'right' : 'left' }}"></i> {{ trans('backpack::crud.back_to_all') }}
                            <span>{{ $crud->entity_name_plural }}</span></a></small>
                @endif
            </h2>
            @include('vendor.backpack.crud.buttons.print')
        </div>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-8">
            <!-- Default box -->

            @include('crud::inc.grouped_errors')
            @include('admin.customer.password')

            <form method="post" action="{{ url($crud->route.'/'.$entry->getKey()) }}" @if ($crud->hasUploadFields('update', $entry->getKey()))enctype="multipart/form-data"@endif>
                {!! csrf_field() !!}
                {!! method_field('PUT') !!}

                @if ($crud->model->translationEnabled())
                    <div class="mb-2 text-right">
                        <!-- Single button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                {{trans('backpack::crud.language')}}: {{ $crud->model->getAvailableLocales()[request()->input('locale')?request()->input('locale'):App::getLocale()] }} &nbsp;
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                @foreach ($crud->model->getAvailableLocales() as $key => $locale)
                                    <a class="dropdown-item" href="{{ url($crud->route.'/'.$entry->getKey().'/edit') }}?locale={{ $key }}">{{ $locale }}</a>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                @endif
            <!-- load the view from the application if it exists, otherwise load the one in the package -->
                @if(view()->exists('vendor.backpack.crud.form_content'))
                    @include('vendor.backpack.crud.form_content', ['fields' => $crud->fields(), 'action' => 'edit'])
                @else
                    @include('crud::form_content', ['fields' => $crud->fields(), 'action' => 'edit'])
                @endif
                @include('crud::inc.form_save_buttons')
            </form>
        </div>

        <div class="col-md-4 d-print-none">

            <div class="card">
                <div class="card-body p-0 d-flex align-items-center">
                    @if($customer->membershipStatus() == config('constants.membership.active'))
                        <i class="la la-certificate bg-success p-4 font-2xl mr-3"></i>
                    @else
                        <i class="la la-certificate bg-secondary p-4 font-2xl mr-3"></i>
                    @endif
                    <div>
                        @if($customer->membershipStatus() == config('constants.membership.active'))
                            <div class="text-value text-success">Hội viên Suzuki</div>
                            <div class="text-muted text-uppercase font-weight-bold">{{ $customer->membership->created_at->format('d/m/Y') }}</div>
                        @elseif ($customer->membershipStatus() == config('constants.membership.expired'))
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-muted mr-5">Điểm hết hạn ngày {{ $customer->point_expires_at->format('d/m/Y') }}.</div>
{{--                                <a href="{{ backpack_url(config('constants.adminRoutes.membership')) . '/create?customer_id=' . $customer->id }}" class="btn btn-secondary"><i class="la la-plus"></i> Gia hạn</a>--}}
                            </div>
                        @else
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-muted mr-5">Hội viên chưa có Membership.</div>
{{--                                <a href="{{ backpack_url(config('constants.adminRoutes.membership')) . '/create?customer_id='. $customer->id }}" class="btn btn-secondary"><i class="la la-plus"></i> Tạo mới</a>--}}
                            </div>
                        @endif

                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body p-0 d-flex align-items-center">
                    <i class="la la-file-invoice-dollar bg-info p-4 font-2xl mr-3"></i>
                    <div>
                        <div class="text-value text-info">{{ Str::point($customer->point_balance) }}</div>
                        <div class="text-muted text-uppercase font-weight-bold">điểm</div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">Thông tin bổ sung</div>
                <div class="card-body">
                    @if($customer->created_at)
                        <p class="d-flex justify-content-between">
                            <span class="font-weight-bold">Thời gian tạo tài khoản:</span>
                            <span class="text-muted">{{ $customer->created_at }}</span>
                        </p>
                    @endif
                    @if($customer->updated_at)
                        <p class="d-flex justify-content-between">
                            <span class="font-weight-bold">Cập nhật cuối:</span>
                            <span class="text-muted">{{ $customer->updated_at }}</span>
                        </p>
                    @endif
                </div>
            </div>

            <div class="card">
                <div class="card-header">5 Giao dịch điểm mới nhất</div>
                <div class="card-body">
                    @if($pointHistory ?? '')
                        <table class="table table-vertical-center">
                            <thead>
                            <tr>
                                <th class="">Thời gian</th>
                                <th class="">Hành động</th>
                                <th class="text-right">Số điểm</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($pointHistory as $transaction)
                                <tr class="border-0">
                                    <td class="text-muted">{{ $transaction->created_at->format('H:i, d/m') }}</td>
                                    <td>@lang('dashboard.short_transaction_type_'. $transaction->type)</td>
                                    <td class="text-right">
                                        <span class="text-nowrap">@if($transaction->amount > 0)+@endif{{ Str::point($transaction->amount) }}</span>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    @else
                        <div class="alert alert-custom alert-outline-success container-fluid align-self-stretch text-center" role="alert">
                            <div class="alert-icon"><i class="la la-info-circle"></i></div>
                            <div class="alert-text">{{ __('dashboard.no_transaction') }}</div>
                        </div>
                    @endif
                </div>
            </div>
        </div>

    </div>
@endsection

@push('after_scripts')
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.help-block, .btn').addClass('d-print-none');
        });
    </script>
@endpush


