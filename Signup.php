<!DOCTYPE html>
<?php
include("connect.php");
include("Includes/redirectToIndex.php");
include("Includes/message.php");
?>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Troll, open network, and make friends even Presidents">
    <meta name="author" content="Priscilla Nguyen, priscillanguyen.lc@gmail.com">
    <link rel="icon" href="favicon.ico">

    <title>Signup - Bitter</title>

    <!-- Bootstrap core CSS -->
    <link href="includes/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="includes/starter-template.css" rel="stylesheet">
	<!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
	
    <script src="includes/bootstrap.min.js"></script>
    
	<script type="text/javascript">
		//any JS validation you write can go here

            var $ = function (id) {//JS course - Chapter 12
                return document.getElementById(id);
            }

            
            function registerValidate() {
                var myValidator = new validate();
                var myFirstName = $("firstname").value;
                var myLastName = $("lastname").value;
                var myEmail = $("email").value;
                var myUsername = $("username").value;
                var myPassword = $("password").value;
                var myConfirmPW = $("confirm").value;
                var myPhone = $("phone").value;
                var myAddress = $("address").value;
                var myPostalCode = $("postalCode").value;
                var myUrl = $("url").value;
                var myDesc = $("desc").value;
                var myLocation = $("location").value;
                
                if (!myValidator.isEmail(myEmail) || myEmail.length>100){
                    alert("Please enter a valid email (e.g., pn@gmail.com) that is no longer than 100 characters");
                    $("email").value = "";
                    $("email").focus();
                    return false;
                }
                if (myConfirmPW!==myPassword){
                    alert("Please try again. The confirm password has to be the same as your password.");
                    $("confirm").value = "";
                    $("confirm").focus();
                    return false;
                }
                if (!myValidator.isPhone(myPhone) ){//already regulate maximum characters is 10 for phone number in pattern
                    alert("Please enter a valid phone number as format (506) 111-1111");
                    $("phone").value = "";
                    $("phone").focus();
                    return false;
                }
                if (!myValidator.isPostalCode(myPostalCode)){//already regulate maximum characters is 7 in pattern
                    alert("Please enter a valid postal code as format E3B 0R6");
                    $("postalCode").value = "";
                    $("postalCode").focus();
                    return false;
                }
                if (myFirstName.length>50){
                    alert("Please enter the first name that is no longer than 50 character");
                    $("firstname").value = "";
                    $("firstname").focus();
                    return false;
                }
                if (myLastName.length>50){
                    alert("Please enter the last name that is no longer than 50 character");
                    $("lastname").value = "";
                    $("lastname").focus();
                    return false;
                }
                if (myUsername.length>50){
                    alert("Please enter the screenname/username that is no longer than 50 character");
                    $("username").value = "";
                    $("username").focus();
                    return false;
                }
                if (myPassword.length>250){
                    alert("Please enter the password that is no longer than 250 character");
                    $("password").value = "";
                    $("password").focus();
                    return false;
                }
                if (myAddress.length>200){
                    alert("Please enter the address that is no longer than 200 character");
                    $("address").value = "";
                    $("address").focus();
                    return false;
                }
                if (myUrl.length>50){
                    alert("Please enter the Url that is no longer than 50 character");
                    $("url").value = "";
                    $("url").focus();
                    return false;
                }
                if (myDesc.length>160){
                    alert("Please enter the description that is no longer than 160 character");
                    $("desc").value = "";
                    $("desc").focus();
                    return false;
                }
                if (myLocation.length>50){
                    alert("Please enter the Location that is no longer than 50 character");
                    $("location").value = "";
                    $("location").focus();
                    return false;
                }

            }
            
            var validate = function (){
                this.isBlank = function (text) {
                    return (text =="");
                };
                this.isEmail = function(text) {
                    var pattern = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
                    return pattern.test(text);
                };
                this.isPhone = function (text){
                    var pattern = /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/;//https://stackoverflow.com/questions/16699007/regular-expression-to-match-standard-10-digit-phone-number
                    return pattern.test(text);
                };
                this.isPostalCode = function (text){
                    var pattern = /^[a-z][0-9][a-z][- ]?[0-9][a-z][0-9]$/i;//https://stackoverflow.com/questions/11149678/validate-canadian-postal-code-regex/14259579
                    return pattern.test(text);
                };

            };
            
            
            window.onload = function() {
                $("registration_form").onsubmit = registerValidate;//https://www.w3schools.com/jsref/event_onsubmit.asp, https://stackoverflow.com/questions/6908187/form-onsubmit-versus-submit-button-onclick
            }
         


	</script>
  </head>

  <body>

    <?php include("Includes/header.php"); ?>

	<BR><BR>
    <div class="container">
		<div class="row">
			
			<div class="main-login main-center">
				<h5>Sign up once and troll as many people as you like!</h5>
					<form method="post" id="registration_form" action="signup_proc.php">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">First Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="firstname" id="firstname"  placeholder="Enter your First Name"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Last Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="lastname" id="lastname"  placeholder="Enter your Last Name"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="email" id="email"  placeholder="Enter your Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Screen Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="username" id="username"  placeholder="Enter your Screen Name"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="password" class="form-control" required name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="password" class="form-control" required name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Phone Number</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="phone" id="phone"  placeholder="Enter your Phone Number"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="address" id="address"  placeholder="Enter your Address"/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Province</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<select name="province" id="province" class="textfield1" required><?php echo $vprovince; ?> 
										<option> </option>
										<option value="British Columbia">British Columbia</option>
										<option value="Alberta">Alberta</option>
										<option value="Saskatchewan">Saskatchewan</option>
										<option value="Manitoba">Manitoba</option>
										<option value="Ontario">Ontario</option>
										<option value="Quebec">Quebec</option>
										<option value="New Brunswick">New Brunswick</option>
										<option value="Prince Edward Island">Prince Edward Island</option>
										<option value="Nova Scotia">Nova Scotia</option>
										<option value="Newfoundland and Labrador">Newfoundland and Labrador</option>
										<option value="Northwest Territories">Northwest Territories</option>
										<option value="Nunavut">Nunavut</option>
										<option value="Yukon">Yukon</option>
									  </select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Postal Code</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="postalCode" id="postalCode"  placeholder="Enter your Postal Code"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Url</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="url" id="url"  placeholder="Enter your URL"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Description</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" required name="desc" id="desc"  placeholder="Description of your profile"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Location</label>
							<div class="cols-sm-10">
								<div class="input-group">
									
									<input type="text" class="form-control" name="location" id="location"  placeholder="Enter your Location"/>
								</div>
							</div>
						</div>
						
						
						<div class="form-group ">
							<input type="submit" name="button" id="button" value="Register" class="btn btn-primary btn-lg btn-block login-button"/>
							
						</div>
						
					</form>
				</div>
			
		</div> <!-- end row -->
    </div><!-- /.container -->

  </body>
</html>