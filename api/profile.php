<?php
header('Content-Type: application/json');
session_start();
$koneksi = new mysqli('localhost', 'root', '', 'livinginh2f');

if ($koneksi->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $koneksi->connect_error]));
}

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    $query = $koneksi->prepare("SELECT id, full_name, email, avatar FROM user WHERE id = ?");
    $query->bind_param("i", $user_id);
    $query->execute();
    $result = $query->get_result();
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
        echo json_encode([
            "user" => [
                "id" => $user['id'],
                "full_name" => $user['full_name'],
                "email" => $user['email'],
                "avatar" => $user['avatar']
            ]
        ]);
    } else {
        echo json_encode(["error" => "User not found"]);
    }
    $query->close();
} else {
    echo json_encode(["error" => "User not logged in"]);
}
$koneksi->close();
?>
