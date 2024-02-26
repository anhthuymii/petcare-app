<?php
 include 'index.php';
 $sql=$conn->query("select * from member");
 $res=array();
 while($row=$sql->fetch_assoc()){
    $res[]=$row;
 }
 echo json_encode($res);
?>