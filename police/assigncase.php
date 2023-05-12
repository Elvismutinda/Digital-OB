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
   <?php
   if(isset($_GET['ob_number'])){
      $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
      $query = "SELECT * FROM cases WHERE ob_number = '$ob_number'";
      $result = mysqli_query($conn, $query);

      $rows = mysqli_fetch_array($result);
   
   ?>
   <form action="../controller/action.php" method="post">
      <div class="details staff">
         <div class="recentOrders edit">
            <div class="cardHeader">
               <h2>Assign Case</h2>
               <a href="casedetails.php?ob_number=<?php echo $rows['ob_number']; ?>&investigator=<?php echo $rows['investigator']; ?>" class="btn">Cancel</a>
            </div>
            <?php include('../controller/message.php'); ?>
            <div class="form-content">
               <div class="form-box">
                  <label for="ob_number">OB Number </label>
                  <input type="text" readonly="" name="ob_number" value="<?php echo $rows['ob_number']; ?>" style="background: lightgrey;">
               </div>
               <div class="form-box">
                  <label for="crime_type">Nature of Report</label>
                  <?php
                    $crime_query = "SELECT crime_type FROM cases WHERE ob_number='$ob_number'";
                    $crime_result = mysqli_query($conn, $crime_query);
                  
                    while($crime_rows = mysqli_fetch_assoc($crime_result)){
                        ?>
                        <input type="text" readonly="" name="crime_type" value="<?php echo $crime_rows['crime_type']; ?>" style="background: lightgrey;">
                        <?php
                    }
                  ?>
               </div>
               <div class="form-box">
                  <label for="investigator">Select Investigator</label>
                  <select name="investigator" required>
                     <option select hidden value="">Select</option>
                     <?php
                     $inv_query = "SELECT * FROM users WHERE status='Investigating Officer' && station='$station'";
                     $inv_result = mysqli_query($conn, $inv_query);

                     while($inv_rows = mysqli_fetch_assoc($inv_result)){
                        ?>
                        <option value="<?php echo $inv_rows['staff_id']." , ". $inv_rows['name']." - ". $inv_rows['rank']."" ?>"> <?php echo $inv_rows['staff_id']." , ". $inv_rows['name']." - ". $inv_rows['rank']."" ?></option>
                        <?php
                     }
                     ?>
                  </select>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="police_assign_case">Assign Officer</button>
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