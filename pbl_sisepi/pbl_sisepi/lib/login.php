<?php
$servername = "localhost";
$db_username = "users";
$db_password = "";
$dbname = "db_pbl";

// Membuat koneksi
$conn = new mysqli($servername, $db_username, $db_password, $dbname);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mendapatkan data POST
$username = $_POST['username'] ?? '';
$password = $_POST['password'] ?? '';

// Debugging: Log username and password
error_log("Username: $username");
error_log("Password: $password");

// Cek apakah data POST ada
if (empty($username) || empty($password)) {
    $response = array(
        'status' => 'error',
        'message' => 'Username atau password tidak boleh kosong'
    );
    echo json_encode($response);
    exit;
}

// Mempersiapkan dan mengikat statement
$stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
if (!$stmt) {
    die("Statement gagal: " . $conn->error);
}
$stmt->bind_param("s", $username);

// Menjalankan statement
$stmt->execute();

// Menyimpan hasil
$stmt->store_result();

if ($stmt->num_rows > 0) {
    // Mengikat hasil ke variabel
    $stmt->bind_result($hashed_password);
    $stmt->fetch();
    
    // Memverifikasi password
    if (password_verify($password, $hashed_password)) {
        // Login berhasil
        $response = array(
            'status' => 'sukses',
            'message' => 'Login berhasil'
        );
    } else {
        // Password salah
        $response = array(
            'status' => 'error',
            'message' => 'Username atau password salah'
        );
    }
} else {
    // Username salah
    $response = array(
        'status' => 'error',
        'message' => 'Username atau password salah'
    );
}

// Menutup statement dan koneksi
$stmt->close();
$conn->close();

// Mengembalikan respons dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
