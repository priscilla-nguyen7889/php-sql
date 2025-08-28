<?php
//displays all the details for a particular Bitter user
include_once("connect.php"); 
include 'includes/User.php';
include 'includes/Tweet.php';
session_start();

if (!isset($_SESSION["SESS_MEMBER_ID"] )){
    header("location:Login.php");
}

include("Includes/message.php");
$id = $_GET['user_id'];
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
		<div class="row">
			<div class="col-md-3">
				<div class="mainprofile img-rounded">
				<div class="bold">
				<?php
                                    User::getPFP($id);   
                                    $user = User::getUserByUserID($id);
                                    echo '<a href = "userpage.php?user_id='. $user->userID . '">'. $user->firstName ." ". $user ->lastName.'</a><BR></div>';
                                        
                                    User::displayUserInfo($id);

                                    echo '<img class="icon" src="images/location_icon.jpg">'.$user->province.'<div class="bold">Member Since:</div>';
                                    echo '<div>'. date('F jS Y', strtotime($user->dateCreated)).'</div>';//https://www.php.net/manual/en/datetime.format.php
                                ?>
				</div><BR><BR>
				
				<div class="trending img-rounded">
				<div class="bold">
                                    <?php
                                    User::displaySameFollowers($id);
                                    ?>
				</div>
				</div>
				
			</div>
			<div class="col-md-6">
				<div class="img-rounded">
				<?php Tweet::displayTweetsRetweets($id);?>	
				</div>
				<div class="img-rounded">
				
				</div>
			</div>
			<div class="col-md-3">
				<div class="whoToTroll img-rounded">
				<div class="bold">Who to Troll?<BR></div>
				<?php
                                User::WhoToTroll();  
                                ?>				
				
				</div><BR>
				
			</div>
		</div> <!-- end row -->
    </div><!-- /.container -->

	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="includes/bootstrap.min.js"></script>
    
  </body>
</html>
