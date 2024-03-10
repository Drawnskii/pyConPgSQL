-- Triggers

-- Auditoría de inserción
CREATE OR REPLACE FUNCTION registrar_auditoria_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('INSERCIÓN', current_user, now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_auditoria_insert
AFTER INSERT ON ventas
FOR EACH ROW
EXECUTE FUNCTION registrar_auditoria_insert();


-- Auditoría de actualización
CREATE OR REPLACE FUNCTION registrar_auditoria_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('MODIFICACIÓN', current_user, now());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_auditoria_update
AFTER UPDATE ON ventas
FOR EACH ROW
EXECUTE FUNCTION registrar_auditoria_update();


-- Auditoría de eliminar
CREATE OR REPLACE FUNCTION registrar_auditoria_delete()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_ventas (usuario, procedimiento, fecha)
    VALUES ('ELIMINACIÓN', current_user, now());
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_auditoria_delete
AFTER DELETE ON ventas
FOR EACH ROW
EXECUTE FUNCTION registrar_auditoria_delete();
