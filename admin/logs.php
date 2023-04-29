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
</head>
<body>
    <div class="details staff">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>AUDIT LOGS</h2>
                <h4><?php echo date('Y-m-d H:i:s'); ?></h4>
            </div>
            <form action="">
                <?php
                $filename = "../controller/audit_trail.log";
                $file = fopen($filename, "r");
                
                if ($file) {
                    $lines = array();
                    while (($line = fgets($file)) !== false) {
                        $lines[] = $line;
                    }
                    fclose($file);

                    $lines = array_reverse($lines);

                    echo "<table>";
                    echo "<thead><tr><th>Date/Time</th><th>Name</th><th>Staff ID</th><th>Rank</th><th>Station</th><th>Action</th></tr></thead>";
                    echo "<tbody>";
                    foreach ($lines as $line){
                        $data = explode(",", $line);
                        echo "<tr>";
                        echo "<td style='text-align:center;'>" . $data[0] . "</td>";
                        echo "<td style='text-align:center;'>" . $data[1] . "</td>";
                        echo "<td style='text-align:center;'>" . $data[2] . "</td>";
                        echo "<td style='text-align:center;'>" . $data[3] . "</td>";
                        echo "<td style='text-align:center;'>" . $data[4] . "</td>";
                        echo "<td style='text-align:center;'>" . $data[5] . "</td>";
                        echo "</tr>";
                    }
                    echo "</tbody>";
                    echo "</table>";
                }else {
                    echo "Unable to open file.";
                }
                ?>
            </form>
        </div>
    </div>
</body>
</html>