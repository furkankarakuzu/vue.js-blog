<?php 
include 'allow.php';
include 'conn.php';
$post= json_decode(file_get_contents('php://input'),true);
$id = $post['id'];
var_dump($id);
$yazilar = $db->prepare("DELETE FROM yazilar WHERE id='$id'");
$yazilar->execute();
if($yazilar)
{
    echo $id;
}
else
{
    echo "hata";
}
?>