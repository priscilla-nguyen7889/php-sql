<?php

include_once 'connect.php';
include 'includes/Tweet.php';
include 'includes/User.php';
session_start();

Tweet::getTweets();
?>