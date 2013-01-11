
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Papel - Inserção e manipulação de dados
-- =============================================================================
ALTER PROCEDURE [dbo].[stSgn_Ppl]

	@IdPpl SMALLINT = NULL,
	@Ppl_Dsc VARCHAR(20) = NULL,
	@Ppl_QtdCh_ INT = NULL,
	@Ppl_Ope BIT = NULL,
	@Ppl_Con BIT = NULL,
	@Ppl_Sdt BIT = NULL,
	@Ppl_PrgLib BIT = NULL

AS
	IF (@IdPpl IS NULL)
       INSERT INTO [dbo].[Sgn_Ppl]
           (Ppl_Dsc, Ppl_QtdCh_, Ppl_Ope, Ppl_Con, Ppl_Sdt, Ppl_PrgLib)
       VALUES
           (@Ppl_Dsc, @Ppl_QtdCh_, @Ppl_Ope, @Ppl_Con, @Ppl_Sdt, @Ppl_PrgLib)
	ELSE
		UPDATE dbo.Sgn_Ppl
		SET	Ppl_Dsc = @Ppl_Dsc,
			Ppl_QtdCh_ = @Ppl_QtdCh_,
			Ppl_Ope = @Ppl_Ope,
			Ppl_Con = @Ppl_Con,
			Ppl_Sdt = @Ppl_Sdt,
			Ppl_PrgLib = @Ppl_PrgLib
		WHERE IdPpl = @IdPpl

