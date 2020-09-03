<?php 
include 'allow.php';
include 'conn.php';
$post= json_decode(file_get_contents('php://input'),true);
$id = $post['id'];
$title = $post['title'];
$descc = $post['descc'];
$content = $post['content'];
$category = $post['category'];
var_dump($id);
$yazilar = $db->prepare("UPDATE yazilar SET title='$title', descc='$descc', content='$content', category='$category' WHERE id='$id'");
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