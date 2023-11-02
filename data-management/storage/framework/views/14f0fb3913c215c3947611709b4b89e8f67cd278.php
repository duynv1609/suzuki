<!doctype html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Suzuki Data Management System</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">
    <style>
        .navbar .navbar-nav li.menu-item-has-children .sub-menu a .menu-icon {
            top: 0 !important;
            margin-top: 10px !important;
        }
    </style>


    
    <?php echo HTML::style('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css'); ?>

    <?php echo HTML::style('assets/css/font-awesome.min.css'); ?>

    <?php echo HTML::style('assets/css/themify-icons.css'); ?>

    <?php echo HTML::style('assets/css/cs-skin-elastic.css'); ?>

    <?php echo HTML::style('assets/css/style.css'); ?>

    <?php echo HTML::style('assets/css/main.css'); ?>

    <?php echo $__env->yieldContent('pageStyles'); ?>
</head>
<body>


<!-- Left Panel -->

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <h3 class="navbar-brand" style="color: white; font-weight: bold; font-size: 25px;">
                SUZUKI DATA </h3>
            <h3 class="navbar-brand hidden" style="color: white; font-weight: bold;">SD</h3>
        </div>
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                
                <li>
                    <a href="<?php echo route('getProfile'); ?>">
                        <i class="menu-icon fa fa-fw fa-address-card"></i>Tài khoản</a>
                </li>
                

                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="menu-icon fa fa-fw fa-table"></i>Dữ liệu
                    </a>
                    <ul class="sub-menu children dropdown-menu">
                        <li>
                            <a href="<?php echo e(route('informationList')); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Tất cả dòng xe
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'ciaz'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Ciaz
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'xl7'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>XL7</a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'ertiga'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Ertiga
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'swift'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Swift
                            </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'carry_pro'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Carry Pro </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'carry_truck'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Carry Truck </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'carry_van'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Carry Van</a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('informationList', ['model' => 'celerio'])); ?>">
                                <i class="menu-icon fa fa-list-ul"></i>Celerio
                            </a>
                        </li>
                    </ul>
                </li>
                <?php if(Auth::user()->permission_id == config('app.permission.suzuki')): ?>
                    <li>
                        <a href="<?php echo route('areaList'); ?>"> <i class="menu-icon fa fa-fw fa-map-marker"></i>Manage Area
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo route('accountList'); ?>">
                            <i class="menu-icon fa fa-fw fa-users"></i>Manage Account
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo route('branchList'); ?>"> <i class="menu-icon fa fa-fw fa-car"></i>Manage Branch
                        </a>
                    </li>
                <?php endif; ?>
                <?php if(Auth::user()->permission_id !== config('app.permission.dealer') ): ?>
                    <li class="menu-item-has-children dropdown">
                        <a href="<?php echo e(route('statisticalList')); ?>" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="menu-icon fa fa-fw fa-database"></i>Thống kê
                        </a>
                        <ul class="sub-menu children dropdown-menu">
                            <li>
                                <a href="<?php echo e(route('statisticalList')); ?>">
                                    <i class="menu-icon fa fa-list-ul"></i>Theo Đại lý
                                </a>
                            </li>
                        </ul>
                    </li>
                    
                <?php endif; ?>
                <li>
                    <a href="<?php echo e(route('logout')); ?>"> <i class="menu-icon fa fa-fw fa-sign-out"></i>Đăng xuất</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside><!-- /#left-panel -->

<!-- Left Panel -->

<!-- Right Panel -->

<div id="right-panel" class="right-panel">

    <!-- Header-->
    <header id="header" class="header">

        <div class="header-menu">

            <div class="col-sm-7">
                <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
            </div>

            <div class="col-sm-5">
                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php echo e(Auth::user()->name); ?>

                    </a>

                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="<?php echo e(route('logout')); ?>"><i class="fa fa-power-off"></i>Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </header><!-- /header -->
    <!-- Header-->

    <!--content -->
<?php echo $__env->yieldContent('mainContent'); ?>
<!-- .content -->


</div><!-- /#right-panel -->

<!-- Right Panel -->

<?php echo e(HTML::script('https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js')); ?>

<?php echo e(HTML::script('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js')); ?>

<?php echo e(HTML::script('https://cdn.jsdelivr.net/gh/rguliev/conditionize2.js/jquery.conditionize2.min.js')); ?>




<?php echo HTML::script('assets/js/main.js'); ?>

<?php echo $__env->yieldContent('pageScripts'); ?>


</body>
</html>
<?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/layouts/master-admin.blade.php ENDPATH**/ ?>