<?php
include_once("connect.php"); 
include 'includes/User.php';
include 'includes/Tweet.php';
session_start();

if (!isset($_SESSION["SESS_MEMBER_ID"] )){
    header("location:Login.php");
}
include("Includes/message.php");
$search = $_GET['search'];
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">

    <title>Bitter - Social Media for Trolls, Narcissists, Bullies and Presidents</title>

    <!-- Bootstrap core CSS -->
    <link href="includes/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="includes/starter-template.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-1.10.2.js" ></script>
	
	
  </head>

  <body>

    <?php include("Includes/headerAfterLogin.php"); ?>
    <BR><BR>
    <div class="container">
		
                    
                    <div class="col-md-6">
				<div class="img-rounded">
				<?php 
                                    User::searchUsers($_SESSION['SESS_MEMBER_ID'], $search);
                                    Tweet::searchTweetsText($search);
                                ?>	
				</div>
				<div class="img-rounded">
				
				</div>
                    </div>
                
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="includes/bootstrap.min.js"></script>
    
  </body>
</html>

      