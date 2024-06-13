<?php
$koneksi = new mysqli('localhost', 'root', '', 'livinginh2f');
if ($koneksi->connect_error) {
    die("Connection failed: " . $koneksi->connect_error);
}

$query = mysqli_query($koneksi, "select * from user");
if (!$query) {
    die("Error executing query: " . mysqli_error($koneksi));
}

$data = mysqli_fetch_all($query, MYSQLI_ASSOC);
echo json_encode($data);
