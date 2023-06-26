<?php
include('connection.php');

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM `admin` 
        WHERE username = '$username' AND password='$password'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data f each row
    echo 'success';
    exit();
} else {
    echo 'failed';
    exit();
}
