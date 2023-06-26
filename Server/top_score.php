<?php
include("connection.php");

$sql = "SELECT name, score
        FROM player
        ORDER BY score DESC, id DESC
        LIMIT 5";

$result = $conn->query($sql);
echo "<table id='hsTable'>";
echo "<thead>
        <tr>
            <th>Name</th>
            <th>Score</th>
        </tr>";
echo "<tbody>";
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["name"] . "</td>";
        echo "<td>" . $row["score"] . "</td>";
        echo "</tr>";
    }
} else {
    echo "0 results";
}
echo "</tbody>";
echo "</table>";
$conn->close();
