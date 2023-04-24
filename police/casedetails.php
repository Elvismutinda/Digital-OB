<?php
$get_ob = $_GET['ob_number'];
$investigator = $_GET['investigator'];
include('../config/connection.php');
include('policemenu.php');

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
            <a href="casereport.php?ob_number=<?php echo $get_ob; ?>&investigator=<?php echo $investigator; ?>&station=<?php echo $rows['station']; ?>" class="btn" target="_blank">Print</a>
            <a href="assigncase.php<?php echo '?ob_number='.$get_ob; ?>" class="btn"> <?php if($investigator=='' ){echo 'Assign This Case to an Investigating Officer';} else{echo 'Change Investigating Officer';}?></a>
            <a href="viewcase.php" class="btn">Go Back</a>
        </div>
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Complainant Details</h2>
            </div>
            <?php
            if(isset($_GET['ob_number'])){
                $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                $query = "SELECT * FROM complainants WHERE ob_number='$ob_number' && station_reported='$station'";
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
<script src="js/jquery-3.2.1.min.js"></script>
</html>