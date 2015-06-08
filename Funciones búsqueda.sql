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

#Procedimiento para obtener la lista de personas aficionados
DROP PROCEDURE IF EXISTS GETAFICIONADOS;
DELIMITER $$
CREATE PROCEDURE GETAFICIONADOS()
BEGIN
	#Obtiene el id del tipo usuario aficionado
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Aficionado';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona aficionados por nombre
DROP PROCEDURE IF EXISTS GETAFICIONADOSNOMBRE;
DELIMITER $$
CREATE PROCEDURE GETAFICIONADOSNOMBRE(PNOMBRE VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario aficionado
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Aficionado';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO AND P.NOMBRE LIKE CONCAT(PNOMBRE, '%')
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona aficionados por apellido
DROP PROCEDURE IF EXISTS GETAFICIONADOSAPELLIDO;
DELIMITER $$
CREATE PROCEDURE GETAFICIONADOSAPELLIDO(PAPELLIDO VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario ornitólogo
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Aficionado';
    #Query para obtener la lista de personas
    SELECT P.PERSONA_ID,P.NOMBRE, A.APELLIDO, P.CORREO, P.FEC_CREACION FROM PERSONA P
    INNER JOIN apellido_x_persona AP ON AP.PERSONA_ID= P.PERSONA_ID
    INNER JOIN APELLIDO A ON AP.APELLIDO_ID= A.APELLIDO_ID
    WHERE TIPO_USU_ID= VTIPO AND A.APELLIDO LIKE CONCAT(PAPELLIDO, '%')
    ORDER BY P.NOMBRE DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener la lista de persona aficionados por correo
DROP PROCEDURE IF EXISTS GETAFICIONADOSCORREO;
DELIMITER $$
CREATE PROCEDURE GETAFICIONADOSCORREO(PCORREO VARCHAR(100))
BEGIN
	#Obtiene el id del tipo usuario aficionado
	DECLARE VTIPO INT;
    SELECT TIPO_USU_ID INTO VTIPO FROM TIPO_USUARIO WHERE TIPO= 'Aficionado';
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

#Procedimiento para obtener todas las fotos de aves, ordenadas por fecha de subida
DROP PROCEDURE IF EXISTS GETAVES;
DELIMITER $$
CREATE PROCEDURE GETAVES()
BEGIN
    SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
	INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY F.FEC_CREACION DESC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por nombre de Orden
DROP PROCEDURE IF EXISTS GETAVESORDEN;
DELIMITER $$
CREATE PROCEDURE GETAVESORDEN(PORDEN VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
	INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN FAMILIA FA ON FA.FAMILIA_ID = G.FAMILIA_ID
	INNER JOIN SUBORDEN S ON S.SUBORDEN_ID = FA.SUBORDEN_ID
	INNER JOIN ORDEN O ON O.ORDEN_ID = S.ORDEN_ID AND O.NOMBRE LIKE CONCAT(PORDEN, '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY O.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por nombre de Familia
DROP PROCEDURE IF EXISTS GETAVESFAMILIA;
DELIMITER $$
CREATE PROCEDURE GETAVESFAMILIA(PFAMILIA VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
	INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN FAMILIA FA ON FA.FAMILIA_ID = G.FAMILIA_ID AND FA.NOMBRE LIKE CONCAT(PFAMILIA, '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY FA.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por nombre de género
DROP PROCEDURE IF EXISTS GETAVESGENERO;
DELIMITER $$
CREATE PROCEDURE GETAVESGENERO(PGENERO VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
	INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID AND G.NOMBRE LIKE CONCAT(PGENERO, '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY G.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por nombre de especie
DROP PROCEDURE IF EXISTS GETAVESESPECIE;
DELIMITER $$
CREATE PROCEDURE GETAVESESPECIE(PESPECIE VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID AND E.NOMBRE LIKE CONCAT(PESPECIE, '%')
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY E.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por nombre de pico
DROP PROCEDURE IF EXISTS GETAVESPICO;
DELIMITER $$
CREATE PROCEDURE GETAVESPICO(PPICO VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
    INNER JOIN PICO PI ON PI.PICO_ID = E.PICO_ID AND PI.NOMBRE LIKE CONCAT(PPICO , '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY PI.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por color
DROP PROCEDURE IF EXISTS GETAVESCOLOR;
DELIMITER $$
CREATE PROCEDURE GETAVESCOLOR(PCOLOR VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
    INNER JOIN color_x_especie CE ON CE.ESPECIE_ID = E.ESPECIE_ID
    INNER JOIN COLOR CO ON CO.COLOR_ID = CE.COLOR_ID AND CO.NOMBRE LIKE CONCAT(PCOLOR , '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY CO.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por cantidad de huevos
DROP PROCEDURE IF EXISTS GETAVESHUEVOS;
DELIMITER $$
CREATE PROCEDURE GETAVESHUEVOS(PHUEVOS VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
    INNER JOIN cantidad_huevos H ON H.CANTIDAD_HUEVOS_ID = E.CANTIDAD_HUEVOS_ID AND H.CANTIDAD LIKE CONCAT(PHUEVOS , '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY H.CANTIDAD ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por Zona de vida
DROP PROCEDURE IF EXISTS GETAVESZONA;
DELIMITER $$
CREATE PROCEDURE GETAVESZONA(PZONA VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
    INNER JOIN zona_vida Z ON Z.ZONA_VIDA_ID = E.ZONA_VIDA_ID AND Z.NOMBRE LIKE CONCAT(PZONA , '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY Z.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por tamaño|
DROP PROCEDURE IF EXISTS GETAVESTAMAÑO;
DELIMITER $$
CREATE PROCEDURE GETAVESTAMAÑO(PTAMAÑO VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
    INNER JOIN TAMAÑO T ON T.TAMAÑO_ID = E.TAMAÑO_ID AND T.TAMAÑO LIKE CONCAT(PTAMAÑO , '%')
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	ORDER BY T.TAMAÑO ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener todas las fotos de aves por persona
DROP PROCEDURE IF EXISTS GETAVESPERSONA;
DELIMITER $$
CREATE PROCEDURE GETAVESPERSONA(PPERSONA VARCHAR(50))
BEGIN
	SELECT F.FOTO_AVE_ID, F.FOTO, G.NOMBRE, E.NOMBRE, P.NOMBRE FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON E.ESPECIE_ID = F.ESPECIE_ID
    INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID AND P.NOMBRE LIKE CONCAT(PPERSONA , '%')
	ORDER BY P.NOMBRE ASC;
END;
$$
DELIMITER ;

#Procedimiento para obtener información de la foto de la ave y de la ave
DROP PROCEDURE IF EXISTS GETINFOAVE;
DELIMITER $$
CREATE PROCEDURE GETINFOAVE(PID INT(8))
BEGIN
	SELECT E.NOMBRE_COMUN,E.NOMBRE_INGLES,O.NOMBRE,FA.NOMBRE,G.NOMBRE,
	E.NOMBRE,PI.NOMBRE,CO.NOMBRE,H.CANTIDAD,Z.NOMBRE,T.TAMAÑO,A.DESCRIPCION,P.NOMBRE,F.FEC_CREACION
	FROM FOTO_AVE F
	INNER JOIN ESPECIE E ON F.ESPECIE_ID = E.ESPECIE_ID AND F.FOTO_AVE_ID=PID
	INNER JOIN GENERO G ON G.GENERO_ID = E.GENERO_ID
	INNER JOIN FAMILIA FA ON G.FAMILIA_ID = FA.FAMILIA_ID
	INNER JOIN SUBORDEN S ON S.SUBORDEN_ID = FA.SUBORDEN_ID
	INNER JOIN ORDEN O ON O.ORDEN_ID = S.ORDEN_ID
	INNER JOIN cantidad_huevos H ON H.CANTIDAD_HUEVOS_ID = E.CANTIDAD_HUEVOS_ID
	INNER JOIN PICO PI ON E.PICO_ID = PI.PICO_ID
	INNER JOIN zona_vida Z ON Z.ZONA_VIDA_ID = E.ZONA_VIDA_ID
	INNER JOIN TAMAÑO T ON T.TAMAÑO_ID = E.TAMAÑO_ID
	INNER JOIN PERSONA P ON P.PERSONA_ID = F.PERSONA_ID
	LEFT JOIN alimento_x_especie AE ON AE.ESPECIE_ID = E.ESPECIE_ID
	LEFT JOIN ALIMENTO A ON A.ALIMENTO_ID = AE.ALIMENTO_ID
	LEFT JOIN color_x_especie CE ON CE.ESPECIE_ID = E.ESPECIE_ID
	LEFT JOIN COLOR CO ON CO.COLOR_ID = CE.COLOR_ID;
END;
$$
DELIMITER ;

