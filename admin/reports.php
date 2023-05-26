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
    <style>
    .report {
        color: inherit;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .report:hover {
        color: #246dec;
    }
</style>
</head>
<body>
<form action="" method="post">
    <div class="details dashboard">
        <div class="recentOrders dashboard">
            <div class="cardHeader">
               <h2 style="margin-bottom: 20px;">Reports</h2>
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
                    <button type="button" class="btn" onclick="printChart()">Print Report</button>
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

                <script text="text/javascript">
                    function printChart() {
                        // Get the selected start date and end date
                        var startDate = document.getElementById('start_date').value;
                        var endDate = document.getElementById('end_date').value;

                        // Create a new window
                        var printWindow = window.open('', '_blank');

                        // Get the chart HTML content
                        var chartHtml = document.getElementById('linechart').outerHTML;

                        // Create a print-friendly page with the chart and date range
                        var printContent = `
                            <html>
                                <head>
                                    <title>Print Report</title>
                                    <style>
                                        .date-range {
                                            margin-bottom: 10px;
                                            font-weight: bold;
                                        }
                                    </style>
                                </head>
                                <body>
                                    <div class="date-range">Date Range: ${startDate} - ${endDate}</div>
                                    ${chartHtml}
                                </body>
                            </html>
                        `;

                        // Write the print-friendly content to the print window
                        printWindow.document.open();
                        printWindow.document.write(printContent);
                        printWindow.document.close();

                        // Print the chart in the new window
                        printWindow.print();
                        printWindow.close();
                    }
                </script>

                <div class="charts-card">
                    <h2 class="charts-title">More Reports (Click to view)</h2>
                    <a class="report" href="reports1.php"><h4>1. Cases Reported Based on Location.</h4></a>
                    <a class="report" href="reports2.php"><h4>2. Complaints Based on Gender.</h4></a>
                    <a class="report" href="reports3.php"><h4>3. Number of Cases Reported by Each Station.</h4></a>
                    <a class="report" href="reports4.php"><h4>4. Number of Cases Reported by Crime Type.</h4></a>
                    <a class="report" href="reports5.php"><h4>5. Status Proportionaliy of Cases.</h4></a>
                    <a class="report" href="reports6.php"><h4>6. Average Time Taken to Solve Cases.</h4></a>
                    <!-- <div id="" style="width: 430px;height: 350px;"></div> -->
                </div>
               
            </div>
        </div>
    </div>
</form>
</body>
</html>