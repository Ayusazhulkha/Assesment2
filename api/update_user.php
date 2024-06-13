<?php
// File: update_user.php
header("Content-Type: application/json; charset=UTF-8");

// Include database configuration
include 'db.php';

// Check if request method is PUT
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    // Get data from request body
    $data = json_decode(file_get_contents("php://input"), true);

    // Extract data
    $full_name = $data['full_name'];
    $email = $data['email'];
    $avatar = $data['avatar'];

    // Query to update user data
    $query = "UPDATE user SET full_name = '$full_name', email = '$email', avatar = '$avatar' WHERE id = $id";

    // Execute query
    $result = mysqli_query($conn, $query);

    // Check if query executed successfully
    if ($result) {
        // User data updated successfully
        echo json_encode(array("status" => "success", "message" => "User data updated successfully"));
    } else {
        // Failed to update user data
        echo json_encode(array("status" => "error", "message" => "Failed to update user data"));
    }

    // Close database connection
    mysqli_close($conn);
} else {
    // Invalid request method
    echo json_encode(array("status" => "error", "message" => "Invalid request method"));
}
?>
