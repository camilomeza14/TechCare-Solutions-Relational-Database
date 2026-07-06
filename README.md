TechCare Solutions — Relational Database
Project description
Relational database for TechCare Solutions Riwi S.A.S., a company that provides preventive and corrective maintenance for technological equipment. The original data lived in a single Excel file with many duplicates and inconsistencies. This project turns it into a normalized relational model (up to 3NF) with clean data, referential integrity and business queries.
Technologies used
·	SQL
·	PostgreSQL
·	CSV files for data loading
·	dbdiagram.io for the ER model
Database engine
PostgreSQL.
Explanation of the normalization process
The source table was a flat sheet mixing clients, technicians, equipment, categories, cities, branches and service orders. See docs/normalizacion.md for the full detail. Summary:
·	1NF: atomic values, WorkOrder as primary key.
·	2NF: entities with their own identity moved to separate tables with their own keys; the order table keeps foreign keys.
·	3NF: transitive dependencies removed (category depends on equipment, city depends on client/branch).
Duplicate and inconsistent values (e.g. "Bogota"/"Bogotá", "J. Perez"/"Juan Perez") were unified to a single canonical form.
Database structure
Eight tables:
·	riwi_city
·	riwi_equipment_category
·	riwi_service_type
·	riwi_technician
·	riwi_equipment (FK → category)
·	riwi_client (FK → city)
·	riwi_branch (FK → city)
·	riwi_work_order (FK → client, branch, technician, equipment, service_type)
Entity Relationship Diagram
The ER model is in docs/MER_dbdiagram.txt. Paste the code into https://dbdiagram.io to render it and export as PDF/PNG.
Database creation instructions
# 1. Create the database
createdb bd_camilo_meza_malecon

# 2. Run the scripts in order
psql -d bd_camilo_meza_malecon -f scripts/01_ddl.sql
psql -d bd_camilo_meza_malecon -f scripts/02_load.sql

Data loading instructions
Data is loaded through scripts/02_load.sql, which contains clean INSERT statements generated from the normalized CSV files inside the data/ folder. This approach was chosen because the data is already clean and it guarantees referential integrity between tables. Clean CSVs are also included in data/ in case a COPY or Import Wizard load is preferred.
Explanation of each SQL query
·	Query 1 — Orders per technician: counts work orders grouped by technician to balance workload. Uses LEFT JOIN so technicians with zero orders still appear.
·	Query 2 — Services per city: joins order → client → city and counts, to see where more services happen.
·	Query 3 — Services per service type: counts orders grouped by service type to find the most requested ones.
·	Query 4 — Equipment with most maintenance: counts orders grouped by equipment to spot the most attended devices.
·	Query 5 — Clients with most orders: counts orders grouped by client for loyalty strategies.
·	Query 6 — Orders per branch: counts orders grouped by branch to plan resources.
Extra (scripts/05_extra.sql): two operational views and a stored function riwi_get_technicians(id) that returns one technician by id or all technicians when passed NULL.
Developer information
·	Full name: Camilo Meza
·	Clan: Malecón
