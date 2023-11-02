<!DOCTYPE html>
<html lang="<?php echo e(app()->getLocale()); ?>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Suzuki Data Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">
    <?php echo HTML::style('assets/css/normalize.css'); ?>

    <?php echo HTML::style('assets/css/bootstrap.min.css'); ?>

    <?php echo HTML::style('assets/css/font-awesome.min.css'); ?>

    <?php echo HTML::style('assets/css/themify-icons.css'); ?>

    <?php echo HTML::style('assets/css/cs-skin-elastic.css'); ?>

    <?php echo HTML::style('assets/css/style.css'); ?>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <style>
        .form-group.has-error {
            color: red;
        }
    </style>
</head>
<body class="bg-dark">


    <div class="sufee-login d-flex align-content-center flex-wrap">
        <?php echo $__env->yieldContent('content'); ?>
    </div>

    <?php echo HTML::script('assets/js/vendor/jquery-2.1.4.min.js'); ?>

    <?php echo HTML::script('assets/js/popper.min.js'); ?>

    <?php echo HTML::script('assets/js/plugins.js'); ?>

    <?php echo HTML::script('assets/js/main.js'); ?>



</body>
</html>
<?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/layouts/app.blade.php ENDPATH**/ ?>