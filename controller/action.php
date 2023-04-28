<?php

include('../config/connection.php');
$date_time = date('Y-m-d H:i:s');

if(isset($_POST['add_staff'])){

    $staff_id = mysqli_real_escape_string($conn, $_POST["staff_id"]);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $station = mysqli_real_escape_string($conn, $_POST["station"]);
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);
    $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
    $cpass = mysqli_real_escape_string($conn, md5($_POST['cpassword']));
    $status = mysqli_real_escape_string($conn, $_POST['status']);
    $rank = mysqli_real_escape_string($conn, $_POST['rank']);
 
    $select = " SELECT * FROM users WHERE staff_id = '$staff_id' && password = '$pass' ";
 
    $result = mysqli_query($conn, $select);
 
    if(mysqli_num_rows($result) > 0){
 
       $error[] = 'User already exist!';
 
    }else{
 
       if($pass != $cpass){
          $error[] = 'Password does not match!';
       }else{
          $insert = "INSERT INTO users(staff_id, name, station, gender, password, status, rank) VALUES(?, ?, ?, ?, ?, ?, ?)";
          $stmt = mysqli_stmt_init($conn);
          $prepareStmt = mysqli_stmt_prepare($stmt,$insert);
          if ($prepareStmt) {
             mysqli_stmt_bind_param($stmt,"issssss",$staff_id, $name, $station, $gender, $pass, $status, $rank);
             mysqli_stmt_execute($stmt);

            require_once'../incharge_officer/inchargemenu.php';
            $incharge_name = $rows['name'];
            $incharge_id = $rows['staff_id'];
            $incharge_station = $rows['station'];
            $incharge_rank = $rows['rank'];
 
             $audit_trail_file = fopen('audit_trail.log', 'a');
 
             $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tAdded $name($staff_id - $rank) to their station staff list\n";
             fwrite($audit_trail_file, $log_message);
 
             fclose($audit_trail_file);
 
             echo "<script type='text/javascript'>alert('Staff Registered Successfully');
             document.location='../incharge_officer/viewstaff.php'</script>";
          }else{
              die("Something went wrong");
          }
          
       }
    }
 
};

if (isset($_POST['admin_delete_staff']))
{
    $staff_id = mysqli_real_escape_string($conn, $_POST['admin_delete_staff']);

    $query = "DELETE FROM users WHERE staff_id = '$staff_id'";
    $result = mysqli_query($conn, $query);

    if($result){
        $_SESSION['message'] = "Staff deleted Successfully";
        header("Location: ../admin/viewstaff.php");
        exit(0);
    }
    else{
        $_SESSION['message'] = "Error! Staff not deleted";
        header("Location: ../admin/viewstaff.php");
        exit(0);
    }
}

if (isset($_POST['delete_staff']))
{
    $staff_id = mysqli_real_escape_string($conn, $_POST['delete_staff']);

    $query = "DELETE FROM users WHERE staff_id = '$staff_id'";
    $result = mysqli_query($conn, $query);

    if($result){
        require_once'../incharge_officer/inchargemenu.php';
        $incharge_name = $rows['name'];
        $incharge_id = $rows['staff_id'];
        $incharge_station = $rows['station'];
        $incharge_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tDeleted staff $staff_id from their station staff list\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        $_SESSION['message'] = "Staff deleted Successfully";
        header("Location: ../incharge_officer/viewstaff.php");
        exit(0);
    }
    else{
        $_SESSION['message'] = "Error! Staff not deleted";
        header("Location: ../incharge_officer/viewstaff.php");
        exit(0);
    }
}

