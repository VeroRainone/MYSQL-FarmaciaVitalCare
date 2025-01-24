USE farmacia_vitalcare;
 -- VISTAS-------------------------------------------------------------
 -- 1
CREATE VIEW V_Estado_Pedidos 
AS
SELECT Estado_pedido, COUNT(Id_pedido) AS Cantidad_Pedidos
FROM Pedidos
GROUP BY Estado_pedido;

SELECT * FROM V_Estado_Pedidos;

-- 2 ------------------------------------------------------------------
CREATE VIEW V_Medicamentos_Laboratorios
AS
SELECT m.Nombre AS Nombre_Medicamento, l.Nombre AS Nombre_Laboratorio
FROM Medicamentos_Laboratorios ml
JOIN Medicamentos M ON ml.Id_medicamento = m.Id_medicamento
JOIN Laboratorios l ON ml.Id_laboratorio = l.Id_laboratorio;
 
SELECT * FROM V_Medicamentos_Laboratorios;
  
 -- 3  ----------------------------------------------------------------
 CREATE VIEW V_Medicamentos_Ventas
 AS
 SELECT m.Nombre AS Nombre_Medicamento, SUM(mv.Cantidad) AS Cantidad_vendida
 FROM Medicamentos_Ventas mv
 JOIN Medicamentos m ON m.Id_Medicamento = mv.Id_Medicamento
 GROUP BY m.Nombre; 

SELECT * FROM V_Medicamentos_Ventas; 

 -- 4 ------------------------------------------------------------------
CREATE VIEW V_Medicamentos_Stock_Categorias
AS
SELECT m.Nombre AS Nombre_Medicamento, m.Stock, c.Nombre AS Categoria
FROM Medicamentos m
LEFT JOIN Categorias c ON m.Id_categoria = c.Id_categoria;

SELECT * FROM V_Medicamentos_Stock_Categorias;

-- 5 --------------------------------------------------------------------
CREATE VIEW V_Laboratorios_Pedidos 
AS
SELECT l.Nombre AS Nombre_Laboratorio, COUNT(p.Id_pedido) AS Cantidad_Pedidos
FROM Laboratorios l
LEFT JOIN Pedidos p ON l.Id_laboratorio = p.Id_laboratorio
GROUP BY l.Nombre;

SELECT * FROM V_Laboratorios_Pedidos;


-- PROCEDIMIENTOS ALMACENADOS ------------------------------------------
-- 1 
DELIMITER //

CREATE PROCEDURE sp_Consultar_Medicamentos_Vencidos()
BEGIN
    SELECT Id_medicamento, Nombre, Fecha_Vencimiento, Stock
    FROM Medicamentos
    WHERE Fecha_Vencimiento < CURDATE();
END //

DELIMITER ;

CALL sp_Consultar_Medicamentos_Vencidos();

-- 2 -------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE sp_Descontar_Stock(
    IN MedicamentoId INT,
    IN Cantidad INT
)
BEGIN
    IF (SELECT Stock FROM Medicamentos WHERE Id_medicamento = MedicamentoId) >= Cantidad 
    THEN
        UPDATE Medicamentos
        SET Stock = Stock - Cantidad
        WHERE Id_medicamento = MedicamentoId;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente';
    END IF;
END//
DELIMITER ;

CALL sp_Descontar_Stock( );

-- FUNCIONES -----------------------------------------------------------
-- 1
DELIMITER //

CREATE FUNCTION fn_calcular_precio_conIVA(
	precio DOUBLE, 
    porcentajeIVA DECIMAL(5, 2)
)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    RETURN ROUND(precio * porcentajeIVA / 100, 2); 
END;
//

DELIMITER ;

-- ACA LA LLAMA A LA FUNCION CON IVA 21%
SELECT Id_medicamento, Nombre, Precio, 
       fn_calcular_precio_conIVA(Precio, 21) AS PrecioConIVA
FROM Medicamentos;


-- 2 ------------------------------------------------------------------
DELIMITER //
CREATE FUNCTION fn_Aplicar_Descuento(
	PrecioBase DECIMAL(10,2),
	Descuento DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN PrecioBase - (PrecioBase * Descuento / 100);
END//
DELIMITER ;
 
-- ACA LA LLAMA A LA FUNCION
SELECT fn_Aplicar_Descuento(100, 10) AS PrecioConDescuento; -- Resultado: 90.00


-- TRIGGERS -----------------------------------------------------------

-- 1

DELIMITER //

CREATE TRIGGER Tr_Validar_Stock_Negativo 
BEFORE UPDATE ON Medicamentos
FOR EACH ROW
BEGIN
    IF NEW.Stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo.';
    END IF;
END//

DELIMITER ;

-- Ejemplo de ejecución:
UPDATE Medicamentos
SET Stock = 15 
WHERE Id_medicamento = 1;


-- Acá lanzará el Error Code
UPDATE Medicamentos
SET Precio = -15 
WHERE Id_medicamento = 1;


-- 2 -----------------------------------------------------------------

DELIMITER //
CREATE TRIGGER tr_Actualizar_Precio
BEFORE UPDATE ON Medicamentos
FOR EACH ROW
BEGIN
    IF OLD.Precio != NEW.Precio THEN
        INSERT INTO Auditoria_Precios (Id_medicamento, Nombre, Precio_Anterior, Precio_Nuevo, Fecha_Cambio)
        VALUES (OLD.Id_medicamento, OLD.Nombre, OLD.Precio, NEW.Precio, NOW());
    END IF;
END;
//

-- Ejemplo de activación del trigger:

UPDATE Medicamentos
SET Precio = 35.0
WHERE Id_medicamento = 1;
