<?php
include('connection.php');

$isNotGood = false;

function convertedLetter($letter)
{
    switch ($letter) {
        case 'a':
            return 1;
        case 'b':
            return 2;
        case 'c':
            return 3;
        case 'd':
            return 4;
    }
}

for ($i = 1; $i <= 10; $i++) {
    $sql = "UPDATE questions
            SET
                question='" . $_POST["q" . $i] . "',
                a='" . $_POST["q" . $i . "a"] . "',
                b='" . $_POST["q" . $i . "b"] . "',
                c='" . $_POST["q" . $i . "c"] . "',
                d='" . $_POST["q" . $i . "d"] . "',
                correctAnswer='" . convertedLetter($_POST["q" . $i . "Correct"]) . "'
            WHERE id=" . $i;
    if ($conn->query($sql) === TRUE) {
    } else {
        $isNotGood = true;
    }
}


if ($isNotGood) {
    echo "Questions Update Failed";
} else {
    echo "Questions Updated Successfully";
}

$conn->close();
