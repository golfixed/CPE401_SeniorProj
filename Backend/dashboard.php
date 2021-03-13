<?php
include('server.php');
session_start();
if(!isset($_SESSION["username"])){
header("Location: login.php");
exit(); }
?>
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="dashboard" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>

<body>
    <div class="form">
        <p>Dashboard</p>
        <p>This is another secured page.</p>
        <p><a href="index.php">Home</a></p>
        <a href="logout.php">Logout</a>
    </div>
</body>

</html>