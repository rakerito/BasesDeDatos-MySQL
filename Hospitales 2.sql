-- DATOS
# NOMBRE: RAQUEL PASTOR GAYTÁN
# GRUPO: DS02SM-24

#BORRAR BASE DE DATOS
drop database Hospitales2;
#CREAR BASE DE DATOS
create database if not exists Hospitales2;
#USAR BASE DE DATOS
use Hospitales2;
#CREAR TABLAS
create table if not exists hospital(
codHos int not null primary key,
nomHos varchar (15) character set utf8mb4 collate utf8mb4_unicode_ci not null unique,
munHos varchar (45) character set utf8mb4 collate utf8mb4_unicode_ci not null,
numPlazas int not null) engine=InnoDB;

create table if not exists empleado(
cveEmp int not null primary key,
nomEmp varchar (45) character set utf8mb4 collate utf8mb4_unicode_ci not null unique,
numEmp varchar (25) character set utf8mb4 collate utf8mb4_unicode_ci not null,
puesEmp varchar (15) character set utf8mb4 collate utf8mb4_unicode_ci not null,
salEmp float not null,
comEmp float,
codHos1 int not null,
foreign key (codHos1) references hospital (codHos) on update cascade on delete cascade)engine=InnoDB;

create table if not exists especialidad(
cveEmp1 int not null,
especMed varchar (15) character set utf8mb4 collate utf8mb4_unicode_ci not null,
foreign key (cveEmp1) references empleado (cveEmp) on delete cascade on update cascade)engine=InnoDB;

-- . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .. . . . . . . . . . . . .

# 2) Usando comandos del tipo DML:
# a. Inserte los registros que se muestran en el modelo relacional.
-- insertar en la tabla de hospital
insert into hospital values (1, "AZUL MARINO", "TEQUISQUIAPAN",23);
insert into hospital values (2, "VERDE AGUA", "SAN JUAN DEL RÍO",50);
select*from hospital;

-- insertar en la tabla de empleado
insert into empleado values
(1,"GARCÍA HERNÁNDEZ ELADIO","TEQUISQUIAPAN","CONSERJE",4800,1000,1),
(2,"FUENTES BERMEJO CARLOS","SAN JUAN DEL RÍO","DIRECTOR",19000,null,2),
(3,"CASTILLO MONTES PEDRO","SAN JUAN DEL RÍO","MÉDICO",17100,2000,2),
(4,"MESA DEL CASTILLO JUAN","TEQUISQUIAPAN","MÉDICO",18800,null,1),
(5,"CRUZ LÓPEZ MARÍA","SAN JUAN DEL RÍO","CONSERJE",5000,1200,2),
(6,"RUEDA PIÑA MÓNICA","SAN JUAN DEL RÍO","DIRECTOR",19800,null,1);
select*from empleado; #mostrar el contenido de la tabla de empleado

-- insertar en la tabla de especialidad
insert into especialidad (cveEmp1, especMed) values (3,"CIRUJANO");
insert into especialidad (cveEmp1, especMed) values (4,"INTERNISTA");
select*from especialidad;
#eliminar registro
delete from especialidad where cveEmp1=3;
delete from especialidad where cveEmp1=4;

# b. Regístrese como empleado con clave de empleado igual a 7 con los datos que crea conveniente.
insert into empleado values
(7,"RAQUEL PASTOR GAYTÁN","SAN JUAN DEL RÍO","MÉDICO",60000,null,2);

# c. Ejecute
#    i. select *  fom  hospital
#    ii. Select * from empleado;
#    iii. Select * from especialidad;

# d. Modifique el municipio dónde reside el empleado RUEDA PIÑA MÓNICA por TEQUISQUIAPAN.
update empleado 
set numEmp="TEQUISQUIAPAN"
where nomEmp="RUEDA PIÑA MÓNICA";
# e. Modifique la comisión del empleado GARCÍA HERNÁNDEZ ELADIO, la nueva comisión es de 1150
update empleado
set comEmp= 1150
where nomEmp="GARCÍA HERNÁNDEZ ELADIO";
# f. Modifique el número de plazas del hospital AZUL MARINO por 32 plazas.
update hospital
set numPlazas= 32
where nomHos="AZUL MARINO";
select*from hospital;

