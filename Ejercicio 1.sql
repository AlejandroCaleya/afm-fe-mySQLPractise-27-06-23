CREATE DATABASE Ejercicio1;
USE Ejercicio1;
SHOW TABLES;

CREATE TABLE productos (
Id INTEGER UNSIGNED AUTO_INCREMENT,
Nombre varchar(40) not null,
Descripcion varchar(200),
Precio decimal(5,2) unsigned,
Stock INTEGER,
primary key (Id)
);

DESCRIBE productos;

ALTER TABLE productos ADD origen VARCHAR(20);

ALTER TABLE productos MODIFY COLUMN origen VARCHAR(15);

ALTER TABLE productos DROP COLUMN origen;

DROP TABLE productos;

insert into productos (Nombre,Descripcion,Precio,Stock)
values('Toshiba Z232','Nuevo PC de toshiba, alta calidad de imagen y buen procesador',666.89,15);

UPDATE productos SET precio='669.85' WHERE precio='666.89';

DELETE FROM productos WHERE Nombre='Toshiba Z232';

SELECT * FROM productos;

SELECT * FROM productos WHERE Nombre='Toshiba Z232' AND precio='666.89';
