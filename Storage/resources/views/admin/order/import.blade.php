@extends(backpack_view('blank'))

@php
    $defaultBreadcrumbs = [
      trans('backpack::crud.admin') => backpack_url('dashboard'),
      'Orders' => backpack_url('/orders'),
      'Import Orders' => false,
    ];

    // if breadcrumbs aren't defined in the CrudController, use the default breadcrumbs
    $breadcrumbs = $breadcrumbs ?? $defaultBreadcrumbs;
@endphp

{{--@section('header')
    <section class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h2>Nhập thông tin Order số lượng lớn</h2>
            </div>
        </div>
    </section>
@endsection--}}

@section('content')
    <div class="card">
        <div class="card-header">
            <h5><strong>Nhập thông tin Order số lượng lớn</strong></h5>
        </div>
        <form class="form-horizontal" id="import-form" action method="post" enctype="multipart/form-data">
            @csrf
            <div class="card-body font-size-xs">
                <div class="alert bg-light">
                    <h5 class="alert-heading"><i class="la la-info-circle"></i> Lưu ý trước khi thực hiện </h5>
                    <hr/>
                    <ul>
                        <li>Nhập dữ liệu theo template từ file Excel có sẵn.
                            <a href="#"><i class="la la-download"></i> Tải template <i class="la la-file-excel"></i></a>
                        </li>
                        <li>Trong quá trình đưa dữ liệu vào template, không thay đổi thứ tự các dòng và cột:
                            <ul>
                                <li>Dòng đầu tiên chứa tên các cột và sẽ không được xử lý.</li>
                                <li>Thứ tự cột: Số điện thoại, Biển số, VIN, Ngày của bill, Số tiền</li>
                            </ul>
                        </li>
                        <li>Bạn sẽ được xem trước dữ liệu cần đưa vào. Nếu dòng nào lỗi, sửa lại dòng đó cho phù hợp rồi thử lại.</li>
                        <li>Sau khi tất cả các dòng OK, bạn nhấn nút "Cập nhật" để nhập dữ liệu vào.</li>
                    </ul>
                </div>
                <hr/>
                <div class="form-group row">
                    <label class="col-md-3 col-form-label" for="file-input">Chọn file Excel chứa dữ liệu cần import:
                        <span class="text-danger">*</span></label>
                    <div class="col-md-9">
                        <input id="file-input" required="required" type="file" name="excel-file" accept=".xls,.xlsx">
                    </div>
                </div>

            </div>
            <div class="card-footer">
                <button type="submit" id="btn-preview" class="btn btn-primary">Xem trước</button>
                <button id="btn-import" class="btn btn-secondary" style="display: none" disabled="disabled">Nhập dữ liệu</button>
                <div id="preview-area" class="mt-3"></div>
            </div>
        </form>
    </div>
@endsection