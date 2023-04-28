<?php

include('../config/connection.php');

session_start();

include('../timezone.php');

if(!isset($_SESSION['admin_id'])){
   header('Location: ../index.php');
}

$session_id = $_SESSION['admin_id'];
$query = "SELECT * FROM users WHERE staff_id = '$session_id'";
$result = mysqli_query($conn, $query);
$rows = mysqli_fetch_assoc($result);

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital OB</title>
    <link rel="stylesheet" href="../css/style.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="sidebar close">
    <div class="logo-details">
      <i class='bx bx-shield-quarter'></i>
      <span class="logo_name">Digital OB</span>
    </div>
    <ul class="nav-links">
      <li>
        <a href="adminpage.php">
          <i class='bx bxs-dashboard' ></i>
          <span class="link_name">Dashboard</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="adminpage.php">Dashboard</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bx-user-plus' ></i>
            <span class="link_name">Staff</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" href="#">Staff</a></li>
          <li><a href="addstaff.php">Add Staff</a></li>
          <li><a href="viewstaff.php">View Staff List</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bx-building' ></i>
            <span class="link_name">Stations</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" href="#">Stations</a></li>
          <li><a href="addstation.php">Add Station</a></li>
          <li><a href="viewstation.php">View Stations List</a></li>
        </ul>
      </li>
      <li>
        <a href="viewcase.php">
          <i class='bx bx-book-open' ></i>
          <span class="link_name">View Cases</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="viewcase.php">View Cases</a></li>
        </ul>
      </li>
      <li>
        <a href="editprofile.php">
          <i class='bx bxs-edit' ></i>
          <span class="link_name">Edit Profile</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="editprofile.php">Edit Profile</a></li>
        </ul>
      </li>
      <li>
        <a href="logs.php">
          <i class='bx bx-file' ></i>
          <span class="link_name">Audit Logs</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="logs.php">Audit Logs</a></li>
        </ul>
      </li>
      <li>
        <a href="reports.php">
          <i class='bx bx-file' ></i>
          <span class="link_name">Reports</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="reports.php">Reports</a></li>
        </ul>
      </li>
      <li>
      <a href="logout.php">
          <i class='bx bx-log-out' ></i>
          <span class="link_name">Logout</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="logout.php">Logout</a></li>
        </ul>
  </li>
</ul>
  </div>
  <div class="home-section">
    <div class="home-content">
      <i class='bx bx-menu' ></i>
      <div class="username">
        <h4> <?php echo $rows['name']." (". $_SESSION['admin_id']." , ". $rows['rank'].")"; ?></h4>
      </div>
      <div class="user">
        <h4><span><?php echo $rows['station']; ?></span></h4>
      </div>
    </div>

  <script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
   arrowParent.classList.toggle("showMenu");
    });
  }
  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
  });
  </script>
</body>
</html>