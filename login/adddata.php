<?php
include 'index.php';
$name = $_POST['name'];
$type = $_POST['type'];
$breed = $_POST['breed'];
$sex = $_POST['sex'];
$descs =$_POST['descs'];
$age = $_POST['age'];
$weight = $_POST['weight'];
$image=$_POST['image'];


$insert= $conn->query("INSERT INTO member(name,type,breed,sex,descs,age,weight,image)  VALUES('$name','$type','$breed','$sex','$descs','$age','$weight','assets/Images/cho1.jpg')");
//$insert= $conn->query("INSERT INTO member(name,type,breed)  VALUES('$name','$type','$breed')");
if($insert){
    echo "success";
}
$conn->close();
return;
?>