<?php 
include 'allow.php';
$upload_dir = 'src/assets/img/';
$server_url = 'http://localhost';
if($_FILES['photo'])
{
    $photo_name = $_FILES["photo"]["name"];
    $photo_tmp_name = $_FILES["photo"]["tmp_name"];
    $error = $_FILES["photo"]["error"];

    if($error > 0){
        $response = array(
            "status" => "error",
            "error" => true,
            "message" => "Error uploading the file!"
        );
    }else 
    {
        $upload_name = $upload_dir.$photo_name;
        $upload_name = preg_replace('/\s+/', '-', $upload_name);
        if(move_uploaded_file($photo_tmp_name , $upload_name)) {
            $response = array(
                "status" => "success",
                "error" => false,
                "message" => "File uploaded successfully",
                "url" => $server_url."/".$photo_name
              );
        }else
        {
            $response = array(
                "status" => "error",
                "error" => true,
                "message" => "Error uploading the file!"
            );
        }
    }
}
else
{
    var_dump('i m sorry man i am suck');
}
include 'conn.php';
$title = $_POST['title'];
$desc = $_POST['descc'];
$content = $_POST['content'];
$category = $_POST['category'];
$time= $_POST['time'];

$sql = $db->prepare("INSERT INTO yazilar (title, descc, imgSrc, content, category, tarih) VALUES ('$title', '$desc', '$photo_name', '$content', '$category','$time')");
$kaydet = $sql->execute();
if($kaydet)
{
    echo "basarili";
}
else
{
    echo "hata";
}
?>