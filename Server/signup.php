<?php
include('connection.php');
$name = $_POST['name'];
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "INSERT INTO admin (name, email, username, password)
        VALUES ('$name', '$email', '$username', '$password')";

if ($conn->query($sql) === TRUE) {
    echo "Admin created";
} else {
    echo "Admin Creation Failed";
}
$conn->close();
