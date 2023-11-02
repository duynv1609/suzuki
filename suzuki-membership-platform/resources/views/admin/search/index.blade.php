@extends(backpack_view('blank'))

@php
    $defaultBreadcrumbs = [
      trans('backpack::crud.admin') => backpack_url('dashboard'),
      'Tìm kiếm' => backpack_url('/search'),
      trans('backpack::crud.edit') => false,
    ];

    // if breadcrumbs aren't defined in the CrudController, use the default breadcrumbs
    $breadcrumbs = $breadcrumbs ?? $defaultBreadcrumbs;
@endphp

@section('header')
    <section class="container">
        <div class="row">
            <div class="col-12">
                <h2>
                    <span class="text-capitalize">Tìm kiếm</span>
                </h2>
            </div>
        </div>
    </section>`
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-12">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#customer-search" role="tab" aria-controls="customer-search">Tìm Hội viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " data-toggle="tab" href="#voucher-search" role="tab" aria-controls="voucher-search">Tìm mã voucher</a>
                    </li>

                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="customer-search">
                        <form method="post">
                            <div class="form-group">
                                <label for="search-term">Email, số điện thoại hoặc số CMND/CCCD của Hội viên:
                                    <span class="text-danger">*</span></label>
                                <input class="form-control" required name="search_term" id="search-term" placeholder="Email / SĐT / CMND / CCCD" value="{{ old('search_term') }}" type="text">
                                <input type="hidden" name="active_tab" value="customer-search"/>
                            </div>
                            {{ @csrf_field() }}
                            <button class="btn btn-primary mr-2" type="submit">
                                <i class="la la-search"></i> Tìm ngay
                            </button>
                            <small class="help-block text-muted"><i class="la la-info-circle"></i> Bạn sẽ được chuyển thẳng đến trang kết quả nếu tìm thấy.</small>
                        </form>
                    </div>
                    <div class="tab-pane" id="voucher-search">
                        <form method="post">
                            <div class="form-group">
                                <label for="voucher-code">Mã: <span class="text-danger">*</span></label>
                                <input class="form-control" required name="voucher_code" id="voucher-code" placeholder="Nhập chính xác mã voucher." value="{{ old('voucher_code') }}" type="text">
                                <input type="hidden" name="active_tab" value="voucher-serach"/>
                            </div>
                            {{ @csrf_field() }}
                            <button class="btn btn-primary mr-2" type="submit">
                                <i class="la la-search"></i> Tìm ngay
                            </button>
                            <small class="help-block text-muted"><i class="la la-info-circle"></i> Bạn sẽ được chuyển thẳng đến trang kết quả nếu tìm thấy.</small>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @if(Session::has('error'))
            <div class="row mt-3">
                <div class="col-12">
                    <div class="alert alert-info" role="alert">
                        <i class="la la-info-circle"></i> {!! Session::get('error') !!}
                    </div>
                </div>
            </div>
        @endif
        @if(Session::has('success'))
            <div class="row mt-3">
                <div class="col-12">
                    <div class="alert alert-success" role="alert">
                        <i class="la la-info-circle"></i> {!! Session::get('success') !!}
                    </div>
                </div>
                <div class="col-12">
                    <a href="#" class="btn btn-secondary"><i class="la la-eye"></i> Xem thông tin Voucher</a>
                </div>
            </div>
        @endif
        @if(Session::has('customers'))
            <div class="row mt-3">
                <div class="col-12">
                    @foreach(Session::get('customers') as $customer)
                        {{ $customer->name }}
                    @endforeach
                </div>
            </div>
        @endif
    </div>
@endsection

@push('after_scripts')
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            let hash = document.location.hash;
            if (hash) {
                $('.nav-tabs a[href="' + hash + '"]').tab('show');
            }
        })

    </script>
@endpush