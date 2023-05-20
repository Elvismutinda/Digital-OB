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
               <h2 style="margin-bottom: 20px;">Analytical Reports</h2>
               <a href="adminpage.php" class="btn">Return to Dashboard</a>
            </div>
            <div class="charts">
                <div class="charts-card">
                    <h2 class="charts-title" style="margin-bottom: 20px;">Crime Trend</h2>
                    <label for="start_date">Start Date:</label>
                    <input type="date" id="start_date" name="start_date" value="<?php echo isset($_POST['start_date']) ? $_POST['start_date'] : ''; ?>">
                    <label for="end_date">End Date:</label>
                    <input type="date" id="end_date" name="end_date" value="<?php echo isset($_POST['end_date']) ? $_POST['end_date'] : ''; ?>">
                    <button type="submit" class="btn" name="generate_report" style="margin-top: 20px; margin-bottom: 20px;">Generate Report</button>
                    <div id="linechart" style="width: 430px;height: 350px;"></div>
                </div>
                <?php
                if (isset($_POST['generate_report'])) {
                    $start_date = $_POST['start_date'];
                    $end_date = $_POST['end_date'];

                    $line_sql = "SELECT DATE(date_reported) as day, COUNT(*) as num_crimes FROM cases WHERE DATE(date_reported) BETWEEN '$start_date' AND '$end_date' GROUP BY DATE(date_reported)";
                    $line_result = mysqli_query($conn, $line_sql);

                    $data_rows = [];
                    while($line_row = mysqli_fetch_assoc($line_result)){
                        $data_rows[] = "['".$line_row['day']."',".$line_row['num_crimes']."]";
                    }

                    $chart_data = implode(",", $data_rows);
                }
                ?>

                <script text="text/javascript">
                    google.charts.load('current', {'packages':['Line']});
                    google.charts.setOnLoadCallback(drawChart);

                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Day', 'Crimes Count'],
                            <?php echo $chart_data; ?>
                        ]);

                        var options = {
                            title: 'Crime Trend',
                            hAxis: {title: 'Day', titleTextStyle: {color: '#333'}},
                            vAxis: {minValue: 0},
                            legend: {position: 'none'}
                        };

                        var chart = new google.charts.Line(document.getElementById('linechart'));
                        
                        chart.draw(data, options);
                    }
                </script>

                <div class="charts-card">
                    <h2 class="charts-title">More Reports</h2>
                    <a href=""><h4>1. Cases Reported Based on Location</h4></a>
                    <a href=""><h4>2. Complaints based on gender</h4></a>
                    <div id="" style="width: 430px;height: 350px;"></div>
                </div>

                <div class="charts-card">
                    <h2 class="charts-title">Cases Reported based on location</h2>
                    <div id="columnchart1" style="width: 430px;height: 350px;"></div>
                </div>
                <script type="text/javascript">
                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(columnChart1);

                    function columnChart1(){

                        var data = google.visualization.arrayToDataTable([
                        ['location', 'count'],
                        <?php
                        $chart_sql = "SELECT location, COUNT(crime_type) as count FROM complainants GROUP BY location"; 
                        $chart_result = mysqli_query($conn, $chart_sql);
                           
                        while($chart_row = mysqli_fetch_assoc($chart_result)){
                           echo"['".$chart_row['location']."',".$chart_row['count']."],";
                        }
                        ?>
                        ]);

                        var options = {
                            legend: {position: 'none'}
                        };

                        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart1'));
                        chart.draw(data, options);
                    }
                </script>

                <div class="charts-card">
                    <h2 class="charts-title">Complaints based on gender</h2>
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