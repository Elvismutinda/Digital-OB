<?php

include('../config/connection.php');
include('policemenu.php');

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
            <div class="cardHeader">
                <h2>Suspect List</h2>
                <a href="addsuspect.php" class="btn">Add Suspect</a>
            </div>
            <form action="../controller/action.php" method="post">
                <table class="staff_table">
                    <thead>
                        <tr>
                            <td>OB Number</td>
                            <td>Case Suspected</td>
                            <td>Full Name</td>
                            <td>National ID</td>
                            <td>Gender</td>
                            <td>Date Added</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php

                        $query = "SELECT * FROM suspects";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            ?>
                            <tr>
                                <td><?php echo $rows['ob_number']; ?></td>
                                <td><?php echo $rows['crime_suspected']; ?></td>
                                <td><?php echo $rows['name']; ?></td>
                                <td><?php echo $rows['national_id']; ?></td>
                                <td><?php echo $rows['gender']; ?></td>
                                <td><?php echo $rows['date_added']; ?></td>
                                <td>
                                    <a class="edit_btn" href="suspectdetails.php?ob_number=<?php echo $rows['ob_number']; ?>">View Full Details</a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>