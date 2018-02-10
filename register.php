<?php

 ob_start();
 session_start(); // start a new session or continues the previous
 if( isset($_SESSION['user'])!="" ){
  
  header("Location: home.php"); // redirects to home.php
 }

 include_once 'dbconnect.php';

 $error = false;

 if ( isset($_POST['btn-signup']) ) {
  // sanitize user input to prevent sql injection
  $name = trim($_POST['name']);
  $name = strip_tags($name);
  $name = htmlspecialchars($name);

  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);

  $pass = trim($_POST['password']);
  $pass = strip_tags($pass);
  $pass = htmlspecialchars($pass);

  // basic name validation

  if (empty($name)) {
   $error = true;
   $nameError = "Please enter your full name.";
  } else if (strlen($name) < 3) {
   $error = true;
   $nameError = "Name must have atleat 3 characters.";
  } else if (!preg_match("/^[a-zA-Z ]+$/",$name)) {
   $error = true;
   $nameError = "Name must contain alphabets and space.";
  }

  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = true;
   $emailError = "Please enter valid email address.";
  } else {

   // check whether the email exist or not

   $query = "SELECT email FROM user WHERE email='$email'";
   $result = mysqli_query($conn, $query);
   $count = mysqli_num_rows($result);
   if($count!=0){
    $error = true;
    $emailError = "Provided Email is already in use.";
   }
  }

  // password validation
  if (empty($pass)){
   $error = true;
   $passError = "Please enter password.";
  } else if(strlen($pass) < 5) {
   $error = true;
   $passError = "Password must have atleast 5 characters.";
  }

 
  // password encrypt using SHA256();
  $password = hash('sha256', $pass);

  // if there's no error, continue to signup
  if( !$error ) {

   $query = "INSERT INTO user(name,email,password) VALUES('$name','$email','$password')";
   $res = mysqli_query($conn, $query);

   
   if ($res) {
    $errTyp = "success";
    $errMSG = "Successfully registered, you may login now";
    unset($name);
    unset($email);
    unset($pass);

   } else {
    $errTyp = "danger";
    $errMSG = "Something went wrong, try again later...";
   }
  }

 }
?>

<!DOCTYPE html>
<html>
<head>
<title>Login & Registration System</title>
</head>
<body>


<div class="container">

      <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">

               <h2>Sign Up.</h2><br>
               <hr />


    

      <?php
     if ( isset($errMSG) ) {
      ?>
               <div class="alert">
   <?php echo $errMSG; ?>
               </div>
   <?php
     }
     ?>


               <br><input type="text" name="name" class="form-control" placeholder="Enter Name" maxlength="50" value="<?php echo $name ?>" />

                  <span class="text-danger"><?php echo $nameError; ?></span>

               <input type="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40" value="<?php echo $email ?>" />

                  <span class="text-danger"><?php echo $emailError; ?></span>

               <input type="password" name="password" class="form-control" placeholder="Enter Password" maxlength="15" />

                  <span class="text-danger"><?php echo $passError; ?></span><br><br>

               <hr />

               <br><button type="submit" class="btn btn-block btn-primary" name="btn-signup">Sign Up</button><br><br>

               <hr />

                  <a href="index.php">Sign in Here...</a>
      </form>
  </div>

</div>



</body>
</html>
<?php ob_end_flush(); ?>