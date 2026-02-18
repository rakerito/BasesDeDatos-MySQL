# VISUALIZAR LAS BASES DE DATOS EXISTENTES
show databases;
show schemas;
# ELIMINAR LA BD DE CONCESIONARIO
drop database if exists concesionario;
# CREAR BD DE CONCEDSIONARIO
create database if not exists concesionario;
# SWITCHEAR O INDICAR QUE BD SE VA A USAR
use concesionario;
# VISUALIZAR TABLAS QUE CONFORMAN LA BD
show tables;

# CREAR LA TABLA DE OPCIÓN
create table if not exists opcion(
nomOp varchar(25) not null primary key,
descop varchar(90) not null )engine=InnoDB;

#DESCRIBIR LAS CARACTERÍSTICAS DE LA TABLA OPCIÓN
desc opcion;
describe opcion;

# CREAR LA TABLA DE MODELO
create table if not exists modelo(
cod_mod int not null primary key,
marca varchar (25) not null,
cil varchar(25) not null,
precio float not null) engine=InnoDB;

#CREAR TABLA DE tiene
create table if not exists tiene(
nomOp1 varchar(25) not null,
precio float not null,
cod_mod1 int not null,
foreign key (nomOp1) references opcion(nomOp) on delete cascade on update cascade,
foreign key (cod_mod1) references modelo(cod_mod) on delete cascade on update cascade
)engine=InnoDB;

#CREAR TABLA DE VENDEDOR
create table if not exists vendedor(
dni_ven varchar(20) not null primary key,
nom_ven varchar(40) not null,
dir_ven varchar(100) not null,
tel_ven varchar(12) not null
)engine=InnoDB;

#CREAR TABLA DE CLIENTE
create table if not exists cliente(
dni_cli varchar(20) not null primary key,
nom_cli varchar(40) not null,
dir_cli varchar(100) not null,
tel_cli varchar (12) not null
)engine=InnoDB;

#CREAR TABLA DE compra
create table if not exists compra(
cod_mod2 int not null,
dni_ven1 varchar(20) not null,
dni_cli1 varchar(20) not null,
mat varchar(15) not null,
fecha date not null,
foreign key (cod_mod2) references modelo(cod_mod) on delete cascade on update cascade,
foreign key (dni_ven1) references vendedor(dni_ven) on delete cascade on update cascade,
foreign key (dni_cli1) references cliente(dni_cli) on delete cascade on update cascade
)engine=InnoDB;

#CREAR TABLA DE VEHICULO
create table if not exists vehiculo(
mat_ve varchar(15) not null primary key,
marca_ve varchar(25) not null,
modelo_ve varchar(25) not null,
precio float not null
)engine=InnoDB;

#CREAR LA TABLA DE cede
create table if not exists cede(
dni_cli2 varchar(20) not null,
mat_ve1 varchar(15) not null,
fecha date not null,
foreign key (dni_cli2) references cliente(dni_cli) on delete cascade on update cascade,
foreign key (mat_ve1) references vehiculo(mat_ve)on delete cascade on update cascade
)engine=InnoDB;

