@if($isPreview)
    <div class="alert alert-info">
        <i class="fa fa-info-circle"></i>
        File dữ liệu có
        <strong>{{ $rows->count() }}</strong> dòng. Các dòng có lỗi màu đỏ sẽ không được nhập vào hệ thống. Nếu vẫn muốn tiếp tục, nhấn
        <strong>"Nhập dữ liệu"</strong> để hoàn tất.
    </div>
@endif
@if($isImport)
    <div class="alert alert-success">
        <i class="fa fa-check"></i>
        Dữ liệu đã được nhập vào hệ thống. Trạng thái chi tiết được thể hiện bên dưới.
    </div>
@endif
<div class="table-responsive">
    <table class="table table-bordered font-size-xs">
        <thead class="thead-dark">
        <tr class="thead-dark">
            <th>STT</th>
            <th>Tên trong file</th>
            <th>VIN</th>
            <th>Ngày</th>
            <th class="text-right text-nowrap">Giá (VAT)</th>
            <th class="text-nowrap">Chứng từ</th>
            <th>Nội dung</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        @foreach($rows as $row)
            <tr class="@if(empty($row['messages'])) text-success @else text-danger @endif">
                <td>{{ $loop->iteration }}</td>
                <td>
                    {{ $row['name'] }}
                </td>
                <td>
                    {{ $row['vin'] }}
                </td>
                <td class="text-nowrap">
                    {{ $row['date'] }}
                </td>
                <td class="text-right">
                    {{ Helper::number_format($row['amount']) }}
                </td>
                <td>
                    {{ $row['code'] }}
                </td>
                <td>
                    {{ $row['detail'] }}
                </td>
                <td>
                    @if(!empty($row['messages']))
                        <ul class="list-unstyled">
                            @foreach ($row['messages'] as $messages)
                                @foreach ($messages as $message)
                                    <li class="list-unstyled"><i class="fa fa-times"></i> {{ $message }}</li>
                                @endforeach
                            @endforeach
                        </ul>
                    @else
                        <ul class="list-unstyled">
                            <li><i class="fa fa-check"></i>
                                {{ $row['success'] ?? 'Dữ liệu hợp lệ. Order này sẽ được nhập.' }}
                            </li>
                        </ul>
                    @endif
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>