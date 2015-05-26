CREATE TABLE GENERO(
	GENERO_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(30) unique,
    FAMILIA_ID INT(8),
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10),
    FOREIGN KEY (FAMILIA_ID) 
	REFERENCES FAMILIA(FAMILIA_ID)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_GENERO
  BEFORE INSERT ON GENERO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_GENERO
  BEFORE UPDATE ON PROGRA_2.GENERO FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$