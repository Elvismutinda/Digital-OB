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
   if(isset($_GET['ob_number'])){
      $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
      $query = "SELECT * FROM cases WHERE ob_number = '$ob_number'";
      $result = mysqli_query($conn, $query);

      $rows = mysqli_fetch_array($result);
   
   ?>
   <?php include('../controller/message.php'); ?>
   <form action="../controller/action.php" method="post">
      <div class="details staff">
         <div class="recentOrders edit">
            <div class="cardHeader">
               <h2>Edit Case</h2>
               <a href="viewcase.php" class="btn">Cancel</a>
            </div>
            <?php include('../controller/message.php'); ?>
            <div class="form-content">
               <div class="form-box">
                  <label for="ob_number">OB Number </label>
                  <input type="text" readonly="" name="ob_number" value="<?php echo $rows['ob_number']; ?>" style="background: lightgrey;">
               </div>
               <div class="form-box">
                  <label for="crime_type">Nature of Report</label>
                  <select name="crime_type" required>
                     <option select hidden value="<?php echo $rows['crime_type']; ?>"><?php echo $rows['crime_type']; ?></option>
                     <?php
                     $crime_query = "SELECT * FROM crimes";
                     $crime_result = mysqli_query($conn, $crime_query);

                     while($crime_rows = mysqli_fetch_assoc($crime_result)){
                        ?>
                        <option value="<?php echo $crime_rows['crime_type'] ?>"> <?php echo $crime_rows['crime_type'] ?></option>
                        <?php
                     }
                     ?>
                  </select>
               </div>
               <div class="form-box">
                  <label for="statement">Statement</label>
                  <input type="text" name="statement" value="<?php echo $rows['statement']; ?>">
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="incharge_edit_case">Update Details</button>
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