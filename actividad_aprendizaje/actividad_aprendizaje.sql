-- Usar la base: actividad_aprendizaje

-- Tabla Hotel
CREATE TABLE hotel (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    direccion VARCHAR(100)
);

-- Tabla Empleado
CREATE TABLE empleado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50),
    salario NUMERIC(10,2),
    hotel_id INT REFERENCES hotel(id)
);

-- Tabla Cliente
CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

-- Tabla Habitacion
CREATE TABLE habitacion (
    id SERIAL PRIMARY KEY,
    numero INT,
    tipo VARCHAR(50),
    precio NUMERIC(10,2),
    hotel_id INT REFERENCES hotel(id)
);

-- Tabla Reserva
CREATE TABLE reserva (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id),
    hotel_id INT REFERENCES hotel(id),
    habitacion_id INT REFERENCES habitacion(id),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla Actividad
CREATE TABLE actividad (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    costo NUMERIC(10,2),
    hotel_id INT REFERENCES hotel(id)
);

-- Tabla Factura
CREATE TABLE factura (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id),
    reserva_id INT REFERENCES reserva(id),
    fecha DATE,
    total NUMERIC(10,2)
);

-- Datos de ejemplo
INSERT INTO hotel (nombre, ciudad, direccion) VALUES ('Safari’S Cartagena', 'Cartagena', 'Cra 1 #10-20');
INSERT INTO empleado (nombre, cargo, salario, hotel_id) VALUES ('Ana Torres', 'Recepcionista', 2000000, 1);
INSERT INTO empleado (nombre, cargo, salario, hotel_id) VALUES ('Carlos Gómez', 'Gerente', 5000000, 1);

INSERT INTO cliente (nombre, email, telefono) VALUES ('Luis Pérez', 'luis@example.com', '3004567890');
INSERT INTO cliente (nombre, email, telefono) VALUES ('María López', 'maria@example.com', '3019876543');

INSERT INTO habitacion (numero, tipo, precio, hotel_id) VALUES (101, 'Doble', 350000, 1);
INSERT INTO habitacion (numero, tipo, precio, hotel_id) VALUES (102, 'Suite', 600000, 1);

INSERT INTO reserva (cliente_id, hotel_id, habitacion_id, fecha_inicio, fecha_fin)
VALUES (1, 1, 1, '2025-09-20', '2025-09-25');

INSERT INTO actividad (nombre, costo, hotel_id) VALUES ('Tour por la ciudad', 120000, 1);
INSERT INTO actividad (nombre, costo, hotel_id) VALUES ('Clases de buceo', 250000, 1);

INSERT INTO factura (cliente_id, reserva_id, fecha, total) VALUES (1, 1, '2025-09-26', 1750000);
