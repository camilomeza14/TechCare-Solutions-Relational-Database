-- ============================================================
-- Puntos Extra: Vistas y Procedimiento Almacenado
-- ============================================================

-- Vista 1: Resumen operativo de carga por tecnico
CREATE VIEW riwi_view_technician_workload AS
SELECT t.technician_id,
       t.name AS technician,
       COUNT(w.work_order_id) AS total_orders,
       SUM(w.hours) AS total_hours
FROM riwi_technician t
LEFT JOIN riwi_work_order w ON w.technician_id = t.technician_id
GROUP BY t.technician_id, t.name;


-- Vista 2: Detalle completo de ordenes para seguimiento de soporte
CREATE VIEW riwi_view_service_detail AS
SELECT w.work_order_id,
       cl.name AS client,
       ci.name AS city,
       b.name AS branch,
       t.name AS technician,
       e.name AS equipment,
       st.name AS service_type,
       w.service_date,
       w.hours,
       w.cost
FROM riwi_work_order w
JOIN riwi_client cl ON cl.client_id = w.client_id
JOIN riwi_city ci ON ci.city_id = cl.city_id
JOIN riwi_branch b ON b.branch_id = w.branch_id
JOIN riwi_technician t ON t.technician_id = w.technician_id
JOIN riwi_equipment e ON e.equipment_id = w.equipment_id
JOIN riwi_service_type st ON st.service_type_id = w.service_type_id;


-- Procedimiento almacenado: consultar tecnicos
-- Si recibe un ID devuelve ese tecnico; si recibe NULL devuelve todos.
CREATE OR REPLACE FUNCTION riwi_get_technicians(p_id INT DEFAULT NULL)
RETURNS TABLE (technician_id INT, name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT t.technician_id, t.name
    FROM riwi_technician t
    WHERE p_id IS NULL OR t.technician_id = p_id;
END;
$$ LANGUAGE plpgsql;

-- Ejemplos de uso:
-- SELECT * FROM riwi_get_technicians(NULL);   -- todos
-- SELECT * FROM riwi_get_technicians(2);      -- solo el tecnico 2
