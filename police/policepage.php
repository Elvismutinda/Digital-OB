<?php

include('../config/connection.php');
include('policemenu.php');
$station = $rows['station'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Digital OB</title>
</head>
<body>
      <form action="">
      <div class="details dashboard">
         <div class="recentOrders dashboard">
            <div class="cardHeader">
               <h2>Dashboard</h2>
               <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
            <div class="charts" style="margin-top: 20px;">
            <div class="charts-card">
                  <h2 class="charts-title">Case Analytics Reports</h2>
                  <div id="piechart_3d" style="width: 430px;height: 350px;"></div>
               </div>
               <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
               <script type="text/javascript">
                  google.charts.load('current', {'packages':['corechart']});
                  google.charts.setOnLoadCallback(pieChart);

                  function pieChart(){

                     var data = google.visualization.arrayToDataTable([
                        ['crime_type', 'count'],
                        <?php
                           $chart_sql = "SELECT crime_type, COUNT(*) as count FROM cases WHERE station='$station' GROUP BY crime_type"; 
                           $chart_result = mysqli_query($conn, $chart_sql);
                           
                           while($chart_row = mysqli_fetch_assoc($chart_result)){
                           echo"['".$chart_row['crime_type']."',".$chart_row['count']."],";
                           }
                        ?>
                     ]);

                     var options = {
                        title: 'Crime Reports Percentage',
                        is3D: true,
                     };

                     var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                     chart.draw(data, options);
                  }
               </script>

               <div class="charts-card">
                  <h2 class="charts-title">Crime Analytics Reports</h2>
                  <div id="columnchart" style="width: 430px;height: 350px;"></div>
               </div>
               <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
               <script type="text/javascript">
                  google.charts.load('current', {'packages':['corechart']});
                  google.charts.setOnLoadCallback(barChart);

                  function barChart(){

                     var data = google.visualization.arrayToDataTable([
                        ['crime_type', 'count'],
                        <?php
                           $chart_sql = "SELECT crime_type, COUNT(*) as count FROM cases WHERE station='$station' GROUP BY crime_type"; 
                           $chart_result = mysqli_query($conn, $chart_sql);
                           
                           while($chart_row = mysqli_fetch_assoc($chart_result)){
                           echo"['".$chart_row['crime_type']."',".$chart_row['count']."],";
                           }
                        ?>
                     ]);

                     var options = {
                        title: 'Crime Reports Count'
                     };

                     var chart = new google.visualization.ColumnChart(document.getElementById('columnchart'));
                     chart.draw(data, options);
                  }
               </script>
            </div>
         </div>
      </div>
   </form>
</body>
</html>