# 3) Consultar los datos almacenados
# a) Para resolver cada consulta, se debe seguir los siguientes pasos:
# i. Leer detenidamente cada enunciado, hasta que haya creído entender lo que se pide.
# ii. Expresar mediante una sentencia SELECT
#    i. Para las consultas multitabla expresar mediante una sentencia SELECT y algún (s) tipo (s) de unión de tablas (Unión, Intersección, Producto cartesiano, Join) o simplemente por medio de una subconsulta

# 1. Mostrar todos los datos de los hospitales
select*from hospital;
select codHos, nomHos, munHos, numPlazas from hospital;
# 2. Mostrar todos los datos de los hospitales de SAN JUAN DEL RÍO
select*from hospital
where munHos="SAN JUAN DEL RÍO";
# 3. Mostrar el nombre, lugar de residencia y salario de todos los empleados que tengan el puesto de DIRECTOR
select nomEmp, numEmp,salEmp from empleado
where puesEmp="DIRECTOR";
# 4. Mostrar el nombre, lugar de residencia y salario de todos los empleados
select nomEmp, numEmp, salEmp from empleado;
# 5. Mostrar a los empleados que residan en SAN JUAN DEL RÍO
select *from empleado
where numEmp="SAN JUAN DEL RÍO";
# 6. Mostrar el nombre de los empleados que son MÉDICOS
select nomEmp from empleado
where puesEmp="MÉDICO";
# 7. Lugar de residencia del empleado MESA DEL CASTILLO JUAN
select numEmp from empleado
where nomEmp="MESA DEL CASTILLO JUAN";
# 8. Mostrar el nombre de los empleados que tienen un salario inferior a 5000
-- operadores aritméticos (+,-,*,/,...)
-- operadores lógicos (AND, OR)
select nomEmp from empleado
where salEmp<5000;
# 9. Mostrar el nombre de los empleados que tienen un salario entre 8000 y 19000 (Para este enunciado realizar una consulta usando BETWEEN y otra utilizando operadores relacionales >= y <=)
select nomEmp from empleado
where salEmp>=8000 and salEmp<=19000;
-- con between
select nomEmp from empleado
where salEmp between 8000 and 19000;
# 10. Mostrar el nombre de los empleados que su nombre inicie con una letra C y termine con una letra O (usar LIKE)
select nomEmp from empleado
where nomEmp LIKE "C%" and nomEmp LIKE "%O";
-- con solo una
select nomEmp from empleado
where nomEmp LIKE "C%%O";
# 11. Mostrar la nómina de los empleados (usar SUM)
select sum(comEmp) from empleado;
# 12. Mostrar el salario promedio de los empleados (usar AVG)
select avg(salEmp) from empleado;
# 13. Mostrar el salario mínimo de los empleados (usar MIN)
select min(salEmp) from empleado;
# 14. Mostrar el salario máximo de los empleados (usar MAX)
select max(salEmp) from empleado;
# 15. Mostrar el nombre de los empleados que tienen comisión (usar IS NOT NULL)
select nomEmp from empleado
where comEmp is not null;
# 16. Mostrar el nombre de los empleados que no tienen comisión (usar IS NULL)
select nomEmp from empleado
where comEmp is null;
# 17. Mostrar el nombre de los empleados que residen en SAN JUAN DEL RÍO o TEQUISQUIAPAN (Para este enunciado realizar una consulta usando IN y otra utilizando el operador relacional =)

