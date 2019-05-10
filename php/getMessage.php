<?php
header('Access-Control-Allow-Origin:*');
$mystatus = "";
$servername = "localhost";
$username = "root";
$password = "150909";
$dbname = "blog";
$content = "";

// 连接数据库
$conn = mysqli_connect($servername, $username, $password, $dbname);
// 连接失败
if (!$conn) {
	$mystatus = "404";
    die("Connection failed: " . mysqli_connect_error());
}else {
	$sql = "select * from message";
	mysqli_query($conn,"SET NAMES utf8");
	$result = mysqli_query($conn, $sql);
	if (mysqli_num_rows($result) > 0) {
	    // 输出结果
	    while($row = mysqli_fetch_assoc($result)) {
	    	$messagebody = "<div class='message_main'><div class='author'><div class='email'>$row[email]</div><div class='time'>$row[create_time]</div></div><div class='context'>$row[content]</div><div class='name'>$row[name]</div></div>";
	    	$content = $content . $messagebody;
	    }
	} else {
	    $content = "0 结果";
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
