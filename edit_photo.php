<?php
//this page will allow the user to edit their profile photo
include("connect.php"); 
include 'includes/User.php';
?>

<?php
session_start();
if (!isset($_SESSION["SESS_MEMBER_ID"] )){
    header("location:Login.php");
}
include("Includes/message.php");
?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Join to a new world, easy to troll, open network successfully, and make friends easily">
    <meta name="author" content="Priscilla Nguyen, priscillanguyen.lc@gmail.com">
    <link rel="icon" href="favicon.ico">

    <title>Upload profile Photo - Bitter</title>

    <!-- Bootstrap core CSS -->
    <link href="includes/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="includes/starter-template.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	
    <script src="includes/bootstrap.min.js"></script>
    
	
  </head>

  <body>

    <?php include("Includes/headerAfterLogin.php"); ?>
      <BR><BR>
    <form action="edit_photo_proc.php" method="post" enctype="multipart/form-data">
        Please select your image (must be under 5MB): 
        <input type="file" accept = "image/*" name="photo" required="required"><br>
        <input type="submit" name="submit" value="UPLOAD">
    
    </form>
  </body>
</html>