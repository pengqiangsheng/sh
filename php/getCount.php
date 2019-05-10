<?php
header('Access-Control-Allow-Origin:*');
$mystatus = "";
$servername = "localhost";
$username = "root";
$password = "150909";
$dbname = "blog";
$content = "";
$pageId=$_GET['pageId'];
// 连接数据库
$conn = mysqli_connect($servername, $username, $password, $dbname);
// 连接失败
if (!$conn) {
	$mystatus = "404";
    die("Connection failed: " . mysqli_connect_error());
}else {
	
	$sql = "select * from count where id = '".$pageId."'";
	

	mysqli_query($conn,"SET NAMES utf8");
	$result = mysqli_query($conn, $sql);
	if (mysqli_num_rows($result) > 0) {
	    // 输出结果
	    while($row = mysqli_fetch_assoc($result)) {
	    	$messagebody = "$row[pv]";
	    	$content = $content . $messagebody;
	    }
	} else {
	    $content = "null result";
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
