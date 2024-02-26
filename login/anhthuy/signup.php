<?php
require('config.php');

if (isset($_POST['username'], $_POST['hoten'], $_POST['email'], $_POST['password'], $_POST['gioitinh'], $_POST['date'])) {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $hoten = $_POST['hoten'];
    $password = md5($_POST['password']); // Mã hóa MD5 cho mật khẩu
    $gioitinh = $_POST['gioitinh'];
    $date = $_POST['date'];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT username FROM user WHERE username = '$username'";

    $result = $conn->query($sql);
    $count = $result->num_rows;

    if ($count == 1) {
        echo json_encode("Error");
    } else {
        $insert = "INSERT INTO user(user_id, username, password, email, date, gioitinh, hoten) VALUES ('$username','$password','$email','$date','$gioitinh','$hoten')";
        $query = $conn->query($insert);

        if ($query) {
            echo json_encode("Success");
        }
    }

    $conn->close();
} else {
    echo "Incomplete data received";
}
?>
