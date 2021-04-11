alter session set nls_date_format = 'DD/MM/YYYY';

CREATE TABLE ESPECIALIDAD(
codigo char(3) PRIMARY KEY,
nombre varchar2(60)
);

CREATE TABLE USUARIO(
numero char(3) PRIMARY KEY,
nombre varchar2(20),
apellidos varchar2(40),
direccion varchar2(40),
poblacion varchar2(40),
puntos_acumulados number(4),
valoracion_total number(4),
especialista char(3),
categoria varchar2(20),
CONSTRAINT usu_esp_FK FOREIGN KEY (especialista) REFERENCES ESPECIALIDAD(codigo) ON DELETE CASCADE);

CREATE TABLE TECNICO(
numero char(2) PRIMARY KEY,
nombre varchar2(50));

CREATE TABLE INCIDENCIA(
ID char(9) PRIMARY KEY,
descripcion varchar2(200),
estado varchar2(20) check (estado in ('Abierta','Aprobada','Adjudicada','Finalizada')),
puntos_coste number(4),
num_cliente char(3),
f_abierta date,
num_repara char(3),
f_repara date,
valoracion_reparacion number(4),
n_tecnico char(2),
f_aprobada date,
CONSTRAINT inc_cli_FK FOREIGN KEY (num_cliente) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_rep_FK FOREIGN KEY (num_repara) REFERENCES USUARIO(numero) ON DELETE SET NULL,
CONSTRAINT inc_tec_FK FOREIGN KEY (n_tecnico) REFERENCES TECNICO(numero) ON DELETE SET NULL);


/* VALORES EN TABLA ESPECIALIDAD */
INSERT INTO ESPECIALIDAD VALUES ('11','Albañileria');
INSERT INTO ESPECIALIDAD VALUES ('22','Fontaneria');
INSERT INTO ESPECIALIDAD VALUES ('33','Electricidad');
INSERT INTO ESPECIALIDAD VALUES ('44','Carpinteria');
INSERT INTO ESPECIALIDAD VALUES ('55','Pintura');

/* VALORES EN TABLA USUARIO */
INSERT INTO USUARIO VALUES ('101','Luis','Sancho Pardo','C/Piedra,48','Roquetas de Mar',0,0,'11','Amateur');
INSERT INTO USUARIO VALUES ('102','Marta','Serrano Cid','C/Lourdes,8','Las Marinas',0,0,'22','Amateur');
INSERT INTO USUARIO VALUES ('103','Leo','Guerrero Liza','C/Plutón,2','Aguadulce',0,0,'33','Amateur');
INSERT INTO USUARIO VALUES ('104','Miguel','Delta Camacho','C/Singular,109','Aguadulce',0,0,'11','Amateur');
INSERT INTO USUARIO VALUES ('105','Carmen','Roca Campos','C/Sol Naciente,29','El Parador',0,0,'22','Amateur');
INSERT INTO USUARIO VALUES ('106','Pedro','Zamora Molina','C/Estanislao,9','Vicar',0,0,'33','Amateur');
INSERT INTO USUARIO VALUES ('107','Angel','Rodrigo Roca','C/Salvatore,1','El Ejido',0,0,'44','Amateur');
INSERT INTO USUARIO VALUES ('108','Soledad','Campillo Molina','C/Paraiso,33','El Ejido',0,0,'11','Amateur');
INSERT INTO USUARIO VALUES ('109','Luisa','Galdeano Ter','C/Castelar,3','Almería',0,0,'22','Amateur');
INSERT INTO USUARIO VALUES ('110','Piedad','Colmenero Zapillo','C/Gran vía,100','Almería',0,0,'55','Amateur');
INSERT INTO USUARIO VALUES ('111','Sergio','Campos Campos','C/Piesuerga,1','Almería',0,0,'22','Amateur');
INSERT INTO USUARIO VALUES ('112','Manuel','Domingo Serrano','C/Palamós,23','Las Marinas',0,0,'44','Amateur');

/* VALORES EN TABLA TÉCNICO */
INSERT INTO TECNICO VALUES ('10','Juan Pedro Morales Vico');
INSERT INTO TECNICO VALUES ('20','Sandra Soler Hidalgo');
INSERT INTO TECNICO VALUES ('30','Mariano Valenzuela Guerrero');

/* VALORES EN TABLA INCIDENCIA */
INSERT INTO INCIDENCIA VALUES ('2019-0001','Pintar habitación 20m2','Abierta',30,'101','19/12/2019',null,null,null,'10',null);
INSERT INTO INCIDENCIA VALUES ('2019-0002','Arreglar escalones puerta de la calle','Aprobada',60,'101','01/12/2019',null,null,null,'30','03/12/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0003','Pintar escaleras 60m','Adjudicada',80,'105','30/11/2019','110',null,null,'10','03/12/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0004','Cambiar azulejos y sanitarios cuarto baño','Adjudicada',1250,'112','10/11/2019','104',null,null,'30','12/11/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0005','Instalar fontanería cuarto baño','Adjudicada',550,'112','10/11/2019','102',null,null,'30','12/11/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0006','Cambiar 8 puertas','Adjudicada',30,'104','24/11/2019','112',null,null,'20','29/11/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0007','Cambiar grifería cuarto baño','Abierta',20,'109','20/12/2019',null,null,null,'20',null);
INSERT INTO INCIDENCIA VALUES ('2019-0008','Pintar techo cuarto baño 2m2','Finalizada',25,'109','15/10/2019','110','30/11/2019',9,'10','18/10/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0009','Poner 10 tomas de enchufe en 4 habitaciones','Finalizada',120,'106','12/10/2019','108','20/10/2019',8,'20','14/10/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0010','Lijar y barnizar mesa madera salon 3m','Finalizada',50,'103','04/09/2019','112','17/09/2019',7,'10','07/09/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0011','Pintar toda la casa 100m2','Finalizada',200,'108','19/08/2019','110','09/03/2019',6,'10','22/08/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0012','Desembozar pila fregadero cocina','Aprobada',25,'106','21/12/2019',null,null,null,'10','23/12/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0013','Cambiar cuadro fusibles','Finalizada',80,'105','10/07/2019','103','25/07/2019',10,'30','15/07/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0014','Poner focos luz en techo cocina','Aprobada',40,'111','06/12/2019',null,null,null,'20','10/12/2019');
INSERT INTO INCIDENCIA VALUES ('2019-0015','Hacer tabique ladrillo para separar dos habitaciones','Finalizada',300,'108','19/06/2019','104','30/06/2019',8,'20','20/06/2019');
