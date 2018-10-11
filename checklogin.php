<?php
    session_start();
    $conn = mysqli_connect("localhost","root","") or die("cannot connect to database");
    $db = mysqli_select_db($conn, "triput_meri") or die("cannot connect to database");
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
    $query = mysqli_query($conn, "SELECT * FROM customer WHERE Email='$username' OR Name='$username'");  
    $exists = mysqli_num_rows($query); //Checks if username exists
    
    if($exists > 0) {

        $row = mysqli_fetch_assoc($query);
        $dehashing_pwd = password_verify($password, $row['Password']);

        if($dehashing_pwd == false){
            echo '<script>alert("Incorrect password!");</script>'; 
            echo '<script>window.location.assign("login.php");</script>'; 
        }
        elseif($dehashing_pwd == true){
            $_SESSION['user'] = $row['Name']; 
            header("location: admin.php"); 
        }
        

    }
    else
    {
        Print '<script>alert("Incorrect username!");</script>'; // Prompts the user
        Print '<script>window.location.assign("login.php");</script>'; // redirects to login.php
    }
    
?>