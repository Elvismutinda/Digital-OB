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
</head>
<body>
<form action="">
    <div class="details dashboard">
        <div class="recentOrders dashboard">
            <div class="cardHeader">
               <h2 style="margin-bottom: 20px;">Analytical Reports</h2>
               <a href="adminpage.php" class="btn">Return to Dashboard</a>
            </div>
            <div class="charts">
                <div class="charts-card">
                    <h2 class="charts-title" style="margin-bottom: 20px;">Daily Crime Trend</h2>
                    <div id="linechart_day" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script text="text/javascript">
                    google.charts.load('current', {'packages':['Line']});
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Day', 'Crimes Count'],
                            <?php
                            $line_sql = "SELECT DATE(date_reported) as day, COUNT(*) as num_crimes FROM cases GROUP BY DATE(date_reported)";
                            $line_result = mysqli_query($conn, $line_sql);

                            while($line_row = mysqli_fetch_assoc($line_result)){
                                echo"['".$line_row['day']."',".$line_row['num_crimes']."],";
                            }
                            ?>
                        ]);

                        var options = {
                            title: 'Yearly Crime Trend',
                            hAxis: {title: 'Day', titleTextStyle: {color: '#333'}},
                            vAxis: {minValue: 0},
                            legend: {position: 'none'}
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart_day'));
                        
                        chart.draw(data, options);
                    }

                </script>

                <div class="charts-card">
                    <h2 class="charts-title" style="margin-bottom: 20px;">Weekly Crime Trend</h2>
                    <div id="linechart_week" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script text="text/javascript">
                    google.charts.load('current', {'packages':['Line']});
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Week', 'Crimes Count'],
                            <?php
                            $line_sql = "SELECT WEEK(date_reported) as week, COUNT(*) as num_crimes FROM cases GROUP BY WEEK(date_reported)";
                            $line_result = mysqli_query($conn, $line_sql);

                            while($line_row = mysqli_fetch_assoc($line_result)){
                                echo"['".$line_row['week']."',".$line_row['num_crimes']."],";
                            }
                            ?>
                        ]);

                        var options = {
                            title: 'Yearly Crime Trend',
                            hAxis: {title: 'Week', titleTextStyle: {color: '#333'}},
                            vAxis: {minValue: 0},
                            legend: {position: 'none'}
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart_week'));
                        
                        chart.draw(data, options);
                    }

                </script>

                <div class="charts-card">
                    <h2 class="charts-title" style="margin-bottom: 20px;">Monthly Crime Trend</h2>
                    <div id="linechart_month" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script text="text/javascript">
                    google.charts.load('current', {'packages':['Line']});
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Month', 'Crimes Count'],
                            <?php
                            $line_sql = "SELECT MONTH(date_reported) as month, COUNT(*) as num_crimes FROM cases GROUP BY MONTH(date_reported)";
                            $line_result = mysqli_query($conn, $line_sql);

                            while($line_row = mysqli_fetch_assoc($line_result)){
                                echo"['".$line_row['month']."',".$line_row['num_crimes']."],";
                            }
                            ?>
                        ]);

                        var options = {
                            title: 'Yearly Crime Trend',
                            hAxis: {title: 'Month', titleTextStyle: {color: '#333'}},
                            vAxis: {minValue: 0},
                            legend: {position: 'none'}
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart_month'));
                        
                        chart.draw(data, options);
                    }

                </script>

                <div class="charts-card">
                    <h2 class="charts-title" style="margin-bottom: 20px;">Yearly Crime Trend</h2>
                    <div id="linechart_year" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script text="text/javascript">
                    google.charts.load('current', {'packages':['Line']});
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Year', 'Crimes Count'],
                            <?php
                            $line_sql = "SELECT YEAR(date_reported) as year, COUNT(*) as num_crimes FROM cases GROUP BY YEAR(date_reported)";
                            $line_result = mysqli_query($conn, $line_sql);

                            while($line_row = mysqli_fetch_assoc($line_result)){
                                echo"['".$line_row['year']."',".$line_row['num_crimes']."],";
                            }
                            ?>
                        ]);

                        var options = {
                            title: 'Yearly Crime Trend',
                            hAxis: {title: 'Year', titleTextStyle: {color: '#333'}},
                            vAxis: {minValue: 0},
                            legend: {position: 'none'}
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart_year'));
                        
                        chart.draw(data, options);
                    }

                </script>
            </div>
        </div>
    </div>
</form>
</body>
</html>