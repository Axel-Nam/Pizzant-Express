  Pizzant Express - Sistema de Gestión de Base de Datos (SQL Server)

    Descripción del Proyecto
Este proyecto diseña e implementa una base de datos relacional orientada a la **Pizzería Pizzant Express** (ubicada en Villa El Salvador)[cite: 5]. El objetivo principal es resolver el desequilibrio en la gestión de inventario y pedidos, optimizando el control del stock de insumos, las órdenes de compra a proveedores y el registro completo del flujo de ventas y recetas.

---

    Objetivos
- **Objetivo General:** Diseñar e implementar una base de datos funcional en SQL Server para la gestión integral de compras, ventas e inventario.
- **Objetivos Específicos:**
  * Modelar un esquema de entidades cumpliendo hasta la **3ra Formato Normal (3NF)**.
  * Implementar claves primarias, foráneas y restricciones de integridad (`PK`, `FK`, `NOT NULL`, `CHECK`, `UNIQUE`) para garantizar la consistencia de datos.
  * Generar consultas analíticas y complejas (joins, agregaciones, subconsultas) para soporte en la toma de decisiones gerenciales.

---

    Alcance del Sistema
- **Compras y Control de Insumos:** Registro de proveedores, órdenes de compra y detalles de transacciones.
- **Gestión de Inventario y Stock:** Control de insumos en tiempo real con monitoreo de stock mínimo y alertas.
- **Ventas y Recetas:** Módulo de recetas que vincula los ingredientes requeridos con los productos del menú para calcular costos e insumos consumidos.
- **Soporte Operacional:** Registro de clientes, empleados e histórico de pedidos.

> **Nota de Alcance:** Se excluyen sistemas contables avanzados, gestión de nóminas y contabilidad de activos fijos.

---

    Modelo Relacional y Normalización
El diseño consta de **12 tablas relacionales** diseñadas bajo los principios de normalización.
1. **1NF:** Todos los campos contienen valores atómicos (ej. campo teléfono único por cliente).
2. **2NF:** Atributos no-clave dependen enteramente de la PK (evidenciado en tablas compuestas como `Receta`).
3. **3NF:** Eliminación de dependencias transitivas aislando datos maestros de tablas transaccionales (ej. `Proveedor` aislado de `Compra_Ingrediente`).

    Tablas Principales
* `Cliente`, `Empleado`, `Categoria`, `Producto`.
* `Pedido`, `Detalle_Pedido`.
* `Proveedor`, `Ingrediente`, `Inventario`.
* `Compra_Ingrediente`, `Detalle_Compra`, `Receta`.

---

    Tecnologías Utilizadas
- **Motor de Base de Datos:** SQL Server.
- **Lenguaje:** T-SQL (DDL, DML).

---

- **Curso:** Programación Avanzada de Base de Datos.
