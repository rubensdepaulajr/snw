-- =============================================
-- Author		: Rubens Jr
-- Create date	: 01/03/2009
-- Description	: Pesquisa Log de Auditoria - Solicitações e Guias
-- =============================================
ALTER PROCEDURE [dbo].[ssAtz_GiaPdmAud]

	@IdSol INT,
	@IdPdm INT,
	@Sol_Tip INT

AS 
    IF (@Sol_Tip = 0)
		SELECT	IdSit, Sit_Dsc, Usr_Nme, Spa_Dat, Spa_Jst
        FROM    dbo.Atz_Sit, dbo.Atz_SolPdmAud, dbo.Sgn_Usr
        WHERE   IdSit		= Spa_IdSit
		AND		IdUsr		= Spa_IdUsr
        AND     Spa_IdSol   = @IdSol
        AND     Spa_IdPdm   = @IdPdm
        ORDER BY IdSpa
	ELSE        
        SELECT	IdSit, Sit_Dsc, Usr_Nme, Gpa_Dat AS Spa_Dat, Gpa_Jst AS Spa_Jst
        FROM    dbo.Atz_Sit, dbo.Atz_GiaPdmAud, dbo.Sgn_Usr
        WHERE   IdSit		= Gpa_IdSit
		AND		IdUsr		= Gpa_IdUsr
        AND     Gpa_IdGia   = @IdSol
        AND     Gpa_IdPdm   = @IdPdm
        ORDER BY IdGpa




