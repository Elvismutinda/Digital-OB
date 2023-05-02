<?php

include('../config/connection.php');

// Get the search term
$searchTerm = mysqli_real_escape_string($conn, $_GET['q']);

// Query the database for suspect that match the search term
$query = "SELECT * FROM suspects WHERE crime_suspected LIKE '%$searchTerm%' OR LOWER(name) LIKE '%$searchTerm%' OR national_id LIKE '%$searchTerm%' OR ob_number LIKE '%$searchTerm%' OR LOWER(gender) LIKE '%$searchTerm%'";
$result = mysqli_query($conn, $query);

// Build the table rows for the search results
$rows = '';
$sn = 0;
while ($suspect = mysqli_fetch_assoc($result)) {
  $sn++;
  $rows .= "
    <tr>
      <td>{$sn}</td>
      <td>{$suspect['crime_suspected']}</td>
      <td>{$suspect['ob_number']}</td>
      <td>{$suspect['name']}</td>
      <td>{$suspect['national_id']}</td>
      <td>{$suspect['gender']}</td>
      <td>{$suspect['date_added']}</td>
      <td>
        <a class=\"edit_btn\" href=\"suspectdetails.php?ob_number={$suspect['ob_number']}\">View Full Details</a>
      </td>
    </tr>
  ";
}

// Return the table rows as a response to the AJAX request
echo $rows;
