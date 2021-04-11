CREATE DATABASE IF NOT EXISTS TRUEKASA;
especialidadespecialidadespecialidadespecialidadUSE TRUEKASA;

CREATE TABLE ESPECIALIDAD(
codigo char(2) PRIMARY KEY,
nombre varchar(60)
);
sys_config
CREATE TABLE USUARIO(
numero char(3) PRIMARY KEY,
nombre varchar(20),
apellidos varchar(40),
direccion varchar(40),
poblacion varchar(40),
puntos_acumulados smallint unsigned,
valoracion_total float,
especialista char(3),
CONSTRAINT usu_esp_FK FOREIGN KEY (especialista) REFERENCES ESPECIALIDAD(codigo) ON DELETE CASCADE);

CREATE TABLE TECNICO(
numero char(2) PRIMARY KEY,
nombre varchar(50));

CREATE TABLE INCIDENCIA(
ID char(9) PRIMARY KEY,
descripcion varchar(200),
estado enum('Abierta','Aprobada','Adjudicada','Finalizada'),
puntos_coste smallint unsigned,
num_cliente char(3),
f_abierta date,
num_repara char(3),
f_repara date,
valoracion_reparacion tinyint unsigned,
n_tecnico char(2),
f_aprobada date,
CONSTRAINT inc_cli_FK FOREIGN KEY (num_cliente) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_rep_FK FOREIGN KEY (num_repara) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_tec_FK FOREIGN KEY (n_tecnico) REFERENCES TECNICO(numero) ON DELETE SET NULL);


/* VALORES EN TABLA ESPECIALIDAD */
INSERT INTO ESPECIALIDAD VALUES ('11','Albañilería');
INSERT INTO ESPECIALIDAD VALUES ('22','Fontanería');
INSERT INTO ESPECIALIDAD VALUES ('33','Electricidad');
INSERT INTO ESPECIALIDAD VALUES ('44','Carpintería');
INSERT INTO ESPECIALIDAD VALUES ('55','Pintura');

/* VALORES EN TABLA USUARIO */
INSERT INTO USUARIO VALUES ('101','Luis','Ramírez Pardo','C/Piedra,48','Roquetas de Mar',100,8.2,'11');
INSERT INTO USUARIO VALUES ('102','María','Sánchez Cid','C/Lourdes,8','Las Marinas',50,9.5,'22');
INSERT INTO USUARIO VALUES ('103','Martín','Guerrero López','C/Plutón,2','Aguadulce',50,7.8,'33');
INSERT INTO USUARIO VALUES ('104','Úrsula','Delta Camacho','C/Singular,109','Aguadulce',300,8,'11');
INSERT INTO USUARIO VALUES ('105','Carmen','Hernández Pío','C/Sol Naciente,29','El Parador',50,null,'22');
INSERT INTO USUARIO VALUES ('106','Pedro','Jiménez Ruiz','C/Estanislao,9','Vicar',1200,7.7,'33');
INSERT INTO USUARIO VALUES ('107','Raúl','Rodrigo Roca','C/Salvatore,1','El Ejido',125,6,'44');
INSERT INTO USUARIO VALUES ('108','Soledad','Campillo Molina','C/Paraiso,33','El Ejido',20,5.8,'11');
INSERT INTO USUARIO VALUES ('109','María Luisa','Galdón Ter','C/Castelar,3','Almería',360,8,'22');
INSERT INTO USUARIO VALUES ('110','Piedad','Colmenero Zapillo','C/Gran vía,100','Almería',100,9.9,'55');
INSERT INTO USUARIO VALUES ('111','Sergio','Lérida Campos','C/Piesuerga,1','Almería',100,8,'22');
INSERT INTO USUARIO VALUES ('112','Manuel','Domingo Serrano','C/Palamós,23','Las Marinas',50,null,'44');

