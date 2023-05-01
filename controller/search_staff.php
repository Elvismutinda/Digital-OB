<?php

include('../config/connection.php');

// Get the search term
$searchTerm = mysqli_real_escape_string($conn, $_GET['q']);

// Query the database for staff that match the search term
$query = "SELECT * FROM users WHERE staff_id LIKE '%$searchTerm%' OR LOWER(name) LIKE '%$searchTerm%' OR LOWER(rank) LIKE '%$searchTerm%' OR LOWER(station) LIKE '%$searchTerm%' OR LOWER(status) LIKE '%$searchTerm%' OR LOWER(gender) LIKE '%$searchTerm%'";
$result = mysqli_query($conn, $query);

// Build the table rows for the search results
$rows = '';
$sn = 0;
while ($staff = mysqli_fetch_assoc($result)) {
  $sn++;
  $rows .= "
    <tr>
      <td>{$sn}</td>
      <td>{$staff['staff_id']}</td>
      <td>{$staff['name']}</td>
      <td>{$staff['rank']}</td>
      <td>{$staff['station']}</td>
      <td>{$staff['status']}</td>
      <td>{$staff['gender']}</td>
      <td>
        <a class=\"edit_btn\" title=\"Edit Staff\" href=\"editstaff.php?staff_id={$staff['staff_id']}\"><i class=\"bx bxs-edit\"></i></a>
        <button type=\"submit\" title=\"Delete Staff\" name=\"admin_delete_staff\" class=\"del_btn\" value=\"{$staff['staff_id']}\"><i class=\"bx bxs-trash-alt\"></i></button>
      </td>
    </tr>
  ";
}

// Return the table rows as a response to the AJAX request
echo $rows;
