<?php

 ob_start();
 session_start();
 require_once 'dbconnect.php';

 // if session is not set this will redirect to login page

 if( !isset($_SESSION['user']) ) {
  header("Location: index.php");
  exit;
 }

 // select logged-in users detail

 $res=mysqli_query($conn, "SELECT * FROM user WHERE user_id=".$_SESSION['user']);
 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

?>

<!DOCTYPE html>
<html>
<head>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
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





<div class="container">
         <h2>   Hi' <?php echo $userRow['userEmail']; ?>
            <a href="logout.php?logout">Sign Out</a></h2>
</div>

<?php

              $sql = "SELECT ISBN ,title , type,photo,short_description,publish_date,status FROM media where type = 'CD'";
    
                $result = $conn->query($sql);//$result = mysqli_query($mysqli,$sql)
                if (!$result) {
                  echo "sql query failed";
              } 

              $rows=$result->fetch_all(MYSQLI_ASSOC);
              echo "<div class='container' style='margin-top:75px;'><h1>Media CD Info</h1><table class='table table-striped'><thead><tr><th>ISBN code</th><th>title</th><th>media_type</th><th>photo</th><th>short_description</th><th>publish date</th><th>status</th></tr></thead><tbody>";
            foreach($rows as $row){
              echo "<tr><td>";
                echo $row['ISBN'];
                echo "</td><td>";
                echo $row['title'];
                echo "</td><td>";
                echo $row['type'];
                echo "</td><td>";
                echo "<img src='";
                echo $row['photo'];
                echo "' width='75'></td>";
                echo "<td>";
                echo $row['short_description'];
                echo "</td><td>";
                echo $row['publish_date'];
                echo "</td><td>";
                echo $row['status'];
                echo "</td></tr>";

            }
              echo "</tbody></table></div>";
              ?>

              <?php

              $sql2 = "SELECT ISBN ,title , type,photo,short_description,publish_date,status FROM media where type = 'DVD'";
    
                $result = $conn->query($sql2);//$result = mysqli_query($mysqli,$sql)
                if (!$result) {
                  echo "sql query failed";
              } 

              $rows=$result->fetch_all(MYSQLI_ASSOC);
              echo "<div class='container' style='margin-top:75px;'><h1>Media DVD Info</h1><table class='table table-striped'><thead><tr><th>ISBN code</th><th>title</th><th>media_type</th><th>photo</th><th>short_description</th><th>publish date</th><th>status</th></tr></thead><tbody>";
            foreach($rows as $row){
              echo "<tr><td>";
                echo $row['ISBN'];
                echo "</td><td>";
                echo $row['title'];
                echo "</td><td>";
                echo $row['type'];
                echo "</td><td>";
                echo "<img src='";
                echo $row['photo'];
                echo "' width='75'></td>";
                echo "<td>";
                echo $row['short_description'];
                echo "</td><td>";
                echo $row['publish_date'];
                echo "</td><td>";
                echo $row['status'];
                echo "</td></tr>";

            }
              echo "</tbody></table></div>";
              ?>

              <?php

              $sql3 = "SELECT ISBN ,title , type,photo,short_description,publish_date,status FROM media where type = 'book'";
    
                $result = $conn->query($sql3);//$result = mysqli_query($mysqli,$sql)
                if (!$result) {
                  echo "sql query failed";
              } 

              $rows=$result->fetch_all(MYSQLI_ASSOC);
              echo "<div class='container' style='margin-top:75px;'><h1>Media book Info</h1><table class='table table-striped'><thead><tr><th>ISBN code</th><th>title</th><th>media_type</th><th>photo</th><th>short_description</th><th>publish date</th><th>status</th></tr></thead><tbody>";
            foreach($rows as $row){
              echo "<tr><td>";
                echo $row['ISBN'];
                echo "</td><td>";
                echo $row['title'];
                echo "</td><td>";
                echo $row['type'];
                echo "</td><td>";
                echo "<img src='";
                echo $row['photo'];
                echo "' width='75'></td>";
                echo "<td>";
                echo $row['short_description'];
                echo "</td><td>";
                echo $row['publish_date'];
                echo "</td><td>";
                echo $row['status'];
                echo "</td></tr>";

            }
              echo "</tbody></table></div>";
              ?>


 </div>

</body>
</html>
<?php ob_end_flush(); ?>