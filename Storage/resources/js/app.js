// require('./bootstrap');

// custom select2
// $('#kt_datatable_search_status').select2();
// $('#kt_datatable_search_type').select2();

SMPDashboard = {};

SMPDashboard.init = function () {
    // $('.btn-quick-view-code').on('click', function () {
    //     $('#modal-voucher-code').val($(this).attr('data-code'))
    //     $('#modal-voucher-name').html('<strong>' + $(this).attr('data-name') + '</strong>')
    // })
    SMPUtil.initProvinceSelector('#provinceSelector', '#districtSelector');
    SMPDashboard.initAside();

}

SMPDashboard.initAside = function () {
    offcanvas = new KTOffcanvas('kt_profile_aside', {
        overlay: true,
        baseClass: 'offcanvas-mobile',
        //closeBy: 'kt_user_profile_aside_close',
        toggleBy: 'kt_subheader_mobile_toggle'
    });
}

SMPDashboard.initAddNewVehicle = function () {

    let typeSelector = $('#type-selector');
    let modelSelector = $('#model-selector');
    let versionSelector = $('#version-selector');
    let yearSelector = $('#year-selector');
    let colorSelector = $('#color-selector');

    typeSelector.select2({
        minimumResultsForSearch: Infinity,
        placeholder: '- Chọn loại xe -'
    });

    modelSelector.select2({
        minimumResultsForSearch: Infinity,
        placeholder: '- Chọn dòng xe -'
    });

    versionSelector.select2({
        minimumResultsForSearch: Infinity,
        placeholder: '- Chọn phiên bản -'
    });

    yearSelector.select2({
        placeholder: '- Chọn năm sản xuất -'
    });

    colorSelector.select2({
        minimumResultsForSearch: Infinity,
        placeholder: '- Chọn màu sắc xe -'
    });

    $('#dealer-selector').select2({
        placeholder: '- Chọn nơi mua xe -'
    });

    let initColorSelector = function (data) {

        // data.push({
        //     'id': 0,
        //     'text': 'Khác'
        // });
        colorSelector.empty().select2({
            data: data,
            minimumResultsForSearch: Infinity,
        });
    };
    let initModelSelector = function (data) {
        versionSelector.empty().select2({
            data: data,
            minimumResultsForSearch: Infinity,
        });
    };
    typeSelector.on('select2:select', function (e) {
        let value = e.params.data.id;
        console.log(value);
        // modelSelector.empty().select2({
        //     data: vehicleTypes[value],
        //     minimumResultsForSearch: Infinity,
        // });

        console.log();
        initModelSelector(vehicleModels[modelSelector.select2('data')[0].id]);
        initColorSelector(vehicleColors[versionSelector.select2('data')[0].id]);

    });

    modelSelector.on('select2:select', function (e) {
        let slug = e.params.data.id;
        versionSelector.empty().select2({
            data: vehicleModels[slug],
            minimumResultsForSearch: Infinity,
        });
        initColorSelector(vehicleColors[versionSelector.select2('data')[0].id]);
    });

    versionSelector.on('change.select2', function (e) {
        let id = e.params.data.id;
        // initColorSelector(vehicleColors[id]);
    });


    $('#plate-number').inputmask('(99a-9999)|(99a-99999)|(99aa-9999)|(99aa-99999)|(99-aa-99999)');
    $('#frame_number').inputmask('*{1,20}');
};

SMPUtil = {};

SMPUtil.initProvinceSelector = function (provinceEl = '#province', districtEl = '#district') {
    let districtSelector = $(districtEl);
    let districtSelect2 = districtSelector.select2({
        minimumResultsForSearch: Infinity,
        placeholder: '- Chọn địa phương -'
    });
    $(provinceEl).select2({
        placeholder: '- Chọn địa phương -'
    }).on('select2:select', function (e) {
        let selectedID = e.params.data.id;
        $.ajax({
            url: '/api/districts',
            data: {province: selectedID},
            dataType: 'json',
            success: function (data, status, xhr) {
                districtSelector.html('');
                districtSelector.select2({
                    data: data.data,
                    placeholder: '- Chọn địa phương -'
                });
            }
        });
    });
};

SMPUtil.preventDuplicateSubmission = function () {
    $('form').on('submit', function (e) {
        $(this).find('button[type="submit"]').attr("disabled", "disabled");
    });
};

$(document).ready(function () {
    SMPDashboard.init();
    SMPUtil.preventDuplicateSubmission();
});
