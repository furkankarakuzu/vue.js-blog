<?php
include 'allow.php';
include 'conn.php';
$data = array();
$yazilar = $db->prepare("SELECT * FROM yazilar order by id desc");
$yazilar->execute();
while ($row=$yazilar->fetch(PDO::FETCH_ASSOC)) {
    $data[]=$row;
}     
echo json_encode($data);
?>