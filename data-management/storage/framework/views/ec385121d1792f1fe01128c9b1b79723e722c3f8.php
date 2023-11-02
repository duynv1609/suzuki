<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký lái thử Suzki XL7 Hoàn Toàn Mới</title>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/bootstrap.min.css')); ?>">
    <?php if(isset($models)): ?>
        <link rel="stylesheet" href="<?php echo e(asset('css/form/iframe.css')); ?>">
    <?php else: ?>
        <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/form/index.css')); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/main.css')); ?>">
    <?php endif; ?>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/bootstrap-datepicker3.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/icheck.css')); ?>">

    <script src="<?php echo e(asset('js/datetime.js')); ?>"></script>

    <script src="<?php echo e(asset('js/jquery-3.3.1.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/bootstrap.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/css/lib/jquery-confirm/jquery-confirm.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/bootstrap-datepicker.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/jquery.validate.min.js')); ?>"></script>
    <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>

</head>

<body>
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W34M784"
            height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PDR7WKD"
            height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<?php
$regions = file_get_contents( resource_path( 'lang/region.json' ) );
$arr_data = json_decode( $regions, true );
?>

<?php if(isset($models)): ?>
    <style>
        body, html, form.reg-form, .celerio-inpt {
            <?php if($model == 'xl7'): ?>
                background-color: #D70428;
            <?php elseif($model == 'celerio'): ?>
                background-color: #B30089;
            <?php elseif($model == 'ertiga'): ?>
                background-color: #C0C999;
            <?php elseif($model == 'swift'): ?>
                background-color: #FD96A9;
            <?php elseif($model == 'ciaz'): ?>
                background: transparent;
            <?php endif; ?>
        }
    </style>
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
<?php else: ?>
    <div class="top-bg">
        <img src="<?php echo e(asset('assets/img/BG-tren-'. $model . '.png')); ?>" style="width: 100%; height: auto;">
        <?php if($model !== 'ciaz' and $model !== 'ertiga'): ?>
            <div class="img-logo col-md-2 col-sm-2 col-3">
                <a href="https://suzuki.com.vn/">
                    <img src="<?php echo e($logo); ?>">
                </a>
            </div>
        <?php endif; ?>
    </div>

    <div class="bottom-bg-form" style="background-image: url(<?php echo e(asset('assets/img/BG-duoi-'. $model . '.png')); ?>);">
        <div class="container cust-container">
            <div class="col-md-12">
                <form method="POST" class="reg-form" id="reg-testdrive" action="">
                    <input type="text" name="user_referer" hidden="">
                    <h1 class="text-center" style="font-size: 2em"><strong>ĐĂNG KÝ LÁI THỬ XE SUZUKI <?php echo e(strtoupper($model)); ?>

                            HOÀN TOÀN
                            MỚI</strong></h1>
                    <h5 class="text-center">Quý khách vui lòng điền đầy đủ thông tin dưới đây</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="full_name" id="full_name" class="form-control celerio-inpt"
                                       placeholder="Họ và tên" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control celerio-inpt"
                                       placeholder="Email" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="tel" name="phone" id="phone" class="form-control celerio-inpt"
                                       placeholder="Điện thoại" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="date_test_drive" id="date_test_drive"
                                       class="form-control celerio-inpt picker-testdrive" placeholder="Ngày lái thử"
                                       readonly="" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <select name="region_id" id="region" class="form-control celerio-inpt" required>
                                    <option selected="" disabled="" value="">Tỉnh thành</option>
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
                                    <option selected="" disabled="" value="">- Vui lòng chọn tỉnh thành trước -</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 cust-col">
                            <div class="form-group">
                                <div class="g-recaptcha" data-sitekey="6LcBOXEUAAAAAOReW-aKSp64_tjJTw_Tx4hLktsH"></div>
                            </div>
                        </div>
                    </div>
                    <div class="checkbox icheck-info text-center">
                        <input type="checkbox" id="agree"/>
                        <label for="agree" style="color: #6e757c">Tôi đã hiểu rõ và đồng ý với các<a class="policy"
                                                                                                     href="https://suzuki.com.vn/chinh-sach-bao-mat"
                                                                                                     target="_blank"> Chính
                                sách bảo mật</a> của SUZUKI</label>
                    </div>
                    <span class="note text-center">*Chú ý: Quý khách vui lòng mang theo bằng lái xe ô tô khi đến tham gia lái thử.</span>
                    <input id="submitBtn" type="submit" disabled="disabled" name="submit-testdrive" class="submit-testdrive"
                           value="HOÀN TẤT ĐĂNG KÝ">
                </form>
            </div>
        </div>
    </div>
    <footer>
        <span>Copyright &copy; <?php echo date( "Y" ); ?> Vietnam Suzuki Corporation. All rights reserved.</span>
    </footer>
<?php endif; ?>


<script src="<?php echo e(asset('assets/css/lib/jquery-confirm/jquery-confirm.min.js')); ?>"></script>
<script src="<?php echo e(asset('js/main.js')); ?>"></script>
<?php if(isset($models)): ?>
    <script src="<?php echo e(asset('js/form/iframe/ajax.js')); ?>"></script>
    <script src="<?php echo e(asset('js/form/iframe/validate.js')); ?>"></script>
<?php else: ?>
    <script src="<?php echo e(asset('js/form/index/validate.js')); ?>"></script>
<?php endif; ?>
</body>
</html><?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/form/index.blade.php ENDPATH**/ ?>