if(isset($_POST['edit_staff']))
{
    $staff_id = mysqli_real_escape_string($conn, $_POST['staff_id']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $rank = mysqli_real_escape_string($conn, $_POST['rank']);

    $query = "UPDATE users SET name='$name', rank='$rank' WHERE staff_id='$staff_id' ";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        require_once'../incharge_officer/inchargemenu.php';
        $incharge_name = $rows['name'];
        $incharge_id = $rows['staff_id'];
        $incharge_station = $rows['station'];
        $incharge_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tUpdated staff details for $staff_id\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        echo "<script type='text/javascript'>alert('Staff Details Updated Successfully');
        document.location='../incharge_officer/viewstaff.php'</script>";
        exit(0);
    }
    else
    {
        $_SESSION['message'] = "Error! Staff Details Not Updated";
        header("Location: ../incharge_officer/editstaff.php");
        exit(0);
    }
}

if(isset($_POST['update_pass']))
{
    $staff_id = mysqli_real_escape_string($conn, $_POST['staff_id']);
    $old_pass = md5($_POST['old_pass']);
    $new_pass = md5($_POST['new_pass']);
    $cnew_pass = md5($_POST['cnew_pass']);

    if(!empty($staff_id))
    {
        if(!empty($old_pass) && !empty($new_pass) && !empty($cnew_pass))
        {
            $check_staff = "SELECT staff_id FROM users WHERE staff_id='$staff_id' LIMIT 1";
            $result = mysqli_query($conn, $check_staff);

            if(mysqli_num_rows($result) > 0)
            {
                if($new_pass == $cnew_pass)
                {
                    $update_pass = "UPDATE users SET password='$new_pass' WHERE staff_id='$staff_id' LIMIT 1";
                    $update_pass_run = mysqli_query($conn, $update_pass);

                    if($update_pass_run)
                    {
                        echo "<script type='text/javascript'>alert('Password Updated Successfully. Login with new password');
                        document.location='../incharge_officer/viewstation.php'</script>";
                        exit(0);
                    }
                    else
                    {
                        $_SESSION['message'] = "Error! Update Failed";
                        header("Location: ../incharge_officer/editprofile.php");
                        exit(0);
                    }
                }
                else
                {
                    $_SESSION['message'] = "Confirm password does not match with new password!";
                    header("Location: ../incharge_officer/viewstaff.php");
                    exit(0);
                }
            }
        }
        else
        {
            $_SESSION['message'] = "All fields should be filled";
            header("Location: ../incharge_officer/viewstaff.php");
            exit(0);
        }
    }
}

if (isset($_POST['delete_station']))
{
    $station = mysqli_real_escape_string($conn, $_POST['delete_station']);

    $query = "DELETE FROM stations WHERE station = '$station'";
    $result = mysqli_query($conn, $query);

    if($result){
        $_SESSION['message'] = "Station deleted Successfully";
        header("Location: ../admin/viewstation.php");
        exit(0);
    }
    else{
        $_SESSION['message'] = "Error! Station not deleted";
        header("Location: ../admin/viewstation.php");
        exit(0);
    }
}


if(isset($_POST['edit_station']))
{
    $station = mysqli_real_escape_string($conn, $_POST['station']);
    $address = mysqli_real_escape_string($conn, $_POST['address']);
    $location = mysqli_real_escape_string($conn, $_POST['location']);
    $phone = mysqli_real_escape_string($conn, $_POST['phone']);

    $query = "UPDATE stations SET address='$address', location='$location', phone='$phone' WHERE station='$station' ";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        echo "<script type='text/javascript'>alert('Station Details Updated Successfully');
        document.location='../incharge_officer/viewstation.php'</script>";
        exit(0);
    }
    else
    {
        $_SESSION['message'] = "Error! Station Details Not Updated";
        header("Location: ../incharge_officer/editstation.php");
        exit(0);
    }
}

