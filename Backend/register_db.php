<?php
    session_start();
    include('server.php');

    $errors = array();
    //if submit register button -> create data in db
    if(isset($_POST['reg_user'])) {
        $username = mysqli_real_escape_string($conn, $_POST['username']);  //prevent special char
        $email = mysqli_real_escape_string($conn, $_POST['email']);  //prevent special char
        $password_1 = mysqli_real_escape_string($conn, $_POST['password_1']);  //prevent special char
         

        //Check empty
        if (empty($username)) {
            array_push($errors, "Username is required");
        }
        if (empty($email)) {
            array_push($errors, "Email is required");
        }
        if (empty($password_1)) {
            array_push($errors, "Password is required");
        }
    
        //Check password match
        // if ($password_1 != $password_2) {
            // array_push($errors, "The password didn't match");
        // }
        //Check doubly
        $user_check_query = "SELECT * FROM account WHERE username = '$username' OR email = '$email' " ;
        $query = mysqli_query($conn, $user_check_query);
        $result = mysqli_fetch_assoc($query);

        if($result) { //if user exists
            if ($result['username'] === $username) {
                array_push($errors, "Username are already exists");
            }

            if ($result['email'] === $email) {
                array_push($errors, "Email are already exists");
            }
        }
        //If no error
        if(count($errors) == 0) {
            $password = md5($password_1); //Encrypt password before save to db

            $sql = "INSERT INTO account (username, email, password) VALUES ('$username', '$email', '$password')";
            mysqli_query($conn, $sql);

            $_SESSION['username'] = $username;
            $_SESSION['success'] = "You are now logged in";
            header('location: index.php');
        
        } else {
            array_push($errors, "Username or Email already exists");
            $_SESSION['error'] = "Username or Email already exists";
            header("location: register.php");
        }
    
?>