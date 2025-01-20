CREATE DATABASE PlataformaBekubes;
USE PlataformaBekubes;
CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido1 VARCHAR(50),
    Apellido2 VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    Rol ENUM('Cliente', 'Administrador'),
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Historial_Usuarios (
    ID_HistorialU INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioCreacion TIMESTAMP,
    UsuarioModificacion TIMESTAMP,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
CREATE TABLE Reseñas (
    ID_Reseña INT PRIMARY KEY AUTO_INCREMENT,
    Comentario TEXT,
    Valoracion INT CHECK (Valoracion BETWEEN 1 AND 5),
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
CREATE TABLE Notificaciones (
    ID_Notificacion INT PRIMARY KEY AUTO_INCREMENT,
    Mensaje TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
CREATE TABLE Torneos (
    ID_Torneo INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Fecha DATE,
    Ubicacion VARCHAR(255),
    Categoria VARCHAR(50)
);
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Precio DOUBLE,
    Stock INT
);
CREATE TABLE Carrito (
    ID_Carrito INT PRIMARY KEY AUTO_INCREMENT,
    Total DOUBLE,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
CREATE TABLE Items_Carrito (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    ID_Carrito INT,
    ID_Producto INT,
    Cantidad INT,
    Subtotal DOUBLE,
    FOREIGN KEY (ID_Carrito) REFERENCES Carrito(ID_Carrito),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
CREATE TABLE Pedidos (
    ID_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Estado ENUM('Procesando', 'Enviado', 'Entregado'),
    ID_Carrito INT,
    FOREIGN KEY (ID_Carrito) REFERENCES Carrito(ID_Carrito)
);
CREATE TABLE Pagos (
    ID_Pago INT PRIMARY KEY AUTO_INCREMENT,
    Monto_Total DOUBLE,
    Estado ENUM('Pendiente', 'Completado', 'Cancelado'),
    ID_Pedido INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);
CREATE TABLE Metodo_Pago (
    ID_MetodoPago INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('Tarjeta', 'PayPal', 'SINPE Movil'),
    Detalle TEXT,
    ID_Pago INT,
    FOREIGN KEY (ID_Pago) REFERENCES Pagos(ID_Pago)
);
CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY AUTO_INCREMENT,
    Productos TEXT,
    Stock INT,
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);