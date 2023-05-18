<?php

include('../config/connection.php');
include('adminmenu.php');

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
                <h2>Station List</h2>
                <a href="addstation.php" class="btn">Add Station</a>
            </div>
            <?php include('../controller/message.php'); ?>
            <form action="../controller/action.php" method="post">
                <table class="staff_table">
                    <thead>
                        <tr><td>S/N</td>
                            <td>Station Name</td>
                            <td>Address</td>
                            <td>Location</td>
                            <td>Phone</td>
                            <td>Date Added</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // serial number variable
                        $sn=0;

                        $query = "SELECT * FROM stations";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            $sn++;
                            ?>
                            <tr>
                                <td><?php echo $sn; ?></td>
                                <td><?php echo $rows['station']; ?></td>
                                <td><?php echo $rows['address']; ?></td>
                                <td><?php echo $rows['location']; ?></td>
                                <td><?php echo $rows['phone']; ?></td>
                                <td><?php echo $rows['date_added']; ?></td>
                                <td>
                                    <a class="edit_btn" title="Edit Station" href="editstation.php?station=<?php echo $rows['station']; ?>"><i class="bx bxs-edit"></i></a>
                                    <button type="submit" title="Delete Station" name="delete_station" class="del_btn" value="<?php echo $rows['station']; ?>"><i class="bx bxs-trash-alt"></i></button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>