# 18. Mostrar el nombre de los empleados que no sean de SAN JUAN DEL RÍO ni de TEQUISQUIAPAN (Para este enunciado realizar una consulta usando NOT IN y otra utilizando el operador relacional <>)--
select nomEmp from empleado
where numEmp!="SAN JUAN DEL RÍO" AND numEmp<>"TEQUISQUIAPAN";
# 19. Mostrar el nombre de los empleados ordenados ascendentemente (usar ORDER BY, ASC)
select nomEmp from empleado order by nomEmp;
select nomEmp from empleado order by nomEmp asc;
# 20. Mostrar el nombre de los empleados ordenados descendentemente (usar ORDER BY, DESC)
select nomEmp from empleado order by nomEmp desc;
# 21. Mostrar el nombre de los empleados y su salario, ordenar por salario de manera ASCENDENTE
select nomEmp,salEmp from empleado order by salEmp asc;
# 22. Mostrar el nombre de los empleados y su salario, ordenar por salario de manera DESCENDENTE
select nomEmp,salEmp from empleado order by salEmp desc;
# 23. Mostrar el nombre de los empleados concatenando el municipio de residencia (usar CONCAT)
select concat (nomEmp, "  - ",numEmp) as DATOS from empleado;
# 24. Mostrar el nombre de los empleados y el valor mayor del salario.
-- ES SIMILAR A LA 30
# 25. Mostrar el nombre, salario y el lugar de residencia de los empleados que tengan un salario entre 2000 y 5000 pesos y que residan en SAN JUAN DEL RIO
select nomEmp,salEmp,numEmp from empleado
where salEmp>=2000 and salEmp<=5000 and numEmp="SAN JUAN DEL RÍO";

select nomEmp,salEmp,numEmp from empleado
where salEmp between 2000 and 5000 and numEmp="SAN JUAN DEL RÍO";
# 26. Mostrar el lugar de residencia de los empleados sin duplicados (usar DISTINCT)
select distinct numEmp from empleado;
# 27. ¿Cuántos empleado están registrados en la base de datos? (usar COUNT)
select count(cveEmp) as NÚMERO_DE_EMPLEADOS from empleado;
# 28. Mostrar el nombre de los empleados que tienen el mismo puesto que MESA DEL CASTILLO JUAN
select nomEmp from empleado
where puesEmp=(select puesEmp from empleado
	where nomEmp="MESA DEL CASTILLO JUAN")
    and nomEmp!="MESA DEL CASTILLO JUAN";
