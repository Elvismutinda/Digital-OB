<?php

include('../config/connection.php');
include('inchargemenu.php');

$station = $rows['station'];

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
                <div class="search">
                    <input type="text" id="searchInput" placeholder="Search Suspect">
                </div>
            </div>
            <form action="../controller/action.php" method="post">
                <table class="staff_table">
                    <thead>
                        <tr>
                            <td>S/N</td>
                            <td>Case Suspected</td>
                            <td>OB Number</td>
                            <td>Full Name</td>
                            <td>National ID</td>
                            <td>Gender</td>
                            <td>Date Added</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="suspectTableBody">
                        <?php
                        $sn=0;

                        $query = "SELECT * FROM suspects WHERE station='$station'";
                        $result = mysqli_query($conn, $query);

                        while($rows = mysqli_fetch_assoc($result)){
                            $sn++;
                            ?>
                            <tr>
                                <td><?php echo $sn; ?></td>
                                <td><?php echo $rows['crime_suspected']; ?></td>
                                <td><?php echo $rows['ob_number']; ?></td>
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

                <script>
                    // Get the search input field
                    const searchInput = document.getElementById('searchInput');

                    // Add an event listener for the keyup event
                    searchInput.addEventListener('keyup', () => {
                    // Get the search term
                    const searchTerm = searchInput.value.trim().toLowerCase();

                    // Send an AJAX request to search for staff
                    const xhr = new XMLHttpRequest();
                    xhr.open('GET', `../controller/search_suspect.php?q=${searchTerm}`);
                    xhr.onload = () => {
                        if (xhr.status === 200) {
                        // Replace the table rows with the search results
                        document.getElementById('suspectTableBody').innerHTML = xhr.responseText;
                        } else {
                        console.error('Failed to search for suspect.');
                        }
                    };
                    xhr.send();
                    });
                </script>

            </form>
        </div>
    </div>
</body>
</html>