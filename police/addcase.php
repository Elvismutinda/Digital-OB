<?php

include('../config/connection.php');
include('policemenu.php');
 
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
      <div class="details case">
         <div class="recentOrders register">
            <div class="cardHeader">
               <h2>Add Case</h2>
               <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
      <div class="form-content">
            <input type="hidden" name="station" readonly="" value="<?php echo $rows['station'] ?>" required>
            <input type="hidden" name="recorded_by" readonly="" value="<?php echo $session_id ?>" required>
         <div class="form-box">
            <label for="ob_number">OB Number</label>
            <?php
            $ob_query = "SELECT * FROM complainants ORDER BY date_added DESC LIMIT 1";
            $ob_result = mysqli_query($conn, $ob_query);
            $ob_row = mysqli_fetch_array($ob_result);
            ?>
            <input type="text" name="ob_number" readonly="" value="<?php echo $ob_row['ob_number'] ?>" required>
         </div>
          <div class="form-box">
             <label for="crime_type">Crime Type</label>
               <input type="text" name="crime_type" readonly="" value="<?php echo $ob_row['crime_type'] ?>" required>
             </select>
          </div>
          <div class="form-box">
            <label for="statement">Statement</label>
            <textarea name="statement" cols="60" rows="10"></textarea>
          </div>
       </div>
       <div class="form-btn">
          <button type="submit" name="add_case">Save Case</button>
       </div>
         </div>
      </div>
   </form>
 </body>
 </html>