-- ============================================================
-- Script DML - Manipulacion de datos
-- ============================================================

-- ---------- INSERCION ----------
-- Registrar un nuevo cliente junto con una orden de servicio.
-- Primero el cliente (requiere una ciudad existente)
INSERT INTO riwi_client (name, city_id)
VALUES ('TechNova SAS', 1);

-- Luego la orden de servicio para ese cliente.
-- Usamos el ultimo client_id generado con currval de la secuencia.
INSERT INTO riwi_work_order
    (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost)
VALUES
    ('WO1021',
     currval(pg_get_serial_sequence('riwi_client','client_id')),
     1, 1, 3, 1, '2026-06-01', 3, 210);


-- ---------- ACTUALIZACION ----------
-- Actualizar la informacion de un tecnico existente.
UPDATE riwi_technician
SET name = 'Juan Perez Gomez'
WHERE technician_id = 4;


-- ---------- ELIMINACION ----------
-- Eliminar un equipo que NO tenga ordenes de servicio asociadas.
-- La FK impide borrar equipos que si tienen ordenes (integridad referencial).
DELETE FROM riwi_equipment
WHERE equipment_id NOT IN (
    SELECT DISTINCT equipment_id FROM riwi_work_order
);
