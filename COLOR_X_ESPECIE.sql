/*
Autor: Javier Rivas
Fecha: 04/06/14
*/

CREATE TABLE COLOR_X_ESPECIE(
    COLOR_ID INT(8) NOT NULL,
    ESPECIE_ID INT(8) NOT NULL,
    PRIMARY KEY(COLOR_ID, ESPECIE_ID),
    FEC_CREACION DATE,
	USUARIO_CREACION VARCHAR(10),
	FEC_ULTIMA_MODIFICACION DATE,
	USUARIO_ULTIMA_MODIFICACION VARCHAR(10),
    FOREIGN KEY (COLOR_ID) 
	REFERENCES COLOR(COLOR_ID),
    FOREIGN KEY (ESPECIE_ID) 
	REFERENCES ESPECIE(ESPECIE_ID)
);

DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_COLOR_X_ESPECIE
  BEFORE INSERT ON COLOR_X_ESPECIE FOR EACH ROW
BEGIN
	SET NEW.USUARIO_CREACION:= current_user();
    SET NEW. FEC_CREACION:= curdate();
END$$

DELIMITER $$
CREATE TRIGGER BEFORE_UPDATE_COLOR_X_ESPECIE
  BEFORE UPDATE ON PROGRA_2.COLOR_X_ESPECIE FOR EACH ROW
BEGIN
	SET NEW.USUARIO_ULTIMA_MODIFICACION:= current_user();
	SET NEW.FEC_ULTIMA_MODIFICACION:= curdate();
END$$