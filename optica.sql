-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Optica;

-- Seleccionar la base de datos
USE Optica;

-- Crear tabla Proveedor
CREATE TABLE Proveedor (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Calle VARCHAR(255),
    Numero INT,
    Piso VARCHAR(10),
    Puerta VARCHAR(10),
    Ciudad VARCHAR(255),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(255),
    Telefono VARCHAR(15),
    Fax VARCHAR(15),
    NIF VARCHAR(15)
);

-- Crear tabla Gafas
CREATE TABLE Gafas (
    GafasID INT PRIMARY KEY,
    Marca VARCHAR(255),
    GraduacionCristal VARCHAR(255),
    TipoMontura VARCHAR(20),
    ColorMontura VARCHAR(255),
    ColorCristal VARCHAR(255),
    Precio DECIMAL(10, 2),
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID)
);

-- Crear tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    DireccionPostal VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255),
    FechaRegistro DATE,
    ClienteRecomendadorID INT,
    FOREIGN KEY (ClienteRecomendadorID) REFERENCES Cliente(ClienteID)
);

-- Crear tabla Venta
CREATE TABLE Venta (
    VentaID INT PRIMARY KEY,
    FechaHora DATE,
    EmpleadoID INT,
    ClienteID INT,
    GafasID INT,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (GafasID) REFERENCES Gafas(GafasID)
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    NIF VARCHAR(15),
    Telefono VARCHAR(15),
    Cocinero BOOLEAN,
    Repartidor BOOLEAN
);
