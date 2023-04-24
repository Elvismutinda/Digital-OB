<?php

include('../config/connection.php');
include('adminmenu.php');

if(isset($_POST['add_station'])){

   $station = $_POST['station'];
   $address = $_POST['address'];
   $location = $_POST['location'];
   $phone = $_POST['phone'];

   $insert = "INSERT INTO stations(station, address, location, phone) VALUES(?, ?, ?, ?)";
   $stmt = mysqli_stmt_init($conn);
   $prepareStmt = mysqli_stmt_prepare($stmt,$insert);
   if ($prepareStmt) {
      mysqli_stmt_bind_param($stmt,"sssi", $station, $address, $location, $phone);
      mysqli_stmt_execute($stmt);
      echo "<script type='text/javascript'>alert('Station Registered Successfully');
      document.location='viewstation.php'</script>";
      }else{
          die("Something went wrong");
      }
   }
      
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Digital OB</title>
   <script src="https://kit.fontawesome.com/57a72e588d.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="../css/style.css">
</head>
<body>
   <form action="" method="post">
      <div class="details police">
         <div class="recentOrders new">
            <div class="cardHeader">
               <h2>Add Station</h2>
               <a href="viewstation.php" class="btn">View Stations</a>
            </div>
            <div class="form-content">
               <div class="form-box">
                  <label for="station">Name of Station</label>
                  <input type="text" name="station" required>
               </div>
               <div class="form-box">
                  <label for="address">Address</label>
                  <input type="text" name="address" required>
               </div>
               <div class="form-box">
                  <label for="location">Location</label>
                  <input type="text" name="location" required>
               </div>
               <div class="form-box">
                  <label for="phone">Phone</label>
                  <input type="text" name="phone" required>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="add_station">Save and Continue</button>
            </div>
         </div>
      </div>
   </form>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>