<?php
    session_start();
    $conn=mysqli_connect("localhost","root","NEWPASSWORD","login");
    if(!isset($_SESSION['username'])){
        header("location:index.php");
        die();
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="index.css">
        <title>LOGIN</title>
    </head>
    <body>
        <section>
        <div class="form-box">
            <h2>
                <ion-icon name="heart-circle-outline"></ion-icon>
                Welcome <?php echo $_SESSION['username'] ?>
                <ion-icon name="heart-circle-outline"></ion-icon>
            </h2>
                <br><p>Click here to <a href = "index.php">Logout</a></p>
                <ion-icon name="arrow-forward-circle-outline"></ion-icon>
        </div>
            
        </section>
        
    </body>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 

</html>