# CREAR BD DE AGENTE DE SEGUROS
create database if not exists agente_seguros;
#USAR LA BD
use agente_seguros;

# CREAR LA TABLA DE VIDA
create table if not exists vida(
cod_v int not null primary key,
edad int not null,
prof varchar(20) not null,
caber varchar (20) not null,
prima varchar (20) not null )engine=InnoDB;

# CREAR LA TABLA DE BENEFICIARIO
create table if not exists beneficiario(
id_ben int not null primary key )engine=InnoDB;

# CREAR LA TABLA DE CLIENTE
create table if not exists cliente(
dni_cli varchar (15) not null primary key,
nom_cli varchar (30) not null,
dir_cli varchar(50) not null,
tel_cli varchar (15) not null )engine=InnoDB;

# CREAR LA TABLA DE AGENTE
create table if not exists agente(
dni_ag varchar (15) not null primary key,
nom_ag varchar (30) not null,
dir_ag varchar(50) not null,
tel_ag varchar (15) not null )engine=InnoDB;

# CREAR LA TABLA DE AUTOMOVIL
create table if not exists autmovil(
cod_a int not null primary key,
categoria varchar (30) not null,
edad int not null,
cober varchar (20) not null,
primaa varchar (20) not null )engine=InnoDB;

# CREAR LA TABLA DE HOGAR
create table if not exists hogar(
cod_h int not null primary key,
cmte varchar (15) not null,
primah varchar (15) not null,
dux varchar (20) not null,
ciclo varchar (20) not null )engine=InnoDB;

# CREAR LA TABLA DE CONTRATA A
create table if not exists contrata_A(
cod_v1 int not null,
id_ben1 int not null,
dni_cli1 varchar (15) not null,
dni_ag1 varchar (15) not null,
fecha_ca date not null,
foreign key (cod_v1 )references vida (cod_v) on delete cascade on update cascade,
foreign key (id_ben1 )references beneficiario (id_ben) on delete cascade on update cascade,
foreign key (dni_cli1 )references cliente (dni_cli) on delete cascade on update cascade,
foreign key (dni_ag1 )references agente (dni_ag) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE CONTRATA B
create table if not exists contrata_B(
cod_h1 int not null,
dni_cli2 varchar (15) not null,
dni_ag2 varchar (15) not null,
dir_cont varchar (55) not null,
fecha_cb date not null,
foreign key (cod_h1 )references hogar (cod_h) on delete cascade on update cascade,
foreign key (dni_cli2 )references cliente (dni_cli) on delete cascade on update cascade,
foreign key (dni_ag2 )references agente (dni_ag) on delete cascade on update cascade)engine=InnoDB;

# CREAR LA TABLA DE CONTRATA C
create table if not exists contrata_C(
cod_a1 int not null,
dni_cli3 varchar (15) not null,
dni_ag3 varchar (15) not null,
mat int not null,
fecha_cb date not null,
recargo int not null,
foreign key (cod_a1 )references autmovil (cod_a) on delete cascade on update cascade,
foreign key (dni_cli3 )references cliente (dni_cli) on delete cascade on update cascade,
foreign key (dni_ag3 )references agente (dni_ag) on delete cascade on update cascade)engine=InnoDB;