<?php
    if(isset($_SESSION['message'])) :
?>

<script src="https://kit.fontawesome.com/57a72e588d.js" crossorigin="anonymous"></script>
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong> <?= $_SESSION['message']; ?> </strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="height: 20px; width: 20px;"><i class="fas fa-x" style="color: #e40707;"></i></button>
    </div>

<?php 
    unset($_SESSION['message']);
    endif;
?>