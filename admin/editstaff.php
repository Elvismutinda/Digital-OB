<?php

include('../config/connection.php');
include('adminmenu.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Digital OB</title>
   <link rel="stylesheet" href="../css/style.css">
</head>
<body>
   <?php
   if(isset($_GET['staff_id'])){
      $staff_id = mysqli_real_escape_string($conn, $_GET['staff_id']);
      $query = "SELECT * FROM users WHERE staff_id = '$staff_id'";
      $result = mysqli_query($conn, $query);

      $rows = mysqli_fetch_array($result);
   
   ?>
   <?php include('../controller/message.php'); ?>
   <form action="../controller/action.php" method="post">
      <div class="details staff">
         <div class="recentOrders edit">
            <div class="cardHeader">
               <h2>Edit Staff</h2>
               <a href="viewstaff.php" class="btn">Go Back</a>
            </div>
            <?php include('../controller/message.php'); ?>
            <div class="form-content">
               <div class="form-box">
                  <label for="name">Name:</label>
                  <input type="text" name="name" value="<?php echo $rows['name']; ?>">
               </div>
               <div class="form-box">
                  <label for="staff_id">Staff ID: </label>
                  <input type="text" readonly="" name="staff_id" value="<?php echo $rows['staff_id']; ?>" style="background: lightgrey;">
               </div>
               <div class="form-box">
                    <label for="rank">Rank</label>
                    <select name="rank">
                        <option select hidden value="<?php echo $rows['rank']; ?>"><?php echo $rows['rank']; ?></option>
                        <option value="Constable">Constable</option>
                        <option value="Corporal">Corporal</option>
                        <option value="Sergeant">Sergeant</option>
                        <option value="Senior Sergeant">Senior Sergeant</option>
                        <option value="Assistant Inspector">Assistant Inspector</option>
                        <option value="Inspector">Inspector</option>
                        <option value="Senior Inspector">Senior Inspector</option>
                        <option value="Chief Inspector">Chief Inspector</option>
                        <option value="Assistant Superintendent">Assistant Superintendent</option>
                    </select>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="admin_edit_staff">Update Details</button>
            </div>
         </div>
      </div>
   </form>
   <?php
   }else{
      echo "<h4>No such ID found</h4>";
   }
   ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>