<?php
$get_ob = $_GET['ob_number'];

include('../config/connection.php');
include('agentmenu.php');

if(isset($_POST['agent_edit_case']))
{
   $report = mysqli_real_escape_string($conn, $_POST['report']);
   $status = mysqli_real_escape_string($conn, $_POST['status']);

   if($status === 'Closed'){
      $date_completed = date('Y-m-d H:i:s');
   }else{
      $date_completed = NULL;
   }

    $query = "UPDATE cases SET report='$report', status='$status', date_completed='$date_completed' WHERE ob_number='$get_ob'";
    $result = mysqli_query($conn, $query);

    if($result)
    {
      $date_time = date('Y-m-d H:i:s');
      $agent_name = $rows['name'];
      $agent_id = $rows['staff_id'];
      $agent_station = $rows['station'];
      $agent_rank = $rows['rank'];

      $audit_trail_file = fopen('../controller/audit_trail.log', 'a');

      $log_message = "$date_time,\t$agent_name,\t$agent_id,\t$agent_rank,\t$agent_station,\tUpdated Case details for OB Number $ob_number. Status of case is $status\n";
      fwrite($audit_trail_file, $log_message);

      fclose($audit_trail_file);

      echo "<script type='text/javascript'>alert('Case Details Updated Successfully');
      document.location='../police_undercover_agent/assignedcase.php'</script>";
      exit(0);
    }
    else
    {
        $_SESSION['message'] = "Error! Case Details Not Updated";
        header("Location: ../police_undercover_agent/editcase.php");
        exit(0);
    }
}
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
   <?php
   if(isset($_GET['ob_number'])){
      $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
      $case_query = "SELECT * FROM cases WHERE ob_number = '$ob_number'";
      $case_result = mysqli_query($conn, $case_query);

      $case_row = mysqli_fetch_array($case_result);
      $status = $case_row['status'];
      $report = $case_row['report'];
   
   ?>
   <?php include('../controller/message.php'); ?>
   <form action="" method="post">
      <div class="details staff">
         <div class="recentOrders edit">
            <div class="cardHeader">
               <h2>Case Report</h2>
               <a href="assignedcase.php" class="btn">Cancel</a>
            </div>
            <?php
            if(isset($_GET['ob_number'])){
                $ob_number = mysqli_real_escape_string($conn, $_GET['ob_number']);
                $query = "SELECT * FROM complainants WHERE ob_number='$ob_number'";
                $query_run = mysqli_query($conn, $query);

                $query2 = "SELECT * FROM cases WHERE ob_number='$ob_number'";
                $query_run2 = mysqli_query($conn, $query2);
                $strow = mysqli_fetch_assoc($query_run2);

                while($row = mysqli_fetch_assoc($query_run)){
                    ?>
                 <table>
                  <tr>
			 		 	   <td>OB Number:</td><td><?php echo $row['ob_number']?></td>
			 		   </tr>
                  <tr>
                     <td>Crime Type:</td><td><?php echo $row['crime_type']?></td>
                  </tr>
                  <tr>
                     <td>Statement:</td><td><?php echo $strow['statement']?></td>
                  </tr>
                  <tr>
			 		 		<td>Name:</td><td><?php echo $row['comp_name']?></td>
			 		 	</tr>
					 	<tr>
		 			 		<td>Gender:</td><td><?php echo $row['gender']?></td>
		 			 	</tr>
                        <tr>
		 			 		<td>Age:</td><td><?php echo $row['age']?></td>
		 			 	</tr>
                        <tr>
			 		 		<td>Occupation:</td><td><?php echo $row['occupation']?></td>
			 		 	</tr>
		 			 	<tr>
			 		 		<td>Address:</td><td><?php echo $row['address']?></td>
					 	</tr> 	
                    </table>
                    <?php
                }
            }
            ?>
            <div class="form-content">
            <div class="form-box">
                  <label for="report">Report</label>
                  <textarea type="text" name="report" cols="60" rows="10"><?php echo $report; ?></textarea>
               </div>
               <div class="form-box">
                  <label for="status">Select Status</label>
                  <select name="status" required>
                     <option select hidden value="<?php echo $status; ?>"><?php if($status==''){echo 'Select';}elseif($status=='Ongoing'){echo 'Ongoing';}else{echo $status;} ?></option>
                     <option value="Ongoing">Ongoing</option>
                     <option value="Closed">Closed</option>
                  </select>
               </div>
            </div>
            <div class="form-btn">
               <button type="submit" name="agent_edit_case">Update Details</button>
            </div>
         </div>
      </div>
   </form>
   <?php
   }else{
      echo "<h4>No such ID found</h4>";
   }
   ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>