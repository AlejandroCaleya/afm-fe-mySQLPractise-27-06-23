SHOW TABLES;

drop table if exists libros;

create table libros(
codigo int unsigned auto_increment,
titulo varchar(40) not null,
autor varchar(30),
editorial varchar(15),
precio decimal(5,2) unsigned,
primary key (codigo)
);
insert into libros (titulo,autor,editorial,precio)
values('El aleph','Borges','Planeta',15);
insert into libros (titulo,autor,editorial,precio)
values('Martin Fierro','Jose Hernandez','Emece',22.20);
insert into libros (titulo,autor,editorial,precio)
values('Antologia poetica','Borges','Planeta',40);
insert into libros (titulo,autor,editorial,precio)
values('Aprenda PHP','Mario Molina','Emece',18.20);
insert into libros (titulo,autor,editorial,precio)
values('Cervantes y el quijote','Borges','Paidos',36.40);
insert into libros (titulo,autor,editorial,precio)
values('Manual de PHP', 'J.C. Paez', 'Paidos',30.80);
insert into libros (titulo,autor,editorial,precio)
values('Harry Potter y la piedra filosofal','J.K. Rowling','Paidos',45.00);
insert into libros (titulo,autor,editorial,precio)
values('Harry Potter y la camara secreta','J.K. Rowling','Paidos',46.00);
insert into libros (titulo,autor,editorial,precio)
values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',null);
-- recuperar 4 libros desde el registro cero:
select * from libros limit 0,4;
-- recuperar 4 libros a partir del registro 5
select * from libros limit 5,4;
-- recuperar 8 libros desde el principio
select * from libros limit 8;

select * from libros where editorial = 'Paidos' and titulo = 'Alicia en el pais de las maravillas';
-- antes de borrar algo, por seguridad primero hacer la búsqueda con el select y luego lo sustituyo por el delete
delete from libros where editorial = 'Paidos' and titulo = 'Alicia en el pais de las maravillas';

-- añadir columna a la tabla que se nos ha olvidado poner
ALTER TABLE libros ADD isbn VARCHAR(20);

SELECT * FROM libros;

DESCRIBE libros;

ALTER TABLE libros DROP COLUMN isbn;

ALTER TABLE libros CHANGE COLUMN precio TO coste;
ALTER TABLE libros MODIFY COLUMN editorial VARCHAR(55); 

SELECT * FROM libros WHERE autor='Borges';
UPDATE libros SET autor='Luis Borges' WHERE autor='Borges';
