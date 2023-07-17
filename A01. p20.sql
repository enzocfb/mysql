CREATE DEFINER=`root`@`localhost` PROCEDURE `p20`(
																									IN vanno SMALLINT,
																									IN vObjEst SMALLINT,
																									IN vObjEsp SMALLINT,
																									IN vnumpregunta INT,																									
																									IN vtippregunta VARCHAR(64),
																									IN vponderado float(20),
																									IN vnomcampo varchar(64),
																									IN vnomvista varchar(64)
																									)
BEGIN
	#Routine body goes here...
			#	CALL P20(vanno, vObjEst, vObjEsp, vnumpregunta, vtippregunta, vponderado, vnomcampo, vnomvista);
			insert into LOG (id, mensaje) VALUES (111, "Entro al P20");
			set @sql = concat(
			
			'	INSERT INTO bi_token_respuesta
				SELECT 
					',vanno,' as anno,
					tid,
					id,
					token,'
					,vObjEst,' as ObjEst,'
					,vObjEsp,' as ObjEsp,'
					,vnumpregunta,' as numpregunta,"'
					,vnomcampo,'" as NomCampo,"'
					,vtippregunta,'" as TipPregunta,'
					,vnomcampo,' as respuesta,'
					,vponderado,' as ponderado 
					from ',vnomvista);					
				
				insert into LOG (id, mensaje) VALUES (222, @sql);
						
				

								
			 
				PREPARE stmt1 FROM @sql;
				EXECUTE stmt1;
				#where tid = 15634

END