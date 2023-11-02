<?php $__env->startSection('pageStyles'); ?>
<?php echo HTML::style('assets/css/lib/datatable/dataTables.bootstrap.min.css'); ?>

<?php echo HTML::style('assets/css/bootstrap-datepicker3.css'); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('mainContent'); ?>
<div class="content mt-3">
    <div class="animated fadeIn">
        <div class="row">

          <div class="col-md-12">
            <div class="card" style="padding: 30px; text-align: center;">
                  <h1 style="font-weight: bold;">Suzuki Management Data</h1>
                  <p style="font-style: italic; font-size: 18px; color: #B22222; font-weight: bold;">Select the item of the operation at the left toolbar to access data.</p>
            </div>
          </div>
        </div>
    </div><!-- .animated -->
</div><!-- .content -->
<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.master-admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH E:\Suzuki\xampp\htdocs\data-management\resources\views/admin/index.blade.php ENDPATH**/ ?>