<?php
// File: delete_user.php
header("Content-Type: application/json; charset=UTF-8");

// Include database configuration
include 'db.php';

// Check if request method is DELETE
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Get data from request body
    $data = json_decode(file_get_contents("php://input"), true);

    // Extract user ID
    $id = $data['id'];

    // Query to delete user
    $query = "DELETE FROM user WHERE id = $id";

    // Execute query
    $result = mysqli_query($conn, $query);

    // Check if query executed successfully
    if ($result) {
        // User deleted successfully
        echo json_encode(array("status" => "success", "message" => "User deleted successfully"));
    } else {
        // Failed to delete user
        echo json_encode(array("status" => "error", "message" => "Failed to delete user"));
    }

    // Close database connection
    mysqli_close($conn);
} else {
    // Invalid request method
    echo json_encode(array("status" => "error", "message" => "Invalid request method"));
}
?>
