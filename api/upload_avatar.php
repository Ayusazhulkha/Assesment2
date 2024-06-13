<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $avatarDir = 'path/to/avatar/directory/';
    $avatarPath = $avatarDir . basename($_FILES['avatar']['name']);
    if (move_uploaded_file($_FILES['avatar']['tmp_name'], $avatarPath)) {
        // Upload berhasil, simpan path ke database
        echo $avatarPath; // Kirim path kembali ke aplikasi Flutter
    } else {
        // Upload gagal
        http_response_code(500);
        echo "Failed to upload image";
    }
} else {
    http_response_code(405);
    echo "Method not allowed";
}
?>
