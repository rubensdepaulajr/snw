-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 22/10/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
ALTER PROCEDURE [dbo].[ssAtz_Pes] 
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@IdEsp SMALLINT = NULL,
	@Gia_Tip TINYINT = NULL, -- [0-Solicitação SP/SADT|1-Guia de Consulta|2-Guia SP/SADT|3-Solicitação Internação]
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdPpl SMALLINT = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
	DECLARE @WHERE NVARCHAR(600), @WHEREGIA NVARCHAR(300), @WHERESOL NVARCHAR(300), @WHEREITN NVARCHAR(300)
	DECLARE @SQL NVARCHAR(4000) 

	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
	IF @Gia_DatIni IS NOT NULL OR @Gia_DatFim IS NOT NULL OR @Gia_Tip IS NOT NULL OR
		@IdEsp IS NOT NULL OR @IdSit IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Gia_Snh IS NOT NULL OR	@Bnf_Mtr IS NOT NULL OR	@IdCtt IS NOT NULL OR
		@Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHERE = ''
		SET @WHEREGIA = ''
		SET @WHERESOL = ''	
		SET @WHEREITN = ''	
		CREATE TABLE #TBLRESULT 
			(
				Gia_DatEms SMALLDATETIME,
				Bnf_Nme VARCHAR(70),
				Gia_Tip VARCHAR(30),
				Pdm_Cod VARCHAR(20),
				Sit_Dsc VARCHAR(20),
				Pdm_Dsc VARCHAR(80),
				Gia_Crt CHAR(1),
				Prf_Sol VARCHAR(70),
				Prf_Exe VARCHAR(70),
				IdCtt BIGINT,
				Prf_Mtr VARCHAR(20),
				Bnf_Mtr VARCHAR(20),
				Gpd_QtdAtz TINYINT,
				Gpd_QtdSol TINYINT,
				Gia_Snh VARCHAR(20),
				Usr_Nme VARCHAR(70),
				Esp_Sol VARCHAR(80),
				Esp_Exe VARCHAR(80),
				IdSit TINYINT,
				Sit_Ind CHAR(1),
				IdNgc INT,
				Ngc_Vlr NUMERIC(18,2),
				Pdm_QtdCh_ NUMERIC(18,2)
			)					

		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp=@IdEsp '

		IF @Bnf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Bnf_Mtr=@Bnf_Mtr ' 

		IF @IdCtt IS NOT NULL
			SET @WHERE = @WHERE + N'AND IdCtt=@IdCtt ' 
			
		IF @Pdm_Cod IS NOT NULL
		BEGIN
			-- VERIFICAR AQUI QUANDO INTERNAÇÃO ESTIVER FUNCIONANDO
			SET @WHEREGIA = @WHEREGIA + N'AND Pdm_Cod=@Pdm_Cod '
			SET @WHERESOL = @WHERESOL + N'AND Pdm_Cod=@Pdm_Cod '
		END
			
		IF @IdSit IS NOT NULL
		BEGIN 
			SET @WHEREGIA = @WHEREGIA + N'AND IdSit=@IdSit '
			SET @WHERESOL = @WHERESOL + N'AND IdSit=@IdSit '
			IF @IdSit = 1 
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=1 '
			ELSE
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=0 '
		END		
		
		IF @Sit_Ind IS NOT NULL
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Sit_Ind=@Sit_Ind '
			SET @WHERESOL = @WHERESOL + N'AND Sit_Ind=@Sit_Ind '
			IF @Sit_Ind = 'A'
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=1 '
			ELSE
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=0 '
		END
			
		IF @Gia_Snh IS NOT NULL
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh=@Gia_Snh ' 
			SET @WHERESOL = @WHERESOL + N'AND Sol_Snh=@Gia_Snh ' 
			SET @WHEREITN = @WHEREITN + N'AND Gia_Snh=@Gia_Snh ' 
		END		
		
		IF @Gia_DatIni IS NOT NULL 
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms>=@Gia_DatIni '
			SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms>=@Gia_DatIni '
			SET @WHEREITN = @WHEREITN + N'AND Gia_DatEms>=@Gia_DatIni '
		END

		IF @Gia_DatFim IS NOT NULL 
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms<=@Gia_DatFim '
			SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms<=@Gia_DatFim '
			SET @WHEREITN = @WHEREITN + N'AND Gia_DatEms<=@Gia_DatFim '
		END

		IF @Gia_Tip IS NOT NULL
		BEGIN 
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip=@Gia_Tip '
			SET @WHEREITN = @WHEREITN + N'AND Gia_Tip=@Gia_Tip '
			-- As solicitações de SP/SADT não devem ser listadas se o usuário 
			-- filtrar por um tipo de guia que não for a de solcitação de SP/SADT
			IF @Gia_Tip <> 0
				SET @WHERESOL = @WHERESOL + N'AND 0=1 '
		END	
					
		-- Consulta
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, ''CONSULTA'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						NULL AS Prf_Sol, Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz, Gpd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, NULL AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdGia = Gpd_IdGia
				AND		IdSit = Gpd_IdSit
				AND		IdCtt = Cte_IdCtt
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd			
				AND		IdPdm = Gpd_IdPdm
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrf
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp
				AND		Gia_Tip = 1 '
			
		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
		BEGIN
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
			SET @SQL = @SQL + @WHERE + @WHEREGIA +
					N' ORDER BY '+ @Ord
		END
		ELSE
			SET @SQL = @SQL + @WHERE + @WHEREGIA +
					N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
			
		-- SP/SADT para procedimentos que não requerem profissional para execução,
		-- somente devem ser listadas se no filtro da pesquisa não estiver a matrícula do profissional
		IF @Prf_Mtr IS NULL
		BEGIN
			SET @SQL = N'
				INSERT #TBLRESULT
					SELECT	Gpd_DatRel, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,
							Sit_Dsc, Pdm_Dsc, Gia_Crt,
							(
								SELECT	Prf_Nme
								FROM	dbo.Atz_Gia sol, dbo.Atz_Prf
								WHERE	sol.IdGia = gia.Gia_IdGiaPrc 
								AND		IdPrf = sol.Gia_IdPrf
							) AS Prf_Sol,
							NULL AS Prf_Exe, IdCtt, NULL AS Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz,
							Gpd_QtdSol, CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme,
							(
								SELECT	Esp_Dsc
								FROM	dbo.Atz_Gia sol, dbo.Atz_Prf, dbo.Atz_Esp
								WHERE	sol.IdGia = gia.Gia_IdGiaPrc
								AND	IdPrf = sol.Gia_IdPrf
								AND	IdEsp = sol.Gia_IdEsp
							) AS Esp_Sol,  Esp_Dsc AS Esp_Exe,
							IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
					FROM	dbo.Atz_Gia gia, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_Sit,
							dbo.Atz_GiaPdm, dbo.Atz_Esp, dbo.Atz_Pdm, dbo.Sgn_Usr
					WHERE	IdSit = Gpd_IdSit
					AND		IdBnf = Gia_IdBnf
					AND		IdGia = Gpd_IdGia
					AND		IdEsp = Gia_IdEsp
					AND		IdPdm = Gpd_IdPdm
					AND		IdUsr = Gia_IdUsr
					AND		IdCtt = Cte_IdCtt
					AND		Gia_IdCtt = Cte_IdCtt
					AND		Gia_SeqEnd = Cte_SeqEnd
					AND		Gia_IdPrf IS NULL
					AND		Gia_Tip = 2 '		
				
			-- Se um dos filtros da pesquisa for a matrícula do profissional,
			-- as guias de SP/SADT com procedimentos que não requerem profissional
			-- não devem ser exibidas
			SET @SQL = @SQL + @WHERE + @WHEREGIA + N' ORDER BY '+ @Ord
					
			
			EXEC SP_EXECUTESQL @SQL,
				N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
				@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
				@Prf_Mtr VARCHAR(20) ',
					@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
		END	
		
		-- SP/SADT para procedimentos que requerem profissional para execução
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT	Gpd_DatRel, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						(
							SELECT	Prf_Nme
							FROM	dbo.Atz_Gia sol, dbo.Atz_Prf
							WHERE	sol.IdGia = gia.Gia_IdGiaPrc
							AND		IdPrf = sol.Gia_IdPrf
						) AS Prf_Sol,
						Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz,
						Gpd_QtdSol, CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme,
						(
							SELECT	Esp_Dsc
							FROM	dbo.Atz_Gia sol, dbo.Atz_Prf, dbo.Atz_Esp
							WHERE	sol.IdGia = gia.Gia_IdGiaPrc
							AND		IdPrf = sol.Gia_IdPrf
							AND		IdEsp = sol.Gia_IdEsp
						) AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia gia, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_Sit,
						dbo.Atz_Prf, dbo.Atz_GiaPdm, dbo.Atz_Esp, dbo.Atz_Pdm, dbo.Sgn_Usr
				WHERE	IdSit = Gpd_IdSit
				AND		IdBnf = Gia_IdBnf
				AND		IdGia = Gpd_IdGia
				AND		IdEsp = Gia_IdEsp
				AND		IdPdm = Gpd_IdPdm
				AND		IdUsr = Gia_IdUsr
				AND		IdCtt = Cte_IdCtt			
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd
				AND		IdPrf = Gia_IdPrf
				AND		Gia_Tip = 2
				 ' 

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '

		SET @SQL = @SQL + @WHERE + @WHEREGIA +	N' ORDER BY '+ @Ord	
			
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
		
		
		-- Solicitação SP/SADT
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT  Sol_DatEms, Bnf_Nme, ''SOLICITAÇÃO'' AS Gia_Tip,Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Sol_Crt,
						Prf_Nme AS Prf_Sol, NULL AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Spd_QtdAtz, Spd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Sol_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, Esp_Dsc AS Esp_Sol, NULL AS Esp_Exe,
						IdSit, Sit_Ind, NULL, NULL, Pdm_QtdCh_
				FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdSol = Spd_IdSol
				AND		IdCtt = Cte_IdCtt
				AND		Sol_IdCtt = Cte_IdCtt
				AND		Sol_SeqEnd = Cte_SeqEnd
				AND		IdSit = Spd_IdSit			
				AND		IdPdm = Spd_IdPdm
				AND		IdBnf = Sol_IdBnf
				AND		IdPrf = Sol_IdPrfSol
				AND		IdUsr = Sol_IdUsr
				AND		IdEsp = Sol_IdEsp '	
		
		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
		BEGIN
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
			SET @SQL = @SQL + @WHERE + @WHERESOL + N' ORDER BY '+ @Ord
		END
		ELSE
			SET @SQL = @SQL + @WHERE + @WHERESOL + N' ORDER BY '+ @Ord	
					
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- SP/SADT da Solicitação de Internação
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, ''SOLICITACAO INTERNACAO'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						NULL AS Prf_Sol, Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz, Gpd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, NULL AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdGia = Gpd_IdGia			
				AND		IdSit = Gpd_IdSit
				AND		IdCtt = Cte_IdCtt
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd			
				AND		IdPdm = Gpd_IdPdm
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrf
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp
				AND		Gia_Tip = 3 '

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
		SET @SQL = @SQL + @WHERE + @WHEREGIA + N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- Solicitação/Prorrogação de Internação
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, 
						CASE Itn_Tip WHEN 1 THEN ''SOLICITACAO INTERNACAO'' WHEN 2 THEN ''PROROGACAO INTERNACAO'' END AS Gia_Tip, 
						NULL AS Pdm_Cod, CASE Itn_Atz WHEN 1 THEN ''AUTORIZADO'' ELSE ''PENDENTE'' END AS Sit_Dsc, NULL AS Pdm_Dsc, Gia_Crt,
						Prf_Nme AS Prf_Sol, NULL AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Itn_DriAtz AS Gpd_QtdAtz, Itn_DriSol AS Gpd_QtdSol,
						CASE Itn_Atz WHEN 1 THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, Esp_Dsc AS Esp_Sol, NULL AS Esp_Exe,
						Itn_Atz AS IdSit, NULL, NULL, 0, 0
				FROM	dbo.Atz_Gia, dbo.Atz_Itn, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Sgn_Usr, dbo.Atz_Esp
				WHERE	IdCtt = Gia_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd
				AND		IdGia = Itn_IdGia		
				AND		IdCtt = Cte_IdCtt
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrfSol
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp '

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
		SET @SQL = @SQL + @WHERE  + @WHEREITN + N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Gia_Snh VARCHAR(20), @Bnf_Mtr VARCHAR(20), @IdCtt BIGINT, @Prf_Mtr VARCHAR(20) ',
			@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- O valor da negociação é exibido somente para os papéis da operadora.
		IF EXISTS (SELECT * FROM dbo.Sgn_Ppl WHERE Ppl_Ope = 1 AND IdPpl = @IdPpl)
			UPDATE #TBLRESULT 
			SET Ngc_Vlr = dbo.fxAtz_GetNgcVlr(IdNgc)
			WHERE IdNgc IS NOT NULL

		SELECT *
		FROM #TBLRESULT	

		DROP TABLE #TBLRESULT	
		
		--PRINT '4000 1000 1100 1000'
		--PRINT LEN(@SQL)
		--PRINT LEN(@SQL2)
		--PRINT LEN(@SQL3)
		--PRINT LEN(@SQL4)
		--PRINT '600 300 300'
		--PRINT LEN(@WHERE)
		--PRINT LEN(@WHEREGIA)
		--PRINT LEN(@WHERESOL)
		--PRINT @SQL	
	END




