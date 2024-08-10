create database practica3;
use practica3;

create table Frecuencia(
id_frec	char,
nomb_frec varchar(20),
primary key (id_frec)
);

create table Revista(
id_rev int,
nom_rev varchar(30),
fk_id_frec char,
primary key (id_rev),
foreign key (fk_id_frec) references Frecuencia (id_frec)
);

create table Ejemplar(
fk_id_rev int,
id_ejem int,
fecha_ejem date,
precio_ejem double,
num_pag_ejemp int,
primary key (fk_id_rev, id_ejem),
foreign key (fk_id_rev) references Revista (id_rev)
);

create table Articulo(
id_art int,
nom_art varchar(50),
num_pag_art int,
primary key (id_art)
);

create table Ejem_art(
fk_fkid_rev int,
fk_id_ejem int,
fk_id_art int,
primary key (fk_fkid_rev, fk_id_ejem, fk_id_art),
foreign key (fk_fkid_rev, fk_id_ejem) references Ejemplar (fk_id_rev, id_ejem),
foreign key (fk_id_art) references Articulo (id_art)
);

create table Autor(
id_autor varchar(2),
nom_autor varchar(80),
rfc_autor varchar(10),
fk_pseudo_id varchar(2),
primary key (id_autor),
foreign key (fk_pseudo_id) references Autor (id_autor) 
);

create table Art_aut(
fk_id_art int, 
fk_id_autor varchar(2),
primary key (fk_id_art,fk_id_autor),
foreign key (fk_id_art) references Articulo (id_art), 
foreign key (fk_id_autor) references Autor (id_autor)
);

/*Tabla Frecuencia*/
insert into Frecuencia values 
('Q','Quicenal'),
('M','Mensual'),
('T','Trimestral');

/*Tabla Revista*/
insert into Revista values 
(1,'Mecanica popular','M'),
(2,'TV Novelas','Q'),
(3,'Byte','T');

/*Tabla Ejemplar*/
insert into Ejemplar values
(1,1,'2013-01-11',45.00,60),
(1,2,'2013-01-12',50.00,55),
(1,3,'2014-01-01',55.00,65),
(2,1,'2013-01-11',45.00,70),
(2,2,'2013-01-12',50.00,65),
(3,1,'2013-01-10',100.00,100),
(3,2,'2013-01-11',100.00,110),
(3,3,'2013-01-12',100.00,120),
(3,4,'2014-01-01',105.00,110),
(3,5,'2014-01-02',105.00,115);
 
/*Tabla Articulo*/
insert into Articulo values 
(1,'Compra Amortiguadores',10),
(2,'Novelas Mexicanas',30),
(3,'Cambio de Llantas',20),
(4,'Faros de Halogeno',25),
(5,'Traccion 4x4',25),
(6,'Afinacion Fuel Inj.',20),
(7,'Ford Fiesta',10),
(8,'Teatro Mexicano',30),
(9,'Valvulas',5),
(10,'Compra de Anillos',35),
(11,'Pistones Diesel',20),
(12,'Camisas para Motor',20),
(13,'Servidores HP',20),
(14,'Manejadores de BD',20),
(15,'Lenguajes 3G',20),
(16,'Sistemas Operativos',20),
(17,'Servidores Dell',10);

/*Tabla Ejem_art*/ 
insert into Ejem_art values 
(1,1,1),
(1,1,6),
(1,1,3),
(1,1,7),
(1,2,4),
(1,2,5),
(1,2,9),
(1,3,10),
(1,3,11),
(1,3,12),
(2,1,2),
(2,1,1),
(2,1,3),
(2,2,8),
(2,2,3),
(3,1,13),
(3,1,14),
(3,1,15),
(3,1,16),
(3,1,17);

/*Tabla Autor*/
insert into Autor values 
('A1','Juanito Salinas','JUSA123491',null),
('A2','Vianney Rey','VIRE432192',null),
('A3','Quijote',null,null),
('A4','Carmen Solorzano','CASO657599',null),
('A5','Marylin Monroe',null,'A2'),
('A6','John Date','JODAT12345',null),
('A7','Luis Sanchez','LISA678988',null),
('A8','Sancho',null,'A1'),
('A9','El cuervo',null,'A1');

/*Tabla Art_aut*/
insert into Art_aut values 
(1,'A1'),
(2,'A2'),
(3,'A3'),
(4,'A8'),
(5,'A9'),
(6,'A7'),
(7,'A1'),
(8,'A2'),
(9,'A3'),
(10,'A8'),
(11,'A9'),
(12,'A7'),
(13,'A5'),
(14,'A5'),
(15,'A4'),
(16,'A4'),
(17,'A6');

select * from art_aut;
select * from articulo;
select * from autor;
select * from ejem_art;
select * from ejemplar;
select * from frecuencia;
select * from revista;