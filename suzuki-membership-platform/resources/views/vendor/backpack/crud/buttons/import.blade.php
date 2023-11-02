@if ($crud->hasAccess('import') && $entry->type == 2)
    <a href="{{ url($crud->route.'/'.$entry->getKey().'/import') }}" class="btn btn-secondary" target="_blank" data-toggle="tooltip" title="Import mã">
        <i class="la la-file-import"></i> {{-- trans('backpack::crud.preview') --}}
    </a>
@endif