if (isset($_POST['delete_case']))
{
    $ob_number = mysqli_real_escape_string($conn, $_POST['delete_case']);

    $query = "DELETE FROM cases WHERE ob_number = '$ob_number'";
    $result = mysqli_query($conn, $query);

    if($result){
        require_once'../incharge_officer/inchargemenu.php';
        $incharge_name = $rows['name'];
        $incharge_id = $rows['staff_id'];
        $incharge_station = $rows['station'];
        $incharge_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tDeleted Case with OB Number $ob_number from their station case list\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        $_SESSION['message'] = "Case deleted Successfully";
        header("Location: ../incharge_officer/viewcase.php");
        exit(0);
    }
    else{
        $_SESSION['message'] = "Error! Case not deleted";
        header("Location: ../incharge_officer/viewcase.php");
        exit(0);
    }
}

if(isset($_POST['incharge_edit_case']))
{
    $ob_number = mysqli_real_escape_string($conn, $_POST['ob_number']);
    $crime_type = mysqli_real_escape_string($conn, $_POST['crime_type']);
    $statement = mysqli_real_escape_string($conn, $_POST['statement']);

    $query = "UPDATE cases SET crime_type='$crime_type', statement='$statement' WHERE ob_number='$ob_number'";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        require_once'../incharge_officer/inchargemenu.php';
        $incharge_name = $rows['name'];
        $incharge_id = $rows['staff_id'];
        $incharge_station = $rows['station'];
        $incharge_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tUpdated Case details for OB Number $ob_number\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        echo "<script type='text/javascript'>alert('Case Details Updated Successfully');
        document.location='../incharge_officer/viewcase.php'</script>";
        exit(0);
    }
    else
    {
        $_SESSION['message'] = "Error! Case Details Not Updated";
        header("Location: ../incharge_officer/editcase.php");
        exit(0);
    }
}

if(isset($_POST['incharge_assign_case'])){
    $ob_number = mysqli_real_escape_string($conn, $_POST['ob_number']);
    $crime_type = mysqli_real_escape_string($conn, $_POST['crime_type']);
    $investigator = mysqli_real_escape_string($conn, $_POST['investigator']);

    $query = "UPDATE cases SET investigator='$investigator' WHERE ob_number='$ob_number'";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        require_once'../incharge_officer/inchargemenu.php';
        $incharge_name = $rows['name'];
        $incharge_id = $rows['staff_id'];
        $incharge_station = $rows['station'];
        $incharge_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$incharge_name,\t$incharge_id,\t$incharge_rank,\t$incharge_station,\tAssigned Case with OB Number $ob_number to $investigator\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        echo "<script type='text/javascript'>alert('Case Assigned Successfully');
        document.location='../incharge_officer/viewcase.php'</script>";
        exit(0);
    }
    else
    {
        $_SESSION['message'] = "Something Went Wrong! Case Details Not Updated";
        header("Location: ../incharge_officer/viewcase.php");
        exit(0);
    }
}

if(isset($_POST['police_assign_case'])){
    $ob_number = mysqli_real_escape_string($conn, $_POST['ob_number']);
    $crime_type = mysqli_real_escape_string($conn, $_POST['crime_type']);
    $investigator = mysqli_real_escape_string($conn, $_POST['investigator']);

    $query = "UPDATE cases SET investigator='$investigator' WHERE ob_number='$ob_number'";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        require_once'../police/policemenu.php';
        $police_name = $rows['name'];
        $police_id = $rows['staff_id'];
        $police_station = $rows['station'];
        $police_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$police_name,\t$police_id,\t$police_rank,\t$police_station,\tAssigned Case with OB Number $ob_number to $investigator\n";
        fwrite($audit_trail_file, $log_message);

        fclose($audit_trail_file);

        echo "<script type='text/javascript'>alert('Case Assigned Successfully');
        document.location='../police/viewcase.php'</script>";
        exit(0);
    }
    else
    {
        $_SESSION['message'] = "Something Went Wrong! Case Details Not Updated";
        header("Location: ../police/viewcase.php");
        exit(0);
    }
}

