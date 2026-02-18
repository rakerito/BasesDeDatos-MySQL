#NOMBRE:RAQUEL PASTOR GAYTÁN
#GRUPO: DS02SM-24

# CREAR BD DE AGENTE DE HOLDING EMPRESARIAL
create database if not exists holding_empresarial;
#USAR LA BD
use holding_empresarial;

# CREAR LA TABLA DE AREA
create table if not exists area(
nom_ar varchar (15) not null primary key,
desc_ar varchar (100) not null )engine=InnoDB;

# CREAR LA TABLA DE ASESOR
create table if not exists asesor(
cod_a int not null primary key,
nom_a varchar (30) not null,
dir_a varchar(50) not null,
tel_a varchar(11) not null )engine=InnoDB;

# CREAR LA TABLA DE VENDEDOR
create table if not exists vendedor(
cod_v int not null primary key,
nom_v varchar (30) not null,
dir_v varchar(50) not null )engine=InnoDB;

# CREAR LA TABLA DE EMPRESA
create table if not exists empresa(
nom_emp varchar (20) not null primary key,
fecha_emp date not null,
fact_emp varchar(15) not null )engine=InnoDB;

# CREAR LA TABLA DE CAPTA A
create table if not exists capta_A(
cod_v1 int not null ,
nom_emp1 varchar (20) not null ,
fecha_capA date not null,
foreign key (cod_v1 )references vendedor (cod_v) on delete cascade on update cascade,
foreign key (nom_emp1 )references empresa (nom_emp) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE ASESORA
create table if not exists asesora(
cod_a1 int not null,
nom_emp2 varchar (20) not null ,
nom_ar1 varchar (15) not null,
fecha_cap date not null,
foreign key (cod_a1 )references asesor (cod_a) on delete cascade on update cascade,
foreign key (nom_emp2 )references empresa (nom_emp) on delete cascade on update cascade,
foreign key (nom_ar1 )references area (nom_ar) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE CAPTA B
create table if not exists capta_B(
cod_v2 int not null,
cod_v3 int not null,
fecha_capB date not null,
foreign key (cod_v2 )references vendedor (cod_v) on delete cascade on update cascade,
foreign key (cod_v3 )references vendedor (cod_v) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE PAIS
create table if not exists pais(
nom_pa varchar (50) not null primary key,
pib varchar(15) not null,
hab int not null,
cap varchar (20) not null )engine=InnoDB;

# CREAR LA TABLA DE ACTUA
create table if not exists actua(
nom_emp3 varchar (20) not null,
nom_pa1 varchar (50) not null,
foreign key (nom_emp3)references empresa (nom_emp) on delete cascade on update cascade,
foreign key (nom_pa1 )references pais (nom_pa) on delete cascade on update cascade)engine=InnoDB;
