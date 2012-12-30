-- =============================================
-- Author:		Rubens Jr
-- Create date: 2009.03.10
-- Description:	Pesquisa dados da solicitação/guia para auditoria
-- =============================================
ALTER PROCEDURE [dbo].[ssAtz_AudDet] 
	@IdSol INT,
	@Sol_Tip TINYINT
AS
BEGIN 

	SET NOCOUNT ON;
	-- Selciona os procedimentos quando é solicitação
	IF @Sol_Tip = 0
		SELECT	Bnf_Mtr, Bnf_Nme, Sol_IdCtt, Sol_SeqEnd, Ctt_Nme, 
				Prf_Mtr, Prf_Nme, Prf_Tel, Prf_Tel2, Prf_Fax, Sol_IndCln,
				(
					SELECT	TOP 1 IdCid + ' - '+ Cid_Dsc 
					FROM	dbo.Atz_Cid, dbo.Atz_GiaCid 
					WHERE	IdCid = Gcd_IdCid
					AND		Gcd_IdGia = Sol_IdGia
				) AS Cid_Dsc, Tpl_Dsc +' '+ Lgr_Nme +' - '+ Brr_Nme +' - '+ Mun_Nme AS Ctt_End
		FROM	dbo.Atz_Sol, dbo.Atz_Ctt, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_CttEnd,
				dbo.Atz_Mun, dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Tpl
		WHERE	IdCtt = Cte_IdCtt
		AND		IdBnf = Sol_IdBnf
		AND		IdPrf = Sol_IdPrfSol
		AND		Cte_IdCtt = Sol_IdCtt
		AND		Cte_SeqEnd = Sol_SeqEnd
		AND		IdMun = Brr_IdMun
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdTpl = Lgr_IdTpl
		AND		IdSol = @IdSol
	ELSE
		-- Seleciona os procedimentos quando é consulta ou SP/SADT
		SELECT
			Bnf_Mtr, Bnf_Nme, Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Ctt_Nme, 
			Prf_Mtr, Prf_Nme, Prf_Tel, Prf_Tel2, Prf_Fax, Gia_IndCln AS Sol_IndCln,
			(
				SELECT TOP (1) IdCid + ' - ' + Cid_Dsc
				FROM
					dbo.Atz_Cid INNER JOIN
					dbo.Atz_GiaCid ON IdCid = Gcd_IdCid
				WHERE
					(Gcd_IdGia = IdGia)) AS Cid_Dsc, 
			Tpl_Dsc + ' ' + Lgr_Nme + ' - ' + Brr_Nme + ' - ' + Mun_Nme AS Ctt_End
		FROM
			dbo.Atz_Gia INNER JOIN
			dbo.Atz_Ctt ON Gia_IdCtt = IdCtt INNER JOIN
			dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN
			dbo.Atz_CttEnd ON Gia_IdCtt = Cte_IdCtt AND Gia_SeqEnd = Cte_SeqEnd INNER JOIN
			dbo.Atz_Lgr ON Cte_IdLgr = IdLgr INNER JOIN
			dbo.Atz_Brr INNER JOIN
			dbo.Atz_Mun ON Brr_IdMun = IdMun ON Lgr_IdBrr = IdBrr INNER JOIN
			dbo.Atz_Tpl ON Lgr_IdTpl = IdTpl LEFT OUTER JOIN
			dbo.Atz_Prf ON Gia_IdPrf = IdPrf
		WHERE
			IdGia = @IdSol

END



