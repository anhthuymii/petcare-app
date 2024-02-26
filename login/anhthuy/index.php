<?php
    session_start();
    $conn=mysqli_connect("localhost:3306","root","NEWPASSWORD","login");
    if(isset($_POST['login'])){
        $username=$_POST['username'];
        $password=$_POST['password'];
        // $sql = mysqli_query($conn,"SELECT * FROM user WHERE username='$username' AND password='$password'");
        $sql = mysqli_query($conn,"SELECT * FROM user WHERE username = '". 
        $conn-> real_escape_string($username). "' and password= '" .
            $conn->real_escape_string($password). "'") ;   
        if(mysqli_num_rows($sql)>0){
            echo "<h1>Login successful</h1><h3>Welcome $username</h3>";
        }
        else{
            echo "<h1>Login unsuccessful</h1><h1>Invalid username or password</h1>";
        }
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
                    <form action="" method="post">
                        <h2>Login</h2>
                        <div class="inputbox">
                            <ion-icon name="person-outline"></ion-icon>
                            <input type="username" name="username">
                            <label for="">Username</label>
                        </div>
                        <div class="inputbox">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                            <input type="password" name="password">
                            <label for="">Password</label>
                        </div>
                        <div class="forget">
                            <label for=""><input type="checkbox"> Remember Me
                                <a href="#"> Forget Password ?</a>
                            </label>
                        </div>
                        <div class="btn">
                            <div class="inner"></div>
                            <button type="submit" name="login">Login</button>
                        </div>
                        <div class="register">
                            <p>Don't have a account ? <a href="#">Register</a></p>
                        </div>
                    </form>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script> 
    </body>
</html>
