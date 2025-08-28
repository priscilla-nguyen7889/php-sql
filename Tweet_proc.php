
<?php 
session_start();
include 'includes/Tweet.php';
Tweet::postTweet($_POST['myTweet']); 
?>