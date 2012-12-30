-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 21/01/2009
-- Description:	Pesquisa Guia de Consulta para impressão
-- =============================================================================
ALTER PROCEDURE [dbo].[srAtz_GiaCon]
	@IdGia INT
AS
	SELECT
		IdGia, Gia_Snh, Gia_DatEms, Bnf_Mtr, Prd_Nme, Bnf_Nme, 
		LTRIM(STR(IdTpc)) + ' - ' + Tpc_Dsc AS Tpc_Dsc, 
		LTRIM(STR(IdSai)) + ' - ' + Sai_Dsc AS Sai_Dsc, 
		Bnf_DatVld, IdCtt, Ctt_Nme, Tpl_Dsc, Gia_TemDoe, Gia_TipDoe, 
		Lgr_Nme + ' ' + Cte_NumEnd + ' ' + ISNULL(Cte_Cpl, '') AS Ctt_End,  Mun_Nme, 
		Mun_Est, Cte_Cep, Prf_Nme, ISNULL(Gia_DatAtd, GETDATE()) AS Gia_DatAtd, Pdm_Cod, 
		Pdm_IdTab, Ctt_CodCne, Cns_Nme, Prf_NumCns, Prf_EstCns, Esp_Cbo
	FROM
		dbo.Atz_Sai RIGHT OUTER JOIN
		dbo.Atz_Pdm INNER JOIN
		dbo.Atz_Gia INNER JOIN
		dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN
		dbo.Atz_CttEnd INNER JOIN
		dbo.Atz_Ctt ON Cte_IdCtt = IdCtt AND Cte_IdCtt = IdCtt ON 
			Gia_IdCtt = Cte_IdCtt AND Gia_SeqEnd = Cte_SeqEnd ON 
			IdPdm = Gpd_IdPdm INNER JOIN
		dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN
		dbo.Atz_BnfPrd ON IdBnf = Bnp_IdBnf INNER JOIN
		dbo.Atz_Lgr ON Cte_IdLgr = IdLgr INNER JOIN
		dbo.Atz_Prd ON Bnp_IdPrd = IdPrd INNER JOIN
		dbo.Atz_Prf ON Gia_IdPrf = IdPrf INNER JOIN
		dbo.Atz_Tpl ON Lgr_IdTpl = IdTpl INNER JOIN
		dbo.Atz_Mun INNER JOIN
		dbo.Atz_Brr ON IdMun = Brr_IdMun ON Lgr_IdBrr = IdBrr INNER JOIN
		dbo.Atz_Cns ON Prf_IdCns = IdCns INNER JOIN
		dbo.Atz_Esp ON Gia_IdEsp = IdEsp ON IdSai = Gia_IdSai LEFT OUTER JOIN
		dbo.Atz_Tpc ON Gia_IdTpc = IdTpc
WHERE
	Gia_Tip = 1 AND
	Bnp_DatFim IS NULL AND
	IdGia = @IdGia

