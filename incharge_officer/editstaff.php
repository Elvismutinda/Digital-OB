<?php

include('../config/connection.php');
include('inchargemenu.php');

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
                  <label for="station">Station:</label>
                  <select name="station">
                     <option select hidden value="<?php echo $rows['station']; ?>"><?php echo $rows['station']; ?></option>
                     <?php
                     $station_query = "SELECT * FROM stations";
                     $station_result = mysqli_query($conn, $station_query);

                     while($station_rows = mysqli_fetch_assoc($station_result)){
                        ?>
                        <option value="<?php echo $station_rows['station'] ?>"> <?php echo $station_rows['station'] ?></option>
                        <?php
                     }
                     ?>
                  </select>
               </div>
               <div class="form-box">
                  <label for="status">Status</label>
                  <select name="status">
                  <option select hidden value="<?php echo $rows['status']; ?>"><?php echo $rows['status']; ?></option>
                     <?php
                     $query = "SELECT * FROM user_type";
                     $result = mysqli_query($conn, $query);

                     while($rows = mysqli_fetch_assoc($result)){
                        ?>
                        <option value="<?php echo $rows['status'] ?>"> <?php echo $rows['status'] ?></option>
                        <?php
                     }
                     ?>
                  </select>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="edit_staff">Update Details</button>
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