/* VALORES EN TABLA TÉCNICO */
INSERT INTO TECNICO VALUES ('10','Juan Pedro Morales Peña');
INSERT INTO TECNICO VALUES ('20','Sandra Soler Martínez');
INSERT INTO TECNICO VALUES ('30','Mariano Úbeda Fernández');

/* VALORES EN TABLA INCIDENCIA */
INSERT INTO INCIDENCIA VALUES ('2019-0001','Pintar habitación 20m2','Abierta',30,'101','2019-12-19',null,null,null,'10',null);
INSERT INTO INCIDENCIA VALUES ('2019-0002','Arreglar escalones puerta de la calle','Aprobada',60,'101','2019-12-01',null,null,null,'30','2019-12-03');
INSERT INTO INCIDENCIA VALUES ('2019-0003','Pintar escaleras 60m','Adjudicada',80,'105','2019-11-30','110',null,null,'10','2019-12-03');
INSERT INTO INCIDENCIA VALUES ('2019-0004','Cambiar azulejos y sanitarios cuarto baño','Adjudicada',1250,'112','2019-11-10','104',null,null,'30','2019-11-12');
INSERT INTO INCIDENCIA VALUES ('2019-0005','Instalar fontanería cuarto baño','Adjudicada',550,'112','2019-11-10','102',null,null,'30','2019-11-12');
INSERT INTO INCIDENCIA VALUES ('2019-0006','Cambiar 8 puertas','Adjudicada',30,'104','2019-11-24','112',null,null,'20','2019-11-29');
INSERT INTO INCIDENCIA VALUES ('2019-0007','Cambiar grifería cuarto baño','Abierta',20,'109','2019-12-20',null,null,null,'20',null);
INSERT INTO INCIDENCIA VALUES ('2019-0008','Pintar techo cuarto baño 2m2','Finalizada',25,'109','2019-10-15','110','2019-11-30',9,'10','2019-10-18');
INSERT INTO INCIDENCIA VALUES ('2019-0009','Poner 10 tomas de enchufe en 4 habitaciones','Finalizada',120,'106','2019-10-12','108','2019-10-20',8,'20','2019-10-14');
INSERT INTO INCIDENCIA VALUES ('2019-0010','Lijar y barnizar mesa madera salon 3m','Finalizada',50,'103','2019-09-04','112','2019-09-17',7,'10','2019-09-07');
INSERT INTO INCIDENCIA VALUES ('2019-0011','Pintar toda la casa 100m2','Finalizada',200,'108','2019-08-19','110','2019-09-03',6,'10','2019-08-22');
INSERT INTO INCIDENCIA VALUES ('2019-0012','Desembozar pila fregadero cocina','Aprobada',25,'106','2019-12-21',null,null,null,'10','2019-12-23');
INSERT INTO INCIDENCIA VALUES ('2019-0013','Cambiar cuadro fusibles','Finalizada',80,'105','2019-07-10','103','2019-07-25',10,'30','2019-07-15');
INSERT INTO INCIDENCIA VALUES ('2019-0014','Poner focos luz en techo cocina','Aprobada',40,'111','2019-12-06',null,null,null,'20','2019-12-10');
INSERT INTO INCIDENCIA VALUES ('2019-0015','Hacer tabique ladrillo para separar dos habitaciones','Finalizada',300,'108','2019-06-19','104','2019-06-30',8,'20','2019-06-20');


/* CONSULTAS TABLAS */
SELECT * FROM especialidad;
SELECT * FROM incidencia;
SELECT * FROM tecnico;
SELECT * FROM usuario;

/* APARTADO A (1) Listado Especialidades */
SELECT nombre FROM especialidad
;

/* APARTADO A (2) Obtener id   */
SELECT id, descripcion, puntos_coste, num_cliente, f_abierta FROM incidencia
WHERE estado='abierta'
;

/* APARTADO A (3) Obtener usuarios con puntos entre 100 y 500   */
SELECT * FROM usuario 
WHERE puntos_acumulados BETWEEN 100 AND 500 
;

