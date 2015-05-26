/* Autor: Erin Siezar
*  Fecha: 26/05/2015 */

CREATE TABLE APELLIDO(
	APELLIDO_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    APELLIDO VARCHAR(30) unique,
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_APELLIDO
  BEFORE INSERT ON APELLIDO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_APELLIDO
  BEFORE UPDATE ON PROGRA_2.APELLIDO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$