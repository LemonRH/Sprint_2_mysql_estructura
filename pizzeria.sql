-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Pizzeria;

-- Seleccionar la base de datos
USE Pizzeria;

-- Crear tabla Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    Dirección VARCHAR(255),
    CódigoPostal VARCHAR(10),
    Localidad VARCHAR(255),
    Provincia VARCHAR(255),
    Teléfono VARCHAR(15)
);

-- Crear tabla Tienda
CREATE TABLE Tienda (
    TiendaID INT PRIMARY KEY,
    Dirección VARCHAR(255),
    CódigoPostal VARCHAR(10),
    Localidad VARCHAR(255),
    Provincia VARCHAR(255)
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellidos VARCHAR(255),
    NIF VARCHAR(15),
    Teléfono VARCHAR(15),
    Rol VARCHAR(20),
    TiendaID INT,
    FOREIGN KEY (TiendaID) REFERENCES Tienda(TiendaID)
);

-- Crear tabla Categoria
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

-- Crear tabla Producto
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Descripción TEXT,
    Imagen VARCHAR(255),
    Precio DECIMAL(10, 2),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

-- Crear tabla Pizza
CREATE TABLE Pizza (
    PizzaID INT PRIMARY KEY,
    ProductoID INT,
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Crear tabla Pedido
CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    FechaHora DATETIME,
    TipoEntrega VARCHAR(20),
    CantidadProductos INT,
    PrecioTotal DECIMAL(10, 2),
    ClienteID INT,
    TiendaID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (TiendaID) REFERENCES Tienda(TiendaID)
);

-- Crear tabla PedidoReparto
CREATE TABLE PedidoReparto (
    PedidoID INT PRIMARY KEY,
    EmpleadoID INT,
    FechaHoraEntrega DATETIME,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID)
);
