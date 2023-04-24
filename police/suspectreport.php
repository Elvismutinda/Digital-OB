<?php
$get_ob = $_GET['ob_number'];

include('../config/connection.php');

$station = $_GET['station'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital OB</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body onload="print()">
    <div class="details staff">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Suspect Details</h2>
                <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
            <?php
            if(isset($_GET['ob_number'])){
                $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                $query = "SELECT * FROM suspects WHERE ob_number='$ob_number'";
                $query_run = mysqli_query($conn, $query);

                while($row = mysqli_fetch_assoc($query_run)){
                    ?>
                    <table>
                        <tr>
			 			 	<td>OB Number:</td><td><?php echo $row['ob_number']?></td>
			 			</tr>
                        <tr>
			 		 		<td>Suspect Name:</td><td><?php echo $row['name']?></td>
			 		 	</tr>
                        <tr>
                            <td>Crime Suspected</td><td><?php echo $row['crime_suspected'] ?></td>
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
</body>
</html>