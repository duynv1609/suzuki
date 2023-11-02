/*
 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
 * @package Suzuki Membership Platform
 * @copyright 2020. Vietnam Suzuki Corporation (VISUCO)
 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
 * @link https://suzuki.com.vn
 */


let SMPAdmin = {
    url: '/smp-admin'
}

SMPAdmin.Order = {
    discountType: 0,
    discountNumber: 0,
    remainingQuota: 0
}

SMPAdmin.Order.init = function () {
    SMPAdmin.Order.initCreate();
}


SMPAdmin.Order.initCreate = function () {

    [originalValue, valueAfterDiscount, discountAmount, taxValue, totalValue] = AutoNumeric.multiple(['#original-value', '#new-value', '#discount-amount', '#tax-value', '#total-value'], {
        digitGroupSeparator: '.',
        decimalCharacter: ',',
        decimalPlaces: 0,
        minimumValue: 0
    });


    let voucherSelector = $('#order-voucher-selector');
    let customerSelector = $('#order-customer-selector');
    let vehicleSelector = $('#order-vehicle-id');

    // If we reload the Page with voucher code pre-selected

    if (voucherSelector.find(':selected')) {
        SMPAdmin.Order.discountType = voucherSelector.find(':selected').data['data-discount-type'];
        SMPAdmin.Order.discountNumber = voucherSelector.find(':selected').data['data-discount-amount'];
        SMPAdmin.Order.calculate()
    }

    voucherSelector.on('select2:select', function (e) {
        let data = e.params.data;
        SMPAdmin.Order.discountType = parseInt(data['data-discount-type']);
        SMPAdmin.Order.discountNumber = parseInt(data['data-discount-amount']);
        SMPAdmin.Order.calculate();
    });

    voucherSelector.on('select2:clear', function (e) {
        SMPAdmin.Order.discountType = 0
        SMPAdmin.Order.discountNumber = 0;
        SMPAdmin.Order.calculate();
    });

    $('#original-value').on('keyup change', function () {
        SMPAdmin.Order.calculate();
    })

    customerSelector.on('select2:select', function (e) {
        voucherSelector.removeAttr('disabled');

        vehicleSelector.select2('close').select2('open');
        SMPAdmin.Order.discountType = 0
        SMPAdmin.Order.discountNumber = 0;
        SMPAdmin.Order.calculate();
    })

    vehicleSelector.on('select2:open', function (e) {

    });

    vehicleSelector.on('select2:select', function (e) {
        data = e.params.data;
        $.ajax({
            url: '/api/vehicles/' + data.id,
            dataType: 'json',
            success: function (data) {
                $('#quota-left').html(new Intl.NumberFormat('vi-VN').format(data.data['remaining_quota']) + "đ");
                SMPAdmin.Order.remainingQuota = parseInt(data['remaining_quota']);
            }
        })
    });
}

SMPAdmin.Order.calculate = function () {

    let discountType = $('#discount-type');
    let tempDiscountAmount = 0;

    if (SMPAdmin.Order.discountType === 1) {
        discountType.val('Giảm ' + SMPAdmin.Order.discountNumber + '% trên tổng hóa đơn');
        tempDiscountAmount = originalValue.getNumber() * SMPAdmin.Order.discountNumber / 100;
        if (tempDiscountAmount <= SMPAdmin.Order.remainingQuota) {
            discountAmount.set(tempDiscountAmount);
        } else {
            discountAmount.set(SMPAdmin.Order.remainingQuota);
        }
    } else if (SMPAdmin.Order.discountType === 2) {
        discountType.val('Giảm ' + SMPAdmin.Order.discountNumber + ' VND vào tổng');
        if (SMPAdmin.Order.discountNumber <= SMPAdmin.Order.remainingQuota) {
            discountAmount.set(SMPAdmin.Order.discountNumber);
        } else {
            discountAmount.set(SMPAdmin.Order.remainingQuota);
        }
    } else {
        discountType.val('Không có');
        discountAmount.set(0);
    }

    valueAfterDiscount.set(originalValue.getNumber() - discountAmount.getNumber());

    $('#converted-point').val(Math.floor(valueAfterDiscount.getNumber() / 100000));

    taxValue.set(valueAfterDiscount.getNumber() / 10);

    totalValue.set(valueAfterDiscount.getNumber() + taxValue.getNumber());
}

SMPAdmin.Order.initImport = function () {

    let btnPreview = $('#btn-preview');
    let btnImport = $('#btn-import');

    btnPreview.add(btnImport).on('click', function (e) {
        e.preventDefault();
        let thisBtn = $(this);
        let form = $('#import-form')[0];
        let previewArea = $('#preview-area');
        if (form.reportValidity()) {

            if (thisBtn.is(btnPreview)) {
                thisBtn.attr('disabled', 'disabled').html('<i class="fa fa-spinner fa-spin"></i> Xem trước');
            } else {
                thisBtn.attr('disabled', 'disabled').html('<i class="fa fa-spinner fa-spin"></i> Nhập dữ liệu');
            }

            let formData = new FormData();
            formData.append('excel-file', $('#file-input')[0].files[0]);
            formData.append('_token', $('input[name="_token"]').val());
            previewArea.html('');
            let action = thisBtn.is(btnPreview) ? 'preview' : 'import';

            $.ajax({
                type: 'POST',
                url: SMPAdmin.url + '/orders/import?action=' + action,
                data: formData,
                processData: false,
                contentType: false,
                complete: function (data, status, xhr) {
                    thisBtn.removeAttr('disabled').find('i').remove();
                },
                success: function (data, status, xhr) {
                    if (thisBtn.is(btnPreview)) {
                        thisBtn.removeClass('btn-primary').addClass('btn-secondary');
                        btnImport.removeAttr('disabled').removeClass('btn-secondary').addClass('btn-primary')
                    }
                    btnImport.show();
                    previewArea.html(data);
                },
                error: function (data, status, xhr) {
                    previewArea.html('<span class="text-danger"><i class="fas fa-times"></i> Có lỗi. Vui lòng kiểm tra xem dữ liệu nhập vào có đúng định dạng không.</span>')
                }
            })
        }
    });
}

$(document).ready(function () {

    if (window.location.pathname.startsWith(SMPAdmin.url + '/orders/import')) {
        SMPAdmin.Order.initImport();
    }

    if (window.location.pathname.startsWith(SMPAdmin.url + '/orders')) {
        SMPAdmin.Order.init();
    }

    $('#print-button').on('click', function () {
        // printJS('show-data-table', 'html');
        $('#main-data-table').printThis({
            header: "<h2 class='text-center text-uppercase font-weight-boldest mb-4'>Giao dịch có Membership</h2>"
        });
    })

});