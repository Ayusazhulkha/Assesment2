<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include 'db.php';

// Periksa apakah semua parameter disediakan
if (!isset($_POST['email']) || !isset($_POST['full_name']) || !isset($_POST['username']) || !isset($_POST['password']) || !isset($_POST['phone'])) {
    echo json_encode(["status" => "error", "message" => "Parameter tidak lengkap"]);
    exit();
}

$email = $_POST['email'];
$full_name = $_POST['full_name'];
$username = $_POST['username'];
$password = $_POST['password'];
$phone = $_POST['phone'];

// Log untuk debugging
error_log("Email: $email, Full Name: $full_name, Username: $username, Phone: $phone");

// Insert data ke tabel user menggunakan prepared statements
$stmt = $conn->prepare("INSERT INTO user (email, full_name, username, password, phone) VALUES (?, ?, ?, ?, ?)");
if ($stmt === false) {
    echo json_encode(["status" => "error", "message" => $conn->error]);
    exit();
}

$stmt->bind_param("sssss", $email, $full_name, $username, $password, $phone);

if ($stmt->execute()) {
    // Jika insert berhasil, ambil semua data dari tabel user
    $result = $conn->query("SELECT * FROM user");
    $users = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $users[] = $row;
        }
    }

    echo json_encode(["status" => "success", "data" => $users]);
} else {
    echo json_encode(["status" => "error", "message" => $stmt->error]);
}

$stmt->close();
$conn->close();

