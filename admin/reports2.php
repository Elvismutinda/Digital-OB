<?php

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
<form action="" method="post">
    <div class="details dashboard">
        <div class="recentOrders dashboard">
            <div class="cardHeader">
               <h2 style="margin-bottom: 20px;">Complaints based on gender</h2>
               <a href="reports.php" class="btn">Go Back</a>
            </div>
            <div class="charts">
                <div class="charts-card">
                    <div id="columnchart2" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript">
                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(columnChart);

                    function columnChart(){

                    var data = google.visualization.arrayToDataTable([
                        ['location', 'count'],
                        <?php
                        $chart_sql = "SELECT gender, COUNT(*) as count FROM complainants GROUP BY gender";
                        $chart_result = mysqli_query($conn, $chart_sql);

                        while($chart_row = mysqli_fetch_assoc($chart_result)){
                            echo"['".$chart_row['gender']."',".$chart_row['count']."],";
                        }
                        ?>
                        ]);

                        var options = {
                            legend: {position: 'none'}
                        };

                        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart2'));
                        chart.draw(data, options);
                    }
                </script>
               
            </div>
        </div>
    </div>
</form>
</body>
</html>