<?php

include('../config/connection.php');
include('policemenu.php');

$station = $rows['station'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital OB</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="details cases">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Case List</h2>
                <div class="search">
                    <input type="text" placeholder="Search Case" id="searchInput">
                </div>
            </div>
            <form action="">
                <table class="case_table">
                    <thead>
                        <tr>
                            <td>S/N</td>
                            <td>OB Number</td>
                            <td>Crime Type</td>
                            <td>Time Reported</td>
                            <td>Statement</td>
                            <td>Recorded By</td>
                            <td>Investigated By</td>
                            <td>Investigation Status</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        //serial number variable
                        $sn=0;

                        $query = "SELECT * FROM cases WHERE station='$station'";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            $sn++;
                            ?>
                            <tr>
                                <td><?php echo $sn; ?></td>
                                <td><?php echo $rows['ob_number']; ?></td>
                                <td><?php echo $rows['crime_type']; ?></td>
                                <td><?php echo $rows['date_reported']; ?></td>
                                <td><?php echo $rows['statement']; ?></td>
                                <td><?php echo $rows['recorded_by']; ?></td>
                                <td><?php echo $rows['investigator']; ?></td>
                                <td><?php echo $rows['status']; ?></td>
                                <td>
                                    <a class="edit_btn" title="View Case Details" href="casedetails.php?ob_number=<?php echo $rows['ob_number']; ?>&investigator=<?php echo $rows['investigator']; ?>"><i class="bx bxs-book-open"></i></a>
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

<script>
$(document).ready(function(){
  $("#searchInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("table.case_table tbody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

</html>