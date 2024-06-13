<?php
// Include database connection
include 'db.php';

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Extract data from POST request
    $email = $_POST['email'];
    $full_name = $_POST['full_name'];
    $phone = $_POST['phone'];
    $username = $_POST['username'];
    $password = $_POST['password']; // Password sudah di-hash di sisi Flutter

    // SQL query to insert new user into database
    $sql = "INSERT INTO user (email, full_name, phone, username, password) VALUES ('$email', '$fullname', '$phone', '$username', '$password')";

    // Execute SQL query
    if ($conn->query($sql) === TRUE) {
        // Return success response
        echo json_encode(["status" => "success"]);
    } else {
        // Return error response
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
} else {
    // Return error response for invalid request method
    echo json_encode(["status" => "error", "message" => "Invalid request method"]);
}

// Close database connection
$conn->close();
?>