if(isset($_POST['agent_edit_case']))
{
    $ob_number = mysqli_real_escape_string($conn, $_POST['ob_number']);
    $report = mysqli_real_escape_string($conn, $_POST['report']);
    $status = mysqli_real_escape_string($conn, $_POST['status']);

    $query = "UPDATE cases SET report='$report', status='$status' WHERE ob_number='$ob_number'";
    $result = mysqli_query($conn, $query);

    if($result)
    {
        require_once'../police_undercover_agent/agentmenu.php';
        $agent_name = $rows['name'];
        $agent_id = $rows['staff_id'];
        $agent_station = $rows['station'];
        $agent_rank = $rows['rank'];

        $audit_trail_file = fopen('audit_trail.log', 'a');

        $log_message = "$date_time,\t$agent_name,\t$agent_id,\t$agent_rank,\t$agent_station,\tUpdated Case details for OB Number $ob_number\n";
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

if(isset($_POST['add_complainant'])){

    $comp_name = $_POST['comp_name'];
    $tel = $_POST['tel'];
    $occupation = $_POST['occupation'];
    $age = $_POST['age'];
    $address = $_POST['address'];
    $region = $_POST['region'];
    $gender = $_POST['gender'];
    $crime_type = $_POST['crime_type'];
    $location = $_POST['location'];
    $station_reported = $_POST['station_reported'];
    $ob_number = $_POST['ob_number'];
 
    $insert = "INSERT INTO complainants(comp_name, tel, occupation, age, address, region, gender, crime_type, location, station_reported, ob_number) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_stmt_init($conn);
    $prepareStmt = mysqli_stmt_prepare($stmt,$insert);
    if ($prepareStmt) {
       mysqli_stmt_bind_param($stmt,"sssisssssss", $comp_name, $tel, $occupation, $age, $address, $region, $gender, $crime_type, $location, $station_reported, $ob_number);
       mysqli_stmt_execute($stmt);

       require_once'../police/policemenu.php';
       $police_name = $rows['name'];
       $police_id = $rows['staff_id'];
       $police_station = $rows['station'];
       $police_rank = $rows['rank'];

       $audit_trail_file = fopen('audit_trail.log', 'a');
 
       $log_message = "$date_time,\t$police_name,\t$police_id,\t$police_rank,\t$police_station,\tAdded a new Complainant($comp_name) with OB Number $ob_number\n";
       fwrite($audit_trail_file, $log_message);

       fclose($audit_trail_file);
       }else{
           die("Something went wrong");
       }
       header('Location: ../police/addcase.php');
}

if(isset($_POST['add_case'])){

    $recorded_by = $_POST['recorded_by'];
    $station = $_POST['station'];
    $ob_number = $_POST['ob_number'];
    $crime_type = $_POST['crime_type'];
    $statement = $_POST['statement'];
 
    $insert = "INSERT INTO cases(recorded_by, station, ob_number, crime_type, statement) VALUES(?, ?, ?, ?, ?)";
    $stmt = mysqli_stmt_init($conn);
    $prepareStmt = mysqli_stmt_prepare($stmt,$insert);
    if ($prepareStmt) {
       mysqli_stmt_bind_param($stmt,"issss", $recorded_by, $station, $ob_number, $crime_type, $statement);
       mysqli_stmt_execute($stmt);

       require_once'../police/policemenu.php';
       $police_name = $rows['name'];
       $police_id = $rows['staff_id'];
       $police_station = $rows['station'];
       $police_rank = $rows['rank'];

       $audit_trail_file = fopen('audit_trail.log', 'a');
 
       $log_message = "$date_time,\t$police_name,\t$police_id,\t$police_rank,\t$police_station,\tAdded a new Case with OB Number $ob_number\n";
       fwrite($audit_trail_file, $log_message);

       fclose($audit_trail_file);

       echo "<script type='text/javascript'>alert('Case Added Successfully');
       document.location='viewcase.php'</script>";
       }else{
          die("Something went wrong");
       }
       header('Location: ../police/viewcase.php');
}
?>