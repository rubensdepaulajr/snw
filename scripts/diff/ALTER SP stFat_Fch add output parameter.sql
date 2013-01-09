
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 18/03/2012
-- Description:	Período de Fechamento de Faturas - Inserção e manipulação de dados
-- =============================================================================
ALTER PROCEDURE [dbo].[stFat_Fch]

	@IdFch INT = NULL,
	@IdOpe SMALLINT,
	@IdCtt BIGINT = NULL,
	@IdTpd TINYINT = NULL,
	@FchCpc VARCHAR(6),
	@FchAno SMALLINT,
	@FchMes TINYINT,
	@FchEnt DATE,
	@FchDatIni SMALLDATETIME,
	@FchDatFim SMALLDATETIME,
	@FchLot BIT,
	@OutErr BIT OUTPUT

AS
	BEGIN TRY
		DECLARE @ErrorLogID INT
		BEGIN TRAN
		IF (@IdFch IS NULL)
		BEGIN
		   IF (@IdTpd IS NULL)
			BEGIN
				-- Exclui a competência do contratado
				DELETE FROM dbo.Fat_Fch
				WHERE Fch_IdCtt = @IdCtt AND
					Fch_Cpc = @FchCpc

				-- Insere contratado individual
				INSERT dbo.Fat_Fch
				   (Fch_IdOpe, Fch_IdCtt, Fch_Cpc, Fch_Ano,
					Fch_Mes, Fch_Ent, Fch_DatIni, Fch_DatFim, Fch_Lot)
				VALUES
				   (@IdOpe, @IdCtt, @FchCpc, @FchAno, @FchMes, 
					@FchEnt, @FchDatIni, @FchDatFim, @FchLot)
			END
			ELSE
			BEGIN
				-- Exclui a competência do grupo de contratado
				DELETE fch
				FROM dbo.Fat_Fch fch, dbo.Atz_Ctt
				WHERE IdCtt = Fch_IdCtt AND
					Fch_Cpc = @FchCpc AND 
					Ctt_IdTpd = @IdTpd
				
				-- Insere em lote por grupo de contratado
				INSERT dbo.Fat_Fch
				   (Fch_IdOpe, Fch_IdCtt, Fch_Cpc, Fch_Ano,
					Fch_Mes, Fch_Ent, Fch_DatIni, Fch_DatFim, Fch_Lot)
					SELECT @IdOpe, IdCtt, @FchCpc, @FchAno, @FchMes, 
						@FchEnt, @FchDatIni, @FchDatFim, 1
					FROM dbo.Atz_Ctt
					WHERE Ctt_IdTpd = @IdTpd
			END
		END
		ELSE
			UPDATE dbo.Fat_Fch
			SET	Fch_Ent = @FchEnt,
				Fch_DatIni = @FchDatIni,
				Fch_DatFim = @FchDatFim,
				Fch_Lot = 0
			WHERE IdFch = @IdFch

		COMMIT TRAN
		SET @OutErr = 0
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
		SET @OutErr = 1
	END CATCH