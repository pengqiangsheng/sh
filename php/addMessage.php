<?php
header('Access-Control-Allow-Origin:*');
$mystatus = "";
$servername = "localhost";
$username = "root";
$password = "150909";
$dbname = "blog";
$content = "";
$name=$_GET['name'];
$email=$_GET['email'];
$createTime=$_GET['createTime'];
$context=$_GET['content'];
// 连接数据库
$conn = mysqli_connect($servername, $username, $password, $dbname);
// 连接失败
if (!$conn) {
	$mystatus = "404";
    die("Connection failed: " . mysqli_connect_error());
}else {
	$sql = "INSERT INTO message ".
        "(create_time, name, content, email) ".
        "VALUES ".
        "('$createTime','$name','$context','$email')";
	mysqli_query($conn,"SET NAMES utf8");
	$result = mysqli_query($conn, $sql);
	if (mysqli_num_rows($result) > 0) {
	   $content = "success";
	} else {
	    $content = "fail";
	}
}
mysqli_close($conn); 
//get the q parameter from URL

// or to the correct values
if ($mystatus == "")
{
    $response = $content;
}
else
{
     $response = $mystatus;
}

//output the response
echo $response;
?>
