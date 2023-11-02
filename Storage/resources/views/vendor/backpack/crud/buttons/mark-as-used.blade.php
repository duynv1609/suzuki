@if($entry->status == config('constants.voucher_code.status_new'))
    <a href="{{ url($crud->route.'/'.$entry->getKey().'/mark-as-used') }}" class="btn btn-success" title="Đánh dấu đã sử dụng">
        <i class="la la-check"></i>
    </a>
@endif