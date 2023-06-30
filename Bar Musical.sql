drop DATABASE if exists pubs;
create database if not exists pubs;
use pubs;

CREATE TABLE pub (
    cod_pub         VARCHAR(5)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    licencia		VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)         ,
    f_apertura  	DATE         NOT NULL,
    horario         VARCHAR(60)  NOT NULL,
    cod_prov   		INT     NOT NULL ) ;
CREATE TABLE titular (
    dni_titular     VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)         ,
    cod_pub         VARCHAR(5)   NOT NULL ) ;
    
CREATE TABLE empleado (
    dni_emp    		VARCHAR(8)   NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    domicilio       VARCHAR(60)          ) ;
    
CREATE TABLE stock (
    cod_prod   	 	VARCHAR(10)  NOT NULL,
    nombre          VARCHAR(60)  NOT NULL,
    cantidad        INTEGER      NOT NULL,
    precio          DECIMAL      NOT NULL,
    cod_pub         VARCHAR(5)   NOT NULL ) ;
    
CREATE TABLE localidad (
    cod_prov   	INT     NOT NULL,
    nombre          VARCHAR(60)  NOT NULL ) ;
CREATE TABLE pub_empleado (
    cod_pub         VARCHAR(5)   NOT NULL,
    dni_empleado    VARCHAR(8)   NOT NULL,
    cargo         	VARCHAR(9)   NOT NULL ) ;
show tables;

ALTER TABLE pub ADD CONSTRAINT pk_pub
 PRIMARY KEY (cod_pub) ;
 
ALTER TABLE localidad ADD CONSTRAINT pk_localidad
 PRIMARY KEY (cod_prov) ;
 
ALTER TABLE titular ADD CONSTRAINT pk_titular
 PRIMARY KEY (dni_titular) ;
 
ALTER TABLE empleado ADD CONSTRAINT pk_empleado
 PRIMARY KEY (dni_emp) ;
 
ALTER TABLE stock ADD CONSTRAINT pk_stock
 PRIMARY KEY (cod_prod) ;
 
ALTER TABLE pub_empleado ADD CONSTRAINT pk_pub_empleado
 PRIMARY KEY (cod_pub, dni_empleado, cargo) ;
 
ALTER TABLE pub ADD CONSTRAINT fk_pub_localidad
 FOREIGN KEY (cod_prov)
 REFERENCES localidad (cod_prov) ;
 
ALTER TABLE titular ADD CONSTRAINT fk_titular_pub
 FOREIGN KEY (cod_pub)
 REFERENCES pub (cod_pub) ;
 
ALTER TABLE stock ADD CONSTRAINT fk_stock_pub
 FOREIGN KEY (cod_pub)
 REFERENCES pub (cod_pub) ;
 
ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_pub
 FOREIGN KEY (cod_pub)
 REFERENCES pub(cod_pub) ;
 
ALTER TABLE pub_empleado ADD CONSTRAINT fk_pubemple_empleado
 FOREIGN KEY (dni_empleado)
 REFERENCES empleado (dni_emp) ;
 
ALTER TABLE pub ADD CONSTRAINT ck_horario
 CHECK (horario IN ("HOR1", "HOR2", "HOR3")) ;
 
ALTER TABLE stock ADD CONSTRAINT ck_precio
 CHECK (precio <> 0) ;
 
ALTER TABLE pub_empleado ADD CONSTRAINT ck_funcion
 CHECK (cargo IN ("CAMARERO", "SEGURIDAD", "LIMPIEZA")) ;





# Datos de la LOCALIDAD
  insert into localidad values (15002, 'La Coruña');
  insert into localidad values (15165, 'Bergondo');
  insert into localidad values (15160, 'Sada');
  insert into localidad values (15170, 'Betanzos');
  insert into localidad values (15001, 'Ayuntamiento Coruña');
  insert into localidad values (15004, 'Centro Coruña');  
  
  # Datos del PUB
insert into pub values('01','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
insert into pub values('02','Agua Mineral','Comprada', 'Orzan','1985-05-15', 'HOR1', '15001'); 
insert into pub values('03','Grietas','Robada', 'Matogrande','2002-02-10', 'HOR2', '15004'); 
insert into pub values('04','OH Coruña','Homologada', 'Orillamar','2020-05-15','HOR1', '15002');  
insert into pub values('05','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
#insert into pub values('06','Nueces','No  Homologada', 'Vereda','2010-05-15', 'HOR4', '15002');
  
 # Datos del TITULAR
insert into titular values ('1234567X', 'Manolo','Orillamar','01');
insert into titular values ('2345678c', 'Pepe','Riobao', '02');
insert into titular values ('5649872x', 'Tomas','Cacharrete', '02');
insert into titular values ('7654321X','Antonio','Mandin','01');
 
 # Datos EMPLEADO
insert into empleado values ('1234567X', 'Manuel','Orillamar');
insert into empleado values ('4534567X', 'Lucas','Orzan');
insert into empleado values ('1234886X', 'Luis','Monte Alto');

# DATOS EMPLEADOS DEL PUB
insert into pub_empleado values('01','1234567X','CAMARERO');
insert into pub_empleado values('03','1234567X','SEGURIDAD');
insert into pub_empleado values('04','4534567X','CAMARERO');
#insert into pub_empleado values('05','46345678X','tocada de huevos');
