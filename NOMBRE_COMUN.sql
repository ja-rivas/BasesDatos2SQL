CREATE TABLE NOMBRE_COMUN(
	NOMBRE_COMUN_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(30) unique,
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_NOMBRE_COMUN
  BEFORE INSERT ON NOMBRE_COMUN FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_NOMBRE_COMUN
  BEFORE UPDATE ON PROGRA_2.NOMBRE_COMUN FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$