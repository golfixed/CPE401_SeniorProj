<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en" />
<title>ตั้งกระทู้</title>
</head>
<body>
<form id="new_topic" name="new_topic" method="post" action="add_new_topic.php">
<table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
<tr>
<td>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<tr>
<td colspan="3" bgcolor="#000000"><b style="color: #FFFFFF;">ตั้งกระทู้</b> </td>
</tr>
<tr>
<td width="30%" style="text-align: right;"><strong>ชื่อหัวข้อกระทู้</strong></td>
<td width="70%"><input name="topic" type="text" id="topic" size="50" /></td>
</tr>
<tr>
<td valign="top" style="text-align: right;"><strong>รายละเอียด</strong></td>
<td><textarea name="detail" cols="50" rows="5" id="detail"></textarea></td>
</tr>
<tr>
<td style="text-align: right;"><strong>ชื่อผู้ตั้งกระทู้</strong></td>
<td><input name="name" type="text" id="name" size="50" /></td>
</tr>
<tr>
<td style="text-align: right;"><strong>อีเมล์ผู้ตั้งกระทู้</strong></td>
<td><input name="email" type="text" id="email" size="50" /></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" name="Submit" value="บันทึกข้อมูล" /> 
<input type="reset" name="Submit2" value="ล้างข้อมูล" /></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>