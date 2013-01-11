

/****** Object:  Index [Idx_FatFch_IdOpe_IdCtt_Ctt]    Script Date: 09/01/2013 00:11:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx_FatFch_IdOpe_IdCtt_Ctt] ON [dbo].[Fat_Fch]
(
	[Fch_IdOpe] ASC,
	[Fch_IdCtt] ASC,
	[Fch_Cpc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