/* APARTADO A (4) id, descripción de las incidencias con fecha de aprobación en el último trimestre del 2019 y además estén adjudicadas   */
SELECT id, descripcion FROM incidencia
WHERE f_aprobada >= '2019-10-01' AND f_aprobada <= '2019-12-31' 
AND estado = 'adjudicada' 
;

/* APARTADO B (5) Obtener técnico, su correspondiente número junto al total de incidencias que cada uno tiene asignada   */
SELECT n_tecnico, COUNT(n_tecnico) AS num_incidencias
FROM incidencia
GROUP BY n_tecnico 
;

/* APARTADO B (6) Obtener por cada mes (con el formato de nombre ej. Noviembre), la cantidad de incidencias que se han reparado en cada uno de ellos.  */
SELECT MONTHNAME(f_abierta) Mes, YEAR(f_abierta) Año, COUNT(f_abierta) Total_incidencias
FROM incidencia
GROUP BY Mes
ORDER BY (f_abierta)
;

/* APARTADO B (7) Obtener nombre completo del usuario en el mismo campo y anteponiendo los apellidos; especialidad "Albañilería" o "Fontanería". Ordenar el listado por apellido.  */
SELECT CONCAT(apellidos,', ', u.nombre) Nombre_Usuario
FROM usuario u, especialidad e
WHERE (especialista = codigo) AND (codigo= 11 OR codigo= 22)
ORDER BY apellidos
;

/* APARTADO B (8) Obtener nombre, apellidos y la valoración total de aquellos usuarios que superen o igualen la media de todas las valoraciones. Ordena el listado de mayor a menor valoración.  */
SELECT nombre, apellidos, valoracion_total FROM usuario 
WHERE valoracion_total >= 
(SELECT AVG(valoracion_total) FROM usuario)
ORDER BY valoracion_total DESC
;

/* APARTADO B (9) Obtener un listado con el nombre y apellidos de los usuarios que no han puesto ninguna incidencia.  */
SELECT usuario.nombre, usuario.apellidos
FROM usuario 
LEFT OUTER JOIN incidencia ON (usuario.numero=incidencia.num_cliente)
WHERE num_cliente IS NULL
;

/* APARTADO B (10) Obtener el identificador, la descripción, el estado, los puntos de coste de las incidencias y el nombre del usuario completo (en el mismo campo) 
que ha abierto la incidencia de aquellas que estén asignadas al técnico de nombre "Sandra". Ordena el listado de mayor a menor valor en los puntos de coste de las incidencias.  */
SELECT ID, descripcion, estado, puntos_coste, CONCAT(usuario.nombre, ', ', apellidos) Nombre_usuario
FROM incidencia 
LEFT OUTER JOIN usuario ON (incidencia.num_cliente=usuario.numero)
LEFT OUTER JOIN tecnico ON (incidencia.n_tecnico=tecnico.numero)
WHERE tecnico.numero= 20
ORDER BY puntos_coste DESC
;

/* APARTADO B (11) Obtener por cada técnico, su nombre, la cantidad de incidencias que no siguen abiertas (cualquier otro estado) y la media de días que han tardado 
en aprobar las incidencias desde que se abrieron redondeando con dos decimales ese valor. Ordenar el listado de menor a mayores días.  */
select * from incidencia
select * from tecnico

SELECT nombre, COUNT(id) AS cantid_incidencias, ROUND(AVG(DATEDIFF(f_aprobada, f_abierta)),2) as media_dias
FROM tecnico, incidencia
WHERE estado!= 'Abierta' AND numero= n_tecnico 
GROUP BY nombre;

/* APARTADO B (12) Obtener un listado con dos registros. En uno debe aparecer el identificador, la descripción y el coste de puntos cuyo valor del campo puntos_coste sea el mayor de todas las incidencias 
y en el otro el identificador, la descripción y el coste de puntos cuyo valor sea el menor en todas ellas.  */
SELECT * FROM incidencia ;

