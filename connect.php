<?php
//these are defined as constants
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');//password is empty
define('DB_NAME', 'bitter_priscillanguyen');
//define('DB_NAME', 'productsdemo');
global $con;
	  $con = mysqli_connect(DB_HOST,DB_USER,DB_PASS, DB_NAME);
if (!$con)
  {
  die('Could not connect: ' . mysql_error());//.mysql_error()
  }
?>
