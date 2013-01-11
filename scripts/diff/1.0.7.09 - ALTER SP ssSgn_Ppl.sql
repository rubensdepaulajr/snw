
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Pesquisa Papel
-- =============================================================================
ALTER PROCEDURE [dbo].[ssSgn_Ppl] 
	@IdPpl  SMALLINT = NULL,
	@Ppl_Dsc VARCHAR(20) = NULL
AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdPpl IS NOT NULL OR  @Ppl_Dsc IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
		SELECT IdPpl
			  ,Ppl_Dsc
			  ,Ppl_QtdCh_
			  ,Ppl_Ope
			  ,Ppl_Con
			  ,Ppl_Sdt
			  ,Ppl_PrgLib
		  FROM [dbo].[Sgn_Ppl]
		WHERE 0 = 0 '

	IF @IdPpl IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND IdPpl = @IdPpl '
	IF @Ppl_Dsc IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Ppl_Dsc LIKE  ''%'' + @Ppl_Dsc + ''%'' '   

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdPpl smallint, @Ppl_Dsc VARCHAR(20)',
	@IdPpl, @Ppl_Dsc

END

