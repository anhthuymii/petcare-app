<?php
session_start();

// Kiểm tra đăng nhập
if (isset($_POST['username'], $_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

    $result = $conn->query($sql);
    $count = $result->num_rows;

    if ($count == 1) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        echo json_encode("Success");
    } else {
        echo json_encode("Error");
    }

    $conn->close();
}

// Hàm logout
function logout() {
    session_start();

    // Xóa tất cả các biến session
    $_SESSION = array();

    // Hủy session
    session_destroy();

    // Chuyển hướng đến trang đăng nhập hoặc trang khác
    header("Location: signin.php");
    exit();
}

// Gọi hàm logout khi nhận yêu cầu logout từ ứng dụng
if (isset($_GET['logout'])) {
    logout();
}
?>
