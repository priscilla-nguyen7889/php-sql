<?php include_once("connect.php"); 
include 'includes/User.php';
include 'includes/Tweet.php';

?>
<?php
//this is the main page for our Bitter website, 
//it will display all tweets from those we are trolling
//as well as recommend people we should be trolling.
//you can also post a tweet from here

session_start();

if (!isset($_SESSION["SESS_MEMBER_ID"] )){
    header("location:Login.php");
}

include("Includes/message.php");
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="DESC MISSING">
    <meta name="author" content="Nick Taggart, nick.taggart@nbcc.ca">
    <link rel="icon" href="favicon.ico">

    <title>Bitter - Social Media for Trolls, Narcissists, Bullies and Presidents</title>

    <!-- Bootstrap core CSS -->
    <link href="includes/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="includes/starter-template.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-1.10.2.js" ></script>
    <script type="text/javascript" src="includes/jquery-3.3.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>//<!AJAX CODE: -- https://www.codexworld.com/jquery-popup-contact-form-with-email-using-ajax-php/#google_vignette, https://www.youtube.com/watch?v=7Gj_zWCHTIk -->
	
	<script>
	//just a little jquery to make the textbox appear/disappear like the real Twitter website does

        // Get the modal
        var modal = $('#modalDialog');

        // Get the <span> element that closes the modal
        var span = $(".close");
	$(document).ready(function() {
		//hide the submit button on page load
		$("#button").hide();
		$("#tweet_form").submit(function() {
			
			$("#button").hide();
		});
		$("#myTweet").click( function() {			
			this.attributes["rows"].nodeValue = 5;
			$("#button").show();
			
		});//end of click event
		$("#myTweet").blur( function() {			
			this.attributes["rows"].nodeValue = 1;
                        //$("#button").hide();

		});//end of click event

                //open  modal
                $(document).on('click', '.reply', function () {
                    var replyToId = $(this).attr("id");
                    $('#replyToId').val(replyToId);
                    $("#modalDialog").modal('show') ;
                    $('#messageReply').focus();
                     });

                // When the user clicks on <span> (x), close the modal
                span.on('click', function() {
                   $("#modalDialog").hide();
                });
                
                //submit
                $('#replyForm').submit(function(e){
                    e.preventDefault();
                    var formData = $(this).serialize();
                    $.ajax({
                        url: 'reply.php',
                        method: "POST",
                        data: formData,
                        success: function(data){
                            $('#replyForm')[0].reset();//https://stackoverflow.com/questions/42051048/how-to-refresh-modal-body-when-submit-ajax-post
                            $("#modalDialog").modal('hide') ;//https://stackoverflow.com/questions/32481278/how-to-clear-data-of-bootstrap-modal-at-the-time-of-submit
                            showReply();
                        }
                            
                });//end Ajax
            });//end submit form
    
                showReply();
                function showReply(){
                    $.ajax({
                        url: "showReply.php",
                        method:"POST",
                        success: function (data){
                            $("#getTweets").html(data);
                        }
                    });//end Ajax
              }//end showReply
	});//end of ready event handler
    
        // When the user clicks anywhere outside of the modal, close it
        $('body').bind('click', function(e){
            if($(e.target).hasClass("modal")){
                modal.hide();
            }
        });
        
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
					<form method="post" id="tweet_form" action="tweet_proc.php">
					<div class="form-group">
						<textarea class="form-control" name="myTweet" id="myTweet" rows="1" placeholder="What are you bitter about today?"></textarea>
						<input type="submit" name="button" id="button" value="Send" class="btn btn-primary btn-lg btn-block login-button"/>
						
					</div>
					</form>
				</div>
                            <!--FORM FOR AJAX REPLY: (Edit form size: https://stackoverflow.com/questions/42896820/modal-width-increase)-->
                                <div id="modalDialog" class=" modal modal-dialog mw-100 w-75">
                                    <div class="modal-content animate-top">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Add comment</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <form method="post" id="replyForm">
                                        <div class="modal-body">
                                            <!-- Form submission status -->
                                            <div class="response"></div>

                                            <!-- Contact form -->
                                            <div class="form-group">
                                                
                                                <input type ="hidden" name ="replyToId" id="replyToId" value="0"/>
                                                
                                                <textarea name="messageReply" id="messageReply" class="form-control" placeholder="Enter your comment" rows="6"></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <!-- Submit button -->
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
				<div class="img-rounded" id="getTweets">
				<!--display list of tweets here-->
                                    <?php Tweet::getTweets(); ?>
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
