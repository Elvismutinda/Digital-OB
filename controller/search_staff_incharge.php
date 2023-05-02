<?php
// Include the database connection file
include('../config/connection.php');

session_start();

if(!isset($_SESSION['incharge_id'])){
   header('Location: ../index.php');
}

$session_id = $_SESSION['incharge_id'];
$query = "SELECT * FROM users WHERE staff_id = '$session_id'";
$result = mysqli_query($conn, $query);
$rows = mysqli_fetch_assoc($result);

$station = $rows['station'];

// Get the search term from the query string
$searchTerm = mysqli_real_escape_string($conn, $_GET['q']);

// Build the SQL query to search for staff
$query = "SELECT * FROM users WHERE station='$station' AND (staff_id LIKE '%$searchTerm%' OR name LIKE '%$searchTerm%' OR rank LIKE '%$searchTerm%' OR status LIKE '%$searchTerm%' OR gender LIKE '%$searchTerm%')";
$result = mysqli_query($conn, $query);

// Build the table rows with the search results
$output = '';
$sn = 0;
while($rows = mysqli_fetch_assoc($result)){
    $sn++;
    $output .= '<tr>';
    $output .= '<td>'.$sn.'</td>';
    $output .= '<td>'.$rows['staff_id'].'</td>';
    $output .= '<td>'.$rows['name'].'</td>';
    $output .= '<td>'.$rows['rank'].'</td>';
    $output .= '<td>'.$rows['station'].'</td>';
    $output .= '<td>'.$rows['status'].'</td>';
    $output .= '<td>'.$rows['gender'].'</td>';
    $output .= '<td>';
    $output .= '<a class="edit_btn" title="Edit Staff" href="editstaff.php?staff_id='.$rows['staff_id'].'"><i class="bx bxs-edit"></i></a>';
    $output .= '<button type="submit" title="Delete Staff" name="delete_staff" class="del_btn" value="'.$rows['staff_id'].'"><i class="bx bxs-trash-alt"></i></button>';
    $output .= '</td>';
    $output .= '</tr>';
}

// Return the table rows
echo $output;
?>
