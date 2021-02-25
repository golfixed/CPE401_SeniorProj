<?php
require 'server.php';
$sql = "SELECT * FROM post ORDER BY id DESC ";
$query = mysqli_query($sql);
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="language" content="en" />
<title>ระบบ Webboard กระทู้ ถาม ตอบ</title>
<style type="text/css">
a{
text-decoration: none;
color: #666666;
}
a:hover{
color: yellowgreen;
}
.table{
padding: 0;
width: 800px;
font-size: 13px;
}
table.table thead tr{
background-color: #000000;
color: #FFFFFF;
}
table.table thead tr th{
border: 1px solid #CCCCCC;
padding: 5px;
margin: 0px;
}
table.table tbody tr td{
border-bottom: 1px solid #CCCCCC;
padding: 5px;
}
</style>
</head>
<body>
<a href="new_post.php">Post</a>
<table border="0" cellpadding="0" cellspacing="0" align="center" class="table">
<thead>
<tr>
<th style="width: 30px;">ลำดับ</th>
<th>หัวข้อกระทู้</th>
<th style="width: 50px;">อ่าน</th>
<th style="width: 50px;">ตอบ</th>
<th style="width: 150px;">วันที่ตั้งกระทู้</th>
</tr>
</thead>
<tbody>
<?php
$i = 1;
while ($result = mysqli_fetch_assoc($query)) {
?>
<tr>
<td style="text-align: center;"><?php echo $i; ?></td>
<td><a href="view_topic.php?id=<?php echo $result['id']; ?>"><?php echo $result['text']; ?></a></td>
<td style="text-align: center;"><?php echo $result['view']; ?></td>
<td style="text-align: center;"><?php echo $result['reply']; ?></td>
<td style="text-align: center;"><?php echo $result['created']; ?></td>
</tr>
<?php
$i++;
}
?>
</tbody>
</table>
</body>
</html>
<?php
mysqli_close();
