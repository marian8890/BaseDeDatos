CREATE DATABASE TiendaOnline;
USE TiendaOnline;

CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255)
);

CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE Ordenes (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_orden DATE NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id) ON DELETE CASCADE
);

CREATE TABLE DetalleOrden (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(orden_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id) ON DELETE CASCADE
);

INSERT INTO Clientes (nombre, email, telefono, direccion) VALUES
('Juan Pérez', 'juan.perez@email.com', '555-1234', 'Calle Falsa 123'),
('María Gómez', 'maria.gomez@email.com', '555-5678', 'Avenida Siempre Viva 456'),
('Carlos Ruiz', 'carlos.ruiz@email.com', '555-9876', 'Calle Real 789');

INSERT INTO Productos (nombre, descripcion, precio, stock) VALUES
('Laptop', 'Laptop de alta gama con 16GB de RAM y 512GB SSD', 1200.00, 10),
('Teléfono móvil', 'Smartphone de última generación con cámara de 64MP', 800.00, 15),
('Auriculares', 'Auriculares inalámbricos con cancelación de ruido', 150.00, 30),
('Monitor', 'Monitor LED 24 pulgadas Full HD', 200.00, 20),
('Teclado mecánico', 'Teclado mecánico retroiluminado RGB', 100.00, 25);

INSERT INTO Ordenes (cliente_id, fecha_orden, total) VALUES
(1, '2024-01-15', 1350.00),
(2, '2024-01-20', 1000.00),
(3, '2024-01-25', 1350.00);

INSERT INTO DetalleOrden (orden_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1200.00), -- Orden de Juan Pérez (Laptop)
(1, 3, 1, 150.00),  -- Orden de Juan Pérez (Auriculares)
(2, 2, 1, 800.00),  -- Orden de María Gómez (Teléfono móvil)
(2, 5, 2, 100.00),  -- Orden de María Gómez (Teclado mecánico)
(3, 1, 1, 1200.00), -- Orden de Carlos Ruiz (Laptop)
(3, 4, 1, 200.00);  -- Orden de Carlos Ruiz (Monitor)

