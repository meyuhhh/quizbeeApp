<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

include "connection.php";

// Get data from request
$score = $_POST['score'];
$username = $_POST['username'];


// Prepare SQL statement to update user information
$sql = "INSERT INTO tbl_users (username, score) VALUES (:username, :score)";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->bindParam(':score', $score);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "User registered successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to register user"]);
}
?>