USE PizzeriaVentas;
GO

-- Insertar Categorías
INSERT INTO Categoria (nombre_categoria) VALUES 
('Pizzas Clasicas'), ('Pizzas Especiales'), ('Bebidas'), ('Postres'), ('Adicionales');

-- Insertar Productos
INSERT INTO Producto (nombre, descripcion, precio_venta, id_categoria) VALUES
('Pizza Margherita', 'Salsa de tomate, mozzarella y albahaca.', 16.50, 1),
('Pizza Pepperoni', 'Salsa de tomate, mozzarella y pepperoni.', 15.00, 1),
('Pizza Hawaiana', 'Jamon, piña y extra queso.', 14.50, 1),
('Pizza De Luxe', 'Multiples carnes y vegetales.', 18.00, 2),
('Refresco Cola 500ml', 'Refresco de cola personal.', 2.50, 3),
('Cerveza Artesanal', 'Cerveza local 330ml.', 5.00, 3),
('Tiramisu', 'Postre clasico italiano.', 6.00, 4);

-- Insertar Clientes
INSERT INTO Cliente (nombre, apellido, telefono, direccion, email) VALUES
('Ana', 'Garcia', '5551234', 'Calle Sol 101', 'anagarcia@gmail.com'),
('Luis', 'Martinez', '5555678', 'Av. Luna 202', 'luismartinez@gmail.com'),
('Sofia', 'Rodriguez', '5559012', 'Jr. Estrella 303', 'sofiarodriguez@gmail.com'),
('Pedro', 'Lopez', '5553456', 'Urb. Cielo 404', 'pedrolopez@gmail.com');

-- Insertar Empleados
INSERT INTO Empleado (nombre, apellido, puesto, salario, fecha_contratacion) VALUES
('Mario', 'Rojas', 'Cocinero Principal', 2500.00, '2022-01-15'),
('Elena', 'Vargas', 'Repartidor', 1800.00, '2023-05-20'),
('Carlos', 'Soto', 'Cajero', 2000.00, '2024-03-10');

-- Insertar Pedidos
INSERT INTO Pedido (id_cliente, id_empleado, fecha_hora, tipo_pedido, estado_pedido, total) VALUES
(1, 3, '2025-11-01 19:30:00', 'Domicilio', 'Entregado', 29.50),
(2, 3, '2025-11-02 20:00:00', 'Local', 'Entregado', 15.00),
(1, 2, '2025-11-05 21:00:00', 'Domicilio', 'Entregado', 36.00),
(3, 3, '2025-11-07 18:30:00', 'Local', 'Entregado', 5.00),
(4, 2, '2025-12-01 12:00:00', 'Domicilio', 'Entregado', 2.50);

-- Insertar Detalle de Pedidos
INSERT INTO Detalle_Pedido (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 16.50, 16.50),
(1, 3, 1, 14.50, 14.50),
(2, 2, 1, 15.00, 15.00),
(3, 4, 2, 18.00, 36.00),
(4, 6, 1, 5.00, 5.00),
(5, 5, 1, 2.50, 2.50);

-- Insertar Ingredientes
INSERT INTO Ingrediente (nombre_ingrediente, unidad_medida) VALUES
('Harina de Trigo', 'Kg'),
('Queso Mozzarella', 'Kg'),
('Salsa de Tomate', 'Litro'),
('Pepperoni', 'Kg'),
('Piña enlatada', 'Kg'),
('Jamon', 'Kg'),
('Albahaca', 'Unidad');

-- Insertar Inventario
INSERT INTO Inventario (id_ingrediente, stock_actual, stock_minimo, fecha_ultima_entrada) VALUES
(1, 50.00, 10.00, '2025-11-20'),
(2, 15.00, 5.00, '2025-11-25'),
(3, 8.00, 2.00, '2025-11-15'),
(4, 3.00, 4.00, '2025-10-30'),
(5, 12.00, 3.00, '2025-11-01'),
(6, 0.50, 1.00, '2025-11-05');

-- Insertar Proveedores
INSERT INTO Proveedor (nombre_proveedor, telefono, contacto) VALUES
('Lacteos del Sur', '7778881', 'Juan Perez'),
('Distribuidora', '7778882', 'Maria Soso'),
('Carnes Gourmet', '7778883', 'Luis Diaz');

-- Insertar Compra de Ingredientes
INSERT INTO Compra_Ingrediente (id_proveedor, fecha_compra, total_compra) VALUES
(3, '2025-11-30', 100.00),
(1, '2025-11-25', 150.00),
(2, '2025-10-30', 50.00);

-- Insertar Detalle de Compra
INSERT INTO Detalle_Compra (id_compra, id_ingrediente, cantidad, costo_unitario) VALUES
(1, 1, 50.00, 2.00),
(2, 2, 15.00, 10.00),
(3, 4, 5.00, 8.00);

-- Insertar Recetas
INSERT INTO Receta (id_producto, id_ingrediente, cantidad_requerida) VALUES
(1, 1, 0.30), (1, 2, 0.20), (1, 3, 0.10), (1, 7, 0.05),
(2, 1, 0.30), (2, 2, 0.20), (2, 3, 0.10), (2, 4, 0.15),
(3, 1, 0.30), (3, 2, 0.25), (3, 5, 0.15), (3, 6, 0.15);
GO
