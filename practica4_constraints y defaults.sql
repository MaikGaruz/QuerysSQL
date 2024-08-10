/*Creamos base de datos*/
create database Ventas_X1;
use Ventas_X1;

/*Crea la tabla usuario*/
/*Verifica como funciona el auto_increment en MySQL 	-->		indentity es para SQL*/
create table usuarios(
id_usuarios int auto_increment not null,
nombre_usuario varchar(40),
contraseña varchar(20),
primary key (id_usuarios)
);

create table cliente(
id_clie int not null,
nom_clie varchar (40),
rfc_clie varchar (11) not null /*constraint check_rfc check 
		(rfc_clie like '[A-z][A-z][A-z][A-z][0-9][0-9][0-9][0-9][0-9][0-9]')*/,
tel_clie varchar (10) null default '0123456789', /*Si no se asigna nada, se colocora por defecto 0-9*/
dir_clie varchar (40),
suspendido bit default 0,
/*user_id int default user_id(),
nom_usuario as user_name(),*/
primary key (id_clie)
);

create table articulo(
id_art int not null,
nom_art varchar (25) null default 'XXXXXXXXXX',
prec_art decimal (10,2),
peso_art decimal (10,2),
existencia float,
color_art int constraint chk_color check (color_art between 0 and 20),
um_art varchar (10) null default 'DEF_PZA',
primary key (id_art)
);

create table factura(
id_fact int not null,
id_clie int not null,
total_fact decimal (10,2),
fecha_fact datetime default now(), /*current_stamp para fecha actual*/
fecha_entrega datetime null,
constraint pk_factura primary key (id_fact),
constraint fk_factura_cte foreign key (id_clie) references cliente (id_clie) on delete cascade/* ON DELETE CASCADE actualiza algun registro de otra tabla, si es que se hizo una modificacion en una tabla raiz*/
);

create table det_fact(
id_fact int not null,
id_art int not null,
cant_art float,
primary key (id_fact, id_art),
constraint fk_detfact_fact foreign key (id_fact) references factura (id_fact) on update cascade,
constraint fk_detfact_art foreign key (id_art) references articulo (id_art) on update cascade
);

insert into usuarios (nombre_usuario,contraseña) values 
('Juanito', 'xxxx123'),
('Luis', 'yyyy126'),
('Mike','Miguel23');

-- Inserta registros en la tabla de clientes
-- 1) Verifica check en el campo "telefono" de la tabla cliente que da los insert. MySQL presenta porblemas segun la web xD
insert into cliente (id_clie, nom_clie, rfc_clie, tel_clie, dir_clie, suspendido) values 
(45,'Jose Hdez.','ABCD1234567',5529122713,'Sur 30', 0);

-- 2) Verifica default del campo "suspendido"
insert into cliente (id_clie, nom_clie, rfc_clie,tel_clie, dir_clie) values 
(41,'Pedro Olvera', 'AGXA-910101','5544466677','sur 31');

-- 3) Agregamos un valor al campo "suspendido" 
insert into cliente (id_clie, nom_clie, rfc_clie,tel_clie, dir_clie, suspendido) values
(47,'Luis Piedra', 'BBXA-910101','5544466677','sur 32', 1);

-- 4) Verifica el default en el campo "Telefono"
insert into cliente (id_clie, nom_clie, rfc_clie, dir_clie, suspendido) values 
(48,'Osvaldo IX', 'LLXA-910101','sur 33', 0),
(49,'Ricardo Mtz.', 'CcXA-910101','sur 34', 1);

-- 5) Verifica RFC, no funciona
insert into cliente (id_clie, nom_clie, rfc_clie,tel_clie, dir_clie, suspendido) values 
(44,'Rosa Alamraz', 'R7XA-910101','5544466677','sur 34', 0);


-- Inserta registros en la tabla de articulos
-- 1) Verificar check color (NUMERO ENTRE 0 Y 20) y defaults (Si no se asgina nombre de un producto)
insert into articulo (id_art, prec_art, peso_art, existencia, color_art) values 
(15, 121.45467, 130.2366, 44.2366, 10);

-- 2)Verificar Redondeos Precios, Cast y verificar que acorta los decimales por que se exceden
insert into articulo values (22, 'Mesa', 1000.45463, 50.2345, 200.23459, 10, 'Conjunto');
insert into articulo values (23, 'Silla', 300.4500, 15.2379, 1.2379, 15, 'kid 4' );
insert into articulo values (24, 'Silla', 100.4500, 15.2379, 1.2379, 15, 'kid 4' );
insert into articulo values (32, 'Sala',CAST('10000.45999' as float),40.2399, 200.2399, 3, 'kid 3' );
insert into articulo values (50, 'Puerta', 125.45111, 10.2311, 200.2311, 4, 'PZA');
insert into articulo values (54, 'Lampara',cast('50.000000' as float), 20.00, 10.00, 6, 'PZA');
insert into articulo values (64, 'Estufa',cast(10.00000000001 as float), 10.00, 10.00, 7, 'PZA');
insert into articulo values (53, 'Gancho', 20.37, 20.00, 10.00, 6, 'PZA');
insert into articulo values (63, 'Taza', cast(20.37 as float), 10.00, 10.00, 7, 'PZA');


-- Inserta registros en la tabla de facturas
-- Verificar Fechas
insert into factura (id_fact, id_clie, total_fact, fecha_entrega) values (1, 45, 100.00,'2012/05/16');
insert into factura (id_fact, id_clie, total_fact) values (2, 47, 111.25);
insert into factura values (3, 45, 150.50, '2012/05/16', '2012-05-31'); -- Ojo con los formatos, POR QUE PUSIMOS DATETIME Y SOLO PONEMOS DATE xD
insert into factura values (4, 48, 101.25, '2012/05/16', '2012-05-31 12:00:00');

-- Inserta registros en la tabla de detalle de facturas
insert into det_fact values ( 1, 54, 1.0);
insert into det_fact values ( 1, 32, 2.0);
insert into det_fact values ( 3, 15, 1.0);
insert into det_fact values ( 3, 23, 5.0);
insert into det_fact values ( 2, 32, 1.0);
insert into det_fact values ( 2, 54, 5.0);
insert into det_fact values ( 4, 15, 1.0);
insert into det_fact values ( 4, 32, 5.0);

-- 1ER paso Veriicar si se puede Borrar Cliente con sus Facturas Clausula On Delete Cascada
select * from cliente where id_clie = 47;
Select * from factura where id_fact = 2;
Select * from det_fact where id_fact = 2;

-- 1) Borrar factura
delete from factura where id_fact = 2;

-- 2) Borrar Cliente con sus facturas
delete from cliente where id_clie = 45;
/*
-- 2do paso Veriicar si se puede Actualizar Articulo en Factura Clausula On update Cascada

select * from articulo -- where id_clie = 47

Select * from det_fact -- where id_fact = 2

update articulo set id_art = 15

where id_art = 17;

-- 3er paso Veriicar si se puede Borrar Articulo Clausula On Delete

Drop table Articulo

-- Paso cuatro intente borrar una fila de Articulos Observe el error

delete articulo where id_art = 15

-- clausula on delete (Veifica integridad de los datos que se debe hacer).

-- Verique que pasa con las demas tablas al borrar la tabla del cliente

delete cliente

