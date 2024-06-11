<?php
$servername = "localhost";
$db_username = "root"; // ganti dengan username database Anda
$db_password = ""; // ganti dengan password database Anda
$dbname = "db_pbl";

// Membuat koneksi
$conn = new mysqli($servername, $db_username, $db_password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mendapatkan data POST
$username = $_POST['username'] ?? '';
$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

// Memeriksa apakah semua data telah diisi
if (empty($username) || empty($name) || empty($email) || empty($password)) {
    $response = array(
        'status' => 'error',
        'message' => 'Semua kolom harus diisi'
    );
    echo json_encode($response);
    exit;
}

// Mengamankan password dengan hashing
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Mempersiapkan dan mengikat statement
$stmt = $conn->prepare("INSERT INTO users (username, name, email, password) VALUES (?, ?, ?, ?)");
if (!$stmt) {
    die("Statement gagal: " . $conn->error);
}
$stmt->bind_param("ssss", $username, $name, $email, $hashed_password);

// Menjalankan statement
if ($stmt->execute()) {
    $response = array(
        'status' => 'sukses',
        'message' => 'Profil berhasil disimpan'
    );
} else {
    $response = array(
        'status' => 'error',
        'message' => 'Gagal menyimpan profil'
    );
}

// Menutup statement dan koneksi
$stmt->close();
$conn->close();

// Mengembalikan respons dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
