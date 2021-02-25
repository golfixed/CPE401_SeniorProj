<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
require 'server.php';
$detail = trim($_POST['detail']);
$name = trim($_POST['name']);
// $email = trim($_POST['email']);
$sql = "INSERT INTO comment (detail,name,id) VALUES ";
$sql .= "('{$detail}','{$name}','{$_POST['id']}')";
$query = mysqli_query($sql);
// update
mysql_query("UPDATE comment SET reply=reply+1 WHERE id='{$_POST['id']}' ");
if ($query == TRUE) {
echo "Success!<BR>";
echo "<a href='view_post.php?id=$_POST[id]'>Back to view your post.</a>";
}
mysqli_close();
}