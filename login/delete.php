<?php
include 'index.php';
$id =$_POST['id'];


$insert = $conn->query(" DELETE FROM member WHERE id= '$id' ");
if($insert){
    echo "success";
}
$conn->close();
return;
?>