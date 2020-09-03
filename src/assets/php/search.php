<?php 
include 'allow.php';
include 'conn.php';
$post= json_decode(file_get_contents('php://input'),true);
$search = $post['search'];
$search2=implode($search);
$data = array();
//$yazilar = $db->prepare("SELECT *, MATCH(title, content) AGAINST('$search2' IN BOOLEAN MODE) FROM yazilar order by id asc");
$yazilar = $db->prepare("SELECT * FROM yazilar Where content Like '%$search2%'");
$yazilar->execute();
while ($row=$yazilar->fetch(PDO::FETCH_ASSOC)) {
    $data[]=$row;
}     
echo json_encode($data);
?>