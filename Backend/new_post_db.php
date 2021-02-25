<?php
require 'connect.php';
// $topic = trim($_POST['topic']);
$text = trim($_POST['text']);
// $detail = trim($_POST['detail']);
$name = trim($_POST['create_by']);
// $email = trim($_POST['email']);
$created = date('Y-m-d H:i:s');
$sql = "INSERT INTO post (text,name,created) VALUES ";
$sql .= "('{$text}','{$name}','{$created}')";
$query = mysqli_query($sql);
if ($query == TRUE) {
echo "Success!<BR>";
echo "<a href='main_webboard.php'>Back to view your topic.</a>";
}
mysql_close();