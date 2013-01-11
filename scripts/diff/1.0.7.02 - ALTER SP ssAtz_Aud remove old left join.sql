
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/01/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
ALTER PROCEDURE [dbo].[ssAtz_Aud] 
	@IdSit TINYINT = NULL,
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@Gia_Tip TINYINT = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
DECLARE @WHERE NVARCHAR(1000), @WHEREGIA NVARCHAR(500), @WHERESOL NVARCHAR(500)
DECLARE @SQL NVARCHAR(4000) , @SQL2 NVARCHAR(1000), @SQL3 NVARCHAR(1000)
IF @Gia_DatIni IS NOT NULL OR
	@Gia_DatFim IS NOT NULL OR
	@Gia_Tip IS NOT NULL OR
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
		SELECT	DISTINCT TOP 1000 IdGia AS IdSol, Bnf_Mtr, Bnf_Nme, Gia_Snh AS Sol_Snh, Gia_DatEms AS Sol_DatEms, Gia_Tip AS Sol_Tip,
				Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Prf_Mtr, Gia_Crt AS Sol_Crt, 
				CASE WHEN (Gpd_DatRel IS NULL) THEN ''CONSULTA'' ELSE ''CONSULTA EXECUTADA'' END AS Sol_TipDsc
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Pdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdPrf = Gia_IdPrf
		AND		IdPdm = Gpd_IdPdm
		AND		Gpd_IdSit <> 10	
		AND		Gia_Tip = 1  '

	-- SP/SADT
	SET @SQL2 = N'
		SELECT DISTINCT 
			IdGia AS IdSol, Bnf_Mtr, Bnf_Nme, Gia_Snh AS Sol_Snh, Gia_DatEms AS Sol_DatEms, 
			Gia_Tip AS Sol_Tip, Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Prf_Mtr, 
			Gia_Crt AS Sol_Crt, ''SP/SADT'' AS Sol_TipDsc
		FROM
			dbo.Atz_Gia INNER JOIN
			dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN
			dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN
			dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm LEFT OUTER JOIN
			dbo.Atz_Prf ON Gia_IdPrf = IdPrf
		WHERE
			Gpd_IdSit <> 10 AND 
			Gia_Tip = 2 '

	-- Solicitação SP/SADT
	SET @SQL3 = N'
		SELECT	DISTINCT IdSol, Bnf_Mtr, Bnf_Nme, Sol_Snh, Sol_DatEms, 0 AS Sol_Tip,
				Sol_IdCtt, Sol_SeqEnd, Prf_Mtr, Sol_Crt, ''SOLICITAÇÃO'' AS Sol_TipDsc
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Pdm
		WHERE	IdBnf = Sol_IdBnf
		AND		IdSol = Spd_IdSol
		AND		IdPrf = Sol_IdPrfSol
		AND		IdPdm = Spd_IdPdm
		AND		Spd_IdSit <> 10 '

	IF @IdSit IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_IdSit = @IdSit '
		SET @WHERESOL = @WHERESOL + N'AND Spd_IdSit = @IdSit '
	END

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
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip = @Gia_Tip '

	IF @Gia_Snh IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh = @Gia_Snh ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_Snh = @Gia_Snh ' 
	END

	IF @Bnf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Bnf_Mtr = @Bnf_Mtr ' 

	IF @IdCtt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdCtt = @IdCtt ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdCtt = @IdCtt ' 
	END

	IF @Prf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
		
	IF @Pdm_Cod IS NOT NULL
		SET @WHERE = @WHERE + N'AND Pdm_Cod = @Pdm_Cod '

	SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL2 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdSit TINYINT, @Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT,
	@Gia_Snh VARCHAR(20), @Bnf_Mtr VARCHAR(20), @IdCtt BIGINT, @Prf_Mtr VARCHAR(20), @Pdm_Cod VARCHAR(20) ',
		@IdSit, @Gia_DatIni, @Gia_DatFim, @Gia_Tip, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr, @Pdm_Cod
END







GO


