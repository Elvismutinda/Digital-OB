<?php
$get_ob = $_GET['ob_number'];
include('../config/connection.php');
include('agentmenu.php');

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
        <div class="recentOrders">
            <div class="tools">
                <a href="report.php?ob_number=<?php echo $get_ob; ?>" class="btn" target="_blank">Print</a>
                <a href="assignedcase.php" class="btn">Go Back</a>
            </div>
            <div class="cardHeader">
                <h2>Complainant Details</h2>
            </div>
            <?php
            if(isset($_GET['ob_number'])){
                $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                $query = "SELECT * FROM complainants WHERE ob_number='$ob_number'";
                $query_run = mysqli_query($conn, $query);

                while($row = mysqli_fetch_assoc($query_run)){
                    ?>
                    <table>
                        <tr>
			 			 	<td>OB Number:</td><td><?php echo $row['ob_number']?></td>
			 			</tr>
                        <tr>
			 		 		<td>Name:</td><td><?php echo $row['comp_name']?></td>
			 		 	</tr>
					 	<tr>
		 			 		<td>Gender:</td><td><?php echo $row['gender']?></td>
		 			 	</tr>
                        <tr>
		 			 		<td>Age:</td><td><?php echo $row['age']?></td>
		 			 	</tr>
                        <tr>
			 		 		<td>Occupation:</td><td><?php echo $row['occupation']?></td>
			 		 	</tr>
                        <tr>
		 			 		<td>Phone Number:</td><td><?php echo $row['tel']?></td>
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
                            <td>Status</td>
                            <td>Date Completed</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if(isset($_GET['ob_number'])){
                            $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                        $query = "SELECT * FROM cases WHERE ob_number='$ob_number'";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            ?>
                            <tr>
                                <td><?php echo $rows['crime_type']; ?></td>
                                <td><?php echo $rows['statement']; ?></td>
                                <td><?php echo $rows['date_reported']; ?></td>
                                <td><?php echo $rows['recorded_by']; ?></td>
                                <td><?php echo $rows['status']; ?></td>
                                <td><?php echo $rows['date_completed']; ?></td>
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
<script src="js/jquery-3.2.1.min.js"></script>
</html>