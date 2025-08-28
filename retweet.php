<?php
session_start();
include 'includes/Tweet.php';
Tweet::Retweet($_GET['tweet_id']);


