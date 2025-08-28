<?php 
include 'includes/User.php';
session_start();

if (isset($_POST["username"])) {
    $username = strtolower($_POST["username"]);
    $password = $_POST["password"];
    User::Login($password, $username);
}
?>