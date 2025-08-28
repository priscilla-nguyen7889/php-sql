<?php

include_once("connect.php"); 
include("Includes/message.php");
include 'includes/Tweet.php';
session_start();

if (isset($_GET['tweet_id'])){
    Tweet::insertLike($_GET['tweet_id'], $_SESSION["SESS_MEMBER_ID"]);
}

?>

