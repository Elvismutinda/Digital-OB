<?php

include('../config/connection.php');
include('adminmenu.php');

if(isset($_POST['add_staff'])){

   $staff_id = mysqli_real_escape_string($conn, $_POST["staff_id"]);
   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $station = mysqli_real_escape_string($conn, $_POST["station"]);
   $gender = mysqli_real_escape_string($conn, $_POST['gender']);
   $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
   $cpass = mysqli_real_escape_string($conn, md5($_POST['cpassword']));
   $status = mysqli_real_escape_string($conn, $_POST['status']);

   $select = " SELECT * FROM users WHERE staff_id = '$staff_id' && password = '$pass' ";

   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){

      $error[] = 'User already exist!';

   }else{

      if($pass != $cpass){
         $error[] = 'Password does not match!';
      }else{
         $insert = "INSERT INTO users(staff_id, name, station, gender, password, status) VALUES(?, ?, ?, ?, ?, ?)";
         $stmt = mysqli_stmt_init($conn);
         $prepareStmt = mysqli_stmt_prepare($stmt,$insert);
         if ($prepareStmt) {
            mysqli_stmt_bind_param($stmt,"isssss",$staff_id, $name, $station, $gender, $pass, $status);
            mysqli_stmt_execute($stmt);
            echo "<script type='text/javascript'>alert('Staff Registered Successfully');
            document.location='viewstaff.php'</script>";
         }else{
             die("Something went wrong");
         }
         
      }
   }

}; 


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
   <form action="" method="post">
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
                  <select name="station" required>
                     <option select hidden value="">Select Station</option>
                     <?php
                     $query = "SELECT * FROM stations";
                     $result = mysqli_query($conn, $query);

                     while($rows = mysqli_fetch_assoc($result)){
                        ?>
                        <option value="<?php echo $rows['station'] ?>"> <?php echo $rows['station'] ?></option>
                        <?php
                     }
                     ?>
                  </select>
               </div>
               <div class="form-box">
                  <label for="usertype">User Type</label>
                  <select name="status" required>
                     <option selected hidden value="">Select User Type</option>
                     <option value="Admin">Admin</option>
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