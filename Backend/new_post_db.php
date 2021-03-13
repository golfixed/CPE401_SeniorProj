<?php
session_start();
include('server.php');
    
$errors = array();

$class_code = mysqli_real_escape_string($conn, $_POST['class_code']);
$detail = mysqli_real_escape_string($conn, $_POST['detail']);
$poll = mysqli_real_escape_string($conn, $_POST['poll']);
$pic_url = mysqli_real_escape_string($conn, $_POST['pic_url']);
$created = date('Y-m-d H:i:s');

$sql = "INSERT INTO post (class_code,detail,poll,pic_url,create_at) VALUES ('$class_code','$detail','$poll','$pic_url','$created')";
$query = mysqli_query($sql);

if (count($errors) == 0) {
    // $password = md5($password_1);

    $sql = "INSERT INTO post (class_code,detail,poll,pic_url,create_at) VALUES ('$class_code','$detail','$poll','$pic_url','$created')";
    mysqli_query($conn, $sql);

    echo "Post successfully";
    echo "<a href='main_webboard.php'>Back to view your topic.</a>";
    
} else {
    header("location: main_webboard.php");
}
$conn->close();
