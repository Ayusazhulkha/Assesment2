<?php
include 'db.php';

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Menggunakan prepared statement untuk menghindari SQL injection
    $stmt = $conn->prepare("SELECT * FROM user WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Periksa password dengan hashing
        if (password_verify($password, $row['hashed_password'])) {
            echo json_encode([
                "status" => "success",
                "role" => $row['role']
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Invalid username or password"
            ]);
        }
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Invalid username or password"
        ]);
    }
    
    $stmt->close();
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Missing required fields"
    ]);
}

$conn->close();
?>
