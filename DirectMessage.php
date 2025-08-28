<?php include_once("connect.php"); 
include 'includes/User.php';
include 'includes/Tweet.php';
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
    <script src="https://code.jquery.com/jquery-3.3.1.js" ></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
	$(document).ready(function() {
	//hide the submit button on page load
	$("#button").hide();
	
	$("#message_form").submit(function() {
		//alert("submit form");
		$("#button").hide();
	});
	$("#message").focus( function() {
        //this will "magically" make the textbox have 5 rows and also
		this.attributes["rows"].nodeValue = 5;
		//show the submit button
		$("#button").show();			
	});//end of click event
        $("#to").keydown(//key down event for the user name textbox
        function(event) {
            if (event.keyCode === 13) {
                //don't do anything if the user types the enter key, it might try to submit the form
                return false;
            }
        }//end anonymous function
        );//end keydown event

        $("#to").keyup(//key up event for the user name textbox        
            function() {                
            jQuery.get(                        
              "UserSearch_AJAX.php",
                $("#message_form").serializeArray(),
                function(data) {//anonymous function
					//uncomment this alert for debugging the directMessage_proc.php page
					//alert(data);  //for debugging
					//clear the users datalist so it starts empty
					$("#dlUsers").empty();
					if (data === "undefined") {
						$("#dlUsers").append("<option value='NO USERS FOUND' label='NO USERS FOUND'></option>");
					}
					$.each(data, function(index, element) {
						//this will loop through the JSON array of users and add them to the select box
						$("#dlUsers").append("<option value='" + element.screen_nameArray + "' data-toId='" + element.idArray + "' label='" + element.full_nameArray + "'></option>");                        
					});
				},
            //change this to "html" for debugging the UserSearch_AJAX.php page
                        //"html"
                     "json"
                    );                                              
                    //make sure the focus stays on the textbox so the user can keep typing
                $("#to").focus();
                return false;
            }    
    ); //end keyup

});//end of ready event handler
    </script>
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
                                    <form method="post" id="message_form" action="DirectMessage_proc.php">
                                        <div class="form-group">
                                            Send message to: <input type="text" id="to" name="to" list="dlUsers" autocomplete="off"><br>
                                            <datalist id="dlUsers">
                                                <!-- this datalist is empty initially but will hold the list of users to select as the user is typing -->
                                               
                                            </datalist>
                                          <input type="hidden" name="userId" value="">
                                            <textarea class="form-control" name="message" id="message" rows="1" placeholder="Enter your message here"></textarea>
                                            <input type="submit" name="button" id="button" value="Send" class="btn btn-primary btn-lg btn-block login-button"/>
                                        </div>
                                    </form>
				</div>
           
                            <h1>Your messages</h1>
				<div class="img-rounded" id="getMeesages">
				<!--display list of messages here-->
                                    <?php User::GetAllMessages(); ?>
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
  
<script src="includes/bootstrap.min.js"></script>
  </body>
</html>

