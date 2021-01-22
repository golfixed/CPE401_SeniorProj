<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "class";

    //Create Connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);

    //Check Connection
    if (!$conn) { //No connection
        die("Connection Failed" . mysqli_connect_error());
    }  else {
        echo "Connected successfully";
    }
?>