<?php
require('config.php');
if (isset($_POST['username'], $_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Mã hóa mật khẩu người dùng đã nhập bằng MD5
    $hashedPassword = md5($password);

    $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$hashedPassword'";

    $result = $conn->query($sql);
    $count = $result->num_rows;

    if ($count == 1) {
        echo json_encode("Success");
    } else {
        echo json_encode("Error");
    }

    $conn->close();
}
?>
