CREATE DATABASE coworking_db;

-- Crear tabla Usuario
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL
);

SELECT * FROM Usuario;

-- Crear tabla Sala
CREATE TABLE Sala (
    id_sala SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    filas INT NOT NULL,
    columnas INT NOT NULL
);

-- Crear tabla Espacio_Trabajo
CREATE TABLE Espacio_Trabajo (
    id_espacio SERIAL PRIMARY KEY,
    fila INT NOT NULL,
    columna INT NOT NULL,
    id_sala INT NOT NULL,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

-- Crear tabla Sesion
CREATE TABLE Sesion (
    id_sesion SERIAL PRIMARY KEY,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL
);


-- Crear tabla Reserva
CREATE TABLE Reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_espacio INT NOT NULL,
    id_sesion INT NOT NULL,
    fecha_reserva TIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_espacio) REFERENCES Espacio_Trabajo(id_espacio),
    FOREIGN KEY (id_sesion) REFERENCES Sesion(id_sesion)
);

--------------////------------------------------------------////------------------------------------

INSERT INTO Usuario (nombre, email, contraseña)
SELECT
    'Usuario ' || i,
    'usuario' || i || '@example.com',
    'contraseña' || i
FROM generate_series(1, 100) i;

SELECT * FROM Usuario;

----------////----------------///---------

-- Insertar 100 salas con 100 filas y 100 columnas cada una

INSERT INTO Sala (nombre, filas, columnas)
SELECT
    'Sala ' || i,
    5,
    5
FROM generate_series(1, 100) i;

SELECT * FROM Sala;


-------------------------/////-----------------------///---

-- Insertar espacios de trabajo para cada sala
INSERT INTO Espacio_Trabajo (fila, columna, id_sala)
SELECT
    fila,
    columna,
    s.id_sala
FROM generate_series(1, 10) fila
CROSS JOIN generate_series(1, 10) columna
CROSS JOIN Sala s;

SELECT * FROM espacio_trabajo;


----------------///---------------///------------------------------

-- Insertar 100 sesiones
INSERT INTO Sesion (fecha_inicio, fecha_fin)
SELECT
    '2023-06-01 09:00:00'::timestamp + (i * interval '1 day'),
    '2023-06-01 18:00:00'::timestamp + (i * interval '1 day')
FROM generate_series(0, 100) i;

SELECT * FROM Sesion

------------------/////-------------------------------------------

-- Insertar reservas aleatorias

INSERT INTO Reserva (id_usuario, id_espacio, id_sesion, fecha_reserva)
SELECT 
    u.id_usuario, 
    e.id_espacio, 
    s.id_sesion, 
    s.fecha_inicio - interval '1 day' + (random() * (s.fecha_fin - s.fecha_inicio + interval '1 day'))
FROM 
    (SELECT id_usuario FROM Usuario ORDER BY random() LIMIT 100) u
CROSS JOIN 
    (SELECT id_espacio FROM Espacio_Trabajo ORDER BY random() LIMIT 100) e
CROSS JOIN 
    (SELECT id_sesion, fecha_inicio, fecha_fin FROM Sesion ORDER BY random() LIMIT 100) s
ORDER BY random()
LIMIT 100;

