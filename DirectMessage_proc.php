<?php
include 'includes/User.php';
session_start();

if (isset($_POST["to"])){
    $screen_name = $_POST["to"];
    $message_text=$_POST["message"];
    if (User::AddMessages ($screen_name, $message_text)){
        $msg = "Message sent!";
        header ("location:DirectMessage.php?message=$msg");
    }
    else {
        $msg = "Errors happen. Please try again!";
        header ("location:DirectMessage.php?message=$msg");
    }
}

?>


