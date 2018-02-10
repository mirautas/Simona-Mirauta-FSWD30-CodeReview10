<?php
 ob_start();
 session_start();
 require_once 'dbconnect.php';

 
 // it will never let you open index(login) page if session is set

 if ( isset($_SESSION['user'])!="" ) {
  header("Location: home.php");
  exit;
 }

 $error = false;

 
 if( isset($_POST['btn-login']) ) {

 
  // prevent sql injections/ clear user invalid inputs

  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);

 
  $pass = trim($_POST['pass']);
  $pass = strip_tags($pass);
  $pass = htmlspecialchars($pass);

  // prevent sql injections / clear user invalid inputs

 
  if(empty($email)){
   $error = true;
   $emailError = "Please enter your email address.";
  } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = true;
   $emailError = "Please enter valid email address.";
  }

 
  if(empty($pass)){
   $error = true;
   $passError = "Please enter your password.";
  }

 
  // if there's no error, continue to login

  if (!$error) {

   
   $password = hash('sha256', $pass); // password hashing using SHA256

 

   $res=mysqli_query($conn, "SELECT user_id, name, password FROM user WHERE email='$email'");
   $row=mysqli_fetch_array($res, MYSQLI_ASSOC);
   $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row


   if( $count == 1 && $row['password']==$password ) {
    $_SESSION['user'] = $row['user_id'];
    header("Location: home.php");
   } else {
    $errMSG = "Incorrect Credentials, Try again...";
   }

   
  }

 }

?>

<!DOCTYPE html>

<html>
<head>
    <title>Login & Registration System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bootstrap.css" media="all">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap.css" media="all">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>






<style>


.form-gradient .header {
  border-top-left-radius: .3rem;
  border-top-right-radius: .3rem; }

.form-gradient input[type=text]:focus:not([readonly]) {
  border-bottom: 1px solid #fd9267;
  -webkit-box-shadow: 0 1px 0 0 #fd9267;
  box-shadow: 0 1px 0 0 #fd9267; }

.form-gradient input[type=text]:focus:not([readonly]) + label {
  color: #4f4f4f; }

.form-gradient input[type=password]:focus:not([readonly]) {
  border-bottom: 1px solid #fd9267;
  -webkit-box-shadow: 0 1px 0 0 #fd9267;
  box-shadow: 0 1px 0 0 #fd9267; }

.form-gradient input[type=password]:focus:not([readonly]) + label {
  color: #4f4f4f; }
                

</style>

</head>
<body>


<div class="container">

    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">

             <h2>Sign In.</h2><br>
             <hr />
            <?php

   if ( isset($errMSG) ) {



echo $errMSG; ?>

                <?php
   }

   ?>

          
          
             <br><input type="email" name="email" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" />

             <span class="text-danger"><?php echo $emailError; ?></span>


             <input type="password" name="pass" class="form-control" placeholder="Your Password" maxlength="15" />

         
            <span class="text-danger"><?php echo $passError; ?></span><br>

             <hr />

             <button type="submit" name="btn-login">Sign In</button><br>

             <hr /><br>

   
             <a href="register.php">Sign Up Here...</a>

      
    </form>
</div>



    </div>


</div>






</section>



</div>





</body>

</html>

<?php ob_end_flush(); ?>