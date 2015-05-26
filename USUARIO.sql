/* Autor: Erin Siezar
*  Fecha: 26/05/2015 */

CREATE TABLE USUARIO(
	USUARIO_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(30) unique,
	CONTRASENA varchar(8) NOT NULL,
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_USUARIO
  BEFORE INSERT ON USUARIO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_USUARIO
  BEFORE UPDATE ON PROGRA_2.USUARIO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$