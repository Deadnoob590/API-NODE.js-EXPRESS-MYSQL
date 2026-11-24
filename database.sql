CREATE DATABASE IF NOT EXISTS practica_sql;
USE practica_sql;

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100),
    telefono VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO categorias (nombre, descripcion) VALUES
('Audio', 'Audifonos, bocinas y microfonos'),
('Almacenamiento', 'Unidades SSD, memorias USB y discos externos'),
('Redes', 'Routers, adaptadores WiFi y cables de red');

INSERT INTO clientes (nombre, correo, telefono) VALUES
('Valeria Mendoza', 'valeria.mendoza@correo.com', '5541209831'),
('Mateo Castellanos', 'mateo.castellanos@correo.com', '5587341209'),
('Camila Navarro', 'camila.navarro@correo.com', '5529084417');

INSERT INTO empleados (nombre, area) VALUES
('Diego Villalobos', 'Soporte Tecnico'),
('Fernanda Reyes', 'Ventas Corporativas');

INSERT INTO productos (id_categoria, nombre, precio) VALUES
(1, 'Audifonos Inalambricos Studio', 1290.00),
(1, 'Bocina Portatil Resistente', 850.00),
(2, 'SSD NVMe 1TB', 1650.00),
(3, 'Router Doble Banda AX1800', 1120.00);

INSERT INTO pedidos (id_cliente, fecha) VALUES
(1, '2026-11-10'),
(2, '2026-11-12'),
(3, '2026-11-15');

INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio) VALUES
(1, 1, 2, 1290.00),
(1, 3, 1, 1650.00),
(2, 2, 3, 850.00),
(3, 4, 2, 1120.00),
(3, 1, 1, 1290.00);