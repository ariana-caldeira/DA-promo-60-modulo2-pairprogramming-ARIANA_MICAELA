CREATE SCHEMA Errores_Comunes;
USE Errores_Comunes;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,  -- quitar PRIMARY KEY porque ya tiene abajo
    nombre VARCHAR(100), -- + NOT NULL
    email VARCHAR(50) UNIQUE,   -- + NOT NULL
    fecha_registro DATE DEFAULT NOW(), -- NOW está mal, sería (CURRENT_DATE)
    edad INT CHECK edad > 18, -- (edad > 18)
    saldo DECIMAL(10,2) DEFAULT 0, -- NOT NULL
    PRIMARY KEY (id_cliente)
);


-- corrección

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    fecha_registro DATE DEFAULT (CURRENT_DATE),
    edad INT CHECK (edad > 18),
    saldo DECIMAL(10,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_cliente)
);
