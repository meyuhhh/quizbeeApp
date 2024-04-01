<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

include 'connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = isset($_POST['username']) ? $_POST['username'] : null;
    $score = isset($_POST['score']) ? $_POST['score'] : null;

    if ($username !== null) {
        $sql = "INSERT INTO tbl_users (username, score) VALUES (:username, :score)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':score', $score);

        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "User registered successfully"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to register user"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Username is required"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST"]);
}
?>
