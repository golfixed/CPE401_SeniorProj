<?php
require 'connect.php';
//question
$sql = "SELECT * FROM questions WHERE id='{$_GET['id']}' ";
$query = mysqli_query($sql);
$result = mysqli_fetch_assoc($query);
// answer
$sql_a = "SELECT * FROM comment WHERE post='{$_GET['id']}' ";
$query_a = mysqli_query($sql_a);
$rows_a = mysqli_num_rows($query_a);
// update view
$sql_u = "UPDATE post SET view=view+1 WHERE id='{$_GET['id']}' ";
mysqli_query($sql_u);
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en" />
<title>Detail</title>
<style type="text/css">
body{
font-size: 13px;
}
</style>
</head>
<body>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="3" bgcolor="#000000">
<b style="color: #FFFFFF;"><?php echo $result['text']; ?></b></td>
</tr>
<tr>
<td valign="top"><?php echo nl2br($result['detail']); ?></td>
</tr>
<tr>
<td>
<strong>Name :</strong> <?php echo $result['name']; ?>
<!-- <strong>อีเมล์ผู้ตั้งกระทู้ :</strong> <?php echo $result['email']; ?> -->
</td>
</tr>
<tr>
<td style="text-align: right;">
<strong>Date :</strong> <?php echo $result['created']; ?>
</td>
</tr>
</table>
</td>
</tr>
</table>
<?php
if ($rows_a > 0) {
$i = 1;
while ($result_a = mysql_fetch_assoc($query_a)) {
?>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" style="margin-top:10px;">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td width="30%" style="text-align: right;"><strong>Comment by</strong></td>
<td width="70%"><?php echo $result_a['name']; ?></td>
</tr>
<!-- <tr> -->
<!-- <td valign="top" style="text-align: right;"><strong>อีเมล์</strong></td> -->
<!-- <td><?php echo $result_a['email']; ?></td> -->
<!-- </tr> -->
<tr>
<td style="text-align: right;"><strong>Comment</strong></td>
<td><?php echo nl2br($result_a['detail']); ?></td>
</tr>
</table>
</td>
</tr>
</table>
<?php
}
} else {
?>
<p style="text-align: center;color: red;">No comment yet</p>
<?php
}
?>
<form id="add_comment" name="add_comment" method="post" action="add_comment.php">
<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="blue" style="margin-top:15px;">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="3" bgcolor="blue"><b style="color: #FFFFFF;">Comment</b> </td>
</tr>
<tr>
<td valign="top" style="text-align: right;"><strong>Text</strong></td>
<td><textarea name="detail" cols="50" rows="5" id="detail"></textarea></td>
</tr>
<tr>
<td style="text-align: right;"><strong>Comment name</strong></td>
<td><input name="name" type="text" id="name" size="50" /></td>
</tr>
<!-- <tr> -->
<!-- <td style="text-align: right;"><strong>อีเมล์ผู้ตอบ</strong></td> -->
<!-- <td><input name="email" type="text" id="email" size="50" /></td> -->
<!-- </tr> -->
<tr>
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" value="submit" /> 
<input type="button" name="Submit2" value="back" onclick="history.back();" />
</td>
</tr>
</table>
</td>
</tr>
</table>
<input type="hidden" name="id" value="<?php echo $result['id']; ?>">
</form>
</body>
</html>
<?php
mysqli_close();