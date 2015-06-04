/*
Autor: Javier Rivas
Fecha: 28/05/14
*/

#Función para obtener la cantidad de fotos subidas por una persona
DROP FUNCTION IF EXISTS GETCANTFOTOPERSONA;
DELIMITER $$
CREATE FUNCTION GETCANTFOTOPERSONA(PID INT)
RETURNS INT
BEGIN
	DECLARE VCANT INT;
	SELECT COUNT(*) INTO VCANT FROM FOTO_AVE
	WHERE PERSONA_ID= PID
	GROUP BY PERSONA_ID;
    RETURN VCANT;
END;
$$
DELIMITER ;

#Función para obtener la cantidad de fotos subidas por una persona
DROP FUNCTION IF EXISTS GETCANTFOTOPERSONA;
DELIMITER $$
CREATE FUNCTION GETCANTFOTOPERSONA(PID INT(8))
RETURNS INT
BEGIN
	DECLARE VCANT INT;
	SELECT COUNT(*) INTO VCANT FROM FOTO_AVE
	WHERE PERSONA_ID= PID
	GROUP BY PERSONA_ID;
    RETURN VCANT;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona ornitólogas
DROP PROCEDURE IF EXISTS GETORNITOLOGOS;
DELIMITER $$
CREATE PROCEDURE GETORNITOLOGOS()
BEGIN
	#Obtiene el id del tipo usuario ornitólogo
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Ornitólogo';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona ornitólogas por nombre
DROP PROCEDURE IF EXISTS GETORNITOLOGOSNOMBRE;
DELIMITER $$
CREATE PROCEDURE GETORNITOLOGOSNOMBRE(PNOMBRE VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario ornitólogo
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Ornitólogo';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO AND P.NOMBRE LIKE CONCAT(PNOMBRE, '%')
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona ornitólogas por apellido
DROP PROCEDURE IF EXISTS GETORNITOLOGOSAPELLIDO;
DELIMITER $$
CREATE PROCEDURE GETORNITOLOGOSAPELLIDO(PAPELLIDO VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario ornitólogo
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Ornitólogo';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO AND A.APELLIDO LIKE CONCAT(PAPELLIDO, '%')
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona ornitólogas por correo
DROP PROCEDURE IF EXISTS GETORNITOLOGOSCORREO;
DELIMITER $$
CREATE PROCEDURE GETORNITOLOGOSCORREO(PCORREO VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario ornitólogo
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Ornitólogo';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO AND P.CORREO LIKE CONCAT(PCORREO, '%')
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener datos de una persona
DROP PROCEDURE IF EXISTS GETPERSONA;
DELIMITER $$
CREATE PROCEDURE GETPERSONA(ID INT)
BEGIN
    SELECT P.NOMBRE, A.APELLIDO, P.CORREO, T.TELEFONO, GETCANTFOTOPERSONA(ID) FROM PERSONA P
	INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
	INNER JOIN APELLIDO A ON A.APELLIDO_ID= AP.APELLIDO_ID
	INNER JOIN telefono_x_persona TP ON TP.PERSONA_ID= P.PERSONA_ID
	INNER JOIN TELEFONO T ON T.TELEFONO_ID= TP.TELEFONO_ID
	WHERE P.PERSONA_ID= ID;
END;
$$
DELIMITER ;

#Procedimiento para obtener fotos de una persona
DROP PROCEDURE IF EXISTS GETFOTOSPERSONA;
DELIMITER $$
CREATE PROCEDURE GETFOTOSPERSONA(ID INT)
BEGIN
    SELECT F.FOTO, G.NOMBRE, E.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID= F.ESPECIE_ID
	INNER JOIN GENERO G ON G.GENERO_ID= E.GENERO_ID
	WHERE PERSONA_ID= ID;
END;
$$
DELIMITER ;

