<?php 
try {
    $db=new PDO("mysql:host=localhost; dbname=vueblog; charset=utf8;","root","");
} catch (PDOException $error) {
    echo "Veritabanına Bağlanırken Bir Problemle Karşılaşıldı!"; $error->get_Message();
}
?>