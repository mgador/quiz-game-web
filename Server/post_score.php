<?php
include("connection.php");
$name = $_POST['playerName'];
$score = $_POST['playerScore'];

$sql = "INSERT INTO player (name, score)
        VALUES ('$name', '$score')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
