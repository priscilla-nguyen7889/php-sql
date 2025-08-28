<?php
//echo "this page will display a list of all recent likes of the current user's tweets<BR>";
//echo "as well as a list of retweets of a current user's tweets<BR>";
//echo "this will be similar to https://twitter.com/i/notifications";

include("connect.php"); 
include 'includes/Tweet.php';
include 'includes/User.php';
include 'includes/Notification.php';
include("Includes/message.php");
session_start();

if (!isset($_SESSION["SESS_MEMBER_ID"] )){
    header("location:Login.php");
}

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DESC MISSING">
    <meta name="author" content="Priscilla Nguyen, priscillanguyen.lc@gmail.com">
    <link rel="icon" href="favicon.ico">

    <title>Bitter - Social Media for Trolls, Narcissists, Bullies and Presidents</title>

    <!-- Bootstrap core CSS -->
    <link href="includes/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="includes/starter-template.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-1.10.2.js" ></script>
    <script type="text/javascript" src="includes/jquery-3.3.1.min.js"></script>

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
                                            User::getPFP($_SESSION['SESS_MEMBER_ID']);   
                                            
                                            $user = User::getUserByUserID($_SESSION['SESS_MEMBER_ID']);
                                            echo '<a href = "userpage.php?user_id='. $user->userID . '">'. $user->firstName ." ". $user ->lastName.'</a><BR></div>';
                                            
                                            User::displayUserInfo($_SESSION['SESS_MEMBER_ID']);
                                            echo '<img class="icon" src="images/location_icon.jpg">'.$user->province.'<div class="bold">Member Since:</div>';
                                            echo '<div>'. date('F jS Y', strtotime($user->dateCreated)).'</div>';//https://www.php.net/manual/en/datetime.format.php
                                        ?>
                                                                     
                                    </div><BR><BR>
                                    <div class="trending img-rounded">
                                        <div class="bold">Trending</div>
                                    </div>
				
                                </div>
			<div class="col-md-6">
				<div class="img-rounded">
                                    <?php
                                        echo '<h4>Replies</h4><hr>';
                                        Notification::showReplies();
                                        echo '<h4>Likes</h4><hr>';
                                        Notification::showLikes();
                                        echo '<h4>Retweets</h4><hr>';
                                        Notification::showRetweets();
                                    
                                    ?>

				</div>


			</div>
			<div class="col-md-3">
				<div class="whoToTroll img-rounded">
				<div class="bold">Who to Troll?<BR></div>
				<!-- display people you may know here-->
				<?php
                                User::WhoToTroll();  
                                ?>
				
				</div><BR>
				<!--don't need this div for now 
				<div class="trending img-rounded">
				© 2021 Bitter
				</div>-->
			</div>
		</div> <!-- end row -->
    </div><!-- /.container -->
 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster 
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    -->
    <script type="text/javascript" src="includes/jquery-3.3.1.min.js"></script>
    <script src="includes/bootstrap.min.js"></script>
  </body>
</html>

        
        
        