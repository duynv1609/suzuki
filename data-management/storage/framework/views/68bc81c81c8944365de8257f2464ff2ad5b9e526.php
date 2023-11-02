<!DOCTYPE html>
<html lang="en">

<head>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-W34M784');
    </script>
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-PDR7WKD');</script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo e(strtoupper($model)); ?> Test Drive</title>
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/bootstrap.min.css')); ?>">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/main.css')); ?>">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="<?php echo e(asset('js/bootstrap.min.js')); ?>"></script>
</head>

<body>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-W34M784" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PDR7WKD"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
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
<div class="bottom-bg-form">
    <div class="col-md-12">
        <div class="bg-white">
            <h4 class="color-blue">ĐĂNG KÝ LÁI THỬ SUZUKI <?php echo e(strtoupper($model)); ?> THÀNH CÔNG!!!</h4>
            <p>Xin chân thành cảm ơn quý khách. Việc đăng ký lái thử đã hoàn tất.<br>Nhân viên SUZUKI sẽ liên hệ với quý khách để xác nhận thông tin trong thời gian sớm nhất.</p>
            <a href="https://suzuki.com.vn/<?php echo e($model); ?>/" target="_blank" class="btn-blue">Xem thêm thông tin về SUZUKI <?php echo e(strtoupper($model)); ?></a>
        </div>
    </div>
</div>
<footer>
    <span>Copyright (C) 2021 Vietnam Suzuki Corporation. All right reserved.</span>
</footer>
</body>

</html><?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/form/thankyou.blade.php ENDPATH**/ ?>