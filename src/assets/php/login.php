<?php 
include 'allow.php';
include 'conn.php';
$post= json_decode(file_get_contents('php://input'),true);
$data = array();
$kullaniciadi=$post['kullaniciadi'];
$sifre=$post['sifre'];
$kontrol = $db->prepare("SELECT * FROM users WHERE kullaniciadi='$kullaniciadi' and sifre='$sifre'");
$kontrol->execute();
while ($row=$kontrol->fetch(PDO::FETCH_ASSOC)) {
    $data[]=$row;
}     
echo json_encode($data);
?>