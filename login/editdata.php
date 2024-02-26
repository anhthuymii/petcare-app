<?php
include 'index.php';
$id =$_POST['id'];
$name = $_POST['name'];
$type = $_POST['type'];
$breed = $_POST['breed'];
$sex = $_POST['sex'];
$descs =$_POST['descs'];
$age = $_POST['age'];
$weight = $_POST['weight'];
$image=$_POST['image'];

$insert = $conn->query("UPDATE member SET name ='$name', type = '$type', breed = '$breed', sex = '$sex', descs = '$descs',age = '$age',weight = '$weight',
image = '$image' WHERE id = '$id' ");
if($insert){
    echo "success";
}
$conn->close();
return;
?>