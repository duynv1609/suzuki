@extends(backpack_view('layouts.top_left'))

@php
    $defaultBreadcrumbs = [
      trans('backpack::crud.admin') => backpack_url('dashboard'),
      $crud->entity_name_plural => url($crud->route), 'import' => false,
    ];

    // if breadcrumbs aren't defined in the CrudController, use the default breadcrumbs
    $breadcrumbs = $breadcrumbs ?? $defaultBreadcrumbs;
@endphp

@section('header')
    <section class="container-fluid">
        <h2>
            <span class="text-capitalize">{!! $crud->getHeading() ?? $crud->entity_name_plural !!}</span>
            <small>{!! $crud->getSubheading() ?? 'Moderate '.$crud->entity_name !!}.</small>

            @if ($crud->hasAccess('list'))
                <small><a href="{{ url($crud->route) }}" class="hidden-print font-sm"><i class="fa fa-angle-double-left"></i> {{ trans('backpack::crud.back_to_all') }}
                        <span>{{ $crud->entity_name_plural }}</span></a></small>
            @endif
        </h2>
    </section>
@endsection

@section('content')

    <div class="row">
        <div class="{{ $crud->getCreateContentClass() }}">
            <!-- Default box -->

            @include('crud::inc.grouped_errors')

            <form id="voucher-code-form" method="post" action="{{ url($crud->route) }}" @if ($crud->hasUploadFields('create'))enctype="multipart/form-data"
                    @endif
            >
            {!! csrf_field() !!}
            <!-- load the view from the application if it exists, otherwise load the one in the package -->
                @if(view()->exists('vendor.backpack.crud.form_content'))
                    @include('vendor.backpack.crud.form_content', [ 'fields' => $crud->fields(), 'action' => 'create' ])
                @else
                    @include('crud::form_content', [ 'fields' => $crud->fields(), 'action' => 'create' ])
                @endif

                @include('crud::inc.form_save_buttons')
                <button class="btn btn-primary" id="btnImport">Import</button>
            </form>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-8">
            <div id="message-container"></div>
        </div>
    </div>

@endsection

@push('after_scripts')
    <script type="text/javascript">
        $(document).ready(function () {

            let form = $('#voucher-code-form');
            let textArea = form.find('textarea');

            textArea.focusout(function () {
                let text = $(this).val();
                text = text.replace(/\n{1,}/g, "\r\n");
                $(this).val(text.trim());
            });

            form.submit(function (e) {
                e.preventDefault();

                let btnImport = $('#btnImport');
                let voucherId = form.find('[name="id"]').val();

                if (!textArea.val()) return;

                btnImport.html('<i class="la la-spinner"></i> Importing...').attr('disabled', 'disabled');

                let lines = $.uniqueSort(textArea.val().split('\n')); //Read line by line and remove duplicated elements.

                if (!$.isEmptyObject(lines)) {
                    $('#error').text('');
                    $(lines).each(function (index, value) {
                        let lastLine = 0;
                        if (index === (lines.length - 1)) {
                            lastLine = 1;
                        }
                        setTimeout(function () {
                            $.ajax({
                                url: lastLine ? full_url + '?recount=1' : full_url,
                                type: 'PUT',
                                data: {
                                    voucher_id: voucherId,
                                    voucher_code: value,
                                },
                                dataType: 'json',
                                success: function (data, xhr) {
                                    $('#message-container').append('<div class="alert alert-success">Successful: ' + value + '</div>');
                                },
                                error: function (xhr, textStatus, error) {
                                    $('#message-container').append('<div class="alert alert-danger">Failed: ' + value + '<br/>' + JSON.parse(xhr.responseText).message + '</div>');
                                },
                                complete: function (error) {
                                    if (lastLine) {
                                        btnImport.removeAttr('disabled').html('Import');
                                    }
                                }
                            })
                        }, 1000 * index);
                    })
                } else {
                    $('#error').text('Incorrect data format.');
                }
            })
        })
    </script>
@endpush