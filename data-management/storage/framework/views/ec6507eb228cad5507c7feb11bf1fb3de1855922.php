<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="login-content">
            <div class="login-logo">
                <h3 style="color: white; font-weight: bold; font-size: 25px; font-style: italic;">
                    SUZUKI DATA MANAGEMENT </h3>
            </div>
            <div class="login-form">
                <form method="POST" action="<?php echo e(route('login')); ?>">
                    <?php echo e(csrf_field()); ?>

                    <div class="form-group<?php echo e($errors->has('username') ? ' has-error' : ''); ?>">
                        <label for="username">User Name</label>
                        <input id="username" type="text" class="form-control" name="username" value="<?php echo e(old('username')); ?>" required autofocus>
                        <?php if($errors->has('username')): ?>
                            <span class="help-block">
                            <strong><?php echo e($errors->first('username')); ?></strong>
                        </span>
                        <?php endif; ?>
                    </div>

                    <div class="form-group<?php echo e($errors->has('password') ? ' has-error' : ''); ?>">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password">
                        <?php if($errors->has('password')): ?>
                            <span class="help-block">
                            <strong><?php echo e($errors->first('password')); ?></strong>
                        </span>
                        <?php endif; ?>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="remember" <?php echo e(old('remember') ? 'checked' : ''); ?>> Remember Me
                        </label>
                    </div>
                    <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30" style="font-weight: bold;">Authenticate</button>
                </form>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/auth/login.blade.php ENDPATH**/ ?>