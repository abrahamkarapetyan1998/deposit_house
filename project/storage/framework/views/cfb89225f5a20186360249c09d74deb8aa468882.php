<option value=""><?php echo e(__('Select Child Category')); ?></option>
<?php $__currentLoopData = $subcat->childs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $child): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
<option value="<?php echo e($child->id); ?>"><?php echo e($child->name()); ?></option>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><?php /**PATH C:\OpenServer\domains\upwork_first\project\resources\views/load/childcategory.blade.php ENDPATH**/ ?>