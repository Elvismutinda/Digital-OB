<?php

include('../config/connection.php');

$ob_number = $_GET['ob_number'];

$sql_crime = "SELECT crime_type FROM cases WHERE ob_number='$ob_number' LIMIT 1";
$sql_result = mysqli_query($conn, $sql_crime);
$crime_row = mysqli_fetch_array($sql_result);

echo $crime_row['crime_type'];

?>
