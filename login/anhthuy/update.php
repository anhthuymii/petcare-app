<?php 
    include 'config.php';
    $user_id =$_POST['user_id'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $hoten = $_POST['hoten'];
    $date = $_POST['date'];
    $gioitinh =$_POST['gioitinh'];


    $insert = $conn->query("UPDATE user SET username ='$username', password = '$password', hoten = '$hoten', email = '$email', date = '$date', gioitinh = '$gioitinh' WHERE user_id = '$user_id' ");
    if($insert){
        echo "success";
    }
    $conn->close();
    return;

?>