-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 04/05/2007
-- Description:	Procedimento Guia SP/SADT - Manipulação de Dados
-- =============================================================================
ALTER PROCEDURE [dbo].[stAtz_GiaPdmSdt]
	 @Gpd_IdGia INT
    ,@Gpd_IdPdm INT
    ,@Gpd_IdSit TINYINT
    ,@Gpd_QtdSol TINYINT
	,@Gpd_QtdAtz TINYINT
	,@Gpd_DatRel SMALLDATETIME
	,@Gpd_IdNgc	INT = NULL
	,@IdSol INT
	,@Gpm_IdMsg VARCHAR(200) = NULL
	,@IdUsr INT
AS
BEGIN
	DECLARE @ErrorLogID INT
	DECLARE @SQL NVARCHAR(2000)
	
	INSERT Log_SolGia
	VALUES(@Gpd_IdGia 
		,@Gpd_IdPdm 
		,@Gpd_IdSit 
		,@Gpd_QtdSol 
		,@Gpd_QtdAtz 
		,@Gpd_DatRel 
		,@Gpd_IdNgc	
		,@IdSol 
		,@Gpm_IdMsg
		,GETDATE() )
	
	--	Tratamento para evitar inserção de guia em duplicidade
	--SELECT	*
	--FROM	dbo.Atz_GiaPdm 
	--WHERE	Gpd_IdGia = @Gpd_IdGia
	--AND		Gpd_IdPdm = @Gpd_IdPdm
	
	---- Se encontrar alguma guia já cadastrada em duplicidade,
	---- retorna o código da guia e senha cadastrada anteriormente.
	--IF (@@ROWCOUNT > 0)
	--BEGIN
	--	RETURN
	--END

	
	BEGIN TRY
	
	BEGIN TRANSACTION
	
	-- Se o procedimento foi negado a quantidade autorizada deve ser igual a zero,
	-- senão deverá ser igual a quantidade solicitada
	IF (@Gpd_IdSit =  0)
		SET @Gpd_QtdAtz = 0
	ELSE
	BEGIN
		SET @Gpd_QtdAtz = @Gpd_QtdSol

		-- Só devem ser marcados como executados o procedimentos que foram autorizados
		UPDATE	dbo.Atz_SolPdm
		SET		Spd_QtdRel = ISNULL(Spd_QtdRel,0) + @Gpd_QtdSol
		WHERE	Spd_IdSol = @IdSol
		AND		Spd_IdPdm = @Gpd_IdPdm
	END

	INSERT dbo.Atz_GiaPdm
		(
			Gpd_IdGia ,Gpd_IdPdm ,Gpd_IdSit ,Gpd_Dat ,Gpd_DatVld,
			Gpd_QtdSol ,Gpd_QtdAtz ,Gpd_DatRel ,Gpd_IdNgc
		)
	 VALUES
		(
			@Gpd_IdGia, @Gpd_IdPdm, @Gpd_IdSit, GETDATE(), GETDATE() + 30, 
			@Gpd_QtdSol, @Gpd_QtdAtz, @Gpd_DatRel, @Gpd_IdNgc
		)	
	
	-- Se o procedimento foi negado é inserido o log da negativa
	IF (@Gpd_IdSit = 0)
	BEGIN
		INSERT dbo.Atz_GiaPdmAud
			(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
		VALUES
			(@Gpd_IdGia, @Gpd_IdPdm, @Gpd_IdSit, @IdUsr, GETDATE(), 'NEGATIVA AUTOMATICA PELAS REGRAS DO SISTEMA')
				
		SET @SQL = N'INSERT dbo.Atz_GiaPdmMsg
					(Gpm_IdGia, Gpm_IdPdm, Gpm_IdMsg)
					SELECT	@IdGia, @IdPdm, IdMsg
					FROM	dbo.Atz_Msg
					WHERE	IdMsg IN ('+@Gpm_IdMsg+')'

		EXEC SP_EXECUTESQL @SQL, N'@IdGia INT, @IdPdm INT', @Gpd_IdGia, @Gpd_IdPdm

	END
	
	COMMIT TRANSACTION
	
	END TRY
	BEGIN CATCH
		IF XACT_STATE() <> 0
		BEGIN
			ROLLBACK TRANSACTION;
		END
		
		EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
	
	END CATCH
	
END



