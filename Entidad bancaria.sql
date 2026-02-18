#NOTAS:
# ELIMINAR LA BD
#drop database if exists entidad_bancaria;
# VISUALIZAR TABLAS QUE CONFORMAN LA BD
show tables;
#INDICAR QUE SE UDARÁ LA BD
use entidad_bancaria;

# CREAR BD DE ENTIDAD BANCARIA
create database if not exists entidad_bancaria;
#CREAR LA TABLA DE BANDA
create table if not exists banda(
cod_b int not null primary key,
noban varchar(30) not null) engine=InnoDB;

# CREAR LA TABLA DE ATRACADOR
create table if not exists atracador(
cod_a int not null primary key,
noma varchar(30) not null,
apa varchar(30) not null,
cod_b1 int not null,
foreign key (cod_b1 )references banda (cod_b) on delete cascade on update cascade) engine=InnoDB;

# CREAR LA TABLA DE ENTIDAD
create table if not exists entidad(
cod_e int not null primary key,
dome varchar(50) not null) engine=InnoDB;

# CREAR LA TABLA DE VIGILANTE
create table if not exists vigilante(
cod_v int not null primary key,
edadv int not null) engine=InnoDB;

# CREAR LA TABLA DE SUCURSAL
create table if not exists sucursal(
cod_s int not null primary key,
nemp varchar(30) not null,
dom varchar(30) not null,
cod_e1 int not null,
foreign key (cod_e1 )references entidad (cod_e) on delete cascade on update cascade) engine=InnoDB;

# CREAR LA TABLA DE CONTRATA
create table if not exists contrata(
cod_v1 int not null,
cod_s1 int not null,
fecha date not null,
arma varchar(30) not null,
foreign key (cod_v1 )references vigilante (cod_v) on delete cascade on update cascade,
foreign key (cod_s1 )references sucursal (cod_s) on delete cascade on update cascade) engine=InnoDB;

# CREAR LA TABLA DE JUEZ
create table if not exists juez(
cod_j int not null primary key,
nomj varchar(30) not null,
apj varchar(30) not null,
aj int not null) engine=InnoDB;

# CREAR LA TABLA DE ATRACA
create table if not exists atraca(
cod_a1 int not null,
cod_s2 int not null,
cod_j1 int not null,
fecha_at date not null,
tiempo time not null,
condena varchar (20) not null,
foreign key (cod_a1 )references atracador (cod_a) on delete cascade on update cascade,
foreign key (cod_s2 )references sucursal (cod_s) on delete cascade on update cascade,
foreign key (cod_j1 )references juez (cod_j) on delete cascade on update cascade) engine=InnoDB;