SELECT id, descripcion, puntos_coste 
FROM incidencia 
WHERE puntos_coste = (select max(puntos_coste) FROM incidencia)
UNION ALL
SELECT id, descripcion, puntos_coste 
FROM incidencia 
WHERE puntos_coste = (select min(puntos_coste) FROM incidencia)
GROUP BY incidencia.puntos_coste
;

/* APARTADO B (13) Obtener por cada especialidad, el nombre de cada una y el número total de incidencias que tienen asignadas los usuarios en cada una de las especialidades teniendo en cuenta que el total
 de incidencias sea superior o igual a dos. Ordena el listado de mayor a menor número de incidencias.  */
SELECT especialidad.nombre, COUNT(num_cliente) AS num_total_incidencias
FROM especialidad
LEFT OUTER JOIN usuario ON (especialidad.codigo=usuario.especialista)
LEFT OUTER JOIN incidencia ON (incidencia.num_cliente=usuario.numero)
GROUP BY especialidad.nombre
HAVING num_total_incidencias >= 2
ORDER BY num_total_incidencias DESC
;

/* APARTADO C (14) Obtener un listado con el nombre y apellidos de los usuarios) que hayan reparado alguna incidencia y por tanto estén finalizadas obteniendo además el total de incidencias que haya reparado
 junto a la suma total de puntos que ha conseguido por las incidencias reparadas siempre y cuando esa suma total sea mayor que la media de los puntos de coste del total de incidencias.  */
SELECT nombre, apellidos, COUNT(num_repara) AS total_incidencias_reparadas, SUM(puntos_coste) AS suma_total_puntos FROM incidencia, usuario
WHERE estado= 'Finalizada' AND incidencia.num_repara=usuario.numero
GROUP BY nombre
HAVING suma_total_puntos >
(
SELECT AVG(incidencia.puntos_coste) FROM incidencia
)
;

/* APARTADO C (15) Obtener un listado con el nombre completo (nombre y apellidos juntos) de los usuarios clientes (que han abierto la incidencia), el identificador y la descripción de incidencia 
que abren y también el nombre completo en el mismo campo del usuario que repara la incidencia, así como los días que transcurren desde que se aprobó hasta que finalizó siempre y cuando 
las incidencias tengan que ver con las especialidades de Fontanería, Pintura o Albañilería.  */
select * from usuario
select * from incidencia
select * from especialidad

SELECT CONCAT(usuario.nombre, ', ', usuario.apellidos) AS Usuario_cliente, incidencia.ID, incidencia.descripcion, 
CONCAT(usuario.nombre, ', ', usuario.apellidos) AS Usuario_repara, DATEDIFF(f_repara, f_aprobada) AS dias_trancurridos
FROM incidencia, usuario, especialidad
WHERE incidencia.estado = 'Finalizada' AND incidencia.num_repara = usuario.numero AND usuario.especialista = especialidad.codigo AND NOT especialidad.codigo = 33 AND NOT especialidad.codigo = 44
GROUP BY incidencia.ID;

SELECT CONCAT(usu1.nombre, ', ', usu1.apellidos) AS Usuario_cliente, incidencia.ID, incidencia.descripcion, 
CONCAT(usu2.nombre, ', ', usu2.apellidos) AS Usuario_repara, DATEDIFF(f_repara, f_aprobada) AS dias_trancurridos
FROM incidencia, usuario AS usu1, usuario AS usu2, especialidad
WHERE incidencia.estado = 'Finalizada' AND incidencia.num_cliente = usu1.numero AND incidencia.num_repara = usu2.numero AND usu2.especialista = especialidad.codigo AND NOT especialidad.codigo = 33 AND NOT especialidad.codigo = 44
GROUP BY incidencia.ID;



