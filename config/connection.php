<?php

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "digital_ob";

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if(!$conn){
  die("Failed to connect!");
}

?>