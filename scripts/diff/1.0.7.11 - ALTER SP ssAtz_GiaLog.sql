-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/01/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
ALTER PROCEDURE [dbo].[ssAtz_GiaLog] 
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@IdEsp SMALLINT = NULL,
	@Gia_Tip TINYINT = NULL, -- [0-Solicitação SP/SADT|1-Guia de Consulta|2-Guia SP/SADT]
	@IdSit TINYINT = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
DECLARE @WHERE NVARCHAR(600), @WHEREGIA NVARCHAR(300), @WHERESOL NVARCHAR(300)
DECLARE @SQL NVARCHAR(4000) , @SQL2 NVARCHAR(1000), @SQL3 NVARCHAR(1100), @SQL4 NVARCHAR(1000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @Gia_DatIni IS NOT NULL OR
	@Gia_DatFim IS NOT NULL OR
	@Gia_Tip IS NOT NULL OR
	@IdEsp IS NOT NULL OR
	@IdSit IS NOT NULL OR
	@Pdm_Cod IS NOT NULL OR
	@Gia_Snh IS NOT NULL OR
	@Bnf_Mtr IS NOT NULL OR
	@IdCtt IS NOT NULL OR
	@Prf_Mtr IS NOT NULL
BEGIN  

	SET @WHERE = ''
	SET @WHEREGIA = ''
	SET @WHERESOL = ''

	-- Consulta Eletiva
	SET @SQL = N'
		SELECT Gia_DatEms,Bnf_Nme,''CONSULTA'' AS Gia_Tip,Pdm_Cod, '+
				'Sit_Dsc,Pdm_Dsc, '+
				'NULL AS Prf_Sol,Prf_Nme AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,Gpd_QtdSol, '+
				'CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,NULL AS Esp_Sol,Esp_Dsc AS Esp_Exe  '+
		'FROM dbo.Atz_Gia,dbo.Atz_GiaPdm,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd, '+
			 'dbo.Atz_Prf,dbo.Atz_Pdm,dbo.Sgn_Usr,dbo.Atz_Esp,dbo.Atz_Sit '+
		'WHERE IdGia = Gpd_IdGia '+
		'AND IdCtt = Gia_IdCtt '+
		'AND IdCtt = Gia_IdCtt '+
		'AND IdSit = Gpd_IdSit '+
		'AND Gia_SeqEnd = Cte_SeqEnd '+
		'AND IdCtt = Cte_IdCtt '+
		'AND IdPdm = Gpd_IdPdm '+
		'AND IdBnf = Gia_IdBnf '+
		'AND IdPrf = Gia_IdPrf '+
		'AND IdUsr = Gia_IdUsr '+
		'AND IdEsp = Gia_IdEsp '+
		'AND Gia_Tip = 1 '

	-- SP/SADT para procedimentos que não requerem profissional para execução,
	-- somente devem ser listadas se no filtro da pesquisa não estiver a matrícula do profissional
	IF @Prf_Mtr IS  NULL
		SET @SQL2 = N'
		SELECT	Gia_DatEms,Bnf_Nme,''SP/SADT'' AS Gia_Tip,Pdm_Cod,'+
				'Sit_Dsc, Pdm_Dsc,'+
				'('+
					'SELECT	Prf_Nme '+
					'FROM dbo.Atz_Gia, dbo.Atz_Prf '+
					'WHERE IdGia = Gia_IdGiaPrc '+ 
					'AND IdPrf = Gia_IdPrf '+
				') AS Prf_Sol, '+
				'NULL AS Prf_Exe,IdCtt,NULL AS Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,'+
				'Gpd_QtdSol,CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,'+
				'( '+
					'SELECT	Esp_Dsc '+
					'FROM dbo.Atz_Gia, dbo.Atz_Prf, dbo.Atz_Esp '+
					'WHERE IdGia = Gia_IdGiaPrc '+
					'AND IdPrf = Gia_IdPrf '+
					'AND IdEsp = Gia_IdEsp '+
				') AS Esp_Sol, Esp_Dsc AS Esp_Exe '+
		'FROM dbo.Atz_Gia,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,dbo.Atz_Sit, '+
			 'dbo.Atz_GiaPdm,dbo.Atz_Esp,dbo.Atz_Pdm,dbo.Sgn_Usr '+
		'WHERE IdCtt = Cte_IdCtt '+
		'AND IdSit = Gpd_IdSit '+
		'AND IdBnf = Gia_IdBnf '+
		'AND IdGia = Gpd_IdGia '+
		'AND IdEsp = Gia_IdEsp '+
		'AND IdPdm = Gpd_IdPdm '+
		'AND IdUsr = Gia_IdUsr '+
		'AND Gia_IdCtt = Cte_IdCtt '+
		'AND Gia_SeqEnd = Cte_SeqEnd '+
		'AND Gia_IdPrf IS NULL '+
		'AND Gia_Tip = 2 '
		
	-- SP/SADT para procedimentos que requerem profissional para execução
	SET @SQL3 = N'
	SELECT	Gia_DatEms, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,'+
			'Sit_Dsc, Pdm_Dsc,'+
			'('+
				'SELECT Prf_Nme '+
				'FROM dbo.Atz_Gia,dbo.Atz_Prf '+
				'WHERE IdGia = Gia_IdGiaPrc '+
				'AND IdPrf = Gia_IdPrf '+
			') AS Prf_Sol,'+
			'Prf_Nme AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,'+
			'Gpd_QtdSol,CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,'+
			'('+
				'SELECT Esp_Dsc '+
				'FROM dbo.Atz_Gia,dbo.Atz_Prf,dbo.Atz_Esp '+
				'WHERE IdGia = Gia_IdGiaPrc '+
				'AND IdPrf = Gia_IdPrf '+
				'AND IdEsp = Gia_IdEsp '+
			') AS Esp_Sol, Esp_Dsc AS Esp_Exe '+
	'FROM dbo.Atz_Gia,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,dbo.Atz_Sit,'+
		'dbo.Atz_Prf,dbo.Atz_GiaPdm,dbo.Atz_Esp,dbo.Atz_Pdm,dbo.Sgn_Usr '+ 
	'WHERE IdCtt = Cte_IdCtt '+
	'AND IdSit = Gpd_IdSit '+
	'AND IdBnf = Gia_IdBnf '+
	'AND IdGia = Gpd_IdGia '+
	'AND IdEsp = Gia_IdEsp '+
	'AND IdPdm = Gpd_IdPdm '+
	'AND IdUsr = Gia_IdUsr '+
	'AND Gia_IdCtt = Cte_IdCtt '+
	'AND Gia_SeqEnd = Cte_SeqEnd '+
	'AND IdPrf = Gia_IdPrf '+
	'AND Gia_Tip = 2 '

	-- Solicitação SP/SADT
	SET @SQL4 = N'
	SELECT Sol_DatEms,Bnf_Nme,''SOLICITAÇÃO'' AS Gia_Tip,Pdm_Cod,'+
			'Sit_Dsc,Pdm_Dsc,'+
			'Prf_Nme AS Prf_Sol,NULL AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Spd_QtdAtz,Spd_QtdSol,'+
			'CASE Sit_Ind WHEN ''A'' THEN Sol_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,Esp_Dsc AS Esp_Sol,NULL AS Esp_Exe '+
	'FROM dbo.Atz_Sol,dbo.Atz_SolPdm,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,'+
		'dbo.Atz_Prf,dbo.Atz_Pdm,dbo.Sgn_Usr,dbo.Atz_Esp,dbo.Atz_Sit '+
	'WHERE IdSol = Spd_IdSol '+
	'AND IdCtt = Sol_IdCtt '+
	'AND IdSit = Spd_IdSit '+
	'AND Sol_SeqEnd = Cte_SeqEnd '+
	'AND IdCtt = Cte_IdCtt '+
	'AND IdPdm = Spd_IdPdm '+
	'AND IdBnf = Sol_IdBnf '+
	'AND IdPrf = Sol_IdPrfSol '+ 
	'AND IdUsr = Sol_IdUsr '+
	'AND IdEsp = Sol_IdEsp '

	IF @Gia_DatIni IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms >= @Gia_DatIni '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms >= @Gia_DatIni '
	END

	IF @Gia_DatFim IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms <= @Gia_DatFim '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms <= @Gia_DatFim '
	END

	IF @Gia_Tip IS NOT NULL
	BEGIN 
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip = @Gia_Tip '
		-- As solicitações de SP/SADT não devem ser listadas se o usuário 
		-- filtrar por um tipo de guia que não for a de solcitação de SP/SADT
		IF @Gia_Tip <> 0
			SET @WHERESOL = @WHERESOL + N'AND 0 = 1 '
	END

	IF @IdSit IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdSit = @IdSit '

	IF @IdEsp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '

	IF @Pdm_Cod IS NOT NULL
		SET @WHERE = @WHERE + N'AND Pdm_Cod = @Pdm_Cod '   

	IF @Gia_Snh IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh = @Gia_Snh ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_Snh = @Gia_Snh ' 
	END

	IF @Bnf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Bnf_Mtr = @Bnf_Mtr ' 

	IF @IdCtt IS NOT NULL
		SET @WHERE = @WHERE + N'AND IdCtt = @IdCtt ' 

	-- Se um dos filtros da pesquisa for a matrícula do profissional,
	-- as guias de SP/SADT com procedimentos que não requerem profissional
	-- não devem ser exibidas
	IF @Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
		
		SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL4 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord
	END
	ELSE
		SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL2 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL4 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord

	PRINT '4000 800 1100 800'
	PRINT LEN(@SQL)
	PRINT LEN(@SQL2)
	PRINT LEN(@SQL3)
	PRINT LEN(@SQL4)
	PRINT '800 400 400'
	PRINT LEN(@WHERE)
	PRINT LEN(@WHEREGIA)
	PRINT LEN(@WHERESOL)
	PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
	@Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
	@Prf_Mtr VARCHAR(20) ',
		@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr

	
END






