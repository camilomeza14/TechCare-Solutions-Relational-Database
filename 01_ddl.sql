-- ============================================================
-- TechCare Solutions Riwi S.A.S.
-- Script DDL - PostgreSQL
-- Base de datos normalizada hasta 3FN
-- ============================================================

-- Crear la base de datos (ejecutar por separado si es necesario)
-- CREATE DATABASE bd_camilo_meza_malecon;
-- \c bd_camilo_meza_malecon

-- Tabla de ciudades
CREATE TABLE riwi_city (
    city_id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE
);

-- Tabla de categorias de equipo
CREATE TABLE riwi_equipment_category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

-- Tabla de tipos de servicio
CREATE TABLE riwi_service_type (
    service_type_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

-- Tabla de tecnicos
CREATE TABLE riwi_technician (
    technician_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Tabla de equipos (depende de categoria)
CREATE TABLE riwi_equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_equipment_category
        FOREIGN KEY (category_id) REFERENCES riwi_equipment_category(category_id)
);

-- Tabla de clientes (depende de ciudad)
CREATE TABLE riwi_client (
    client_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city_id INT NOT NULL,
    CONSTRAINT fk_client_city
        FOREIGN KEY (city_id) REFERENCES riwi_city(city_id)
);

-- Tabla de sedes (depende de ciudad)
CREATE TABLE riwi_branch (
    branch_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city_id INT NOT NULL,
    CONSTRAINT fk_branch_city
        FOREIGN KEY (city_id) REFERENCES riwi_city(city_id)
);

-- Tabla de ordenes de servicio (tabla de hechos)
CREATE TABLE riwi_work_order (
    work_order_id VARCHAR(15) PRIMARY KEY,
    client_id INT NOT NULL,
    branch_id INT NOT NULL,
    technician_id INT NOT NULL,
    equipment_id INT NOT NULL,
    service_type_id INT NOT NULL,
    service_date DATE NOT NULL,
    hours INT NOT NULL,
    cost NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_wo_client
        FOREIGN KEY (client_id) REFERENCES riwi_client(client_id),
    CONSTRAINT fk_wo_branch
        FOREIGN KEY (branch_id) REFERENCES riwi_branch(branch_id),
    CONSTRAINT fk_wo_technician
        FOREIGN KEY (technician_id) REFERENCES riwi_technician(technician_id),
    CONSTRAINT fk_wo_equipment
        FOREIGN KEY (equipment_id) REFERENCES riwi_equipment(equipment_id),
    CONSTRAINT fk_wo_service_type
        FOREIGN KEY (service_type_id) REFERENCES riwi_service_type(service_type_id),
    CONSTRAINT chk_hours_positive CHECK (hours > 0)
);
