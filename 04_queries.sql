-- ============================================================
-- Consultas SQL - Necesidades del negocio
-- ============================================================

-- Consulta 1: Cantidad de ordenes atendidas por tecnico
SELECT t.name AS technician,
       COUNT(w.work_order_id) AS total_orders
FROM riwi_technician t
LEFT JOIN riwi_work_order w ON w.technician_id = t.technician_id
GROUP BY t.name
ORDER BY total_orders DESC;


-- Consulta 2: Historial de servicios realizados por ciudad
SELECT c.name AS city,
       COUNT(w.work_order_id) AS total_services
FROM riwi_city c
JOIN riwi_client cl ON cl.city_id = c.city_id
JOIN riwi_work_order w ON w.client_id = cl.client_id
GROUP BY c.name
ORDER BY total_services DESC;


-- Consulta 3: Total de servicios realizados por tipo de servicio
SELECT s.name AS service_type,
       COUNT(w.work_order_id) AS total
FROM riwi_service_type s
JOIN riwi_work_order w ON w.service_type_id = s.service_type_id
GROUP BY s.name
ORDER BY total DESC;


-- Consulta 4: Equipos con mayor cantidad de mantenimientos
SELECT e.name AS equipment,
       COUNT(w.work_order_id) AS maintenance_count
FROM riwi_equipment e
JOIN riwi_work_order w ON w.equipment_id = e.equipment_id
GROUP BY e.name
ORDER BY maintenance_count DESC;


-- Consulta 5: Clientes con mayor numero de ordenes de servicio
SELECT cl.name AS client,
       COUNT(w.work_order_id) AS total_orders
FROM riwi_client cl
JOIN riwi_work_order w ON w.client_id = cl.client_id
GROUP BY cl.name
ORDER BY total_orders DESC;


-- Consulta 6: Cantidad de ordenes gestionadas por sede
SELECT b.name AS branch,
       COUNT(w.work_order_id) AS total_orders
FROM riwi_branch b
JOIN riwi_work_order w ON w.branch_id = b.branch_id
GROUP BY b.name
ORDER BY total_orders DESC;
