<?php

include('config/connection.php');
$date_time = date('Y-m-d H:i:s');

session_start();
include('header.php');

if(isset($_POST['submit'])){

   $staff_id = mysqli_real_escape_string($conn, $_POST["staff_id"]);
   $pass = md5($_POST['password']);

   $select = " SELECT * FROM users WHERE staff_id = '$staff_id' && password = '$pass' ";

   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){

      $row = mysqli_fetch_array($result);

      if($row['status'] == 'Incharge Officer'){

         $_SESSION['incharge_id'] = $row['staff_id'];

         $incharge_name = $row['name'];
         $incharge_id = $row['staff_id'];
         $incharge_station = $row['station'];
         $incharge_rank = $row['rank'];

         $audit_trail_file = fopen('controller/audit_trail.log', 'a');
 
         $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tLogged into the system\n";
         fwrite($audit_trail_file, $log_message);

         fclose($audit_trail_file);

         header('Location: incharge_officer/inchargepage.php');

      }elseif($row['status'] == 'Police'){

         $_SESSION['police_id'] = $row['staff_id'];

         $police_name = $row['name'];
         $police_id = $row['staff_id'];
         $police_station = $row['station'];
         $police_rank = $row['rank'];

         $audit_trail_file = fopen('controller/audit_trail.log', 'a');
 
         $log_message = "$date_time,\t$police_name,\t$police_id,\t$police_rank,\t$police_station,\tLogged into the system\n";
         fwrite($audit_trail_file, $log_message);

         fclose($audit_trail_file);

         header('Location: police/policepage.php');

      }elseif($row['status'] == 'Investigating Officer'){
         
         $_SESSION['agent_id'] = $row['staff_id'];

         $inv_name = $row['name'];
         $inv_id = $row['staff_id'];
         $inv_station = $row['station'];
         $inv_rank = $row['rank'];

         $audit_trail_file = fopen('controller/audit_trail.log', 'a');
 
         $log_message = "$date_time,\t$inv_name,\t$inv_id,\t$inv_rank,\t$inv_station,\tLogged into the system\n";
         fwrite($audit_trail_file, $log_message);

         fclose($audit_trail_file);

         header('Location: police_undercover_agent/assignedcase.php');

      }elseif($row['status'] == 'Admin'){

         $_SESSION['admin_id'] = $row['staff_id'];
         header('Location: admin/adminpage.php');
      }
     
   }else{
      $error[] = 'Incorrect Staff ID or Password!';
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
   <link rel="stylesheet" href="css/index.css">
</head>
<body>
   
<div class="container">
   <form action="" method="post">
      <header>Please Login Here</header>
      <?php
      if(isset($error)){
         foreach($error as $error){
            echo '<span class="error-msg">'.$error.'</span>';
         };
      };
      ?>
      <div class="login-content">
         <div class="login-box">
            <label for="staff_id"><b>Staff ID</b></label>
            <input type="text" name="staff_id" class="form-control" required placeholder="Enter Your Staff ID">
         </div>
         <div class="login-box">
            <label for="password"><b>Password</b></label>
            <input type="password" name="password" class="form-control" required placeholder="Enter Your Password">
         </div>
            <button type="submit" name="submit">Login</button>
      </div>
   </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>