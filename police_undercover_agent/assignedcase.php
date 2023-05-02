<?php

include('../config/connection.php');
include('agentmenu.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Digital OB</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="details cases">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Assigned Cases</h2>
                <div class="search">
                    <input type="text" placeholder="Search Staff" id="searchInput">
                </div>
            </div>
            <form action="">
                <table class="case_table">
                    <thead>
                        <tr>
                            <td>S/N</td>
                            <td>OB Number</td>
                            <td>Crime Type</td>
                            <td>Statement</td>
                            <td>Date Reported</td>
                            <td>Reported By</td>
                            <td>Station</td>
                            <td>Status</td>
                            <td>Date Completed</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        //serial number variable
                        $sn=0;

                        $query = "SELECT * FROM cases WHERE investigator='$session_id'";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            $recorded_by = $rows['recorded_by'];
                            $query2 = "SELECT name FROM users WHERE staff_id='$recorded_by'";
                            $result2 = mysqli_query($conn, $query2);
                            $rows2 = mysqli_fetch_assoc($result2);
                            $sn++;
                            ?>
                            <tr>
                                <td><?php echo $sn; ?></td>
                                <td><?php echo $rows['ob_number']; ?></td>
                                <td><?php echo $rows['crime_type']; ?></td>
                                <td><?php echo $rows['statement']; ?></td>
                                <td><?php echo $rows['date_reported']; ?></td>
                                <td><?php echo $rows['recorded_by'] ." , ". $rows2['name'] .""; ?></td>
                                <td><?php echo $rows['station']; ?></td>
                                <td><?php echo $rows['status']; ?></td>
                                <td><?php echo $rows['date_completed']; ?></td>
                                <td>
                                    <a class="edit_btn" title="Edit Case Details" href="editcase.php?ob_number=<?php echo $rows['ob_number']; ?>"><i class="bx bxs-edit"></i></a>
                                    <a class="edit_btn" title="View Case Details" href="casedetails.php?ob_number=<?php echo $rows['ob_number']; ?>"><i class="bx bxs-book-open"></i></a>
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