CREATE DATABASE Ejercicio3;
USE Ejercicio3;

SHOW TABLES;
# 0. Crea las tablas y las relaciones.
CREATE TABLE fabricantes (
codigo TINYINT PRIMARY KEY,
nombre NVARCHAR(100)
);

CREATE TABLE articulos (
codigo TINYINT PRIMARY KEY,
nombre NVARCHAR(100),
precio DECIMAL(6,2),
fabricante TINYINT,
FOREIGN KEY (fabricante) REFERENCES fabricantes(codigo)
);

INSERT INTO fabricantes (codigo, nombre)
VALUES (1, 'Fabricante A'),
       (2, 'Fabricante B'),
       (3, 'Fabricante C'),
       (4, 'Fabricante D'),
       (5, 'Fabricante E'),
       (6, 'Fabricante F'),
       (7, 'Fabricante G'),
       (8, 'Fabricante H'),
       (9, 'Fabricante I'),
       (10, 'Fabricante J');

INSERT INTO articulos (codigo, nombre, precio, fabricante)
VALUES (1, 'Articulo 1', 10.99, 1),
       (2, 'Articulo 2', 19.99, 2),
       (3, 'Articulo 3', 15.50, 3),
       (4, 'Articulo 4', 8.75, 4),
       (5, 'Articulo 5', 12.99, 5),
       (6, 'Articulo 6', 9.99, 6),
       (7, 'Articulo 7', 14.99, 7),
       (8, 'Articulo 8', 7.50, 8),
       (9, 'Articulo 9', 11.25, 9),
       (10, 'Articulo 10', 16.50, 10);
INSERT INTO articulos (codigo, nombre, precio, fabricante)
VALUES (11, 'Articulo 11', 55.75, 1),
       (12, 'Articulo 12', 132.40, 2),
       (13, 'Articulo 13', 76.90, 3),
       (14, 'Articulo 14', 92.20, 4),
       (15, 'Articulo 15', 41.30, 5),
       (16, 'Articulo 16', 175.60, 6),
       (17, 'Articulo 17', 63.10, 7),
       (18, 'Articulo 18', 110.80, 8),
       (19, 'Articulo 19', 87.50, 9),
       (20, 'Articulo 20', 29.95, 10);

# 1. Obtener los nombres de los productos de la tienda.
SELECT * FROM articulos;

# 2. Obtener los nombres y los precios de los productos de la tienda.
SELECT nombre,precio FROM articulos;

# 3. Obtener el nombre de los productos cuyo precio sea menor o igual a 20 €
SELECT nombre FROM articulos WHERE precio<=20;

# 4. Obtener todos los datos de los artículos cuyo precio esté entre los 60 € y los 120 € (ambas cantidades incluidas)
SELECT * FROM articulos WHERE precio>=60 AND precio<=120;

# 5. Obtener el nombre y el precio multiplicado por 166,386, la columna debe presentarse como precio_total.
SELECT nombre,precio*166.386 AS precio_total FROM articulos;

# 6. Seleccionar el precio medio de todos los productos.
SELECT AVG(precio) AS precio_medio FROM articulos;

# 7. Obtener el precio medio de los artıculos cuyo código de fabricante sea 2.
SELECT AVG(precio) AS precio_medio FROM articulos WHERE fabricante=2;

# 8. Obtener el número de artículos cuyo precio sea mayor o igual a 180 €.
SELECT count(*) FROM articulos WHERE precio>=170;

# 9. Obtener el nombre y precio de los artículos cuyo precio sea mayor o igual a 180 € y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT nombre,precio FROM articulos WHERE precio>=110 ORDER BY precio DESC, nombre ASC;

#10. Obtener un listado completo de artículos, incluyendo por cada artículo los datos del artículo y de su fabricante.
SELECT * FROM articulos as a JOIN fabricantes AS f ON a.fabricante=f.codigo;

#11. Obtener un listado de artículos, incluyendo el nombre del artículo, su precio, y el nombre de su fabricante.
SELECT a.nombre,a.precio,f.nombre  AS nombreFabricante FROM articulos as a JOIN fabricantes AS f ON a.fabricante=f.codigo;

#12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
SELECT a.fabricante,AVG(a.precio) AS precio_medio FROM articulos AS a JOIN fabricantes AS f ON a.fabricante=f.codigo GROUP BY a.fabricante;

# 13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT f.nombre,AVG(a.precio) AS precio_medio FROM articulos AS a JOIN fabricantes AS f ON a.fabricante=f.codigo GROUP BY f.nombre;

# 14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €. Indicar el precio medio.
SELECT nombre, precio FROM articulos  WHERE precio<=150;

# 15. Obtener el nombre y precio del artículo más barato.
SELECT nombre, precio FROM articulos ORDER BY precio ASC LIMIT 1;

# 16. Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
SELECT f.nombre, a.nombre, a.precio FROM articulos AS a JOIN fabricantes AS f ON a.fabricante=f.codigo WHERE a.precio = ( SELECT MAX(precio) FROM articulos WHERE fabricante=f.codigo ORDER BY precio);

# 17. Añadir un nuevo producto: Altavoces de 70 € (del fabricante 2).
INSERT INTO articulos (codigo, nombre, precio, fabricante) VALUES (21, 'Altavoces', 70, 2);

# 18. Cambiar el nombre del producto 8 a “Impresora Laser”.
UPDATE articulos SET nombre='Impresora Laser' WHERE codigo=8;

# 19. Aplicar un descuento del 10 % a todos los productos.
UPDATE articulos SET precio=precio-(precio*0.1);

# 20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual a 120.
UPDATE articulos SET precio = precio - 10 WHERE PRECIO>=110;

# 21. Borrar el producto de código 6.
SELECT * FROM articulos WHERE codigo=6;
DELETE FROM articulos WHERE codigo=6;

