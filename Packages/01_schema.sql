-- =======================================================
-- PROYECTO: Pizzant Express - Sistema de Base de Datos
-- AUTOR: Axel Fabian Torres Guerrero
-- MOTOR: SQL Server 2022
-- =======================================================

CREATE DATABASE PizzeriaVentas;
GO

USE PizzeriaVentas;
GO

-- 1. Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50),
    telefono NVARCHAR(15) UNIQUE,
    direccion NVARCHAR(150),
    email NVARCHAR(100)
);
GO

-- 2. Tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(50) NOT NULL,
    apellido NVARCHAR(50),
    puesto NVARCHAR(50),
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
GO

-- 3. Tabla Categoria
CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY IDENTITY(1,1),
    nombre_categoria NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- 4. Tabla Producto
CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_venta DECIMAL(10, 2) NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);
GO

-- 5. Tabla Pedido
CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT NOT NULL,
    id_empleado INT,
    fecha_hora DATETIME NOT NULL,
    tipo_pedido NVARCHAR(10) NOT NULL CHECK (tipo_pedido IN ('Domicilio', 'Local')),
    estado_pedido NVARCHAR(20) CHECK (estado_pedido IN ('Pendiente', 'Preparacion', 'Enviado', 'Entregado', 'Cancelado')),
    total DECIMAL(10, 2),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    CONSTRAINT fk_pedido_empleado FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);
GO

-- 6. Tabla Detalle_Pedido
CREATE TABLE Detalle_Pedido (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2),
    CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    CONSTRAINT ux_detalle_pedido UNIQUE (id_pedido, id_producto)
);
GO

-- 7. Tabla Ingrediente
CREATE TABLE Ingrediente (
    id_ingrediente INT PRIMARY KEY IDENTITY(1,1),
    nombre_ingrediente NVARCHAR(100) NOT NULL UNIQUE,
    unidad_medida NVARCHAR(20) NOT NULL
);
GO

-- 8. Tabla Inventario
CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY IDENTITY(1,1),
    id_ingrediente INT NOT NULL UNIQUE,
    stock_actual DECIMAL(10, 2) NOT NULL,
    stock_minimo DECIMAL(10, 2),
    fecha_ultima_entrada DATE,
    CONSTRAINT fk_inventario_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente)
);
GO

-- 9. Tabla Receta
CREATE TABLE Receta (
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad_requerida DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_producto, id_ingrediente),
    CONSTRAINT fk_receta_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    CONSTRAINT fk_receta_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente)
);
GO

-- 10. Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY IDENTITY(1,1),
    nombre_proveedor NVARCHAR(100) NOT NULL UNIQUE,
    telefono NVARCHAR(15),
    contacto NVARCHAR(50)
);
GO

-- 11. Tabla Compra_Ingrediente
CREATE TABLE Compra_Ingrediente (
    id_compra INT PRIMARY KEY IDENTITY(1,1),
    id_proveedor INT NOT NULL,
    fecha_compra DATE NOT NULL,
    total_compra DECIMAL(10, 2),
    CONSTRAINT fk_compra_proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);
GO

-- 12. Tabla Detalle_Compra
CREATE TABLE Detalle_Compra (
    id_detalle_compra INT PRIMARY KEY IDENTITY(1,1),
    id_compra INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad DECIMAL(10, 2) NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_detallec_compra FOREIGN KEY (id_compra) REFERENCES Compra_Ingrediente(id_compra),
    CONSTRAINT fk_detallec_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id_ingrediente),
    CONSTRAINT ux_detalle_compra UNIQUE (id_compra, id_ingrediente)
);
GO
