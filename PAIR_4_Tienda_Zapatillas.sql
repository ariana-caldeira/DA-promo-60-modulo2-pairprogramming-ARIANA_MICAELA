CREATE SCHEMA Tienda_Zapatillas;
USE Tienda_Zapatillas;

-- 4 tablas: empleados, clientes, facturas y zapatillas



CREATE TABLE Zapatillas(
	id_zapatilla INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_zapatilla)
);

CREATE TABLE Cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_cliente)
);


CREATE TABLE Empleados(
	id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE Facturas(
	id_factura INT NOT NULL AUTO_INCREMENT,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATETIME NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT fk_facturas_zapatillas
		FOREIGN KEY (id_zapatilla)
        REFERENCES Zapatillas(id_zapatilla),
    CONSTRAINT fk_facturas_empleados
		FOREIGN KEY (id_empleado)
        REFERENCES Empleados(id_empleado),
    CONSTRAINT fk_facturas_clientes
		FOREIGN KEY (id_cliente)
        REFERENCES Cliente(id_cliente)
);