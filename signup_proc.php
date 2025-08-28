<?php 
//insert the user's data into the users table of the DB
//if everything is successful, redirect them to the login page.
//if there is an error, redirect back to the signup page with a friendly message
session_start();
include 'includes/User.php';
if (isset($_POST["firstname"])){
    $fName = $_POST["firstname"];
    $lName = $_POST["lastname"];
    $email = $_POST["email"];
    $username = strtolower($_POST["username"]);
    $password = $_POST["password"];
    $confirmPass = $_POST["confirm"];
    $phone = $_POST["phone"];
    $address = $_POST["address"];
    $province = $_POST["province"];
    $postalCode = $_POST["postalCode"];
    $url = $_POST["url"];
    $desc = $_POST["desc"];
    $location = $_POST["location"];
    
    $user = new User(0, $fName, $lName, $username, $password, $address, $province,$postalCode,$phone, $email,$url, $desc, $location, null, null);
    if (User::validatePostalCode($postalCode, $province)){
        User::createUser($user);
    }
    else {
       $msg = "Invalid Postal Code. Please check your information!";
       header("location:Signup.php?message=$msg"); 
    }
  }

?>