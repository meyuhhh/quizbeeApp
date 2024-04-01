<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

include "connection.php";

// $userId = $_GET['userId'];

$sql = "SELECT * FROM tbl_users ";
$sql .= "ORDER BY score DESC ";
$stmt = $conn->prepare($sql);
// $stmt->bindParam(":userId", $userId);
$stmt->execute();
$returnValue = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($returnValue);
?>