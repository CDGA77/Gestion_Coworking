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
