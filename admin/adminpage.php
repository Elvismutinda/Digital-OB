<?php

include('../config/connection.php');
include('adminmenu.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Digital OB</title>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<form action="">
      <div class="details dashboard">
         <div class="recentOrders dashboard">
            <div class="cardHeader">
               <h2>Dashboard</h2>
               <a href="reports.php" class="btn">View Reports</a>
            </div>
            <div class="main-cards">
               <div class="card">
                  <div class="card-inner">
                     <h3>Total Staff</h3>
                  </div>
                  <?php
                  $dash_staff_query = "SELECT * FROM users";
                  $dash_staff_result = mysqli_query($conn, $dash_staff_query);

                  if($dash_staff_total = mysqli_num_rows($dash_staff_result)){
                     echo '<h1> '.$dash_staff_total.' </h1>';
                  }
                  else{
                     echo '<h1>No Data</h1>';
                  }
                  ?>
                  <a href="viewstaff.php" style="text-decoration: none; color: black; background: pink;">
                  <h4>View Details</h4>
                  </a>
               </div>

               <div class="card">
                  <div class="card-inner">
                     <h3>Total Complaints reported</h3>
                  </div>
                  <?php
                  $dash_comp_query = "SELECT * FROM cases";
                  $dash_comp_result = mysqli_query($conn, $dash_comp_query);
                  
                  if($dash_comp_total = mysqli_num_rows($dash_comp_result)){
                     echo '<h1> '.$dash_comp_total.' </h1>';
                  }
                  else{
                     echo '<h2>No Data</h2>';
                  }
                  ?>
                  <a href="viewcase.php" style="text-decoration: none; color: black; background: pink;">
                  <h4>View Details</h4>
                  </a>
               </div>

               <div class="card">
                  <div class="card-inner">
                     <h3>Cases Ongoing</h3>
                  </div>
                  <?php
                  $dash_ongoing_query = "SELECT * FROM cases WHERE status='Ongoing'";
                  $dash_ongoing_result = mysqli_query($conn, $dash_ongoing_query);
                  
                  if($dash_ongoing_total = mysqli_num_rows($dash_ongoing_result)){
                     echo '<h1> '.$dash_ongoing_total.' </h1>';
                  }
                  else{
                     echo '<h1>No Data</h1>';
                  }
                  ?>
               </div>

               <div class="card">
                  <div class="card-inner">
                     <h3>Cases Closed</h3>
                  </div>
                  <?php
                  $dash_complete_query = "SELECT * FROM cases WHERE status='Closed'";
                  $dash_complete_result = mysqli_query($conn, $dash_complete_query);
                  
                  if($dash_complete_total = mysqli_num_rows($dash_complete_result)){
                     echo '<h1> '.$dash_complete_total.' </h1>';
                  }
                  else{
                     echo '<h2>No Data</h2>';
                  }
                  ?>
               </div>
            </div>
            <div class="charts">
               <div class="charts-card">
                  <h2 class="charts-title">Case Analytics Reports</h2>
                  <div id="piechart_3d" style="width: 430px;height: 350px;"></div>
               </div>
               <script type="text/javascript">
                  google.charts.load('current', {'packages':['corechart']});
                  google.charts.setOnLoadCallback(pieChart);

                  function pieChart(){

                     var data = google.visualization.arrayToDataTable([
                        ['crime_type', 'count'],
                        <?php
                        $chart_sql = "SELECT crime_type, COUNT(*) as count FROM cases GROUP BY crime_type"; 
                        $chart_result = mysqli_query($conn, $chart_sql);
                           
                        while($chart_row = mysqli_fetch_assoc($chart_result)){
                           echo"['".$chart_row['crime_type']."',".$chart_row['count']."],";
                        }
                        ?>
                     ]);

                     var options = {
                        is3D: true
                     };

                     var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                     chart.draw(data, options);
                  }
               </script>

               <div class="charts-card">
                  <h2 class="charts-title">Cases Ongoing for a long time</h2>
                  <div id="data_container">
                  <?php
                  $query = "SELECT station, ob_number, crime_type, date_reported FROM cases WHERE status = 'Ongoing'";
                  $result = mysqli_query($conn, $query);

                  if (mysqli_num_rows($result) > 0) {
                     $data = array();

                     while ($row = mysqli_fetch_assoc($result)) {
                        $station = $row['station'];
                        $ob_number = $row['ob_number'];
                        $crime_type = $row['crime_type'];
                        $startDate = $row['date_reported'];
                        
                        // Calculate the duration
                        $startDate = new DateTime($startDate);
                        $now = new DateTime();
                        $duration = $now->diff($startDate);
                        
                        if ($duration->days > 30) {
                           $data[] = array(
                           'station' => $station,
                           'ob_number' => $ob_number,
                           'crime_type' => $crime_type,
                           'duration' => $duration->format('%a days')
                           );
                        }
                     }

                     $itemsPerPage = 3; // Number of items to display
                     $page = isset($_GET['page']) ? $_GET['page'] : 1; // Get the current page number
                     $offset = ($page - 1) * $itemsPerPage; // Calculate the offset for the query

                     $totalPages = ceil(count($data) / $itemsPerPage); // Total no. of pages

                     $currentPageData = array_slice($data, $offset, $itemsPerPage); // Data for current page

                     foreach($currentPageData as $item){
                        echo "<div class='data-item'>";
                        echo "Station: " . $item['station'] . "<br>";
                        echo "OB Number: " . $item['ob_number'] . "<br>";
                        echo "Nature of Case: " . $item['crime_type'] . "<br>";
                        echo "Pending for: " . $item['duration'] . "<br><br>";
                        echo "</div>";
                     }

                     echo "<div class='pagination'>";
                     if($page > 1){
                        echo "<a href='?page=" . ($page - 1) . "'>View Previous</a>";
                     }
                     if($page < $totalPages){
                        echo "<a href='?page=" . ($page + 1) . "' style='margin-left:20px;'>View Next</a>";
                     }
                     echo "</div>";
                     
                  } else {
                     echo "No long ongoing cases found.";
                  }

                  mysqli_close($conn);

                  ?>

               </div>

            </div>
         </div>
      </div>
   </form>
</body>
</html>