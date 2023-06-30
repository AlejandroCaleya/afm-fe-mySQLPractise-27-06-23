SHOW DATABASES;
CREATE DATABASE mydb;
USE mydb;
SHOW TABLES;
CREATE TABLE usuario (
nombre VARCHAR(30),
clave VARCHAR(30)
);
DROP TABLE usuario;
INSERT INTO usuario (nombre, clave) VALUES ('Mario Perez','MarioLuigi');
SELECT * FROM usuario;

CREATE TABLE libros (
titulo VARCHAR(40),
autor VARCHAR(20),
editorial VARCHAR(15),
precio FLOAT,
cantidad INTEGER
);
SHOW TABLES;

