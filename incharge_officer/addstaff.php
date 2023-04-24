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
   <form action="../controller/action.php" method="post">
      <div class="details staff">
         <div class="recentOrders register">
            <div class="cardHeader">
               <h2>Add Staff</h2>
               <a href="viewstaff.php" class="btn">View Staff</a>
            </div>
            <?php
               if(isset($error)){
                  foreach($error as $error){
                     echo '<span class="error-msg">'.$error.'</span>';
                  };
               };
            ?>
            <div class="form-content">
               <div class="form-box">
                  <label for="staff_id">Staff ID</label>
                  <input type="text" name="staff_id" required>
               </div>
               <div class="form-box">
                  <label for="name">Full Name</label>
                  <input type="text" name="name" required>
               </div>
               <div class="form-box">
                  <label for="station">Station</label>
                  <input type="text" name="station" readonly="" value="<?php echo $rows['station'] ?>" required>
               </div>
               <div class="form-box">
                  <label for="usertype">User Type</label>
                  <select name="status" required>
                     <option selected hidden value="">Select User Type</option>
                     <option value="Police">Police</option>
                     <option value="Investigating Officer">Investigating Officer</option>
                  </select>
               </div>
               <div class="form-box">
                  <label for="password">Password</label>
                  <input type="password" name="password" required>
               </div>
               <div class="form-box">
                  <label for="cpassword">Confirm Password</label>
                  <input type="password" name="cpassword" required>
               </div>
               <div class="form-box">
                  <label for="rank">Rank</label>
                  <select name="rank" required>
                     <option selected hidden value="">Select Rank</option>
                     <option value="Constable">Constable</option>
                     <option value="Corporal">Corporal</option>
                     <option value="Sergeant">Sergeant</option>
                     <option value="Senior Sergeant">Senior Sergeant</option>
                     <option value="Assistant Inspector">Assistant Inspector</option>
                     <option value="Inspector">Inspector</option>
                     <option value="Senior Inspector">Senior Inspector</option>
                  </select>
               </div>
               <div class="form-box">
                  <label for="gender">Gender</label>
                  <select name="gender" required>
                     <option selected hidden value="">Select Gender</option>
                     <option value="Male">Male</option>
                     <option value="Female">Female</option>
                  </select>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="add_staff">Register Staff</button>
            </div>
         </div>
      </div>
   </form>
</div>
</body>
</html>