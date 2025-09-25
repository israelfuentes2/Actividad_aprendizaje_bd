-- Pruebas para actividad_aprendizaje

-- Ver hoteles registrados
SELECT * FROM hotel;

-- Ver clientes y sus reservas
SELECT c.nombre, r.fecha_inicio, r.fecha_fin
FROM cliente c
JOIN reserva r ON c.id = r.cliente_id;

-- Ver empleados por hotel
SELECT e.nombre, e.cargo, h.nombre AS hotel
FROM empleado e
JOIN hotel h ON e.hotel_id = h.id;

-- Ver habitaciones y su precio por hotel
SELECT h.nombre AS hotel, hab.numero, hab.tipo, hab.precio
FROM habitacion hab
JOIN hotel h ON hab.hotel_id = h.id;

-- Ver actividades disponibles en cada hotel
SELECT h.nombre AS hotel, a.nombre AS actividad, a.costo
FROM actividad a
JOIN hotel h ON a.hotel_id = h.id;

-- Ver facturas con cliente y total
SELECT f.id AS factura, c.nombre AS cliente, f.total
FROM factura f
JOIN cliente c ON f.cliente_id = c.id;
