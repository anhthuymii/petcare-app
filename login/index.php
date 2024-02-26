<?php
   
   $servername = "localhost";
   $username = "root";
   $password = "NEWPASSWORD";
   $dbname = "login";
  
   $conn = new mysqli($servername, $username,$password,$dbname);
   if($conn->connect_error){
    die("Connection failed:" .$conn->connect_error);
    return ;
   }
   
?>
