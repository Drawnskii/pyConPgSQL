-- Procedimientos almacenados

-- Inserción
CREATE OR REPLACE PROCEDURE insertar_venta(
    IN p_id INTEGER,
    IN p_total NUMERIC,
    IN p_id_local INTEGER,
    IN p_id_cliente INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO ventas (id, total, id_local, id_cliente)
    VALUES (p_id, p_total, p_id_local, p_id_cliente);
END;
$$;

-- Actualización
CREATE OR REPLACE PROCEDURE modificar_venta(
    IN p_id INTEGER,
    IN p_total NUMERIC,
    IN p_id_local INTEGER,
    IN p_id_cliente INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE ventas
    SET total = p_total,
        id_local = p_id_local,
        id_cliente = p_id_cliente
    WHERE id = p_id;
END;
$$;

-- Eliminar
CREATE OR REPLACE PROCEDURE eliminar_venta(
    IN p_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM ventas
    WHERE id = p_id;
END;
$$;