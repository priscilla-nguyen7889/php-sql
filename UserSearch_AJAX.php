<?php
include("connect.php");
include 'includes/User.php';
session_start();
$screen_name = strtolower($_GET["to"]);
$user_id = $_SESSION['SESS_MEMBER_ID'];
$json_out = User::GetUsers($screen_name, $user_id);
echo $json_out;

?>

