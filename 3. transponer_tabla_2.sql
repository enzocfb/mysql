CREATE DEFINER=`root`@`localhost` PROCEDURE `TRANSPONER_RESPUESTA_2`(IN `vanno` INTEGER, OUT `return_val` INT, OUT fin INT)
BEGIN

/* Pseucodigo
	Leer cada pregunta de tablatablas
  Para cada pregunta:
			Buscar respuesta en token y encuesta 	
				insertar respuesta en TABLA NUEVA
						id, token, respuesta, nro pregunta, nom campo , año.  ( 1 columna, n filas)

*/
	DECLARE vObjEst INT;
	DECLARE vObjEsp INT;
	DECLARE vnumpregunta INT;
	DECLARE vtippregunta varchar(64);
	DECLARE vponderado float;
	DECLARE vnomcampo varchar(64);
	DECLARE vnomvista varchar(64);
	DECLARE vcorresponde varchar(64);
	
	
	DECLARE CONTADOR INT DEFAULT 0;
	DECLARE variableinouterproc INT DEFAULT 0;
	DECLARE c VARCHAR(35);
	DECLARE done INT DEFAULT 0;

	DECLARE	cur_1 CURSOR FOR 
			SELECT
				t.anno,
				t.ObjEst,
				t.ObjEsp,
				t.NroPregunta,
				t.TipPregunta,
				t.Ponderado,
				t.NomCampo,
				t.NomVista
		FROM
					tablatablas t
			WHERE t.anno = vanno
			ORDER BY t.NroPregunta ASC;
			
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN cur_1;
				
		REPEAT
			#FETCH cur_1 INTO a,c;
			insert into LOG (id, mensaje) VALUES (done, "entro al repeat");
			
			FETCH cur_1 INTO vanno, vObjEst, vObjEsp, vnumpregunta, vtippregunta, vponderado, vnomcampo, vnomvista;

			SET CONTADOR = CONTADOR + 1 ;
			CALL P20(vanno, vObjEst, vObjEsp, vnumpregunta, vtippregunta, vponderado, vnomcampo, vnomvista);
			insert into LOG (id, mensaje) VALUES (contador, "fecth contador");

					
			UNTIL done = 1 	
			END REPEAT;
		
	CLOSE cur_1;
	SET return_val = CONTADOR;
	SET fin = done;
END