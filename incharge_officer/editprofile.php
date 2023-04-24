<?php

include('../config/connection.php');
include('inchargemenu.php');

$session_id = $_SESSION['incharge_id'];
$query = "SELECT * FROM users WHERE staff_id = '$session_id'";
$result = mysqli_query($conn, $query);
$rows = mysqli_fetch_array($result);

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
      <div class="details profile">
         <div class="recentOrders edit">
            <div class="cardHeader">
               <h2>Update Account Details</h2>
               <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
            <div class="form-content">
               <div class="form-box">
                  <label for="staff_id">Staff ID</label>
                  <input type="text" readonly="" value="<?php echo $rows['staff_id'] ?>" name="staff_id" style="background: lightgrey;">
               </div>
               <div class="form-box">
                  <label for="current_pass">Current Password</label>
                  <input type="password" name="old_pass" required>
               </div>
               <div class="form-box">
                  <label for="password">New Password</label>
                  <input type="password" name="new_pass" required>
               </div>
               <div class="form-box">
                  <label for="cpassword">Confirm New Password</label>
                  <input type="password" name="cnew_pass" required>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="update_pass">Update Details</button>
            </div>
         </div>
      </div>
   </form>
</body>
</html>