<?php
$get_ob = $_GET['ob_number'];
include('../config/connection.php');
include('agentmenu.php');

$station = $rows['station'];

$printquery = "SELECT * FROM cases";
$printresult = mysqli_query($conn, $printquery);

$printrow = mysqli_fetch_array($printresult);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital OB</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="details staff">
        <div class="tools" style="margin-bottom: 20px;">
            <a href="suspectreport.php?ob_number=<?php echo $get_ob; ?>&station=<?php echo $rows['station']; ?>" class="btn" onclick="printReport(event)" target="_blank">Print</a>
            <a href="viewsuspect.php" class="btn">Go Back</a>
        </div>
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Suspect Details</h2>
            </div>
            <?php
            if(isset($_GET['ob_number'])){
                $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                $query = "SELECT * FROM suspects WHERE ob_number='$ob_number'/* && station_reported='$station'*/";
                $query_run = mysqli_query($conn, $query);

                while($row = mysqli_fetch_assoc($query_run)){
                    ?>
                    <table>
                        <tr>
			 		 		<td>Suspect Name:</td><td><?php echo $row['name']?></td>
			 		 	</tr>
                        <tr>
                            <td>Crime Susupected:</td><td><?php echo $row['crime_suspected'] ?></td>
                        </tr>
					 	<tr>
		 			 		<td>Gender:</td><td><?php echo $row['gender']?></td>
		 			 	</tr>
                        <tr>
		 			 		<td>National ID:</td><td><?php echo $row['national_id']?></td>
		 			 	</tr>
                        <tr>
			 		 		<td>DOB:</td><td><?php echo $row['dob']?></td>
			 		 	</tr>
                        <tr>
		 			 		<td>Phone Number:</td><td><?php echo $row['phone_num']?></td>
		 			 	</tr>
		 			 	<tr>
			 		 		<td>Address:</td><td><?php echo $row['address']?></td>
					 	</tr> 			 	
                    </table>
                    <?php
                }
            }
            ?>
            <div class="cardHeader">
                <h2 style="margin-top: 18px;">Case Details</h2>
            </div>
            <table class="staff_table">
                    <thead>
                        <tr>
                            <td>OB Number</td>
                            <td>Nature of Report</td>
                            <td>Statement</td>
                            <td>Time Reported</td>
                            <td>Recorded By</td>
                            <td>Investigating Officer</td>
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if(isset($_GET['ob_number'])){
                            $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                        $query = "SELECT * FROM cases WHERE ob_number='$ob_number' && station='$station'";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            ?>
                            <tr>
                                <td><?php echo $rows['ob_number']; ?></td>
                                <td><?php echo $rows['crime_type']; ?></td>
                                <td><?php echo $rows['statement']; ?></td>
                                <td><?php echo $rows['date_reported']; ?></td>
                                <td><?php echo $rows['recorded_by']; ?></td>
                                <td><?php echo $rows['investigator']; ?></td>
                                <td><?php echo $rows['status']; ?></td>
                            </tr>
                            <?php
                        }
                    }
                        ?>
                    </tbody>
                </table>
        </div>
    </div>

    <script>
        function printReport(event) {
        event.preventDefault();
        var newWindow = window.open(event.target.href, 'printWindow');
        newWindow.onload = function() {
            newWindow.print();
        };
        window.setTimeout(function() {
            if (!newWindow.closed) {
            newWindow.close();
            }
        }, 700);
        }
    </script>
</body>

<script src="js/jquery-3.2.1.min.js"></script>
</html>