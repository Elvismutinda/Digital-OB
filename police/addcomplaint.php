<?php

include('../config/connection.php');
include('policemenu.php');

$station = $rows['station'];
      
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
   <form action="../controller/action.php" method="post">
      <div class="details police">
         <div class="recentOrders new">
            <div class="cardHeader">
               <h2>Add Complaint</h2>
               <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
            <?php include('../controller/message.php'); ?>
            <div class="form-content">

               <div class="form-box">
                  <label for="comp_name">Name of Complainant</label>
                  <input type="text" name="comp_name" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="tel">Phone Number</label>
                  <input type="text" name="tel" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="occupation">Occupation</label>
                  <input type="text" name="occupation" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="age">Age</label>
                  <input type="number" name="age" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="address">Address</label>
                  <input type="text" name="address" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="region">Region</label>
                  <input type="text" name="region" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="gender">Gender</label>
                  <select name="gender" required>
                     <option selected hidden value="">Select Gender</option>
                     <option value="Male">Male</option>
                     <option value="Female">Female</option>
                  </select>
               </div>
               <div class="form-box">
                  <label for="crime_type">Crime Type</label>
                  <select name="crime_type" required>
                     <option selected hidden value="">Select Crime Type</option>

                     <?php
                     $query = "SELECT * FROM crimes";
                     $result = mysqli_query($conn, $query);

                     while($rows = mysqli_fetch_assoc($result)){
                        ?>
                        <option value="<?php echo $rows['crime_type'] ?>"> <?php echo $rows['crime_type'] ?> </option>
                        <?php
                     }

                     ?>
                  </select>
               </div>
               <div class="form-box">
                  <label for="location">Location of Crime</label>
                  <input type="text" name="location" autocomplete="off" required>
               </div>
               <div class="form-box">
                  <label for="ob_number">OB Number</label>
                  <?php
                  $start_query = "SELECT staff_id FROM users WHERE status='Incharge Officer' && station='$station'";
                  $start_result = mysqli_query($conn, $start_query);
                  $start_num = mysqli_fetch_assoc($start_result);
                  ?>
                  <input type="text" name="ob_number" value="<?php echo $start_num['staff_id'] ?>/" autocomplete="off" required>
               </div>
               <input type="hidden" name="station_reported" readonly="" value="<?php echo $station ?>" required>
            </div>
            <div class="form-btn">
               <button type="submit" name="add_complainant">Save and Continue</button>
            </div>
         </div>
      </div>
   </form>
</body>
</html>