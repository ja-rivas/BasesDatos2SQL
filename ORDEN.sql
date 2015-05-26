CREATE TABLE ORDEN(
	ORDEN_ID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(30) unique,
    CLASE_ID INT(8),
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10),
    FOREIGN KEY (CLASE_ID) 
	REFERENCES CLASE(CLASE_ID)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_ORDEN
  BEFORE INSERT ON ORDEN FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_ORDEN
  BEFORE UPDATE ON PROGRA_2.ORDEN FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$