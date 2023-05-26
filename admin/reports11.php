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
               <h2 style="margin-bottom: 20px;">Investigators Who Have Handled the Most Cases.</h2>
               <a href="reports.php" class="btn">Go Back</a>
            </div>
            <div class="charts">
                <div class="charts-card">
                    <div id="columnchart" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript">
                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(columnChart);

                    function columnChart(){
                        var data = google.visualization.arrayToDataTable([
                            ['Investigator', 'No. of Cases'],
                            <?php
                            $chart_sql = "SELECT investigator, COUNT(*) AS count FROM cases GROUP BY investigator ORDER BY count DESC LIMIT 10";
                            $chart_result = mysqli_query($conn, $chart_sql);

                            while($chart_row = mysqli_fetch_assoc($chart_result)){
                                echo "['".$chart_row['investigator']."', ".$chart_row['count']."],";
                            }
                            ?>
                        ]);

                        var options = {
                            legend: {position: 'none'},
                            hAxis: {title: 'Investigator'},
                            vAxis: {title: 'Number of Cases'}
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