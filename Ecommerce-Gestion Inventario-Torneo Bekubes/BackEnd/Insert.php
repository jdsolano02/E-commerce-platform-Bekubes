<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
include 'DA.php';
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['ID']) && isset($data['Nombre'])) {
    $ID = $data['ID'];
    $Nombre = $data['Nombre'];

    $sql = "INSERT INTO Usuario (ID_Usuario, Nombre) VALUES ('$ID', '$Nombre')";

if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true, "message" => "Datos insertados correctamente"]);
} else {
    echo json_encode(["success" => false, "message" => "Error en la consulta: " . $conn->error]);
}
} else {
    echo json_encode(["success" => false, "message" => "Faltan datos"]);
}

$conn->close();
?>
