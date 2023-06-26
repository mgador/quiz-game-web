<?php
include('connection.php');

function getAnswers($row, $correctLetter)
{
    $questionChoices = ["a", "b", "c", "d"];
    foreach ($questionChoices as $letter) {
        if ($letter == $correctLetter) {
            echo "<input type='radio' name='q" . $row["id"] . "Choices' id='q" . $row["id"] . $letter . "Choice' value='" . $letter . "' checked>";
            echo "<input type='text' id='q" . $row["id"] . $letter . "Answer' value='" . $row[$letter] . "'>";
        } else {
            echo "<input type='radio' name='q" . $row["id"] . "Choices' id='q" . $row["id"] . $letter . "Choice' value='" . $letter . "'>";
            echo "<input type='text' id='q" . $row["id"] . $letter . "Answer' value='" . $row[$letter] . "'>";
        }
    }
}

$sql = "SELECT * FROM questions";
$result = $conn->query($sql);


if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo
        "<div class='questionContainer'>"
            . "<label for='q" . $row["id"] . "'>Question " . $row["id"] . "</label>"
            . "<input type='text' id='q" . $row["id"] . "' value='" . $row["question"] . "'>"
            . "</div>"
            . "<div class='questionContainer'>";

        switch ($row["correctAnswer"]) {
            case 1:
                getAnswers($row, "a");
                break;
            case 2:
                getAnswers($row, "b");
                break;
            case 3:
                getAnswers($row, "c");
                break;
            case 4:
                getAnswers($row, "d");
                break;
        }
        echo "</div>";
    }
}

// Close the database connection
$conn->close();
