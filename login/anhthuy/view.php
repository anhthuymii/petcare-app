<?php 

    require('config.php');
    
    $query = mysqli_query($conn, "select * from user ORDER BY username");
    $data = mysqli_fetch_all($query, MYSQLI_ASSOC);
    // header('Content-Type: application/json');
    echo json_encode($data);
    $conn->close();
    
    // require('config.php');

    // if (isset($_POST['username']) && isset($_POST['password'])) {
    //     $username = $_POST['username'];
    //     $password = $_POST['password'];

    //     $query = mysqli_query($conn, "SELECT * FROM user WHERE username='$username' AND password='$password'");
    //     $data = mysqli_fetch_assoc($query);
        
    //     if ($data) {
    //         echo json_encode($data);
    //     } else {
    //         echo "User not found";
    //     }
    // } else {
    //     echo "Invalid request";
    // }

    // $conn->close();


// require('config.php');

// function getUserInfo($username, $password) {
//     $conn = new mysqli($servername, $username, $password, $dbname);

//     if ($conn->connect_error) {
//         die("Connection failed: " . $conn->connect_error);
//     }

//     $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";

//     $result = $conn->query($sql);
//     $count = $result->num_rows;

//     if ($count == 1) {
//         $userInfo = $result->fetch_assoc();
//         return $userInfo;
//     } else {
//         return null;
//     }

//     $conn->close();
// }

// if (isset($_POST['username'], $_POST['password'])) {
//     $username = $_POST['username'];
//     $password = $_POST['password'];

//     $userInfo = getUserInfo($username, $password);

//     if ($userInfo) {
//         echo json_encode($userInfo);
//     } else {
//         echo json_encode("Invalid credentials");
//     }
// } else {
//     echo json_encode("Invalid request");
// }



?>