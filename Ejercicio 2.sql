CREATE DATABASE Ejercicio2;
USE Ejercicio2;
SHOW TABLES;
CREATE TABLE almacen (
ID INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(15),
Descripción TEXT,
Precio DECIMAL(6,2),
Stock INT,
FechaLanzamiento DATE,
Activo BOOL,
Categoría VARCHAR(20),
Imagen BLOB,
Peso FLOAT,
Estado SET('Disponible','Agotado','En Espera')
);

INSERT INTO almacen (Nombre,Descripción,Precio,Stock,FechaLanzamiento,Activo,Categoría,Imagen,Peso,Estado)
VALUES ('Toshiba Z232','Nuevo PC de toshiba, alta calidad de imagen y buen procesador',439.99,5,'2000-02-19',true,'Tecnología',null, 2.4,'Disponible');

INSERT INTO almacen (Nombre, Descripción, Precio, Stock, FechaLanzamiento, Activo, Categoría, Imagen, Peso, Estado)
VALUES ('Producto 1', 'Descripción del producto 1', 19.99, 50, '2022-01-01', true, 'Categoría 1', NULL, 1.5, 'Disponible');

SELECT * FROM almacen;