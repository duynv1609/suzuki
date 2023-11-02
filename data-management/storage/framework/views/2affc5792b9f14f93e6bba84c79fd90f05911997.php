<?php
//$regions = file_get_contents( 'region.json' );
//$arr_data = json_decode( $regions, true );
?>
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XL7 Test Drive</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/main.css')); ?>">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/icheck-bootstrap/3.0.1/icheck-bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-W34M784');</script>
    <script>(function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({
                'gtm.start':
                    new Date().getTime(), event: 'gtm.js'
            });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
            j.async = true;
            j.src =
                'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, 'script', 'dataLayer', 'GTM-PDR7WKD');</script>


    <link rel="stylesheet" href="<?php echo e(asset('css/form/iframe.css')); ?>">
</head>

<body>
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W34M784" height="0" width="0"
            style="display:none;visibility:hidden"></iframe>
</noscript>
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PDR7WKD" height="0" width="0"
            style="display:none;visibility:hidden"></iframe>
</noscript>
<?php
$regions = file_get_contents(resource_path( 'lang/region.json' ));
$arr_data = json_decode($regions, true);
?>
<div>
    <div class="container-fluid cust-container p-0">
        <div class="col-md-12 p-0">
            <form method="POST" class="reg-form p-0" id="reg-testdrive" action="">
                <?php echo e(csrf_field()); ?>

                <input type="text" name="user_referer" hidden="">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <input type="text" name="full_name" id="full_name" class="form-control celerio-inpt"
                                   placeholder="Họ và tên" required>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <input type="tel" name="phone" id="phone" class="form-control celerio-inpt"
                                   placeholder="Điện thoại" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <select name="region_id" id="region" class="form-control celerio-inpt getBranch" required>
                                <option selected="" disabled="" value="">Khu vực lái thử</option>
	                            <?php
	                            foreach ($arr_data as $area_data) {
	                            ?>
                                <option value="<?php echo $area_data['region_id']; ?>">
		                            <?php
		                            echo $area_data['region_name']; ?>
                                </option>
	                            <?php
	                            }
	                            ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <select name="branch_id" id="branch_id" class="form-control celerio-inpt" required>
                                <option selected="" disabled="" value="">Chọn khu vực lái thử trước</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 cust-col text-center mx-auto">
                        <div class="form-group text-center d-flex align-items-center">
                            <div class="text-center g-recaptcha mx-auto"
                                 data-sitekey="6LcBOXEUAAAAAOReW-aKSp64_tjJTw_Tx4hLktsH"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <div id="success-message"></div>
                        <div id="check-agree" class="checkbox icheck-danger text-center">
                            <input type="checkbox" id="agree"/>
                            <label for="agree" class="text-white">Tôi đã hiểu rõ và đồng ý với các
                                <a class="policy" href="https://suzuki.com.vn/index.php/chinh-sach-bao-mat"
                                   target="_blank"> Chính sách bảo mật</a> của Việt Nam Suzuki.</label>
                        </div>
                        <span class="font-italic text-white">* Chú ý: Quý khách vui lòng mang theo bằng lái xe ô tô khi đến tham gia lái thử.</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-3">
                        <button id="submitBtn" type="submit" disabled="disabled" name="submit-testdrive"
                                class="btn btn-light font-weight-bold">Hoàn tất đăng ký
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.4/jquery-confirm.min.js"></script>
<script src="<?php echo e(asset('js/main.js')); ?>"></script>
<script src="<?php echo e(asset('js/form/iframe/ajax.js')); ?>"></script>
<script src="<?php echo e(asset('js/form/iframe/validate.js')); ?>"></script>
</body>
</html><?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/form/iframe.blade.php ENDPATH**/ ?>