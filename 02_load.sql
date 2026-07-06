-- ============================================================
-- Script de carga de datos (INSERT)
-- Datos ya normalizados y limpios desde los CSV
-- ============================================================

-- Ciudades
INSERT INTO riwi_city (city_id, name) VALUES (1, 'Barranquilla');
INSERT INTO riwi_city (city_id, name) VALUES (2, 'Bogotá');
INSERT INTO riwi_city (city_id, name) VALUES (3, 'Bucaramanga');
INSERT INTO riwi_city (city_id, name) VALUES (4, 'Cali');
INSERT INTO riwi_city (city_id, name) VALUES (5, 'Cartagena');
INSERT INTO riwi_city (city_id, name) VALUES (6, 'Cúcuta');
INSERT INTO riwi_city (city_id, name) VALUES (7, 'Manizales');
INSERT INTO riwi_city (city_id, name) VALUES (8, 'Medellín');
INSERT INTO riwi_city (city_id, name) VALUES (9, 'Pereira');
INSERT INTO riwi_city (city_id, name) VALUES (10, 'Santa Marta');

-- Categorias de equipo
INSERT INTO riwi_equipment_category (category_id, name) VALUES (1, 'Desktop');
INSERT INTO riwi_equipment_category (category_id, name) VALUES (2, 'Laptop');
INSERT INTO riwi_equipment_category (category_id, name) VALUES (3, 'Networking');
INSERT INTO riwi_equipment_category (category_id, name) VALUES (4, 'Printer');

-- Tipos de servicio
INSERT INTO riwi_service_type (service_type_id, name) VALUES (1, 'Corrective');
INSERT INTO riwi_service_type (service_type_id, name) VALUES (2, 'Installation');
INSERT INTO riwi_service_type (service_type_id, name) VALUES (3, 'Preventive');

-- Tecnicos
INSERT INTO riwi_technician (technician_id, name) VALUES (1, 'Andres Mora');
INSERT INTO riwi_technician (technician_id, name) VALUES (2, 'Carlos Ruiz');
INSERT INTO riwi_technician (technician_id, name) VALUES (3, 'Juan Perez');
INSERT INTO riwi_technician (technician_id, name) VALUES (4, 'Laura Diaz');
INSERT INTO riwi_technician (technician_id, name) VALUES (5, 'Maria Gomez');

-- Equipos
INSERT INTO riwi_equipment (equipment_id, name, category_id) VALUES (1, 'Canon Pixma', 4);
INSERT INTO riwi_equipment (equipment_id, name, category_id) VALUES (2, 'Cisco Switch 2960', 3);
INSERT INTO riwi_equipment (equipment_id, name, category_id) VALUES (3, 'Dell Latitude 5420', 2);
INSERT INTO riwi_equipment (equipment_id, name, category_id) VALUES (4, 'HP ProDesk', 1);
INSERT INTO riwi_equipment (equipment_id, name, category_id) VALUES (5, 'Lenovo ThinkPad', 2);

-- Clientes
INSERT INTO riwi_client (client_id, name, city_id) VALUES (1, 'Acme Ltd', 2);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (2, 'BioHealth', 1);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (3, 'EduCenter', 6);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (4, 'HealthPlus', 7);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (5, 'Innova SAS', 8);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (6, 'MegaFoods', 10);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (7, 'NovaTech', 4);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (8, 'RetailOne', 3);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (9, 'SoftCorp', 5);
INSERT INTO riwi_client (client_id, name, city_id) VALUES (10, 'Vision SA', 9);

-- Sedes
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (1, 'North Office', 2);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (2, 'Main', 1);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (3, 'NorthEast', 6);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (4, 'Central', 7);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (5, 'HQ', 8);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (6, 'Caribbean', 10);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (7, 'West', 4);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (8, 'East', 3);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (9, 'Coast', 5);
INSERT INTO riwi_branch (branch_id, name, city_id) VALUES (10, 'Coffee', 9);

-- Ordenes de servicio
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1001', 1, 1, 3, 3, 3, '2026-05-01', 2, 120);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1002', 1, 1, 3, 3, 3, '2026-05-02', 3, 180);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1003', 5, 5, 5, 4, 1, '2026-05-03', 4, 250);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1004', 5, 5, 5, 4, 1, '2026-05-04', 2, 150);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1005', 7, 7, 2, 2, 2, '2026-05-05', 5, 500);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1006', 7, 7, 2, 2, 2, '2026-05-06', 4, 450);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1007', 2, 2, 4, 1, 1, '2026-05-07', 2, 130);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1008', 2, 2, 4, 1, 1, '2026-05-08', 3, 200);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1009', 9, 9, 1, 5, 3, '2026-05-09', 2, 140);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1010', 9, 9, 1, 5, 3, '2026-05-10', 3, 190);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1011', 10, 10, 3, 4, 2, '2026-05-11', 6, 550);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1012', 10, 10, 3, 4, 2, '2026-05-12', 5, 520);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1013', 8, 8, 5, 3, 1, '2026-05-13', 2, 160);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1014', 8, 8, 5, 3, 1, '2026-05-14', 3, 210);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1015', 3, 3, 2, 2, 3, '2026-05-15', 2, 125);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1016', 3, 3, 2, 2, 3, '2026-05-16', 2, 135);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1017', 4, 4, 4, 1, 2, '2026-05-17', 4, 400);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1018', 4, 4, 4, 1, 2, '2026-05-18', 5, 430);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1019', 6, 6, 1, 5, 1, '2026-05-19', 3, 220);
INSERT INTO riwi_work_order (work_order_id, client_id, branch_id, technician_id, equipment_id, service_type_id, service_date, hours, cost) VALUES ('WO1020', 6, 6, 1, 5, 1, '2026-05-20', 4, 260);

-- Reiniciar secuencias despues de inserts con id explicito
SELECT setval(pg_get_serial_sequence('riwi_city','city_id'), (SELECT MAX(city_id) FROM riwi_city));
SELECT setval(pg_get_serial_sequence('riwi_equipment_category','category_id'), (SELECT MAX(category_id) FROM riwi_equipment_category));
SELECT setval(pg_get_serial_sequence('riwi_service_type','service_type_id'), (SELECT MAX(service_type_id) FROM riwi_service_type));
SELECT setval(pg_get_serial_sequence('riwi_technician','technician_id'), (SELECT MAX(technician_id) FROM riwi_technician));
SELECT setval(pg_get_serial_sequence('riwi_equipment','equipment_id'), (SELECT MAX(equipment_id) FROM riwi_equipment));
SELECT setval(pg_get_serial_sequence('riwi_client','client_id'), (SELECT MAX(client_id) FROM riwi_client));
SELECT setval(pg_get_serial_sequence('riwi_branch','branch_id'), (SELECT MAX(branch_id) FROM riwi_branch));