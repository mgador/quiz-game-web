<?php
include("connection.php");
$id = $_POST["id"];
$sql = "SELECT * FROM questions WHERE id=$id";
$result = $conn->query($sql);
$response;

if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $response = array(
            'question' => $row["question"],
            'a' => $row["a"],
            'b' => $row["b"],
            'c' => $row["c"],
            'd' => $row["d"],
            'correctAnswer' => $row["correctAnswer"]
        );
    }
} else {
    echo "0 results";
}

echo json_encode($response);
$conn->close();
