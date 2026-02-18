#NOMBRE:RAQUEL PASTOR GAYTÁN
#GRUPO: DS02SM-24

# CREAR BD DE AGENTE DE CLUB NÁUTICO
create database if not exists club_náutico;
#USAR LA BD
use club_náutico;

# CREAR LA TABLA DE SOCIO
create table if not exists socio(
dni_so varchar (15) not null primary key,
nom_so varchar (30) not null,
dir_so varchar(50) not null,
tel_so varchar (15) not null,
fecha_so date not null )engine=InnoDB;

# CREAR LA TABLA DE EMBARCACIÓN
create table if not exists embarcación(
mat varchar (15) not null primary key,
nom_emb varchar (20) not null,
tipo_emb varchar(20) not null,
dimo varchar (50) not null )engine=InnoDB;

# CREAR LA TABLA DE tiene
create table if not exists tiene(
dni_so1 varchar (15) not null,
mat1 varchar (15) not null,
foreign key (dni_so1 )references socio (dni_so) on delete cascade on update cascade,
foreign key (mat1 )references embarcación (mat) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE ZONA
create table if not exists zona(
letrat varchar (2) not null primary key,
tipo_zo varchar (20) not null,
pror varchar(20) not null )engine=InnoDB;

# CREAR LA TABLA DE AMARRE
create table if not exists amarre(
numa int not null primary key,
agua varchar (10) not null,
luz varchar(20) not null,
mant varchar (3) not null,
letrat1 varchar (2) not null,
foreign key (letrat1 )references zona (letrat) on delete cascade on update cascade )engine=InnoDB;

# CREAR LA TABLA DE ocupa
create table if not exists ocupa(
mat2 varchar (15) not null,
numa1 int not null,
fecha_oc date not null,
foreign key (mat2 )references embarcación (mat) on delete cascade on update cascade,
foreign key (numa1 )references amarre (numa) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE compra
create table if not exists compra(
dni_so2 varchar (15) not null,
numa2 int not null,
fecha_com date not null,
foreign key (dni_so2 )references socio (dni_so) on delete cascade on update cascade,
foreign key (numa2 )references amarre (numa) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE EMPLEADO
create table if not exists empleado(
cod_e varchar (15) not null primary key,
nom_e varchar (30) not null,
dir_e varchar(50) not null,
tel_e varchar (15) not null,
espec varchar (10) not null )engine=InnoDB;

# CREAR LA TABLA DE asignado
create table if not exists asignado(
letrat2 varchar (2) not null,
cod_e1 varchar (15) not null,
no_barcos int (4) not null,
foreign key (letrat2 )references zona (letrat) on delete cascade on update cascade,
foreign key (cod_e1 )references empleado (cod_e) on delete cascade on update cascade)engine=InnoDB;
