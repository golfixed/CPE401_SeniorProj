<?php
include 'server.php';

$sql = "SELECT id, username FROM account";
$result = mysqli_query($conn, $sql);
// $sql = "SELECT * FROM post ORDER BY id DESC ";
// $query = mysqli_query($sql);
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
      echo "id: " . $row["id"]. " - Name: " . $row["username"]. " ". "<br>";
    }
  } else {
    echo "0 results";
  }
  
  mysqli_close($conn);
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
<!-- <th style="width: 50px;">ตอบ</th> -->
<!-- <th style="width: 150px;">วันที่ตั้งกระทู้</th> -->
</tr>
</thead>
<tbody>
</tbody>
</table>
</body>
</html>
