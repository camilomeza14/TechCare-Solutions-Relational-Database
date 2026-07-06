# Proceso de Normalización — TechCare Solutions

## 1. Estado inicial del archivo

El archivo Excel original es una única tabla plana con 20 registros y 11 columnas:
`Client, City, Branch, Technician, Equipment, EquipmentCategory, ServiceType, WorkOrder, ServiceDate, Hours, Cost`.

Toda la información de clientes, técnicos, equipos, sedes y ciudades está mezclada en la misma fila, sin llaves ni relaciones.

## 2. Problemas encontrados

- **Clientes duplicados con distinta escritura**: "Acme Ltd" / "ACME LTDA", "Innova SAS" / "Innova S.A.S.", etc. Los 10 clientes reales aparecen escritos de 2 formas cada uno.
- **Técnicos repetidos**: "Juan Perez" / "J. Perez" / "J Perez" son la misma persona.
- **Equipos inconsistentes**: "Dell Latitude 5420" / "Latitude 5420" / "Dell 5420".
- **Categorías repetidas**: singular y plural ("Laptop" / "Laptops").
- **Ciudades con diferencias de escritura**: "Bogotá" / "Bogota", "Cúcuta" / "Cucuta", "Manizales" / "Manizalez".
- **Tipos de servicio con sinónimos**: "Corrective" / "Repair", "Installation" / "Install".
- **Redundancia general**: los datos descriptivos se repiten en cada orden.

## 3. Transformaciones realizadas

### Primera Forma Normal (1FN)
La tabla ya tiene valores atómicos (no hay listas dentro de una celda) y cada registro es único por `WorkOrder`. Se define `WorkOrder` como clave primaria de la tabla base. Cumple 1FN.

### Segunda Forma Normal (2FN)
La clave primaria (`WorkOrder`) es simple, por lo que no existen dependencias parciales. Sin embargo, para eliminar la redundancia se extraen las entidades que no dependen del hecho "orden" sino que tienen identidad propia: cliente, técnico, equipo, categoría, tipo de servicio, ciudad y sede pasan a tablas separadas, cada una con su propia clave primaria. La tabla de órdenes se queda con las llaves foráneas.

### Tercera Forma Normal (3FN)
Se eliminan las dependencias transitivas:
- `EquipmentCategory` dependía del equipo, no de la orden → se mueve a `riwi_equipment_category`, referenciada desde `riwi_equipment`.
- La ciudad dependía del cliente y de la sede, no de la orden → se mueve a `riwi_city`, referenciada desde `riwi_client` y `riwi_branch`.

## 4. Modelo normalizado final

8 tablas:
- `riwi_city` (catálogo de ciudades)
- `riwi_equipment_category` (catálogo de categorías)
- `riwi_service_type` (catálogo de tipos de servicio)
- `riwi_technician`
- `riwi_equipment` → FK a categoría
- `riwi_client` → FK a ciudad
- `riwi_branch` → FK a ciudad
- `riwi_work_order` → FK a cliente, sede, técnico, equipo y tipo de servicio (tabla de hechos)

## 5. Justificación de decisiones

- Los valores duplicados se unificaron eligiendo una forma canónica (la más completa/correcta), por ejemplo "Cisco Switch 2960" y "Bogotá" con tilde.
- Cada cliente se asoció a la ciudad y sede de su primera aparición, dado que en el dataset cada cliente opera desde una sola ciudad.
- Se conservó `cost` y `hours` en la orden porque son atributos propios del hecho (varían por orden), no dependen de ninguna otra entidad.
- Se asumió que "Repair" equivale a "Corrective" y "Maintenance" a "Preventive" según el contexto de mantenimiento técnico.
