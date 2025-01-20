<?php
$servername = "localhost"; // Cambia si tu servidor es diferente
$username = "root";        // Usuario de tu MySQL
$password = "Htfpq98310";            // Contraseña de tu MySQL
$dbname = "prueba1";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>