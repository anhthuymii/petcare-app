<?php
require('config.php');

$response = array();

if (isset($_POST['username'], $_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

    $query = mysqli_query($conn, $sql);

    if (mysqli_num_rows($query) == 1) {
        $data = mysqli_fetch_assoc($query);
        $response['status'] = "Success";
        $response['message'] = "Login successful";
        $response['user'] = $data;
    } else {
        $response['status'] = "Error";
        $response['message'] = "Invalid credentials";
    }
} else {
    $response['status'] = "Error";
    $response['message'] = "Missing credentials";
}

header('Content-Type: application/json');
echo json_encode($response);

$conn->close();
?>
