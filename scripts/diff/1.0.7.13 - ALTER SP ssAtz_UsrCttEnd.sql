
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa os endereços do contratado 
--				em que o usuário esta relacionado.
-- =============================================================================
ALTER PROCEDURE [dbo].[ssAtz_UsrCttEnd] 
	@UserName NVARCHAR(256) = NULL,
	@IdUce INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@UserName IS NOT NULL)
		SELECT	IdUsr, IdCtt, Cte_SeqEnd, Ctt_Nme, Lgr_Nme, Brr_Nme,
				Ctt_Nme + ' - '+ Tpl_Dsc +' '+ Lgr_Nme +', '+	Brr_Nme +' - '+ Mun_Nme AS Uce_Loc,
				LTRIM(STR(IdCtt)) +'|'+ LTRIM(STR(Cte_SeqEnd)) +'|'+ Ctt_Nme + '|'+ Tpl_Dsc +' '+ Lgr_Nme +'|'+
				Brr_Nme +'|'+ Mun_Nme +'|'+ LTRIM(STR(IdUsr)) +'|'+ Usr_Nme +'|'+ LTRIM(STR(Usr_IdPpl)) +'|'+ 
				CASE Cte_BioCon WHEN 1 THEN 'S' ELSE 'N' END +'|'+
				CASE Cte_BioExe WHEN 1 THEN 'S' ELSE 'N' END +'|'+
				+'N' AS Uce_Dad
		FROM	dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_UsrCttEnd,	dbo.Sgn_Usr, 
				dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Mun, dbo.Atz_Tpl, dbo.Aspnet_Users
		WHERE	IdLgr = Cte_IdLgr
		AND		IdTpl = Lgr_IdTpl
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		IdCtt = Cte_IdCtt
		AND		IdUsr = Uce_IdUsr
		AND		Cte_IdCtt = Uce_IdCtt
		AND		Cte_SeqEnd = Uce_SeqEnd
		AND		UserId = Usr_UserId
		AND		(Cte_DatFim IS NULL OR Cte_DatFim > GETDATE())
		AND		UserName = @UserName
		UNION 
		SELECT IdUsr, IdCtt, Cte_SeqEnd, Ctt_Nme, Lgr_Nme, Brr_Nme, 
			Ctt_Nme + ' - ' + Tpl_Dsc + ' ' + Lgr_Nme + ', ' + Brr_Nme + ' - ' + Mun_Nme AS Uce_Loc, 
			LTRIM(STR(IdCtt)) + '|' + LTRIM(STR(Cte_SeqEnd)) 
			+ '|' + Ctt_Nme + '|' + Tpl_Dsc + ' ' + Lgr_Nme + '|' + Brr_Nme + '|' + Mun_Nme + '|' + LTRIM(STR(IdUsr))
			+ '|' + Usr_Nme + '|' + LTRIM(STR(Usr_IdPpl)) 
			+ '|' + CASE Cte_BioCon WHEN 1 THEN 'S' ELSE 'N' END + '|' + 
			CASE Cte_BioExe WHEN 1 THEN 'S' ELSE 'N' END + '|' + CASE ISNULL(IdBpf, 0) 
			WHEN 0 THEN 'N' ELSE 'S' END AS Uce_Dad
		FROM dbo.Atz_Prf INNER JOIN
			dbo.Sgn_Usr ON Prf_IdUsr = IdUsr INNER JOIN
			dbo.Atz_PrfEspLcr ON IdPrf = Pel_IdPrf INNER JOIN
			dbo.Atz_Lcr ON Pel_IdLcr = IdLcr INNER JOIN
			dbo.Atz_Lgr INNER JOIN
			dbo.Atz_CttEnd ON IdLgr = Cte_IdLgr INNER JOIN
			dbo.Atz_Tpl ON Lgr_IdTpl = IdTpl INNER JOIN
			dbo.Atz_Brr ON Lgr_IdBrr = IdBrr INNER JOIN
			dbo.Atz_Mun ON Brr_IdMun = IdMun INNER JOIN
			dbo.Atz_Ctt ON Cte_IdCtt = IdCtt ON Lcr_IdCtt = Cte_IdCtt AND 
			Lcr_SeqEnd = Cte_SeqEnd INNER JOIN
			dbo.aspnet_Users ON Usr_UserId = UserId LEFT OUTER JOIN
			dbo.Sgn_BioPrf ON Cte_IdCtt = Bpf_IdCtt AND Cte_SeqEnd = Bpf_SeqEnd AND 
			IdPrf = Bpf_IdPrf
		WHERE ((Cte_DatFim IS NULL) OR
			(Cte_DatFim > GETDATE())) AND		
			UserName = @UserName
		ORDER BY Ctt_Nme, Cte_SeqEnd
	ELSE
	IF (@IdUce IS NOT NULL)
		SELECT	IdUsr, IdCtt, Cte_SeqEnd, Ctt_Nme, Lgr_Nme, Brr_Nme
		FROM	dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_UsrCttEnd, 
				dbo.Sgn_Usr, dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Aspnet_Users
		WHERE	IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdCtt = Cte_IdCtt
		AND		IdUsr = Uce_IdUsr
		AND		Cte_IdCtt = Uce_IdCtt
		AND		Cte_SeqEnd = Uce_SeqEnd
		AND		UserId = Usr_UserId
		AND		(Cte_DatFim IS NULL OR Cte_DatFim > GETDATE())
		AND		IdUce = @IdUce

END



