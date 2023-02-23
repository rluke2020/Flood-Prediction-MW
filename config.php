<?php

$host = "127.0.0.1"; // Change this to your MySQL server hostname
$user = "luke"; // Change this to your MySQL username
$password = "password"; // Change this to your MySQL password
$database = "weather_db"; // Change this to your database name

// Create a MySQLi object
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
