USE [TotalTiss]
GO

/****** Object:  Table [dbo].[Lote]    Script Date: 12/11/2012 22:32:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Lote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [char](67) NOT NULL,
	[DataCriacao] [datetime] NOT NULL,
	[Arquivo] [varbinary](max) NOT NULL,
	[IdCompetencia] [smallint] NOT NULL,
	[arq] [xml] NULL,
 CONSTRAINT [PK_Lote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Lote]  WITH CHECK ADD  CONSTRAINT [FK_Lote_Lote] FOREIGN KEY([IdCompetencia])
REFERENCES [dbo].[Fat_Fch] ([IdFch])
GO

ALTER TABLE [dbo].[Lote] CHECK CONSTRAINT [FK_Lote_Lote]
GO



USE [TotalTiss]
GO

/****** Object:  Table [dbo].[LoteGuia]    Script Date: 12/11/2012 22:32:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoteGuia](
	[IdLote] [int] NOT NULL,
	[IdGuia] [int] NOT NULL,
 CONSTRAINT [PK_LoteGuia] PRIMARY KEY CLUSTERED 
(
	[IdLote] ASC,
	[IdGuia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LoteGuia]  WITH CHECK ADD  CONSTRAINT [FK_LoteGuia_Atz_Gia] FOREIGN KEY([IdGuia])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO

ALTER TABLE [dbo].[LoteGuia] CHECK CONSTRAINT [FK_LoteGuia_Atz_Gia]
GO

ALTER TABLE [dbo].[LoteGuia]  WITH CHECK ADD  CONSTRAINT [FK_LoteGuia_Lote] FOREIGN KEY([IdLote])
REFERENCES [dbo].[Lote] ([Id])
GO

ALTER TABLE [dbo].[LoteGuia] CHECK CONSTRAINT [FK_LoteGuia_Lote]
GO



