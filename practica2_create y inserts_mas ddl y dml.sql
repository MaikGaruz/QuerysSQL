create database PRACTICA2;
use PRACTICA2; /*Se indica que BD se va usar*/

/*crea una tabla, vista, indice o una BD*/
create table Inquilino(
	id_inquilino int not null,
    nombre varchar(40),
    rfc varchar(12),
    edad int,
    telefono int,
    primary key (id_inquilino)
    );

create table Clasificacion(
	id_clasificacion int,
    descrip_clasificacion varchar(12),
    monto_renta int,
    primary key (id_clasificacion)
    );
    
create table Caracteristica(
	id_caract varchar(2),
    desc_caract varchar(100),
    monto_car float,
    primary key (id_caract)
    );

create table Departamento(
	id_depto int not null,
    fk_id_inquilino int,
    fk_id_clasificacion int,
    num_rec int,
    chimenea bool,
    lavaplatos bool,
    cocina_int bool,
    primary key (id_depto),
    foreign key (fk_id_inquilino) references Inquilino (id_inquilino),
    foreign key (fk_id_clasificacion) references Clasificacion (id_clasificacion)
    );
   
create table Cajon(
	id_cajon int not null,
    ubicacion varchar(10),
    fk_id_depto int,
    primary key (id_cajon),
    foreign key (fk_id_depto) references Departamento (id_depto)
);

create table Depto_Caracteristicas(
	fk_id_depto int,
	fk_id_caract varchar(2),
	primary key (fk_id_depto,fk_id_caract),
	foreign key (fk_id_depto) references Departamento (id_depto),
	foreign key (fk_id_caract) references Caracteristica (id_caract)
	);

/*insert into NOMBRETABLA values -> sirve para insertar valores a una tabla*/
/* Tabla Inquilinos */
insert into Inquilino values
(3,'Juanito Banana','JB830581',28,5586768),
(8,'Betty','Bh830581',37,55153022),
(13,'Luis Montiel','LF830581',56,55997666),
(14,'Paulo','PL830581',30,5593761),
(19,'Alex Lora','AL830581',48,5595768),
(20,'Leticia','LS830581',22,5574537),
(25,'Osvaldo','OV830581',30,5557447);

/* Tabla clasificacion */
insert into Clasificacion values 
(1,'Economico',3200.00),
(2,'Regular',4200.00),
(3,'Lujo',5200.00);

/* Tabla Caracteristica */
insert into Caracteristica values 
('VP','Con vista a la playa',40.00),
('CC','Con cable',40.00),
('CT','Con vista cancha de Tenis',10.00),
('VA','Con vista a la albarca',30.00);

/* Tabla departamentos */
insert into Departamento values
(1,13,3,3,1,1,1),
(2,null,3,3,1,1,1),
(3,3,1,2,0,0,1),
(4,13,2,2,0,1,1),
(5,25,2,2,0,1,1),
(6,8,3,3,1,1,1),
(7,null,3,3,1,1,1),
(8,14,1,2,0,0,1),
(9,19,2,2,0,1,1),
(10,20,2,2,0,1,1),
(28,3,1,2,0,0,1);

/* Tabla cajon */
insert into Cajon values 
(20,'Zona D',10),
(28,'Zona A',3),
(29,'Zona A',3),
(70,'Zona C',1);

/* Tabla Depto_Caracteristicas ojojojo */
insert into Depto_Caracteristicas values
(1,'VP'),
(1,'CT'),
(1,'CC'),
(2,'CT'),
(2,'VA'),
(3,'VA'),
(4,'CT'),
(5,'VA'),
(5,'CC');

/*Muestra el contenido de las tablas*/
select * from Inquilino;
select * from Clasificacion;
select * from Caracteristica;
select * from Departamento;
select * from Depto_Caracteristicas;

drop table Depto_Caracteristicas; /*Borra la tabla y todo su contenido*/
drop database practica2; /*Borra la base de datos*/

alter table Depto_Caracteristicas add aqui_no_va_nada int;	/*Agrega un atributo (columna) mas a alguna tabla*/
alter table Depto_Caracteristicas drop aqui_no_va_nada;	/*Borra un atributo (columna) mas a alguna tabla*/
alter table Depto_Caracteristicas rename column aqui_no_va_nada to aqui_si_va_algo; /*Cambia el nombre del atributo*/

rename table Depto_Caracteristica to Depto_Caracteristicas; /* Cambia el nombre de la tabla. Cuidado con las consultas*/

truncate table Depto_Caracteristicas; /*Borra el contenido de la tabla. Conserva la estructura y los indices (Por el 1,1). Mas rapido que delete*/

delete from Depto_Caracteristicas; /*Borra el contenido de una tabla*/
delete from Depto_Caracteristicas where fk_id_caract = 'CC'; /*Elimina los registros con las condiciones indicadas*/
update Depto_Caracteristicas set aqui_no_va_nada = 100 where fk_id_caract = 'CC';

