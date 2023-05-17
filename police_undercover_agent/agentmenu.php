<?php

include('../config/connection.php');

session_start();

include('../timezone.php');

if(!isset($_SESSION['agent_id'])){
    header('location: ../index.php');
}
 
$session_id = $_SESSION['agent_id'];
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
        <a href="agentpage.php">
          <i class='bx bxs-dashboard' ></i>
          <span class="link_name">Dashboard</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="agentpage.php">Dashboard</a></li>
        </ul>
      </li>
      <li>
        <a href="assignedcase.php">
          <i class='bx bx-book-open' ></i>
          <span class="link_name">View Assigned Cases</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="assignedcase.php">View Assigned Cases</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bx-user-plus' ></i>
            <span class="link_name">Suspects</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" href="#">Suspects</a></li>
          <li><a href="addsuspect.php">Add Suspect</a></li>
          <li><a href="viewsuspect.php">View Suspects List</a></li>
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
        <h4> <?php echo $rows['name']." (". $_SESSION['agent_id']." , ". $rows['rank'].")"; ?></h4>
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