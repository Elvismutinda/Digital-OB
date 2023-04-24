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
   if(isset($_GET['station'])){
      $station = mysqli_real_escape_string($conn, $_GET['station']);
      $query = "SELECT * FROM stations WHERE station = '$station'";
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
                  <label for="station">Station Name</label>
                  <input type="text" name="station" readonly value="<?php echo $rows['station']; ?>" style="background-color: lightgray;">
               </div>
               <div class="form-box">
                  <label for="address">Address</label>
                  <input type="text" name="address" value="<?php echo $rows['address']; ?>">
               </div>
               <div class="form-box">
                  <label for="location">Location</label>
                  <input type="text" name="location" value="<?php echo $rows['location']; ?>">
               </div>
               <div class="form-box">
                  <label for="phone">Phone</label>
                  <input type="text" name="phone" value="<?php echo $rows['phone']; ?>">
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="edit_station">Update Details</button>
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