# 29. Mostrar el nombre de los empleados que no tienen el salario menor
select nomEmp from empleado
where salEmp!=(select min(salEmp) from empleado);
# 30. Mostrar el nombre de los empleados que tengan el salario mayor
select nomEmp from empleado
where salEmp=(select max(salEmp) from empleado);
# 31. Nombre del empleado con mayor comisión
select nomEmp from empleado
where comEmp=(select max(comEmp) from empleado);
# 32. Nombre del empleado y puesto con menor comisión
select nomEmp from empleado
where comEmp=(select min(comEmp) from empleado);
# 33. ¿Con cuántas plazas cuenta el hospital VERDE AGUA?
select numPLazas as PLAZAS from hospital
where nomHos="VERDE AGUA";
# 34. Mostrar la nómina de los MÉDICOS (usar SUM)
select sum(salEmp) as NÓMINA_DE_LOS_MÉDICOS from empleado
where puesEmp="MÉDICO";
# 35. Mostrar el salario promedio de los MÉDICOS (usar AVG)
select avg(salEmp) as SALARIO_PROMEDIO_MÉDICOS from empleado
where puesEmp="MÉDICO";
# 36. Mostrar el salario mínimo de los médicos (usar MIN)
select min(salEmp) as SALARIO_MÍNIMO_MÉDICOS from empleado
where puesEmp="MÉDICO";
# 37. Mostrar el salario máximo de los médicos (usar MAX)
select max(salEmp) as SALARIO_MÁXIMO_MÉDICOS from empleado
where puesEmp="MÉDICO";
# 38. Mostrar el nombre de los médicos que tienen comisión (usar IS NOT NULL)
select nomEmp as MÉDICOS_CON_COMISIÓN from empleado
where comEmp is not null;
# 39. Mostrar el nombre de los médicos que no tienen comisión (usar IS NULL)
select nomEmp as MÉDICOS_CON_COMISIÓN from empleado
where comEmp is null;
# 40. Mostrar el nombre de los hospitales que su nombre contenga al menos una A en cualquier posición (usar LIKE)
select nomHos from hospital
where nomHos LIKE "%A%";
# 41. Mostrar el nombre de los hospitales que su nombre inicie con E (usar LIKE)
select nomHos from hospital
where nomHos LIKE "E%";
# 42. Mostrar el nombre de los hospitales que su nombre termine con A (usar LIKE)
select nomHos from hospital
where nomHos LIKE "%A";
# 43. Mostrar el nombre de los hospitales que su nombre contenga al menos una letra A, que residan en SAN JUAN DEL RÍO y que tengan más de 30 plazas.
select nomHos from hospital
where nomHos LIKE "%A%" and munHos="SAN JUAN DEL RÍO" and numPlazas>30;
# 44. Mostrar el nombre de los hospitales que su nombre inicie con una letra A, que residan en SAN JUAN DEL RÍO o TEQUISQUIAPAN y que tengan más de 20 plazas
select nomHos from hospital
where nomHos LIKE "A%" and munHos="SAN JUAN DEL RÍO" or munHos="TEQUISQUIAPAN" and numPlazas>30;
# 45. Mostrar las especialidades en minúsculas (usar LOWER)
select lower(especMed) from especialidad;
# 46. Mostrar las especialidades en mayúsculas (usar UPPER)
select upper(especMed) from especialidad;
# 47. Mostrar el municipio donde se encuentra el hospital AZUL MARINO
select munHos from hospital
where nomHos="AZUL MARINO";
# 48. Mostar el número de plazas que existe en los hospitales registrados en la base de datos
select nomHos,numPlazas from hospital;
# 49. Mostrar el nombre de los médicos y la longitud del nombre (usar LENGTH)
select nomEmp as NOMBRE_EMPLEADO,length(nomEmp) as LARGO from empleado
where puesEmp="MÉDICO";
# 50. ¿Cuántos médicos se encuentran registrados en la base de datos?
select count(cveEmp) as NUM_MÉDICOS from empleado
where puesEmp="MÉDICO";
# 51. Mostrar las especialidades de los médicos sin duplicados.
select distinct especMed from especialidad;
# 52. Mostrar el nombre del hospital y el valor mayor plazas
select nomHos, numPlazas from hospital
where numPlazas=(select max(numPlazas) from hospital);
# 53. Nombre del hospital con el menor número de plazas
select nomHos, numPlazas from hospital
where numPlazas=(select min(numPlazas) from hospital);
# 54. Municipio dónde se encuentra el hospital con mayor número de plazas
select munHos from hospital
where numPlazas=(select max(numPlazas)from hospital);
# 55. Mostrar el nombre de los médicos y su especialidad
-- PRODUCTO CARTESIANO
select em.cveEmp,em.nomEmp,es.especMed from empleado as em, especialidad as es
where em.cveEmp=es.cveEmp1  and em.puesEmp="MÉDICO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN NATURAL
select em.cveEmp,em.nomEmp, es.especMed from empleado as em INNER JOIN especialidad as es ON(em.cveEmp=es.cveEmp1)
where em.puesEmp="MÉDICO";
# 56. ¿Qué especialidad tiene el médico MESA DEL CASTILLO JUAN?
select cveEmp,nomEmp, especMed from empleado, especialidad
where cveEmp=cveEmp1 and nomEmp="MESA DEL CASTILLO JUAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
select em.cveEmp,em.nomEmp, es.especMed from empleado as em INNER JOIN especialidad as es ON (em.cveEmp=es.cveEmp1)
where nomEmp="MESA DEL CASTILLO JUAN" and em.puesEmp="MÉDICO";
-- SUBCONSULTA
select especMed from especialidad
where cveEmp1 in(select cveEmp from empleado
where puesEmp="MÉDICO" and nomEmp="MESA DEL CASTILLO JUAN");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 57. Nombre de los médicos que tienen la especialidad de cirujano
-- SUBCONSULTA
select nomEmp from empleado
where puesEmp="MÉDICO" and cveEmp=(select cveEmp1 from especialidad
where especMed="CIRUJANO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select em.cveEmp,em.nomEmp, es.especMed from empleado as em INNER JOIN especialidad as es ON (em.cveEmp=es.cveEmp1)
where es.especMed="CIRUJANO" and em.puesEmp="MÉDICO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select em.cveEmp,em.nomEmp, es.especMed from empleado as em, especialidad as es 
where em.cveEmp=es.cveEmp1 and es.especMed="CIRUJANO" and em.puesEmp="MÉDICO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 58. Nombre de los directores que viven en el mismo municipio que el director FUENTES BERMEJO CARLOS
select nomEMp from empleado
where puesEmp="DIRECTOR" AND numEmp=(select numEmp from empleado
where nomEmp="FUENTES BERMEJO CARLOS" and
nomEmp!="FUENTES BERMEJO CARLOS");
# 59. Nombre de los empleados que residen en el mismo municipio que CASTILLO MONTES PEDRO
select nomEMp from empleado 
where numEmp=(select numEmp from empleado
where nomEmp="CASTILLO MONTES PEDRO")
and nomEmp!="CASTILLO MONTES PEDRO";
# 60. Nombre de los empleados que trabajan en el mismo hospital que MESA DEL CASTILLO JUAN
select nomEmp from empleado 
where codHos1=(select codHos1 from empleado
where nomEmp="MESA DEL CASTILLO JUAN") and 
nomEmp!="MESA DEL CASTILLO JUAN";
# 61. Clave y nombre de los empleados que tienen el mismo salario y la misma comisión que GARCÍA HERNÁNDEZ ELADIO
select cveEmp, nomEmp from empleado
where salEmp=(select salEmp from empleado
where nomEmp="GARCÍA HERNÁNDEZ ELADIO") and
comEmp=(select comEmp from empleado
where nomEmp="GARCÍA HERNÁNDEZ ELADIO") and
nomEmp!="GARCÍA HERNÁNDEZ ELADIO";
# 62. Nombre del hospital donde labora el empleado CASTILLO MONTES PEDRO
-- SUBCONSULTA
select nomHos from hospital
where codHos in (select codHos1 from empleado
where nomEmp="CASTILLO MONTES PEDRO");
-- PRODUCTO CARTESIANO
select h.nomHos from hospital as h, empleado as e
where h.codHos=e.codHos1 and nomEmp="CASTILLO MONTES PEDRO";
-- JOIN
select h.nomHos from hospital as h INNER JOIN empleado as e ON (h.codHos=e.codHos1) 
where nomEmp="CASTILLO MONTES PEDRO";
# 63. Municipio donde labora el empleado FUENTES BERMEJO CARLOS
-- SUBCONSULTA
select numEmp from empleado
where nomEmp in (select nomEmp from empleado
where nomEmp="CASTILLO MONTES PEDRO");
-- PRODUCTO CARTESIANO
select h.nomHos from hospital as h, empleado as e
where h.codHos=e.codHos1 and nomEmp="CASTILLO MONTES PEDRO";
-- JOIN
select h.nomHos from hospital as h INNER JOIN empleado as e ON (h.codHos=e.codHos1) 
where nomEmp="CASTILLO MONTES PEDRO";
# 64. Mostrar a los empleados agrupados por el lugar de residencia
select nomEmp, numEmp from empleado
order by numEmp asc;
# 65. Mostrar a los empleados agrupados por hospital
select nomEmp, codHos1 from empleado
order by codHos1 asc;
# 66. Mostrar el nombre de los empleados y el nombre del hospital donde laboran
-- PRODUCTO CARTESIANO
select e.nomEmp, h.nomHos from empleado as e, hospital as h
where e.codHos1=h.codHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp, h.nomHos from empleado as e INNER JOIN hospital as h
ON (e.codHos1=h.codHos);
# 67. Nombre de los empleados que trabajan en el hospital AZUL MARINO
-- SUBCONSULTA
select nomEmp from empleado
where codHos in (select codHos from hospital
where nomHos="AZUL MARINO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos)
where nomHos="AZUL MARINO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp from empleado as e, hospital as h
where nomHos="AZUL MARINO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 68. ¿Cuál es el mayor salario que perciben los empleados del hospital VERDE AGUA?
-- SUBCONSULTA
select max(salEmp) from empleado
where codHos1=(select codHos from hospital
where nomHos="VERDE AGUA");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select max(e.salEmp) from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos)
where nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select max(e.salEmp) from empleado as e, hospital as h 
where e.codHos1=h.codHos and nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 69. ¿Qué puestos tiene vigentes el hospital AZUL MARINO?
-- SUBCONSULTA
select puesEmp as PUESTOS_VIGENTES from empleado, hospital
where nomHos="AZUL MARINO" and codHos1=1;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PLANO CARTESIANO
select e.puesEmp as PUESTOS_VIGENTES from empleado as e, hospital as h 
where h.nomHos="AZUL MARINO" and codHos1=1;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.puesEmp as PUESTOS_VIGENTES from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos)
where h.nomHos="AZUL MARINO" and codHos1=1;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 70. Mostrar la especialidad de los médicos que laboran en el hospital VERDE AGUA
-- SUBCONSULTA POR LA MAESTRA
select especMed from especialidad 
where cveEmp1 in(select cveEmp from empleado
where puesEmp="MÉDICO" and codHos1 in (select codHos from hospital
where nomHos="VERDE AGUA"));
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PLANO CARTESIANO
select es.especMed from especialidad as es
where cveEmp1 in(select e.cveEmp from empleado as e 
where e.puesEmp="MÉDICO" and e.codHos1 in (select h.codHos from hospital as h
where h.nomHos="VERDE AGUA" and e.puesEmp="MÉDICO"));
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN POR LA MAESTRA
select es.especMed from especialidad as es INNER JOIN empleado as e ON (e.cveEmp=es.CveEmp1)
INNER JOIN hospital as h ON (e.codhos1=h.codHos)
where e.puesEmp="MÉDICO" and h.nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PLANO CARTESIANO POR LA MAESTRA
select es.especMed from especialidad as es, empleado as e, hospital as h
where es.cveEmp1=e.cveEmp and e.codHos1=h.codHos and
h.nomHos="VERDE AGUA" and e.puesEmp="MÉDICO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 71. Mostrar los municipios dónde se encuentran ubicados los hospitales donde laboran los médicos cirujanos
-- SUBCONSULTA
select munHos from hospital
where codHos in(select codHos1 from empleado 
where puesEmp="MÉDICO" and cveEMp in (select cveEmp1 from especialidad
where especMed="CIRUJANO"));
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select h.munHos from especialidad as es, empleado as e, hospital as h
where es.cveEmp1=e.cveEmp and
e.codHos1= h.codHos and
es.especMed="CIRUJANO" and
e.puesEmp="MÉDICO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select h.munHos from especialidad as es INNER JOIN empleado as e ON (codHos=codHos1) INNER JOIN hospital as h ON (es.cveEmp1=e.cveEmp)
where e.codHos1= h.codHos and
es.especMed="CIRUJANO" and
e.puesEmp="MÉDICO"; #A ESTE HACE FALTA ANOTARLO BIEN
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 72. Mostrar el nombre, municipio de residencia de aquellos que empleados que laboran en el hospital AZUL MARINO.
-- SUBCONSULTA
select nomEmp, numEmp from empleado
where codHos1 in (select codHos from hospital
where nomHos="AZUL MARINO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp, e.numEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and h.nomHos="AZUL MARINO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp, e.numEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos) 
where h.nomHos="AZUL MARINO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 73. Nombre de los empleados que trabajan en el municipio de TEQUISQUIAPAN
-- SUBCONSULTA
select nomEmp, munHos from empleado, hospital
where codHos1=codHos and munHos="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp, h.munHos from empleado as e, hospital as h
where e.codHos1=h.codHos and h.munHos="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp, h.munHos from empleado as e INNER JOIN hospital as h on (e.codHos1=h.codHos)
where h.munHos="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 74. Nombre de los empleados que residen en SAN JUAN DEL RÍO, que ganen un salario superior a los 6000 pesos y que laboren en el hospital AZUL MARINO
-- SUBCONSULTA
select nomEmp, numEmp, salEmp, nomHos from empleado, hospital
where codHos1=codHos and numEmp="SAN JUAN DEL RÍO" and salEmp>6000 and codHos1 in (select codHos from hospital
where nomHos="AZUL MARINO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp, e.numEmp, e.salEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and e.numEmp="SAN JUAN DEL RÍO" and e.salEmp>6000 and h.nomHos="AZUL MARINO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 75. Nombre y salario de los empleados que no tienen comisión y que laboran en el municipio de SAN JUAN DEL RÍO
-- SUBCONSULTA
select nomEmp, salEmp from empleado, hospital
where codHos=codHos1 and comEmp IS null and codHos1 in (select codHos from hospital
where munHos="SAN JUAN DEL RÍO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp, e.salEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and e.comEmp IS null and h.munHos="SAN JUAN DEL RÍO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp, e.salEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos)
where e.comEmp IS null and h.munHos="SAN JUAN DEL RÍO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 76. Nombre del hospital donde laboran empleados que residen en TEQUISQUIAPAN
-- SUBCONSULTA
select distinct (nomHos) from hospital, empleado
where codHos=codHos1 and numEmp="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select distinct (h.nomHos) from hospital as h, empleado as e
where h.codHos=e.codHos1 and e.numEmp="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select distinct (h.nomHos) from hospital as h INNER JOIN empleado as e ON (h.codHos=e.codHos1)
where e.numEmp="TEQUISQUIAPAN";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 77. Nombre de los empleados que residan y laboren en el mismo municipio
-- SUBCONSULTA
select nomEmp from empleado, hospital
where codHos1=codHos and numEmp=munHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and e.numEmp=h.munHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos) 
where e.numEmp=h.munHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 78. Nombre de los empleados que residan y laboren en diferente municipio
-- SUBCONSULTA
select nomEmp from empleado, hospital
where codHos1=codHos and numEmp!=munHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and e.numEmp!=h.munHos;
-- JOIN
select e.nomEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos) 
where e.numEmp!=h.munHos;
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# 79. Nombre de los empleados que tengan un salario entre 5000 y 1000 y a demás que laboren en el municipio de SAN JUAN DEL RIO
-- SUBCONSULTA
select nomEmp from empleado
where salEmp between 1000 and 5000 and codHos1 in(select codHos from hospital
where munHos="SAN JUAN DEL RÍO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- PRODUCTO CARTESIANO
select e.nomEmp from empleado as e, hospital as h
where e.codHos1=h.codHos and e.salEmp between 1000 and 5000 and h.munHos="SAN JUAN DEL RÍO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
-- JOIN
select e.nomEmp from empleado as e INNER JOIN hospital as h ON (e.codHos1=h.codHos)
where e.salEmp between 5000 and 1000 and h.munHos="SAN JUAN DEL RÍO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#80. Mostrar el nombre de los empleados que sean MÉDICOS 
-- CIRUJANOS y que laboren en el hospital AZUL MARINO 
# PROUCTO CARTESIANO
select e.nomEmp
from empleado as e, hospital as h, especialidad as es
where e.codHos1=h.codHos and 
      e.cveEmp=es.cveEmp1 and e.puesEmp="MÉDICO" and
      h.nomHos="AZUL MARINO" and es.especMed="CIRUJANO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# JOIN
select e.nomEmp
from empleado as e inner join hospital as h on (e.codHos1=h.codHos)
     inner join especialidad as es on(e.cveEmp=es.cveEmp1)
where e.puesEmp="MÉDICO" and
      h.nomHos="AZUL MARINO" and es.especMed="CIRUJANO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#SUBCONSULTA
select nomEmp
from empleado
where puesEmp="MÉDICO" and
      codHos1 in(select codHos
                 from hospital
				 where nomHos="AZUL MARINO")
	and cveEmp in(select cveEmp1
                  from especialidad
                  where especMed="CIRUJANO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#81. Nombre de los médicos que residan y 
-- laboren en el municipio de SAN JUAN DEL RIO 
#PRODUCTO CARTESIANO
select e.nomEmp
from empleado as e, hospital as h
where e.codHos1=h.codHos and e.munEmp="SAN JUAN DEL RÍO" and
      h.munHos ="SAN JUAN DEL RÍO";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#JOIN
select e.nomEmp
from empleado as e inner join hospital as h on(e.codHos1=h.codHos)
where e.munEmp="SAN JUAN DEL RÍO" and h.munHos ="SAN JUAN DEL RÍO";
#SUBCONSULTA
select nomEmp
from empleado
where munEmp ="SAN JUAN DEL RÍO" 
      and codHos1 in (Select codHos
                  from hospital
                  where munHos="SAN JUAN DEL RÍO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#82. Nombre de los empleados que tengan el puesto de MÉDICO, 
-- una especialidad de INTERNISTA, que tengan un salario 
-- inferior a 8000, que no tengan comisión y que trabajen en azul marino 
# PROUCTO CARTESIANO
select e.nomEmp
from empleado as e, hospital as h, especialidad as es
where e.codHos1=h.codHos and 
      e.cveEmp=es.cveEmp1 and e.puesEmp="MÉDICO" and
      e.salEmp<8000 and e.comEmp IS NULL and
      h.nomHos="AZUL MARINO" and es.especMed="INTERNISTA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
# JOIN
select e.nomEmp
from empleado as e inner join hospital as h on (e.codHos1=h.codHos)
     inner join especialidad as es on(e.cveEmp=es.cveEmp1)
where e.puesEmp="MÉDICO" and
      e.salEmp<8000 and e.comEmp IS NULL and
      h.nomHos="AZUL MARINO" and es.especMed="INTERNISTA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#SUBCONSULTA
select nomEmp
from empleado
where puesEmp="MÉDICO" and salEmp<8000 and  comEmp IS NULL and
      codHos1 in(select codHos from hospital where nomHos="AZUL MARINO")
	and cveEmp in(select cveEmp1 from especialidad where especMed="INTERNISTA");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#83. Mostrar las ternas del nombre de los empleados y 
-- salario, separados por una coma, de aquellos empleados 
-- que laboran en el hospital VERDE AGUA 
#PRODUCTO
select  concat(e.nomEmp, " , ", e.salEmp) as DATOS
from empleado as e, hospital as h
where e.codHos1=h.codHos and h.nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#JOIN
select concat(e.nomEmp, " , ", e.salEmp) as DATOS
from empleado as e inner join hospital as h on(e.codHos1=h.codHos)
where h.nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#SUBCONSULTA
select concat(e.nomEmp, " , ", e.salEmp) as DATOS
from empleado
where codHos1 in (Select codHos
                  from hospital
                  where nomHos="VERDE AGUA");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#84. Mostrar las ternas del nombre de los empleados y nombre 
-- del hospital, separados por una coma de aquellos empleados que laboran en el hospital VERDE AGUA  
select  concat(e.nomEmp, " , ", h.nomHos) as DATOS
from empleado as e, hospital as h
where e.codHos1=h.codHos and h.nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#JOIN
select concat(e.nomEmp, " , ", h.nomHos) as DATOS
from empleado as e inner join hospital as h on(e.codHos1=h.codHos)
where h.nomHos="VERDE AGUA";
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#85. Mostrar el puesto del empleado con mayor salario y que labore en el hospital AZUL MARINO 
#SUBCONSULTA CON PRODUCTO
  select puesEmp
 from empleado 
 where salEmp=(select max(e.salEmp)
                 from empleado as e, hospital as h
                 where e.codHos1=h.codHos and h.nomHos="AZUL MARINO");
 -- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
 #SUBCONSULTA CON JOIN
  select puesEmp
 from empleado 
 where salEmp=(select max(e.salEmp)
                 from empleado as e INNER JOIN hospital as h ON(e.codHos1=h.codHos)
                 where h.nomHos="AZUL MARINO");
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#SUBCONSULTA 
  select puesEmp
 from empleado 
 where salEmp=(select max(salEmp)
			   from empleado
               where codHos1 IN(select codHos 
                                  from hospital
                                  where nomHos="AZUL MARINO"));
-- . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
#4) Usando comandos del tipo DML: 
#a.	Dar baja  al  empleado con clave de empleado igual a 7 
delete from empleado where cveEmp=7;
select * from empleado;
select * from hospital;
select * from especialidad;