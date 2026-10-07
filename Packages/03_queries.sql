USE PizzeriaVentas;
GO

-- 1. Obtener todos los pedidos del cliente con ID 1
SELECT id_pedido, fecha_hora, total, estado_pedido
FROM Pedido
WHERE id_cliente = 1;

-- 2. Alerta de Stock: Mostrar ingredientes cuyo stock actual está por debajo del mínimo
SELECT I.nombre_ingrediente, INV.stock_actual, INV.stock_minimo
FROM Inventario INV
INNER JOIN Ingrediente I ON INV.id_ingrediente = I.id_ingrediente
WHERE INV.stock_actual < INV.stock_minimo;

-- 3. Reporte de Atención: Clientes y el empleado que atendió su pedido
SELECT C.nombre AS Nombre_Cliente, C.apellido AS Apellido_Cliente, E.nombre AS Nombre_Empleado, P.id_pedido
FROM Pedido P
INNER JOIN Cliente C ON P.id_cliente = C.id_cliente
INNER JOIN Empleado E ON P.id_empleado = E.id_empleado;

-- 4. Productos que utilizan el ingrediente "Queso Mozzarella"
SELECT P.nombre AS Nombre_Producto
FROM Producto P
INNER JOIN Receta R ON P.id_producto = R.id_producto
INNER JOIN Ingrediente I ON R.id_ingrediente = I.id_ingrediente
WHERE I.nombre_ingrediente = 'Queso Mozzarella';

-- 5. Total de ventas (SUM) en noviembre de 2025
SELECT SUM(total) AS Total_Ventas_Nov_2025
FROM Pedido
WHERE fecha_hora >= '2025-11-01' AND fecha_hora < '2025-12-01';

-- 6. Ranking de empleados por cantidad de pedidos atendidos
SELECT E.nombre, COUNT(P.id_pedido) AS Total_Pedidos_Atendidos
FROM Empleado E
INNER JOIN Pedido P ON E.id_empleado = P.id_empleado
GROUP BY E.nombre
ORDER BY Total_Pedidos_Atendidos DESC;
GO
