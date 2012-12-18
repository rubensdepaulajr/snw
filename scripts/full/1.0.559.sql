USE [TotalTISS]
GO
/****** Object:  StoredProcedure [dbo].[Arq_CmpInsProc]    Script Date: 12/18/2012 09:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Arq_CmpInsProc]
(
    @Cmp_IdTab     int,
    @Cmp_Ord       tinyint,
    @Cmp_Dsc       varchar(30),
    @Cmp_Nme       varchar(16),
    @Cmp_Tpo       char(1),
    @Cmp_Imp       bit                    = NULL,
    @Cmp_Csa       varchar(50)            = NULL)
AS
BEGIN
    BEGIN TRAN

    INSERT INTO Arq_Cmp(Cmp_IdTab,
                        Cmp_Ord,
                        Cmp_Dsc,
                        Cmp_Nme,
                        Cmp_Tpo,
                        Cmp_Imp,
                        Cmp_Csa)
    VALUES(@Cmp_IdTab,
           @Cmp_Ord,
           @Cmp_Dsc,
           @Cmp_Nme,
           @Cmp_Tpo,
           @Cmp_Imp,
           @Cmp_Csa)

    IF (@@error!=0)
    BEGIN
        RAISERROR  20000 'Arq_CmpInsProc: Cannot insert because primary key value not found in Arq_Cmp '
        ROLLBACK TRAN
        RETURN(1)
    
    END

    COMMIT TRAN

END
GO
/****** Object:  Table [dbo].[Ans_Msg]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ans_Msg](
	[IdMsg] [smallint] NOT NULL,
	[Msg_Dsc] [varchar](150) NOT NULL,
	[Msg_DscAtz] [varchar](150) NOT NULL,
	[Msg_Grp] [varchar](25) NOT NULL,
	[Msg_Loc] [varchar](50) NULL,
 CONSTRAINT [PK_IdMsg] PRIMARY KEY NONCLUSTERED 
(
	[IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ans_Msg', @level2type=N'COLUMN',@level2name=N'IdMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ans_Msg', @level2type=N'COLUMN',@level2name=N'Msg_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição que será exibida no autorizador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ans_Msg', @level2type=N'COLUMN',@level2name=N'Msg_DscAtz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grupo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ans_Msg', @level2type=N'COLUMN',@level2name=N'Msg_Grp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica o local onde a mensagem esta sendo utilizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ans_Msg', @level2type=N'COLUMN',@level2name=N'Msg_Loc'
GO
/****** Object:  Table [dbo].[_Aud_GiaCon]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Aud_GiaCon](
	[Qtd] [int] NULL,
	[Gia_IdCtt] [bigint] NULL,
	[Gia_SeqEnd] [tinyint] NULL,
	[Gia_IdPrf] [int] NULL,
	[Gia_IdEsp] [smallint] NULL,
	[Gia_IdBnf] [int] NULL,
	[Gia_IdPrfSol] [int] NULL,
	[Gia_IdUsr] [int] NULL,
	[Gia_IdTpc] [tinyint] NULL,
	[Gia_IdTpa] [tinyint] NULL,
	[Gia_IdTpi] [tinyint] NULL,
	[Gia_IdAcm] [char](2) NULL,
	[Gia_IdRgm] [tinyint] NULL,
	[Gia_IdSai] [tinyint] NULL,
	[Gia_Tip] [tinyint] NULL,
	[Gia_TipDoe] [char](1) NULL,
	[Gia_TemDoe] [char](4) NULL,
	[Gia_DatEms] [smalldatetime] NOT NULL,
	[Gia_DatAtd] [smalldatetime] NULL,
	[Gia_Snh] [varchar](20) NULL,
	[Gia_DatVld] [smalldatetime] NULL,
	[Gia_Crt] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_Applicati__2CF2ADDF] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 12/18/2012 09:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(20)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 12/18/2012 09:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
 CONSTRAINT [PK__aspnet_SchemaVer__37703C52] PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atz_Cns]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Cns](
	[IdCns] [varchar](7) NOT NULL,
	[Cns_Nme] [varchar](60) NOT NULL,
 CONSTRAINT [PK_Cns] PRIMARY KEY NONCLUSTERED 
(
	[IdCns] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cns', @level2type=N'COLUMN',@level2name=N'IdCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cns', @level2type=N'COLUMN',@level2name=N'Cns_Nme'
GO
/****** Object:  Table [dbo].[Atz_Cid]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Cid](
	[IdCid] [char](5) NOT NULL,
	[Cid_Dsc] [varchar](300) NOT NULL,
	[Cid_Aud] [bit] NULL,
 CONSTRAINT [PK_Cid] PRIMARY KEY NONCLUSTERED 
(
	[IdCid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cid', @level2type=N'COLUMN',@level2name=N'IdCid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cid', @level2type=N'COLUMN',@level2name=N'Cid_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica se a utilização do CID deve ser monitorada pela medicina preventiva' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cid', @level2type=N'COLUMN',@level2name=N'Cid_Aud'
GO
/****** Object:  Table [dbo].[Atz_Cbt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Cbt](
	[IdCbt] [smallint] NOT NULL,
	[Cbt_Dsc] [varchar](40) NOT NULL,
	[Cbt_Car] [smallint] NULL,
 CONSTRAINT [PK_Cbt] PRIMARY KEY NONCLUSTERED 
(
	[IdCbt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do grupo de cobertura/carência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cbt', @level2type=N'COLUMN',@level2name=N'IdCbt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cbt', @level2type=N'COLUMN',@level2name=N'Cbt_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de dias em carência para o grupo de procedimentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cbt', @level2type=N'COLUMN',@level2name=N'Cbt_Car'
GO
/****** Object:  Table [dbo].[Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Esp](
	[IdEsp] [smallint] IDENTITY(1,1) NOT NULL,
	[Esp_Dsc] [varchar](80) NOT NULL,
	[Esp_Cbo] [varchar](10) NULL,
	[Esp_SisGst] [varchar](10) NULL,
	[Esp_AltCpx] [bit] NULL,
	[Esp_Sxo] [char](1) NULL,
	[Esp_IddMin] [tinyint] NULL,
	[Esp_IddMax] [tinyint] NULL,
	[Esp_QtdMax] [tinyint] NULL,
	[Esp_QtdDia] [tinyint] NULL,
	[Esp_QtdMes] [tinyint] NULL,
	[Esp_QtdAno] [smallint] NULL,
	[Esp_Rtn] [smallint] NULL,
 CONSTRAINT [PK_Esp] PRIMARY KEY NONCLUSTERED 
(
	[IdEsp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Esp', @level2type=N'COLUMN',@level2name=N'IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Esp', @level2type=N'COLUMN',@level2name=N'Esp_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código CBO no padrão TISS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Esp', @level2type=N'COLUMN',@level2name=N'Esp_Cbo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade no sistema de gestão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Esp', @level2type=N'COLUMN',@level2name=N'Esp_SisGst'
GO
/****** Object:  Table [dbo].[Atz_Emp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Emp](
	[IdEmp] [int] IDENTITY(1,1) NOT NULL,
	[Emp_IdItg] [int] NULL,
	[Emp_TipItg] [char](1) NULL,
	[Emp_Doc] [varchar](14) NOT NULL,
	[Emp_Nme] [varchar](50) NOT NULL,
	[Emp_Sit] [char](1) NULL,
 CONSTRAINT [PK_Emp] PRIMARY KEY NONCLUSTERED 
(
	[IdEmp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'IdEmp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do lote de integração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'Emp_IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de integração, indica se a empresa foi inserida ou alterada via integração [I-Insert|U-Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'Emp_TipItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CPF ou CNPJ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'Emp_Doc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'Emp_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação [A-Aivo|I-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Emp', @level2type=N'COLUMN',@level2name=N'Emp_Sit'
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
 CONSTRAINT [PK__aspnet_WebEvent___0E391C95] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atz_Ngc_Aux]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Ngc_Aux](
	[IdNgc] [int] NOT NULL,
	[Ngc_IdPel] [int] NULL,
	[Ngc_IdLce] [int] NULL,
	[Ngc_IdPdm] [int] NOT NULL,
	[Ngc_Uni] [char](10) NOT NULL,
	[Ngc_Vlr] [decimal](18, 2) NOT NULL,
	[Ngc_VlrFlm] [decimal](18, 4) NULL,
	[Ngc_DatIni] [smalldatetime] NOT NULL,
	[Ngc_DatFim] [smalldatetime] NULL,
	[Ngc_FtrCh_] [decimal](18, 5) NULL,
	[Ngc_Crt] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atz_EspPdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_EspPdm](
	[Epd_IdEsp] [int] NULL,
	[Epd_IdPdm] [int] NULL,
	[Epd_Abl] [bit] NULL,
	[Epd_PS_] [bit] NULL,
	[Epd_Itn] [bit] NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspPdm', @level2type=N'COLUMN',@level2name=N'Epd_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspPdm', @level2type=N'COLUMN',@level2name=N'Epd_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica procedimento liberado para solicitação em ambulatório (eletivo) [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspPdm', @level2type=N'COLUMN',@level2name=N'Epd_Abl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica procedimento liberado para solicitação em pronto socorro (urgência) [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspPdm', @level2type=N'COLUMN',@level2name=N'Epd_PS_'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica procedimento liberado para solicitação em paciente internado [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspPdm', @level2type=N'COLUMN',@level2name=N'Epd_Itn'
GO
/****** Object:  Table [dbo].[Atz_Mun]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Mun](
	[IdMun] [smallint] IDENTITY(1,1) NOT NULL,
	[Mun_Cod] [varchar](7) NOT NULL,
	[Mun_Nme] [varchar](30) NOT NULL,
	[Mun_Est] [char](2) NOT NULL,
 CONSTRAINT [PK_Mnc] PRIMARY KEY NONCLUSTERED 
(
	[IdMun] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Mun', @level2type=N'COLUMN',@level2name=N'IdMun'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código IBGE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Mun', @level2type=N'COLUMN',@level2name=N'Mun_Cod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Mun', @level2type=N'COLUMN',@level2name=N'Mun_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Mun', @level2type=N'COLUMN',@level2name=N'Mun_Est'
GO
/****** Object:  Table [dbo].[Atz_Msg___]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Msg___](
	[IdMsg] [smallint] NOT NULL,
	[Msg_Dsc] [varchar](150) NOT NULL,
	[Msg_DscAtz] [varchar](150) NOT NULL,
	[Msg_Grp] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Mns] PRIMARY KEY NONCLUSTERED 
(
	[IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Msg___', @level2type=N'COLUMN',@level2name=N'IdMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Msg___', @level2type=N'COLUMN',@level2name=N'Msg_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição que será exibida no autorizador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Msg___', @level2type=N'COLUMN',@level2name=N'Msg_DscAtz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grupo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Msg___', @level2type=N'COLUMN',@level2name=N'Msg_Grp'
GO
/****** Object:  Table [dbo].[Atz_Grp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Grp](
	[IdGrp] [tinyint] IDENTITY(1,1) NOT NULL,
	[Grp_Dsc] [varchar](30) NULL,
	[Grp_QtdCh_] [int] NULL,
 CONSTRAINT [PK_Cla] PRIMARY KEY NONCLUSTERED 
(
	[IdGrp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Grp', @level2type=N'COLUMN',@level2name=N'IdGrp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Grp', @level2type=N'COLUMN',@level2name=N'Grp_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica a quantidade de CH máxima permitida para liberação automática do procedimento no grupo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Grp', @level2type=N'COLUMN',@level2name=N'Grp_QtdCh_'
GO
/****** Object:  Table [dbo].[Atz_Acm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Acm](
	[IdAcm] [tinyint] NOT NULL,
	[Acm_Dsc] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Acm] PRIMARY KEY NONCLUSTERED 
(
	[IdAcm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código  do tipo de acomodação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Acm', @level2type=N'COLUMN',@level2name=N'IdAcm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição do tipo de acomodação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Acm', @level2type=N'COLUMN',@level2name=N'Acm_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Sit]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Sit](
	[IdSit] [tinyint] NOT NULL,
	[Sit_Dsc] [varchar](20) NOT NULL,
	[Sit_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_Atz_Sit] PRIMARY KEY CLUSTERED 
(
	[IdSit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sit', @level2type=N'COLUMN',@level2name=N'IdSit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sit', @level2type=N'COLUMN',@level2name=N'Sit_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador [A-Autorizado|N-Negado|C-Cancelado]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sit', @level2type=N'COLUMN',@level2name=N'Sit_Ind'
GO
/****** Object:  Table [dbo].[Atz_Sai]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Sai](
	[IdSai] [tinyint] NOT NULL,
	[Sai_Dsc] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Tps] PRIMARY KEY NONCLUSTERED 
(
	[IdSai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sai', @level2type=N'COLUMN',@level2name=N'IdSai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sai', @level2type=N'COLUMN',@level2name=N'Sai_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Rgm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Rgm](
	[IdRgm] [tinyint] NOT NULL,
	[Rgm_Dsc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Rgm] PRIMARY KEY NONCLUSTERED 
(
	[IdRgm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Rgm', @level2type=N'COLUMN',@level2name=N'IdRgm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descirção' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Rgm', @level2type=N'COLUMN',@level2name=N'Rgm_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Rde]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Rde](
	[IdRde] [smallint] IDENTITY(1,1) NOT NULL,
	[Rde_Nme] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Atz_Rde] PRIMARY KEY CLUSTERED 
(
	[IdRde] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencilal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Rde', @level2type=N'COLUMN',@level2name=N'IdRde'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Rde', @level2type=N'COLUMN',@level2name=N'Rde_Nme'
GO
/****** Object:  Table [dbo].[FILME]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILME](
	[sNomeTPI] [nvarchar](255) NULL,
	[sCodigoSRV] [nvarchar](255) NULL,
	[sNomeSIS] [nvarchar](255) NULL,
	[nQuant] [float] NULL,
	[iAcrescAptoPriv] [float] NULL,
	[sTipoSIS] [nvarchar](255) NULL,
	[sPossuiAcrescAptoPriv] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eml_Grp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Eml_Grp](
	[IdGrp] [smallint] IDENTITY(1,1) NOT NULL,
	[Grp_Nme] [varchar](30) NOT NULL,
	[Grp_Obs] [varchar](100) NULL,
 CONSTRAINT [PK_Eml_Grp] PRIMARY KEY CLUSTERED 
(
	[IdGrp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Eml_Grp', @level2type=N'COLUMN',@level2name=N'IdGrp'
GO
/****** Object:  Table [dbo].[Sgn_Aca]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Aca](
	[IdAca] [tinyint] IDENTITY(1,1) NOT NULL,
	[Aca_Nme] [varchar](20) NOT NULL,
	[Aca_Cod] [char](3) NOT NULL,
 CONSTRAINT [PK_Sgn_Aca] PRIMARY KEY CLUSTERED 
(
	[IdAca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SERVICOS]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SERVICOS](
	[sNomeTAB] [nvarchar](255) NULL,
	[sNomeTPI] [nvarchar](255) NULL,
	[sCodigoSRV] [varchar](50) NULL,
	[cValor] [numeric](18, 2) NULL,
	[iControleTABD] [float] NULL,
	[sCodTabelaTiss] [nvarchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSC_RelacaoServicosConveniado]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSC_RelacaoServicosConveniado](
	[iControle] [int] NOT NULL,
	[sCodigoCNV] [varchar](10) NULL,
	[sCpfCgc] [varchar](19) NULL,
	[iCodigoRED] [int] NULL,
	[sNomeRede] [varchar](25) NULL,
	[iControleSRV] [int] NULL,
	[sNomeTPI] [varchar](10) NULL,
	[sCodigoSRV] [varchar](12) NULL,
	[sNomeSRV] [varchar](60) NULL,
	[sCondicao] [varchar](9) NULL,
	[cValor] [decimal](14, 2) NULL,
	[sExigeAUT] [varchar](3) NULL,
	[dCadastro] [datetime2](0) NOT NULL,
	[iCodigoESP] [int] NULL,
	[sCodigoCNVCC] [varchar](10) NULL,
	[iCodigoEDC] [int] NULL,
	[SeqEnd] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSC_RelacaoServicosConveniado', @level2type=N'COLUMN',@level2name=N'sCodigoCNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSC_RelacaoServicosConveniado', @level2type=N'COLUMN',@level2name=N'iCodigoESP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo corpo clinico - codigo do profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSC_RelacaoServicosConveniado', @level2type=N'COLUMN',@level2name=N'sCodigoCNVCC'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'codigo endereco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSC_RelacaoServicosConveniado', @level2type=N'COLUMN',@level2name=N'iCodigoEDC'
GO
/****** Object:  Table [dbo].[RECM_RectosMestre]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RECM_RectosMestre](
	[iCodigoREC] [int] NOT NULL,
	[sDocumento] [varchar](15) NULL,
	[dInclusao] [smalldatetime] NOT NULL,
	[sDescricao] [varchar](40) NULL,
	[sNumeroCNT] [varchar](10) NOT NULL,
	[iParcela] [int] NOT NULL,
	[iControleTIT] [int] NULL,
	[sNome] [varchar](70) NOT NULL,
	[sNomeLOC] [varchar](20) NOT NULL,
	[cValor] [decimal](14, 2) NOT NULL,
	[dVencto] [smalldatetime] NOT NULL,
	[cSaldo] [decimal](14, 2) NOT NULL,
	[iNumeroLFN_Geracao] [int] NULL,
	[iNumeroLFN_Remessa] [int] NULL,
	[iNumeroLFN_Retorno] [int] NULL,
	[iUltSequencia] [int] NOT NULL,
	[nIndiceAuxiliar] [float] NOT NULL,
	[sObservacao] [varchar](60) NULL,
	[mMSGRetorno] [text] NULL,
	[sFormaCobranca] [varchar](20) NOT NULL,
	[sRemeter] [varchar](3) NOT NULL,
	[mMSGNoBoleto] [text] NULL,
	[sNossoNumero] [varchar](20) NULL,
	[dPagamento] [smalldatetime] NULL,
	[dPeriodoCompetencia] [smalldatetime] NULL,
	[iNumeroLFN_Grafica] [int] NULL,
	[mInstrBoleto] [text] NULL,
	[cValorRefComissao] [decimal](14, 2) NOT NULL,
	[iNumeroLCM] [int] NULL,
	[dCadPagamento] [smalldatetime] NULL,
	[nISS_Perc] [decimal](10, 6) NOT NULL,
	[nISS_ValorBase] [decimal](14, 2) NOT NULL,
	[mNotaFiscal] [text] NULL,
	[sCobrarISS] [varchar](3) NOT NULL,
	[sReajusteAnual] [varchar](3) NOT NULL,
	[iNumeroLFN_Anistia] [int] NULL,
	[iCodigoREC_GerouAnistia] [int] NULL,
	[dDataAnistia] [smalldatetime] NULL,
	[sMarcaEspecial] [varchar](3) NOT NULL,
	[sCobrancaExtra] [varchar](3) NOT NULL,
	[sEmGeracao] [varchar](3) NOT NULL,
	[sParcelaPAD] [varchar](3) NOT NULL,
	[dVenctoOriginal] [smalldatetime] NOT NULL,
	[iQtdDiasCobrados] [int] NOT NULL,
	[iCodigoSBL] [int] NOT NULL,
	[dDataDesconto] [smalldatetime] NULL,
	[cValorDesconto] [decimal](14, 2) NULL,
	[dSegundaVia] [smalldatetime] NULL,
	[dEnvShopCash] [smalldatetime] NULL,
	[iControleLRC] [int] NULL,
	[sNumeroNotaFiscal] [varchar](20) NULL,
	[sUsuario] [varchar](20) NULL,
	[dDataEmissaoNota] [smalldatetime] NULL,
	[iControleCTR] [int] NULL,
	[iControleOCO] [int] NULL,
	[iControleLNFD] [int] NULL,
	[mMSGExtra] [text] NULL,
	[dContabil] [smalldatetime] NOT NULL,
	[dCancelamento] [smalldatetime] NULL,
	[dInicioCobertura] [smalldatetime] NULL,
	[iCodigoRECPerda] [int] NULL,
	[mPendenciaJudicial] [text] NULL,
	[sLancarISSBoleto] [varchar](3) NOT NULL,
	[sNossoNumeroCnv] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PUSR_ProdutosDosUsuarios]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUSR_ProdutosDosUsuarios](
	[sCodigoUSR] [varchar](16) NOT NULL,
	[sNomePRD] [varchar](20) NOT NULL,
	[iCodigoTBN] [int] NOT NULL,
	[dBaseCarencia] [smalldatetime] NOT NULL,
	[nFatorPreco] [float] NULL,
	[nDesconto] [decimal](5, 2) NOT NULL,
	[sCodigoVEN] [varchar](20) NOT NULL,
	[dInclusao] [smalldatetime] NOT NULL,
	[dExclusao] [smalldatetime] NULL,
	[nParcelaDescIni] [int] NOT NULL,
	[nParcelaDescFim] [int] NOT NULL,
	[sCodigoCMP] [varchar](8) NOT NULL,
	[cPrecoPRD] [decimal](14, 2) NOT NULL,
	[dBasePrecoPRD] [smalldatetime] NOT NULL,
	[sOperador] [varchar](15) NOT NULL,
	[dCadastro] [smalldatetime] NOT NULL,
	[cPrecoTabela] [decimal](14, 2) NULL,
	[cPrecoNovo] [decimal](14, 2) NULL,
	[nIndiceAuxiliar] [float] NULL,
	[iControleRDF] [int] NOT NULL,
	[sShopCashVEN] [varchar](20) NULL,
	[sInclusoPlanoFamilia] [varchar](3) NOT NULL,
	[iControleRFE] [int] NULL,
	[cValor_Desc] [smallmoney] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRDM_Produtos]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRDM_Produtos](
	[sNomePRD] [varchar](20) NOT NULL,
	[sTipoProduto] [varchar](9) NOT NULL,
	[sCodigoANS] [varchar](15) NULL,
	[mDescricao] [text] NULL,
	[dInclusao] [smalldatetime] NOT NULL,
	[dExclusao] [smalldatetime] NULL,
	[iLimiteFE1] [int] NOT NULL,
	[iLimiteFE2] [int] NOT NULL,
	[iLimiteFE3] [int] NOT NULL,
	[iLimiteFE4] [int] NOT NULL,
	[iLimiteFE5] [int] NOT NULL,
	[iLimiteFE6] [int] NOT NULL,
	[iLimiteFE7] [int] NOT NULL,
	[nPercentFE1] [decimal](7, 2) NOT NULL,
	[nPercentFE2] [decimal](7, 2) NOT NULL,
	[nPercentFE3] [decimal](7, 2) NOT NULL,
	[nPercentFE4] [decimal](7, 2) NOT NULL,
	[nPercentFE5] [decimal](7, 2) NOT NULL,
	[nPercentFE6] [decimal](7, 2) NOT NULL,
	[nPercentFE7] [decimal](7, 2) NOT NULL,
	[iCodigoTBN] [int] NOT NULL,
	[cPrecoBaseTitular] [decimal](14, 2) NOT NULL,
	[cPrecoBaseAdicional] [decimal](14, 2) NOT NULL,
	[cPrecoBaseAgregado] [decimal](14, 2) NOT NULL,
	[sTipoRede] [varchar](12) NULL,
	[nIndiceAuxiliar] [float] NULL,
	[nVarPercGAD] [decimal](7, 2) NOT NULL,
	[nVarPercIDC] [decimal](7, 2) NOT NULL,
	[sInternacao] [varchar](16) NOT NULL,
	[sCodigoCAR] [varchar](7) NULL,
	[iLimiteFE8] [int] NOT NULL,
	[iLimiteFE9] [int] NOT NULL,
	[iLimiteFE10] [int] NOT NULL,
	[nPercentFE8] [decimal](7, 2) NOT NULL,
	[nPercentFE9] [decimal](7, 2) NOT NULL,
	[nPercentFE10] [decimal](7, 2) NOT NULL,
	[sUsaChequeConsulta] [varchar](3) NOT NULL,
	[sRede] [varchar](15) NULL,
	[sNomeProduto] [varchar](60) NULL,
	[iCodigoRED] [int] NOT NULL,
	[sHospitalar] [varchar](3) NOT NULL,
	[sAmbulatorial] [varchar](3) NOT NULL,
	[sObstetricia] [varchar](3) NULL,
	[sAbrangenciaGeo] [varchar](2) NULL,
	[sCooparticipacao] [varchar](3) NULL,
	[iControlePRD] [int] NOT NULL,
	[sNomeGPRD] [varchar](20) NULL,
	[sTiposProdutosNaANS] [varchar](30) NULL,
	[iControleRFE] [int] NULL,
	[iControleRCP] [int] NULL,
	[iControleRDV] [int] NOT NULL,
	[sEnviarANS] [varchar](3) NOT NULL,
	[sEnviarSIB] [varchar](3) NULL,
	[sCodigoANSAntigo] [varchar](30) NULL,
	[sCategoria] [varchar](13) NULL,
	[iControleRFM] [int] NULL,
	[iControleOCO] [int] NULL,
	[sProdutoReferencia] [varchar](3) NULL,
	[sOdonto] [varchar](3) NULL,
	[cValorRepasse] [decimal](14, 2) NOT NULL,
	[sRemocao] [varchar](3) NULL,
	[iControlePTRM] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PLANILHA]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANILHA](
	[CÓDIGO] [float] NULL,
	[DESCRIÇÃO] [nvarchar](255) NULL,
	[CÓDIGO1] [float] NULL,
	[DESCRIÇÃO TISS] [nvarchar](255) NULL,
	[CÓD# CONSULTAS] [nvarchar](255) NULL,
	[CÓD CONSULTAS] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAN_MENSxGRUPO]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_MENSxGRUPO](
	[NEGATIVA] [float] NULL,
	[GRUPO QUE NÃO PODE LIBERAR] [nvarchar](255) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDM_02102009]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDM_02102009](
	[CÓDIGO] [nvarchar](255) NULL,
	[DESCRIÇÃO] [nvarchar](255) NULL,
	[APELIDO] [nvarchar](255) NULL,
	[SEXO] [nvarchar](255) NULL,
	[IDADEMINIMA] [float] NULL,
	[IDADEMAXIMA] [float] NULL,
	[QTD_MAX] [float] NULL,
	[QTD_DIA] [float] NULL,
	[QTD_MES] [float] NULL,
	[QTD_ANO] [float] NULL,
	[RETORNO] [float] NULL,
	[ALTACOMPLEXIDADE] [float] NULL,
	[ESPECIAL] [float] NULL,
	[EXIGE_PRF] [float] NULL,
	[URGENCIA] [float] NULL,
	[CH] [nvarchar](255) NULL,
	[cp] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_SolGia]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log_SolGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gpd_IdGia] [int] NULL,
	[Gpd_IdPdm] [int] NULL,
	[Gpd_IdSit] [tinyint] NULL,
	[Gpd_QtdSol] [tinyint] NULL,
	[Gpd_QtdAtz] [tinyint] NULL,
	[Gpd_DatRel] [smalldatetime] NULL,
	[Gpd_IdNgc] [int] NULL,
	[IdSol] [int] NULL,
	[Gpm_IdMsg] [varchar](200) NULL,
	[Gpd_Dat] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log_Sis]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Log_Sis](
	[IdSis] [int] IDENTITY(1,1) NOT NULL,
	[Sis_Log] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Log_Sis] PRIMARY KEY CLUSTERED 
(
	[IdSis] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log_NgcPrf]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_NgcPrf](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Log_Dat] [smalldatetime] NOT NULL,
	[Log_IdUsr] [int] NOT NULL,
	[IdNgc] [int] NOT NULL,
	[Ngc_Vlr] [numeric](18, 2) NULL,
	[Ngc_VlrFlm] [numeric](18, 4) NULL,
	[Ngc_FtrCh_] [numeric](18, 5) NULL,
 CONSTRAINT [PK_Log_NgcPrf] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_NgcCtt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_NgcCtt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Log_Dat] [smalldatetime] NOT NULL,
	[Log_IdUsr] [int] NOT NULL,
	[IdNgc] [int] NOT NULL,
	[Ngc_Vlr] [numeric](18, 2) NULL,
	[Ngc_VlrFlm] [numeric](18, 4) NULL,
	[Ngc_FtrCh_] [numeric](18, 5) NULL,
 CONSTRAINT [PK_Log_NgcCtt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_Itg]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Itg](
	[IdItg] [int] IDENTITY(1,1) NOT NULL,
	[Itg_Dat] [smalldatetime] NOT NULL,
	[Itg_Tip] [tinyint] NOT NULL,
	[Itg_Sts] [tinyint] NOT NULL,
 CONSTRAINT [PK_Int_Reg] PRIMARY KEY CLUSTERED 
(
	[IdItg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_Itg', @level2type=N'COLUMN',@level2name=N'IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da execução' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_Itg', @level2type=N'COLUMN',@level2name=N'Itg_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_Itg', @level2type=N'COLUMN',@level2name=N'Itg_Tip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_Itg', @level2type=N'COLUMN',@level2name=N'Itg_Sts'
GO
/****** Object:  Table [dbo].[Log_GiaDoc]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log_GiaDoc](
	[IdGid] [int] IDENTITY(1,1) NOT NULL,
	[Gid_IdGia] [int] NOT NULL,
	[Gid_TipDoc] [char](3) NOT NULL,
	[Gid_NumDoc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Log_GiaDoc] PRIMARY KEY CLUSTERED 
(
	[IdGid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fxUtl_SetHor]    Script Date: 12/18/2012 09:52:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 27/06/2009
-- Description:	Retorna uma hora ao passar a hora, minuto e segundo separados
-- =============================================================================
CREATE FUNCTION [dbo].[fxUtl_SetHor](@Hour INT, @Minute INT, @Second INT)
RETURNS DATETIME
AS
BEGIN
	RETURN DATEADD(ss,(@Hour*3600)+(@Minute*60)+@Second,0)
END
GO
/****** Object:  Table [dbo].[Atz_Tpp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpp](
	[IdTpp] [tinyint] IDENTITY(1,1) NOT NULL,
	[Tpp_Dsc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tpp] PRIMARY KEY NONCLUSTERED 
(
	[IdTpp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpp', @level2type=N'COLUMN',@level2name=N'IdTpp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpp', @level2type=N'COLUMN',@level2name=N'Tpp_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tpl]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpl](
	[IdTpl] [smallint] NOT NULL,
	[Tpl_Dsc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tpl] PRIMARY KEY NONCLUSTERED 
(
	[IdTpl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpl', @level2type=N'COLUMN',@level2name=N'IdTpl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpl', @level2type=N'COLUMN',@level2name=N'Tpl_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tpi]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpi](
	[IdTpi] [tinyint] NOT NULL,
	[Tpi_Dsc] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Tpi] PRIMARY KEY NONCLUSTERED 
(
	[IdTpi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpi', @level2type=N'COLUMN',@level2name=N'IdTpi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpi', @level2type=N'COLUMN',@level2name=N'Tpi_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tpd]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpd](
	[IdTpd] [tinyint] NOT NULL,
	[Tpd_Dsc] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Atz_Tpd] PRIMARY KEY CLUSTERED 
(
	[IdTpd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpd', @level2type=N'COLUMN',@level2name=N'IdTpd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpd', @level2type=N'COLUMN',@level2name=N'Tpd_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tpc]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpc](
	[IdTpc] [tinyint] NOT NULL,
	[Tpc_Dsc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tpc] PRIMARY KEY NONCLUSTERED 
(
	[IdTpc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpc', @level2type=N'COLUMN',@level2name=N'IdTpc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpc', @level2type=N'COLUMN',@level2name=N'Tpc_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tpa]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tpa](
	[IdTpa] [tinyint] NOT NULL,
	[Tpa_Dsc] [varchar](35) NOT NULL,
 CONSTRAINT [PK_Atz_Tpa] PRIMARY KEY CLUSTERED 
(
	[IdTpa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpa', @level2type=N'COLUMN',@level2name=N'IdTpa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tpa', @level2type=N'COLUMN',@level2name=N'Tpa_Dsc'
GO
/****** Object:  Table [dbo].[Atz_Tab]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Tab](
	[IdTab] [tinyint] NOT NULL,
	[Tab_Dsc] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Tab] PRIMARY KEY NONCLUSTERED 
(
	[IdTab] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tab', @level2type=N'COLUMN',@level2name=N'IdTab'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Tab', @level2type=N'COLUMN',@level2name=N'Tab_Dsc'
GO
/****** Object:  Table [dbo].[Dba_ErrorLog]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dba_ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[UserName] [sysname] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dba_ErrExe]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dba_ErrExe](
	[idgia] [int] NOT NULL,
	[idpdm] [int] NOT NULL,
	[idsit] [tinyint] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'DD', @value=N'Procedimentos executados indevidamente após correção de execução em duplicidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dba_ErrExe'
GO
/****** Object:  Table [dbo].[CNV_Conveniados]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CNV_Conveniados](
	[sCodigoCNV] [nvarchar](10) NULL,
	[sNomeCNV] [nvarchar](40) NULL,
	[sNomeTCN] [nvarchar](12) NULL,
	[sCpfCgc] [nvarchar](19) NULL,
	[dPrevistaExtincao] [datetime] NULL,
	[sInscrEstadual] [nvarchar](15) NULL,
	[dNascimento] [datetime] NULL,
	[sSujeitoINSS] [nvarchar](3) NULL,
	[sSujeitoIRRF] [nvarchar](3) NULL,
	[sEndereco] [nvarchar](50) NULL,
	[sBairro] [nvarchar](15) NULL,
	[sCep] [nvarchar](9) NULL,
	[sCidade] [nvarchar](15) NULL,
	[sEstado] [nvarchar](2) NULL,
	[sFones] [nvarchar](25) NULL,
	[sFax] [nvarchar](20) NULL,
	[sEMail] [nvarchar](40) NULL,
	[mObserv] [ntext] NULL,
	[sBanco] [nvarchar](3) NULL,
	[sAgencia] [nvarchar](5) NULL,
	[sConta] [nvarchar](12) NULL,
	[sSituacao] [nvarchar](7) NULL,
	[dSituacao] [datetime] NULL,
	[nIndiceAuxiliar] [float] NULL,
	[sInscricaoINSS] [nvarchar](11) NULL,
	[mSituacao] [ntext] NULL,
	[sOperador] [nvarchar](15) NULL,
	[sNomeTAB] [nvarchar](10) NULL,
	[sNomePIC] [nvarchar](10) NULL,
	[sPercSobreComplementos] [nvarchar](3) NULL,
	[sMatricula] [nvarchar](10) NULL,
	[sUFMatricula] [nvarchar](2) NULL,
	[sTipoMatricula] [nvarchar](10) NULL,
	[sCredenciado] [nvarchar](3) NULL,
	[iCodigoESPPadrao] [int] NULL,
	[sRelacao] [nvarchar](20) NULL,
	[sUtilizaESPCC] [nvarchar](3) NULL,
	[sNomeFantasia] [nvarchar](60) NULL,
	[sAssDigAuditor] [nvarchar](25) NULL,
	[sSenhaWEB] [nvarchar](25) NULL,
	[sDvAgencia] [nvarchar](1) NULL,
	[sDvConta] [nvarchar](1) NULL,
	[sDvAgenciaConta] [nvarchar](1) NULL,
	[sDvBanco] [nvarchar](1) NULL,
	[sNomeBanco] [nvarchar](50) NULL,
	[sLocalAgencia] [nvarchar](50) NULL,
	[iControleCNV] [int] NULL,
	[nPercINSS] [numeric](5, 2) NULL,
	[sSujeitoISS] [nvarchar](3) NULL,
	[nPercISS] [numeric](5, 2) NULL,
	[sPessoa] [nvarchar](8) NULL,
	[sPreferencial] [nvarchar](3) NULL,
	[sTipoAtendimento] [nvarchar](20) NULL,
	[sHoraAtendIni] [nvarchar](5) NULL,
	[sHoraAtendFim] [nvarchar](5) NULL,
	[sDiaPagtoPadrao] [nvarchar](2) NULL,
	[sCodigoCNVAntigo] [nvarchar](10) NULL,
	[sNumeroCartaoPoli] [nvarchar](8) NULL,
	[sDiretorTecnico] [nvarchar](60) NULL,
	[sCNES] [nvarchar](20) NULL,
	[sSolicitaAutorizacao] [nvarchar](3) NULL,
	[nPercCOFINS] [numeric](5, 2) NULL,
	[nPercPIS] [numeric](5, 2) NULL,
	[nPercCSLL] [numeric](5, 2) NULL,
	[nPercOUTROS] [numeric](5, 2) NULL,
	[sExibirNoGuiaMedico] [nvarchar](3) NULL,
	[sExibirNoSAC] [nvarchar](3) NULL,
	[sTipoDeEstabelecimento] [nvarchar](15) NULL,
	[sTipoContratacao] [nvarchar](8) NULL,
	[sClassificacaoDoEstabelecimento] [nvarchar](28) NULL,
	[sDisponibilidadeDosServicos] [nvarchar](7) NULL,
	[sAtendeUrgenciaEmergencia] [nvarchar](3) NULL,
	[sNumRegistroANSOperadoraInter] [nvarchar](10) NULL,
	[iControleRAP] [int] NULL,
	[sNumeroISS] [nvarchar](20) NULL,
	[mEmail] [ntext] NULL,
	[iDias_Pgmt_apos_protocolo] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CNT_Contratos]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CNT_Contratos](
	[sNumeroCNT] [varchar](10) NOT NULL,
	[sProposta] [varchar](10) NULL,
	[dDataContrato] [smalldatetime] NOT NULL,
	[dPrevistaExtincao] [smalldatetime] NULL,
	[sMotivoExtincao] [varchar](60) NULL,
	[dInterromperCobranca] [smalldatetime] NULL,
	[sANS] [varchar](3) NOT NULL,
	[sSituacao] [varchar](15) NOT NULL,
	[dSituacao] [smalldatetime] NOT NULL,
	[sTipoContrato] [varchar](11) NOT NULL,
	[sTipoCobranca] [varchar](10) NOT NULL,
	[iDiaVenctoPadrao] [int] NULL,
	[nQtdUsrInclusos] [int] NULL,
	[sNomePTC_Inclusos] [varchar](20) NOT NULL,
	[sNomePTC_Adicionais] [varchar](20) NOT NULL,
	[sNomePTC_Agregados] [varchar](20) NOT NULL,
	[sCpfCgcResp] [varchar](19) NULL,
	[sNomeResp] [varchar](70) NULL,
	[sInscrEstadual] [varchar](15) NULL,
	[sEndereco] [varchar](50) NULL,
	[sBairro] [varchar](30) NULL,
	[sCep] [varchar](9) NULL,
	[sCidade] [varchar](30) NULL,
	[sEstado] [varchar](2) NULL,
	[sFones] [varchar](25) NULL,
	[sFax] [varchar](20) NULL,
	[sEMail] [varchar](40) NULL,
	[sPrePagto] [varchar](3) NOT NULL,
	[sNomeTAB] [varchar](10) NULL,
	[sNomeTAD] [varchar](20) NULL,
	[nIndiceAuxiliar] [float] NULL,
	[mSituacao] [text] NULL,
	[sOperador] [varchar](15) NULL,
	[iUltimaParcela] [int] NOT NULL,
	[sReajustaTitular] [varchar](3) NOT NULL,
	[sReajustaAdicional] [varchar](3) NOT NULL,
	[sReajustaAgregado] [varchar](3) NOT NULL,
	[sBanco] [varchar](3) NULL,
	[sAgencia] [varchar](5) NULL,
	[sConta] [varchar](12) NULL,
	[sFormaCobranca] [varchar](20) NULL,
	[dVenctoUltimaParcela] [smalldatetime] NULL,
	[sNomeGCNT] [varchar](15) NOT NULL,
	[sComplemento] [varchar](40) NULL,
	[sPercapta] [varchar](3) NOT NULL,
	[mJuridico] [text] NULL,
	[sDvAgencia] [varchar](1) NULL,
	[sDvConta] [varchar](1) NULL,
	[sDvAgenciaConta] [varchar](1) NULL,
	[sDvBanco] [varchar](1) NULL,
	[nISS_Perc] [decimal](10, 6) NOT NULL,
	[sCobrarISS] [varchar](3) NOT NULL,
	[sNomeBanco] [varchar](50) NULL,
	[sLocalAgencia] [varchar](50) NULL,
	[sMotivoCancelamento] [varchar](2) NULL,
	[sTipoContratacao] [varchar](40) NULL,
	[dReferenciaReajusteAnual] [smalldatetime] NULL,
	[dReferenciaLancamentoPAD] [smalldatetime] NULL,
	[nPercDescontoNoCNT] [decimal](5, 2) NOT NULL,
	[iParcelaInicialDesconto] [int] NULL,
	[iParcelaFinalDesconto] [int] NULL,
	[mObserv] [text] NULL,
	[iCodigoTPM] [int] NULL,
	[iCodigoTDM] [int] NULL,
	[iControleCNT] [int] NOT NULL,
	[nPercReducaoCarencia] [decimal](5, 2) NOT NULL,
	[sCobraTaxaCadastro] [varchar](3) NOT NULL,
	[sPrefUSR] [varchar](6) NULL,
	[sUtilizaCodEmpresa] [varchar](3) NULL,
	[iControleUND] [int] NULL,
	[iControleRTA] [int] NOT NULL,
	[sDataRefReajuste] [varchar](8) NOT NULL,
	[sPrecoVendaTitulares] [varchar](65) NOT NULL,
	[sPrecoVendaDependentes] [varchar](65) NOT NULL,
	[sMigracao] [varchar](3) NULL,
	[sModificaVencto] [varchar](16) NOT NULL,
	[sNomeContato] [varchar](70) NULL,
	[dInclusao] [smalldatetime] NULL,
	[sTipoUsuario] [varchar](20) NOT NULL,
	[sTipoCodigoSIB] [varchar](20) NULL,
	[sNumeroCNT_Migrado] [varchar](15) NULL,
	[iControleCTR] [int] NULL,
	[sRazaoSocial] [varchar](70) NULL,
	[sNomeFantasia] [varchar](70) NULL,
	[sEnderecoCorrespondencia] [varchar](50) NULL,
	[sEstadoCorrespondencia] [varchar](2) NULL,
	[sCepCorrespondencia] [varchar](9) NULL,
	[sBairroCorrespondencia] [varchar](30) NULL,
	[sCidadeCorrespondencia] [varchar](30) NULL,
	[sComplementoCorrespondencia] [varchar](40) NULL,
	[sFonesCorrespondencia] [varchar](25) NULL,
	[sFaxCorrespondencia] [varchar](20) NULL,
	[sEMailCorrespondencia] [varchar](40) NULL,
	[sCodigoDebitoAutomatico] [varchar](25) NULL,
	[sNomeLOC_Padrao] [varchar](20) NULL,
	[sInscricaoMunicipal] [varchar](15) NULL,
	[iMesesComissionamento] [int] NULL,
	[iControleFADP] [int] NULL,
	[sCodigoCMP] [varchar](8) NULL,
	[sCodigoVEN] [varchar](20) NULL,
	[sCodigoUnidadeTerritorial] [varchar](7) NULL,
	[sDebitoConta] [varchar](25) NULL,
	[iControleRDF] [int] NULL,
	[iControleRCD] [int] NULL,
	[sCodigoCMPParaPRDAdicional] [varchar](8) NULL,
	[SCriticaCEP] [varchar](3) NULL,
	[sPISTitObrigatorio] [varchar](3) NULL,
	[sCNSTitObrigatorio] [varchar](3) NULL,
	[sObstetriciaTitObrigatorio] [varchar](3) NULL,
	[sTelefoneTitObrigatorio] [varchar](3) NULL,
	[sEmailTitObrigatorio] [varchar](3) NULL,
	[sNumeroPropostaTitObrigatorio] [varchar](3) NULL,
	[sCompraCarenciaTitObrigatorio] [varchar](3) NULL,
	[sCriticaCPF] [varchar](3) NULL,
	[sPISDepObrigatorio] [varchar](3) NULL,
	[sCNSDepObrigatorio] [varchar](3) NULL,
	[sObstetriciaDepObrigatorio] [varchar](3) NULL,
	[sNumeroPropostaDepObrigatorio] [varchar](3) NULL,
	[sCompraCarenciaDepObrigatorio] [varchar](3) NULL,
	[sCeiResp] [varchar](14) NULL,
	[sLancarISSBoleto] [varchar](3) NOT NULL,
	[sNumero] [varchar](10) NULL,
	[sNumeroCorrespondencia] [varchar](10) NULL,
	[sCorrespondencia] [varchar](11) NULL,
	[sCodigoUnidadeTerritorialComercial] [varchar](7) NULL,
	[sCodigoVENPosVenda] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CBO_PROCEDIMENTOS]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBO_PROCEDIMENTOS](
	[ID_T] [int] IDENTITY(1,1) NOT NULL,
	[ID] [float] NULL,
	[SNOMEESP] [nvarchar](255) NULL,
	[SCBOS] [nvarchar](255) NULL,
	[CODIGO] [nvarchar](255) NULL,
	[SNOMESRV] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cad_PdmOrt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cad_PdmOrt](
	[IdPdo] [int] IDENTITY(1,1) NOT NULL,
	[Pdo_IdOpe] [smallint] NOT NULL,
	[Pdo_IdPdm] [int] NOT NULL,
	[Pdo_Dsc] [varchar](900) NOT NULL,
	[Pdo_Htm] [varchar](1100) NOT NULL,
 CONSTRAINT [PK_Cad_PdmOrt] PRIMARY KEY CLUSTERED 
(
	[IdPdo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt', @level2type=N'COLUMN',@level2name=N'IdPdo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da operadora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt', @level2type=N'COLUMN',@level2name=N'Pdo_IdOpe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt', @level2type=N'COLUMN',@level2name=N'Pdo_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt', @level2type=N'COLUMN',@level2name=N'Pdo_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição no formato HTML' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt', @level2type=N'COLUMN',@level2name=N'Pdo_Htm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cadastro de orientações para auditoria de procedimentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_PdmOrt'
GO
/****** Object:  Table [dbo].[Cad_Ope]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Cad_Ope](
	[IdOpe] [smallint] IDENTITY(1,1) NOT NULL,
	[Ope_Nme] [varchar](30) NOT NULL,
	[Ope_RegAns] [int] NOT NULL,
	[Ope_Cnp] [varchar](14) NOT NULL,
	[Ope_DatIni] [smalldatetime] NOT NULL,
	[Ope_DatFim] [smalldatetime] NULL,
 CONSTRAINT [PK_Cad_Ope] PRIMARY KEY CLUSTERED 
(
	[IdOpe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial da operadora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope', @level2type=N'COLUMN',@level2name=N'IdOpe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome fantasia da operadora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope', @level2type=N'COLUMN',@level2name=N'Ope_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nº do registro da operadora na ANS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope', @level2type=N'COLUMN',@level2name=N'Ope_RegAns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de início da contratação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope', @level2type=N'COLUMN',@level2name=N'Ope_DatIni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de término da contratação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope', @level2type=N'COLUMN',@level2name=N'Ope_DatFim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cadastro de operadoras' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cad_Ope'
GO
/****** Object:  Table [dbo].[ELMAH_Error]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELMAH_Error](
	[ErrorId] [uniqueidentifier] NOT NULL,
	[Application] [nvarchar](60) NOT NULL,
	[Host] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Source] [nvarchar](60) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TimeUtc] [datetime] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[AllXml] [ntext] NOT NULL,
 CONSTRAINT [PK_ELMAH_Error] PRIMARY KEY NONCLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EDC_EnderecosDosConveniados]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDC_EnderecosDosConveniados](
	[iCodigoEDC] [int] NULL,
	[sEndereco] [nvarchar](60) NULL,
	[sComplemento] [nvarchar](60) NULL,
	[sBairro] [nvarchar](30) NULL,
	[sCidade] [nvarchar](30) NULL,
	[sEstado] [nvarchar](2) NULL,
	[sCep] [nvarchar](9) NULL,
	[sFones] [nvarchar](30) NULL,
	[sFax] [nvarchar](20) NULL,
	[sEMail] [ntext] NULL,
	[mObserv] [ntext] NULL,
	[nIndiceAuxiliar] [float] NULL,
	[sMacroRegiao] [nvarchar](20) NULL,
	[sNumero] [nvarchar](10) NULL,
	[nLatitude] [float] NULL,
	[nLongitude] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dba_TblSolExe]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dba_TblSolExe](
	[IdGiaCon] [int] NULL,
	[IdSol] [int] NULL,
	[IdBnf] [int] NULL,
	[IdPdm] [int] NULL,
	[Pdm_Cod] [varchar](20) NULL,
	[QtdSol] [tinyint] NULL,
	[QtdAtz] [tinyint] NULL,
	[QtdRel] [tinyint] NULL,
	[QtdExe] [tinyint] NULL,
	[Ok] [bit] NULL,
	[Sld] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'DD', @value=N'Correção de solicitações executadas sem a gravação das respectivas guias de SP/SADT. Backup do banco na máq. de teste' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dba_TblSolExe'
GO
/****** Object:  Table [dbo].[Dba_TblSol]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dba_TblSol](
	[Seq] [tinyint] NULL,
	[SpdIdSol] [int] NULL,
	[SolIdGia] [int] NULL,
	[SpdIdPdm] [int] NULL,
	[SpdIdSit] [tinyint] NULL,
	[SpdQtdSol] [tinyint] NULL,
	[SpdQtdAtz] [tinyint] NULL,
	[SpdQtdRel] [tinyint] NULL,
	[SolIdCtt] [bigint] NULL,
	[SolSeqEnd] [tinyint] NULL,
	[SolIdEsp] [smallint] NULL,
	[SolIdPrfSol] [int] NULL,
	[SolIdBnf] [int] NULL,
	[SolIdUsr] [int] NULL,
	[SolDatEms] [smalldatetime] NULL,
	[Qtd] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dba_TblSdt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dba_TblSdt](
	[Seq] [smallint] NULL,
	[GiaIdGiaPrc] [int] NULL,
	[GpdIdGia] [int] NULL,
	[GiaIdCtt] [bigint] NULL,
	[GiaSeqEnd] [tinyint] NULL,
	[GiaIdEsp] [smallint] NULL,
	[GiaIdBnf] [int] NULL,
	[GiaIdUsr] [int] NULL,
	[GiaCrt] [char](1) NULL,
	[GpdDat] [smalldatetime] NULL,
	[GiaIdTpa] [tinyint] NULL,
	[GiaIdSai] [tinyint] NULL,
	[GpdIdPdm] [int] NULL,
	[GpdQtdSol] [tinyint] NULL,
	[GpdQtdAtz] [tinyint] NULL,
	[SitInd] [char](1) NULL,
	[IdSit] [tinyint] NULL,
	[Qtd] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dba_TblConDia]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dba_TblConDia](
	[SEQ] [tinyint] NULL,
	[IDGIA] [int] NULL,
	[IDCTT] [bigint] NULL,
	[SEQEND] [tinyint] NULL,
	[IDPRF] [int] NULL,
	[IDESP] [smallint] NULL,
	[IDBNF] [int] NULL,
	[IDUSR] [int] NULL,
	[GIACRT] [char](1) NULL,
	[GIADATEMS] [smalldatetime] NULL,
	[DATATD] [smalldatetime] NULL,
	[IDPDM] [int] NULL,
	[IDSIT] [tinyint] NULL,
	[QTD] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'DD', @value=N'Mais de uma consulta por beneficiário no mesmo contratado local e dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Dba_TblConDia'
GO
/****** Object:  StoredProcedure [dbo].[dba_ReIndexDatabase_UpdateStats]    Script Date: 12/18/2012 09:51:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dba_ReIndexDatabase_UpdateStats]
AS
	DECLARE @MyTable VARCHAR(255)
	DECLARE myCursor
	CURSOR FOR
		SELECT table_name
		FROM information_schema.tables
		WHERE table_type = 'base table'
	OPEN myCursor
		FETCH NEXT
		FROM myCursor INTO @MyTable
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Reindexing Table:  ' + @MyTable
		DBCC DBREINDEX(@MyTable, '', 80)
		FETCH NEXT
		FROM myCursor INTO @MyTable
	END
	CLOSE myCursor
	DEALLOCATE myCursor
	EXEC sp_updatestats
GO
/****** Object:  StoredProcedure [dbo].[Dba_PrintError]    Script Date: 12/18/2012 09:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dba_PrintError] 
AS
BEGIN
    SET NOCOUNT ON;

    -- Print error information. 
    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +
          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +
          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 
          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 
          ', Line ' + CONVERT(varchar(5), ERROR_LINE());
    PRINT ERROR_MESSAGE();
END;
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcPrfIns]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 07/08/2009
-- Description:	Negociação Profissional - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcPrfIns]
	@TipAco CHAR(1), -- [S-Select|U-Update]
	@IdNgc INT = NULL,
	@Prf_Mtr NVARCHAR(500) = NULL,
	@IdCtt BIGINT = NULL,
	@SeqEnd TINYINT = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod NVARCHAR(600) = NULL,
	@Ngc_Uni CHAR(10) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_Vlr NUMERIC(18,2) = NULL,
	@Ngc_VlrFlm NUMERIC(18,4) = NULL,
	@Ngc_FtrCh_ NUMERIC(18,5) = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,
	@Out_TotNgc INT OUTPUT  
AS
	DECLARE @WHERE NVARCHAR(2000),
			@SQL NVARCHAR(2000)
	
	IF (@IdNgc IS NOT NULL OR @Prf_Mtr IS NOT NULL OR @IdCtt IS NOT NULL OR 
		@SeqEnd IS NOT NULL OR @IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL)
	BEGIN
		SET @WHERE = ''
		IF (@TipAco = 'S')
			SET @SQL = N' SELECT @Out_TotNgc = COUNT(*) '
		ELSE	
		BEGIN
			SET @SQL = N'
				INSERT	dbo.Atz_Ngc
					(Ngc_IdPel, Ngc_IdPdm, Ngc_Uni, Ngc_Vlr, Ngc_VlrFlm, Ngc_DatIni, Ngc_FtrCh_, Ngc_Crt, Ngc_IdUsrInc) '
					
			-- Quando o valor não é informado, ele é encontrado multiplicando o Fator CH pelo Quantidade de CH
			IF @Ngc_Vlr IS NULL			
				SET @SQL = @SQL +'SELECT IdPel, IdPdm, @Ngc_Uni, @Ngc_FtrCh_ * Pdm_QtdCh_, @Ngc_VlrFlm, @Ngc_DatIni, @Ngc_FtrCh_, @Ngc_Crt, @IdUsr '
			ELSE
				SET @SQL = @SQL +'SELECT IdPel, IdPdm, @Ngc_Uni, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_DatIni, @Ngc_FtrCh_, @Ngc_Crt, @IdUsr  '
		END	
		
		SET @SQL = @SQL + 
			'FROM	dbo.Atz_PrfEspLcr p, dbo.Atz_Lcr, dbo.Atz_Pdm t, dbo.vwlItg_CboPdm,
					dbo.Atz_Rde, dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Grp 
			WHERE	IdLcr = Pel_IdLcr
			AND		IdPrf = Pel_IdPrf
			AND		IdEsp = Pel_IdEsp
			AND		IdRde = Lcr_IdRde
			AND		IdGrp = Pdm_IdGrp 
			AND		Cbp_IdEsp = Esp_SisGst
			AND		Cbp_PdmCod = Pdm_Cod
			AND		Pdm_Atv = 1
			AND		IdPel NOT IN
				(
					SELECT	IdPel
					FROM	Atz_Ngc, Atz_PrfEspLcr p2, Atz_Pdm t2
					WHERE	IdPel = Ngc_IdPel
					AND		IdPdm = Ngc_IdPdm
					AND		Ngc_IdPel = p.IdPel 
					AND		t.IdPdm = t2.IdPdm
					AND		Ngc_Crt = @Ngc_Crt
					AND		Ngc_DatFim IS NULL
				) '
		
		IF @IdNgc IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdNgc = @IdNgc '
		IF @Prf_Mtr IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Prf_Mtr IN ('+ @Prf_Mtr +') '
		IF @IdCtt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
		IF @SeqEnd IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_SeqEnd = @SeqEnd '
		IF @IdRde IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '
		
		SET @SQL = @SQL + @WHERE	
		
		print @SQL
		
		IF (@TipAco = 'S')
		BEGIN
			EXEC SP_EXECUTESQL @SQL,
				N'@IdNgc INT, @IdCtt BIGINT, @SeqEnd TINYINT,
				@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_Crt CHAR(1),
				@Out_TotNgc INT OUTPUT',
				@IdNgc, @IdCtt, @SeqEnd, @IdEsp, @IdGrp, @Ngc_Crt,
				@Out_TotNgc OUTPUT
		END
		ELSE
		IF (@TipAco = 'U')
		BEGIN		
			EXEC SP_EXECUTESQL @SQL,
				N'@IdNgc INT, @IdCtt BIGINT, @SeqEnd TINYINT,
				@IdEsp SMALLINT, @IdGrp TINYINT, 
				@Ngc_DatIni SMALLDATETIME, @Ngc_Vlr NUMERIC(18,2),
				@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5),
				@Ngc_Uni CHAR(10), @Ngc_Crt CHAR(1), @IdUsr INT',
				@IdNgc, @IdCtt, @SeqEnd, @IdEsp, @IdGrp, 
				@Ngc_DatIni, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_,
				@Ngc_Uni, @Ngc_Crt, @IdUsr
			
			SET @Out_TotNgc = @@ROWCOUNT
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcPrfFim]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.07.30
-- Description:	Finaliza a negociação do contrataado e bloqueia o 
--				acesso dos usuários quando não existe mais negociação
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcPrfFim] 
	@TipAco CHAR(1), -- [S-Select|U-Update],
	@IdNgc INT = NULL,
	@IdCtt BIGINT = NULL,
	@SeqEnd NVARCHAR(100) = NULL,
	@Prf_Mtr NVARCHAR(500) = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod VARCHAR(20) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,
	@Out_TotNgc INT OUTPUT,
	@Out_Err BIT OUTPUT
AS
BEGIN
	DECLARE @WHERE NVARCHAR(2000),
			@SQL NVARCHAR(2000),
			@Pel_IdPrf INT
			
	SET @Out_TotNgc = 0
	
	SET @WHERE = ''
	IF (@TipAco = 'S')
		SET @SQL = N' SELECT @Out_TotNgc = COUNT(*) '
	ELSE
		SET @SQL = N' 
			UPDATE dbo.Atz_Ngc 
			SET		Ngc_DatFim = @Ngc_DatFim,
					Ngc_IdUsrExc = @IdUsr '
	

	SET @SQL = @SQL + N' 
		FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Pdm, 
				dbo.Atz_Rde, dbo.Atz_Esp, dbo.Atz_Grp, dbo.Atz_Prf 
		WHERE	IdPel = Ngc_IdPel
		AND		IdLcr = Pel_IdLcr
		AND		IdEsp = Pel_IdEsp
		AND		IdPrf = Pel_IdPrf
		AND		IdPdm = Ngc_IdPdm
		AND		IdRde = Lcr_IdRde
		AND		IdGrp = Pdm_IdGrp
		AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > @Ngc_DatFim) '
		
	IF @IdNgc IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdNgc = @IdNgc '
	IF @Prf_Mtr IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Prf_Mtr IN ('+ @Prf_Mtr +') '
	IF @IdCtt IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
	IF @SeqEnd IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Lcr_SeqEnd IN ('+ @SeqEnd +') '
	IF @IdRde IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
	IF @IdEsp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
	IF @IdGrp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
	IF @Pdm_Cod IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Pdm_Cod IN('+ @Pdm_Cod +') '
	IF @Ngc_DatIni IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Ngc_DatIni >= @Ngc_DatIni '
	IF @Ngc_Crt IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Ngc_Crt = @Ngc_Crt '
	
	SET @SQL = @SQL + @WHERE
	
	IF (@TipAco = 'S')
	BEGIN 	
		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, 
			@Ngc_DatIni SMALLDATETIME, @Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1), @Out_TotNgc INT OUTPUT',
			@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt, @Out_TotNgc OUTPUT	
	END
	ELSE	
	IF (@TipAco = 'U')
	BEGIN
		--BEGIN TRAN
		
		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, 
			@Ngc_DatIni SMALLDATETIME,  @Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1), @IdUsr INT ',
			@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt, @IdUsr
			
		SET @Out_TotNgc = @@ROWCOUNT
		
		IF @@ERROR <> 0 
		BEGIN
			GOTO FIM_ERRO
		END
	
		/*
		IF (@Prf_Mtr IS NOT NULL) AND NOT EXISTS
			(	-- Verifica se existe alguma negociação ativa para o profissional ...
				SELECT	*
				FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Prf
				WHERE	IdPel = Ngc_IdPel
				AND		IdPrf = Pel_IdPrf
				AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > GETDATE())
				AND		Prf_Mtr = @Prf_Mtr
			)
		BEGIN
			-- ... se não existir bloqueia o acesso do usuário do profissional
			UPDATE	aspnet_Membership
			SET		IsApproved = 0
			FROM	dbo.Atz_Prf, dbo.Sgn_Usr, dbo.aspnet_Users u, 
					dbo.aspnet_Membership m
			WHERE	IdUsr = Prf_IdUsr
			AND		u.UserId = Usr_UserId
			AND		u.UserId = m.UserId
			AND		Prf_Mtr = @Prf_Mtr
			
			IF @@ERROR <> 0 GOTO FIM_ERRO
		END
		ELSE 
		IF (@IdCtt IS NOT NULL)
		BEGIN
			DECLARE CURSOR_PRF --Nome do cursor

			CURSOR FOR
				SELECT	DISTINCT Pel_IdPrf
				FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr
				WHERE	IdLcr = Pel_IdLcr
				AND		Lcr_IdCtt = @IdCtt

			OPEN CURSOR_PRF 
			FETCH NEXT FROM CURSOR_PRF INTO @Pel_IdPrf
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS 
					(	
						SELECT	*
						FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr
						WHERE	IdPel = Ngc_IdPel
						AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > GETDATE())
						AND		Pel_IdPrf = @Pel_IdPrf
					)
					UPDATE	aspnet_Membership
					SET		IsApproved = 0
					FROM	dbo.Atz_Prf, dbo.Sgn_Usr, dbo.aspnet_Users u, 
							dbo.aspnet_Membership m
					WHERE	IdUsr = Prf_IdUsr
					AND		u.UserId = Usr_UserId
					AND		u.UserId = m.UserId
					AND		IdPrf = @Pel_IdPrf
					
					IF @@ERROR <> 0 
					BEGIN
						CLOSE CURSOR_PRF
						DEALLOCATE CURSOR_PRF
						GOTO FIM_ERRO
					END

				FETCH NEXT FROM CURSOR_PRF INTO @Prf_Mtr
			END

			CLOSE CURSOR_PRF
			DEALLOCATE CURSOR_PRF 						
			
		END
		ELSE 
		IF (@IdCtt IS NOT NULL AND @SeqEnd IS NOT NULL)
		BEGIN
			DECLARE CURSOR_PRF --Nome do cursor

			CURSOR FOR
				SELECT	DISTINCT Pel_IdPrf
				FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr
				WHERE	IdLcr = Pel_IdLcr
				AND		Lcr_IdCtt = @IdCtt
				AND		Lcr_SeqEnd = @SeqEnd

			OPEN CURSOR_PRF 
			FETCH NEXT FROM CURSOR_PRF INTO @Pel_IdPrf
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS 
					(	
						SELECT	*
						FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr
						WHERE	IdPel = Ngc_IdPel
						AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > GETDATE())
						AND		Pel_IdPrf = @Pel_IdPrf
					)
					UPDATE	aspnet_Membership
					SET		IsApproved = 0
					FROM	dbo.Atz_Prf, dbo.Sgn_Usr, dbo.aspnet_Users u, 
							dbo.aspnet_Membership m
					WHERE	IdUsr = Prf_IdUsr
					AND		u.UserId = Usr_UserId
					AND		u.UserId = m.UserId
					AND		IdPrf = @Pel_IdPrf
					
					IF @@ERROR <> 0 
					BEGIN
						CLOSE CURSOR_PRF
						DEALLOCATE CURSOR_PRF
						GOTO FIM_ERRO
					END

				FETCH NEXT FROM CURSOR_PRF INTO @Prf_Mtr
			END

			CLOSE CURSOR_PRF
			DEALLOCATE CURSOR_PRF 						
			
		END
		*/
		
		--COMMIT TRAN
		SET @Out_Err = 0
		RETURN

		FIM_ERRO:
			--ROLLBACK TRAN
			SET @Out_Err = 1
			RETURN
	END
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcPrf]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 20/06/2009
-- Description:	Negociação Profissional - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcPrf]
	@TipAco CHAR(1), -- [S-Select|U-Update] 
	@IdNgc INT = NULL,
	@Prf_Mtr NVARCHAR(500) = NULL,
	@IdCtt BIGINT = NULL,
	@SeqEnd TINYINT = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod NVARCHAR(600) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Vlr NUMERIC(18,2) = NULL,
	@Ngc_VlrFlm NUMERIC(18,4) = NULL,
	@Ngc_FtrCh_ NUMERIC(18,5) = NULL,
	@Ngc_Uni CHAR(10) = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,
	@Out_TotNgc INT OUTPUT 
AS
	DECLARE @set NVARCHAR(200),
			@where NVARCHAR(2000),
			@sql NVARCHAR(2000),
			@sqllog NVARCHAR(2000)
	
	IF (@IdNgc IS NOT NULL OR @Prf_Mtr IS NOT NULL OR @IdCtt IS NOT NULL OR 
		@SeqEnd IS NOT NULL OR @IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL OR @Ngc_DatFim IS NOT NULL OR @Ngc_Crt IS NOT NULL)
	BEGIN
		SET @WHERE = ''
		
		IF (@TipAco = 'S')
			SET @sql = N' SELECT @Out_TotNgc = COUNT(*) '
		ELSE
		BEGIN
			IF @Ngc_Vlr IS NOT NULL
				SET @set = ' Ngc_Vlr = @Ngc_Vlr, Ngc_FtrCh_ = NULL, '
			ELSE
				SET @set = ' Ngc_FtrCh_ = @Ngc_FtrCh_, Ngc_Vlr = @Ngc_FtrCh_ * Pdm_QtdCh_, '
			
			SET @set = @set + ' Ngc_VlrFlm = @Ngc_VlrFlm, Ngc_Uni = @Ngc_Uni '
			
			SET @sql = N' UPDATE dbo.Atz_Ngc
				SET '+ @set	
				
			SET @sqllog = 
				N'INSERT Log_NgcPrf
					(Log_Dat, Log_IdUsr, IdNgc, Ngc_Vlr, Ngc_VlrFlm, Ngc_FtrCh_) 
					SELECT 
						GETDATE(), @IdUsr, IdNgc, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_
					FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Pdm, 
							dbo.Atz_Rde, dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Grp 
					WHERE	IdPel = Ngc_IdPel
					AND		IdLcr = Pel_IdLcr
					AND		IdPrf = Pel_IdPrf
					AND		IdEsp = Pel_IdEsp
					AND		IdPdm = Ngc_IdPdm
					AND		IdRde = Lcr_IdRde
					AND		IdGrp = Pdm_IdGrp  '
		END	

		SET @sql = @sql +
			N'FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Pdm, 
					dbo.Atz_Rde, dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Grp 
			WHERE	IdPel = Ngc_IdPel
			AND		IdLcr = Pel_IdLcr
			AND		IdPrf = Pel_IdPrf
			AND		IdEsp = Pel_IdEsp
			AND		IdPdm = Ngc_IdPdm
			AND		IdRde = Lcr_IdRde
			AND		IdGrp = Pdm_IdGrp '
		
		IF @IdNgc IS NOT NULL 
			SET @where = @where + N'AND IdNgc = @IdNgc '
		IF @Prf_Mtr IS NOT NULL 
			SET @where = @where + N'AND Prf_Mtr IN ('+ @Prf_Mtr +') '
		IF @IdCtt IS NOT NULL 
			SET @where = @where + N'AND Lcr_IdCtt = @IdCtt '
		IF @SeqEnd IS NOT NULL 
			SET @where = @where + N'AND Lcr_SeqEnd = @SeqEnd '
		IF @IdRde IS NOT NULL 
			SET @where = @where + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @where = @where + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @where = @where + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @where = @where + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '
		IF @Ngc_DatIni IS NOT NULL 
			SET @where = @where + N'AND Ngc_DatIni >= @Ngc_DatIni '
		IF @Ngc_DatFim IS NOT NULL 
			SET @WHERE = @where + N'AND Ngc_DatFim <= @Ngc_DatFim '
		IF @Ngc_Crt IS NOT NULL 
			SET @where = @where + N'AND Ngc_Crt = @Ngc_Crt '
		
		SET @sql = @sql + @where
		
		SET @sqllog = @sqllog + @where
		
		IF (@TipAco = 'S')
		BEGIN
			EXEC SP_EXECUTESQL @sql,
				N'@IdNgc INT, @IdCtt BIGINT, @SeqEnd TINYINT,
				@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, 
				@Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1), @Out_TotNgc INT OUTPUT',
				@IdNgc, @IdCtt, @SeqEnd, @IdEsp, @IdGrp, 
				@Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt, @Out_TotNgc  OUTPUT
		END
		ELSE
		IF (@TipAco = 'U')
		BEGIN

			EXEC SP_EXECUTESQL @sql,
				N'@IdNgc INT, @IdCtt BIGINT, @SeqEnd TINYINT,
				@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, 
				@Ngc_DatFim SMALLDATETIME, @Ngc_Vlr NUMERIC(18,2),
				@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5), @Ngc_Uni CHAR(10), @Ngc_Crt CHAR(1)',
				@IdNgc, @IdCtt, @SeqEnd, @IdEsp, @IdGrp, 
				@Ngc_DatIni, @Ngc_DatFim, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_, @Ngc_Uni, @Ngc_Crt
		
			SET @Out_TotNgc = @@ROWCOUNT
			
			IF @IdUsr IS NOT NULL
				EXEC SP_EXECUTESQL @sqllog,
					N'@IdNgc INT, @IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_Vlr NUMERIC(18,2),
					@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5), @Ngc_Crt CHAR(1), @IdUsr INT',
					@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_, @Ngc_Crt, @IdUsr
		END
		
	END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcCttIns]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 07/08/2009
-- Description:	Negociação Contratado - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcCttIns]
	@TipAco CHAR(1), -- [S-Select|U-Update]
	@IdCtt BIGINT = NULL,
	@Cte_SeqEnd NVARCHAR(100) = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod VARCHAR(20) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_Vlr NUMERIC(18,2) = NULL,
	@Ngc_VlrFlm NUMERIC(18,4) = NULL,
	@Ngc_FtrCh_ NUMERIC(18,5) = NULL,
	@Ngc_Uni CHAR(10) = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,
	@Out_TotNgc INT OUTPUT 
AS
	DECLARE @WHERE NVARCHAR(2000),
			@SQL NVARCHAR(2000)
	
	IF (@IdCtt IS NOT NULL OR @Cte_SeqEnd IS NOT NULL OR 
		@IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL)
	BEGIN
		SET @Out_TotNgc = 0
		
		SET @WHERE = ''
		IF (@TipAco = 'S')
			SET @SQL = N' SELECT @Out_TotNgc = COUNT(*) '
		ELSE
		BEGIN
			SET @SQL = N'
				INSERT	dbo.Atz_Ngc
					(Ngc_IdLce, Ngc_IdPdm, Ngc_Vlr, Ngc_VlrFlm, Ngc_DatIni, Ngc_FtrCh_, Ngc_Uni, Ngc_Crt, Ngc_IdUsrInc) '		
			-- Quando o valor não é informado, ele é encontrado multiplicando o Fator CH pelo Quantidade de CH
			IF @Ngc_Vlr IS NULL			
				SET @SQL = @SQL +'SELECT IdLce, IdPdm, @Ngc_FtrCh_ * Pdm_QtdCh_, @Ngc_VlrFlm, @Ngc_DatIni, @Ngc_FtrCh_, @Ngc_Uni, @Ngc_Crt, @IdUsr '
			ELSE
				SET @SQL = @SQL +'SELECT IdLce, IdPdm, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_DatIni, @Ngc_FtrCh_, @Ngc_Uni, @Ngc_Crt, @IdUsr '
		END	
		
		SET @SQL = @SQL +			
			'FROM	dbo.Atz_LcrEsp l, dbo.Atz_Esp, dbo.vwlItg_CboPdm, dbo.Atz_Pdm p, 
					dbo.Atz_Lcr, dbo.Atz_Rde, dbo.Atz_Grp
			WHERE	IdEsp = Lce_IdEsp
			AND		IdLcr = Lce_IdLcr
			AND		IdGrp = Pdm_IdGrp
			AND		IdRde = Lcr_IdRde
			AND		Cbp_IdEsp = Esp_SisGst
			AND		Cbp_PdmCod = Pdm_Cod 
			AND		Pdm_Atv = 1
			AND		IdLce NOT IN
					(
						SELECT	IdLce
						FROM	dbo.Atz_Ngc, Atz_LcrEsp l2, Atz_Pdm p2
						WHERE	IdLce = Ngc_IdLce
						AND		IdPdm = Ngc_IdPdm
						AND		Ngc_IdLce = l2.IdLce
						AND		p.IdPdm = p2.IdPdm
						AND		Ngc_Crt = @Ngc_Crt
						AND		Ngc_DatFim IS NULL
					) '
		
		IF @IdCtt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
		IF @Cte_SeqEnd IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_SeqEnd IN ('+ @Cte_SeqEnd +') '
		IF @IdRde IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '
		
		SET @SQL = @SQL + @WHERE
		
		IF (@TipAco = 'S')
		BEGIN
			EXEC SP_EXECUTESQL @SQL,
					N'@IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, 
					@Ngc_Crt CHAR(1), @Out_TotNgc INT OUTPUT',
					@IdCtt, @IdEsp, @IdGrp, 
					@Ngc_Crt, @Out_TotNgc OUTPUT	
		END
		ELSE
		BEGIN
			EXEC SP_EXECUTESQL @SQL,
				N'@IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, 
				@Ngc_DatIni SMALLDATETIME, @Ngc_Vlr NUMERIC(18,2),
				@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5), 
				@Ngc_Uni CHAR(10), @Ngc_Crt CHAR(1), @IdUsr INT',
				@IdCtt, @IdEsp, @IdGrp, 
				@Ngc_DatIni, @Ngc_Vlr, 
				@Ngc_VlrFlm, @Ngc_FtrCh_, 
				@Ngc_Uni, @Ngc_Crt, @IdUsr
			
			SET @Out_TotNgc = @@ROWCOUNT
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcCtt]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 20/06/2009
-- Description:	Negociação Contratado - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcCtt]
	@TipAco CHAR(1), -- [S-Select|U-Update] 
	@IdNgc INT = NULL,
	@IdCtt BIGINT = NULL,
	@SeqEnd NVARCHAR(100) = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod NVARCHAR(600) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Vlr NUMERIC(18,2) = NULL,
	@Ngc_VlrFlm NUMERIC(18,4) = NULL,
	@Ngc_FtrCh_ NUMERIC(18,5) = NULL,
	@Ngc_Uni CHAR(10) = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,
	@Out_TotNgc INT OUTPUT
AS
	DECLARE @set NVARCHAR(200),
			@where NVARCHAR(2000),
			@sql NVARCHAR(2000),
			@sqllog NVARCHAR(2000)
	
	IF (@IdNgc IS NOT NULL OR @IdCtt IS NOT NULL OR 
		@SeqEnd IS NOT NULL OR @IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL OR @Ngc_DatFim IS NOT NULL OR @Ngc_Crt IS NOT NULL)
	BEGIN
		SET @where = ''
		
		IF (@TipAco = 'S')
			SET @sql = N' SELECT @Out_TotNgc = COUNT(*) '
		ELSE
		BEGIN
			IF @Ngc_Vlr IS NOT NULL
				SET @set = ' Ngc_Vlr = @Ngc_Vlr, Ngc_FtrCh_ = NULL, '
			ELSE
				SET @set = ' Ngc_FtrCh_ = @Ngc_FtrCh_, Ngc_Vlr = @Ngc_FtrCh_ * Pdm_QtdCh_, '
			
			SET @set = @set + ' Ngc_VlrFlm = @Ngc_VlrFlm, Ngc_Uni = @Ngc_Uni '
			
			SET @sql = N' UPDATE dbo.Atz_Ngc
				SET '+ @set
				
			SET @sqllog = 
				N'INSERT Log_NgcCtt
					(Log_Dat, Log_IdUsr, IdNgc, Ngc_Vlr, Ngc_VlrFlm, Ngc_FtrCh_) 
					SELECT 
						GETDATE(), @IdUsr, IdNgc, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_
					FROM
						dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Pdm, 
						dbo.Atz_Rde, dbo.Atz_Esp, dbo.Atz_Grp 
					WHERE	IdLce = Ngc_IdLce
					AND		IdLcr = Lce_IdLcr
					AND		IdEsp = Lce_IdEsp
					AND		IdPdm = Ngc_IdPdm
					AND		IdRde = Lcr_IdRde
					AND		IdGrp = Pdm_IdGrp '
		END

		SET @sql = @sql +
		 N' FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Pdm, 
					dbo.Atz_Rde, dbo.Atz_Esp, dbo.Atz_Grp 
			WHERE	IdLce = Ngc_IdLce
			AND		IdLcr = Lce_IdLcr
			AND		IdEsp = Lce_IdEsp
			AND		IdPdm = Ngc_IdPdm
			AND		IdRde = Lcr_IdRde
			AND		IdGrp = Pdm_IdGrp '
		
		IF @IdNgc IS NOT NULL 
			SET @where = @where + N'AND IdNgc = @IdNgc '
		IF @IdCtt IS NOT NULL 
			SET @where = @where + N'AND Lcr_IdCtt = @IdCtt '
		IF @SeqEnd IS NOT NULL 
			SET @where = @where + N'AND Lcr_SeqEnd IN ('+ @SeqEnd +') '
		IF @IdRde IS NOT NULL 
			SET @where = @where + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @where = @where + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @where = @where + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @where = @where + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '
		IF @Ngc_DatIni IS NOT NULL 
			SET @where = @where + N'AND Ngc_DatIni >= @Ngc_DatIni '
		IF @Ngc_DatFim IS NOT NULL 
			SET @where = @where + N'AND Ngc_DatFim <= @Ngc_DatFim '
		IF @Ngc_Crt IS NOT NULL 
			SET @where = @where + N'AND Ngc_Crt = @Ngc_Crt '
		
		SET @sql = @sql + @where

		SET @sqllog = @sqllog + @where

		IF (@TipAco = 'S')
		BEGIN
			EXEC SP_EXECUTESQL @sql,
				N'@IdNgc INT, @IdCtt BIGINT, 
				@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, 
				@Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1), @Out_TotNgc INT OUTPUT',
				@IdNgc, @IdCtt, @IdEsp, @IdGrp,	@Ngc_DatIni, 
				@Ngc_DatFim, @Ngc_Crt, @Out_TotNgc OUTPUT
		END
		ELSE
		IF (@TipAco = 'U')
		BEGIN
			EXEC SP_EXECUTESQL @sql,
				N'@IdNgc INT, @IdCtt BIGINT, 
				@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, 
				@Ngc_DatFim SMALLDATETIME, @Ngc_Vlr NUMERIC(18,2),
				@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5), @Ngc_Uni CHAR(10), @Ngc_Crt CHAR(1)',
				@IdNgc, @IdCtt, @IdEsp, @IdGrp,	@Ngc_DatIni, 
				@Ngc_DatFim, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_, @Ngc_Uni, @Ngc_Crt
			
			SET @Out_TotNgc = @@ROWCOUNT
			
			IF @IdUsr IS NOT NULL
				EXEC SP_EXECUTESQL @sqllog,
					N'@IdNgc INT, @IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_Vlr NUMERIC(18,2),
					@Ngc_VlrFlm NUMERIC(18,4), @Ngc_FtrCh_ NUMERIC(18,5), @Ngc_Crt CHAR(1), @IdUsr INT',
					@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_Vlr, @Ngc_VlrFlm, @Ngc_FtrCh_, @Ngc_Crt, @IdUsr
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaPdmMsg]    Script Date: 12/18/2012 09:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 20/11/2008
-- Description:	Guia Procedimento Mensagem - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_GiaPdmMsg]

@IdGia INT,
@IdPdm INT,
@IdMsg VARCHAR(200)

AS

	DECLARE @SQL NVARCHAR(2000)

	SET @SQL = N'INSERT dbo.Atz_GiaPdmMsg
				(Gpm_IdGia, Gpm_IdPdm, Gpm_IdMsg)
				SELECT	@IdGia, @IdPdm, IdMsg
				FROM	dbo.Atz_Msg
				WHERE	IdMsg IN ('+@IdMsg+')'

	EXEC SP_EXECUTESQL @SQL, N'@IdGia INT, @IdPdm INT', @IdGia, @IdPdm
GO
/****** Object:  Table [dbo].[VCE_VinculoConveniadoEndereco]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VCE_VinculoConveniadoEndereco](
	[sCodigoCNV] [varchar](10) NOT NULL,
	[iCodigoEDC] [int] NOT NULL,
	[sEndPadraoCNV] [varchar](3) NOT NULL,
	[sExibirNoGuiaMedico] [varchar](3) NOT NULL,
	[iSeqEndCNV] [int] NOT NULL,
	[sExibirNoSAC] [varchar](3) NOT NULL,
	[sOperador] [varchar](15) NULL,
	[dInclusao] [datetime2](0) NULL,
	[dExclusao] [datetime2](0) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USR_Usuarios]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USR_Usuarios](
	[iControleTIT] [int] NOT NULL,
	[iSequenciaUSR] [int] NOT NULL,
	[sControleUSR] [varchar](9) NOT NULL,
	[sCodigoUSR] [varchar](16) NOT NULL,
	[sNomeUSR] [varchar](70) NOT NULL,
	[sCpfUSR] [varchar](14) NULL,
	[sTipoUsuario] [varchar](9) NOT NULL,
	[sParentesco] [varchar](15) NULL,
	[sSexo] [varchar](9) NOT NULL,
	[sEstadoCivil] [varchar](10) NOT NULL,
	[dNascimento] [smalldatetime] NOT NULL,
	[dMatricula] [smalldatetime] NOT NULL,
	[iCodigoCAR] [int] NULL,
	[mObserv] [text] NULL,
	[dExclusao] [smalldatetime] NULL,
	[sUsuario] [varchar](3) NOT NULL,
	[nIndiceAuxiliar] [float] NULL,
	[sTipoCAR] [varchar](11) NOT NULL,
	[mTextoCAR] [text] NULL,
	[iUltNumeroCAR] [int] NOT NULL,
	[sNomeMae] [varchar](70) NULL,
	[sPIS] [varchar](20) NULL,
	[sCNS] [varchar](20) NULL,
	[sShopCashUSR] [varchar](8) NULL,
	[dEnvShopCash] [smalldatetime] NULL,
	[dAltShopCash] [smalldatetime] NULL,
	[dInclusao] [smalldatetime] NOT NULL,
	[sNaoGeraComissao] [varchar](3) NOT NULL,
	[sDigVerificador] [varchar](1) NULL,
	[dDataBaseCPT] [smalldatetime] NOT NULL,
	[sMotivoCancelamento] [varchar](2) NULL,
	[iControleUSR] [int] NOT NULL,
	[dPreExistencia] [smalldatetime] NULL,
	[sCodigoUSR_Migrado] [varchar](20) NULL,
	[iControleCTR] [int] NULL,
	[sTipoSanguineo] [varchar](5) NULL,
	[sGraudeEscolaridade] [varchar](30) NULL,
	[sBiometria] [varchar](3) NULL,
	[iPrimeiraParcelaDoUSR] [int] NULL,
	[sCodigoNaEmpresa] [varchar](20) NULL,
	[sCCO_Saude] [varchar](10) NOT NULL,
	[sCCOdv_Saude] [varchar](2) NOT NULL,
	[sCCO_Odonto] [varchar](10) NOT NULL,
	[sCCOdv_Odonto] [varchar](2) NOT NULL,
	[sContactarAOperadora] [varchar](3) NOT NULL,
	[sUtilizaBiometria] [varchar](3) NOT NULL,
	[sIdentidade] [varchar](15) NULL,
	[iCodigoMKV] [int] NULL,
	[sCodigoDN] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TUSS_ANS]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUSS_ANS](
	[THM_1990] [float] NULL,
	[THM_1992] [float] NULL,
	[LPM_1996] [float] NULL,
	[LPM_1999] [float] NULL,
	[CBHPM_3ed] [float] NULL,
	[CBHPM_4ed] [float] NULL,
	[CBHPM_5ed] [float] NULL,
	[Cod_TUSS] [float] NULL,
	[Desc_TUSS] [nvarchar](255) NULL,
	[Utilizado] [float] NULL,
	[CodTUSS] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUSS]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUSS](
	[IdPdm] [int] NULL,
	[Pdm_Cod_AMB] [nvarchar](255) NULL,
	[Pdm_Cod] [nvarchar](255) NULL,
	[Pdm_Dsc] [nvarchar](255) NULL,
	[cod_TUSS] [nvarchar](255) NULL,
	[dsc_TUSS] [nvarchar](255) NULL,
	[atz_qtd] [int] NULL,
	[ngc_qtd] [int] NULL,
	[utilizado] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIT_Titulares]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TIT_Titulares](
	[iControleTIT] [int] NOT NULL,
	[sNomeTIT] [varchar](70) NOT NULL,
	[sNumeroCNT] [varchar](10) NOT NULL,
	[sCodigoUSR] [varchar](16) NOT NULL,
	[sEndereco] [varchar](50) NULL,
	[sBairro] [varchar](30) NULL,
	[sCep] [varchar](9) NULL,
	[sCidade] [varchar](30) NULL,
	[sEstado] [varchar](2) NULL,
	[sFones] [varchar](25) NULL,
	[sFax] [varchar](20) NULL,
	[sEMail] [varchar](40) NULL,
	[sCodigoNaEmpresa] [varchar](20) NULL,
	[sUsuario] [varchar](3) NOT NULL,
	[sCpfTIT] [varchar](14) NULL,
	[sSexo] [varchar](9) NOT NULL,
	[sEstadoCivil] [varchar](10) NOT NULL,
	[dNascimento] [smalldatetime] NOT NULL,
	[dMatricula] [smalldatetime] NOT NULL,
	[iCodigoCAR] [int] NULL,
	[mObserv] [text] NULL,
	[dExclusao] [smalldatetime] NULL,
	[nIndiceAuxiliar] [float] NULL,
	[sTipoCAR] [varchar](11) NOT NULL,
	[mTextoCAR] [text] NULL,
	[sBanco] [varchar](3) NULL,
	[sAgencia] [varchar](5) NULL,
	[sConta] [varchar](12) NULL,
	[iDiaVenctoPadrao] [int] NULL,
	[sFormaCobranca] [varchar](20) NULL,
	[dVenctoUltimaParcela] [smalldatetime] NULL,
	[iUltimaParcela] [int] NOT NULL,
	[sProposta] [varchar](10) NULL,
	[sComplemento] [varchar](40) NULL,
	[cPrecoTabelaFamilia] [decimal](14, 2) NULL,
	[cPrecoFamilia] [decimal](14, 2) NULL,
	[sDvAgencia] [varchar](1) NULL,
	[sDvConta] [varchar](1) NULL,
	[sDvAgenciaConta] [varchar](1) NULL,
	[sDvBanco] [varchar](1) NULL,
	[sNomeBanco] [varchar](50) NULL,
	[sLocalAgencia] [varchar](50) NULL,
	[sMotivoCancelamento] [varchar](2) NULL,
	[sNomeMae] [varchar](70) NULL,
	[sPIS] [varchar](20) NULL,
	[sCNS] [varchar](20) NULL,
	[iCodigoTPM] [int] NULL,
	[iCodigoTDM] [int] NULL,
	[dInclusao] [smalldatetime] NOT NULL,
	[sDigVerificador] [varchar](1) NULL,
	[sImprimeMOVBoleto] [varchar](3) NULL,
	[dDataBaseCPT] [smalldatetime] NOT NULL,
	[dPreExistencia] [smalldatetime] NULL,
	[sCodigoUSR_Migrado] [varchar](20) NULL,
	[iControleCTR] [int] NULL,
	[sTipoSanguineo] [varchar](5) NULL,
	[sGraudeEscolaridade] [varchar](30) NULL,
	[sEnderecoCorrespondencia] [varchar](50) NULL,
	[sEstadoCorrespondencia] [varchar](2) NULL,
	[sCepCorrespondencia] [varchar](9) NULL,
	[sBairroCorrespondencia] [varchar](30) NULL,
	[sCidadeCorrespondencia] [varchar](30) NULL,
	[sComplementoCorrespondencia] [varchar](40) NULL,
	[sFonesCorrespondencia] [varchar](25) NULL,
	[sFaxCorrespondencia] [varchar](20) NULL,
	[sEMailCorrespondencia] [varchar](40) NULL,
	[sBiometria] [varchar](3) NULL,
	[sCodigoDebitoAutomatico] [varchar](25) NULL,
	[sNomeLOC_Padrao] [varchar](20) NULL,
	[dDataAdmissao] [smalldatetime] NULL,
	[iPrimeiraParcelaDoUSR] [int] NULL,
	[sDebitoConta] [varchar](25) NULL,
	[sCodigoUnidadeTerritorial] [varchar](7) NULL,
	[sCCO_Saude] [varchar](10) NOT NULL,
	[sCCOdv_Saude] [varchar](2) NOT NULL,
	[sCCO_Odonto] [varchar](10) NOT NULL,
	[sCCOdv_Odonto] [varchar](2) NOT NULL,
	[sContactarAOperadora] [varchar](3) NOT NULL,
	[sUtilizaBiometria] [varchar](3) NOT NULL,
	[sTitularParaANS] [varchar](16) NULL,
	[sIdentidade] [varchar](15) NULL,
	[iCodigoMKV] [int] NULL,
	[sNumero] [varchar](10) NULL,
	[sNumeroCorrespondencia] [varchar](10) NULL,
	[sCorrespondencia] [varchar](11) NULL,
	[sCodigoUnidadeTerritorialComercial] [varchar](7) NULL,
	[sCodigoDN] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBNM_TabelaBeneficios]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBNM_TabelaBeneficios](
	[iCodigoTBN] [int] NOT NULL,
	[sNomeTBN] [varchar](40) NOT NULL,
	[sItensNaoRelac] [varchar](25) NOT NULL,
	[nIndiceAuxiliar] [float] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBNE_TabelaBeneficios_Excessoes]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBNE_TabelaBeneficios_Excessoes](
	[iCodigoTBN] [int] NOT NULL,
	[sNomeTPI] [varchar](10) NOT NULL,
	[sCodigoSRV] [varchar](12) NOT NULL,
	[sTipoTBN] [varchar](8) NOT NULL,
	[iPrazo] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBND_TabelaBeneficios_Grupos]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBND_TabelaBeneficios_Grupos](
	[iCodigoTBN] [int] NOT NULL,
	[sNomeGBN] [varchar](20) NOT NULL,
	[sTipoTBN] [varchar](8) NOT NULL,
	[iPrazo] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAB_PADRAO]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAB_PADRAO](
	[sNomeTAB] [nvarchar](255) NULL,
	[sNomeTPI] [nvarchar](255) NULL,
	[sCodigoSRV] [nvarchar](255) NULL,
	[cValor] [float] NULL,
	[iControleTABD] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[stAtz_SolPdmMsg]    Script Date: 12/18/2012 09:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 27/11/2008
-- Description:	Solcitação Procedimento Mensagem - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_SolPdmMsg]

@IdSol INT,
@IdPdm INT,
@IdMsg VARCHAR(200)

AS

	DECLARE @SQL NVARCHAR(2000)

	SET @SQL = N'INSERT dbo.Atz_SolPdmMsg
				(Spm_IdSol, Spm_IdPdm, Spm_IdMsg)
				SELECT	@IdSol, @IdPdm, IdMsg
				FROM	dbo.Atz_Msg
				WHERE	IdMsg IN ('+@IdMsg+')'

	EXEC SP_EXECUTESQL @SQL, N'@IdSol INT, @IdPdm INT', @IdSol, @IdPdm
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_PdmMsg]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 19/11/2008
-- Description:	Pesquisa Mensagens de Negativas
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_PdmMsg]

@IdMsg VARCHAR(200)

AS
	DECLARE @SQL NVARCHAR(1000)

	SET @SQL = N'SELECT LTRIM(STR(IdMsg)) +''-''+ Msg_DscAtz AS Msg_DscAtz '+
		'FROM	dbo.Atz_Msg '+
		'WHERE	IdMsg IN ('+ @IdMsg +') '+
		'ORDER BY 1'

	EXEC sp_executesql @SQL
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Rde]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author	  : Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Rede
-- Alter date : 2909/2008
-- Author	  :	Rubens Jr
-- Description: Adicionado parâmetros @Lcr_IdCtt
--				e @Lcr_Seq para selecionar so-
--				mente as redes que não pertencem
--				ao contratado local.
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Rde] 
@IdRde  SMALLINT = NULL,
@Rde_Nme VARCHAR(30) = NULL,
@Lcr_IdCtt BIGINT = NULL,
@Lcr_SeqEnd TINYINT = NULL

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdRde IS NOT NULL OR  @Rde_Nme IS NOT NULL OR @Lcr_IdCtt IS NOT NULL OR @Lcr_SeqEnd IS NOT NULL
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT [IdRde]
      ,[Rde_Nme]
  FROM [dbo].[Atz_Rde]
WHERE 1 = 1 '

IF @IdRde IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdRde = @IdRde '

IF @Rde_Nme IS NOT NULL               
   SET @WHERE = @WHERE + N'AND Rde_Nme LIKE  ''%'' + @Rde_Nme + ''%'' '   

IF @Lcr_IdCtt IS NOT NULL AND @Lcr_SeqEnd IS NOT NULL
	SET @WHERE = @WHERE + N'AND IdRde NOT IN (SELECT Lcr_IdRde FROM Atz_Lcr WHERE (Lcr_IdCtt = @Lcr_IdCtt) AND (Lcr_SeqEnd = @Lcr_SeqEnd)) '   

SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '

--print @SQL

--PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@IdRde SMALLINT, @Rde_Nme VARCHAR(30), @Lcr_IdCtt BIGINT, @Lcr_SeqEnd TINYINT',
@IdRde, @Rde_Nme, @Lcr_IdCtt, @Lcr_SeqEnd

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_PrfLcr]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 26/09/2008
-- Description:	Pesquisa Local Rede do Profissional
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_PrfLcr] 
@IdPrf      BIGINT = NULL, 
@IdLcr		INT	= NULL
AS

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdPrf IS NOT NULL OR @IdLcr IS NOT NULL  
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT 
		IdPrf,
		Pel_IdLcr, 
		Prf_Nme		
FROM dbo.Atz_Prf, dbo.Atz_PrfEspLcr
WHERE IdPrf = Pel_IdPrf '


IF @IdPrf IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdPrf = @IdPrf '

IF @IdLcr IS NOT NULL
   SET @WHERE = @WHERE + N'AND Pel_IdLcr = @IdLcr '

SET @SQL = @SQL + @WHERE + N' ORDER BY Prf_Nme '


--PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@IdPrf BIGINT, @IdLcr INT ',
@IdPrf, @IdLcr

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_PrfEspLcr]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Profissional Contratado Rede Especialidade
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_PrfEspLcr] 

@Prf_Nme VARCHAR(70) = NULL,
@IdPrf BIGINT = NULL, 
@Prf_Mtr VARCHAR(20) = NULL, 
@Prf_Cpf CHAR(11) = NULL, 
@Prf_NumCns VARCHAR(15) = NULL,
@IdCtt BIGINT = null 

AS

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/

IF @Prf_Nme IS NOT NULL OR  @IdPrf IS NOT NULL OR @Prf_Mtr IS NOT NULL OR @Prf_Cpf IS NOT NULL OR  @Prf_NumCns IS NOT NULL  or @IdCtt is not null
BEGIN  

SET @WHERE = ''
SET @SQL = N'
	SELECT  IdPel,
			IdLcr,
			IdPrf,
			IdEsp,
			Lcr_IdCtt AS IdCtt,
			Esp_Dsc,
			Rde_Nme,
			Prf_Nme,
			Ctt_Nme,
			Cte_SeqEnd,
			Lgr_Nme
	FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Rde, dbo.Atz_Prf, 
			dbo.Atz_CttEnd, dbo.Atz_Ctt, dbo.Atz_Lgr, dbo.Atz_Esp
	WHERE	IdLcr = Pel_IdLcr
	AND		IdRde = Lcr_IdRde
	AND		IdPrf = Pel_IdPrf
	AND		IdCtt = Cte_IdCtt
	AND		IdLgr = Cte_IdLgr
	AND		IdEsp = Pel_IdEsp
	AND		Lcr_IdCtt = Cte_IdCtt
	AND		Lcr_SeqEnd = Cte_SeqEnd
	AND		1 = 1 '


IF @IdPrf IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdPrf = @IdPrf '

IF @Prf_Mtr IS NOT NULL                   
   SET @WHERE = @WHERE + N'AND Prf_Mtr LIKE  ''%'' + @Prf_Mtr + ''%'' '

IF @IdCtt IS NOT NULL 
   SET @WHERE = @WHERE + N'AND lcr_IdCtt = @IdCtt '

IF @Prf_Nme IS NOT NULL
   SET @WHERE = @WHERE + N'AND Prf_Nme LIKE  ''%'' + @Prf_Nme + ''%'''   

IF @Prf_Cpf IS NOT NULL
   SET @WHERE = @WHERE + N'AND Prf_Cpf  = @Prf_Cpf ' 

IF @Prf_NumCns IS NOT NULL
   SET @WHERE = @WHERE + N'AND Prf_NumCns  = @Prf_NumCns ' 


SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '



--PRINT @SQL

EXEC SP_EXECUTESQL @SQL,
N'@Prf_Nme VARCHAR(70), @IdPrf BIGINT, @Prf_Mtr VARCHAR(20), @Prf_Cpf VARCHAR(11),@Prf_NumCns VARCHAR(15),@IdCtt BIGINT',
@Prf_Nme, @IdPrf, @Prf_Mtr, @Prf_Cpf, @Prf_NumCns, @IdCtt


END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Prf]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Wesley PS
-- Create date: 26/08/2008
-- Description:	Pesquisa Profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Prf] 
	@IdPrf      INT = NULL,
	@Prf_Mtr	VARCHAR(20) = NULL, 
	@Prf_Nme    VARCHAR(70) = NULL, 
	@Prf_NumCns VARCHAR(15) = NULL,      
	@Prf_Cpf    CHAR(14) = NULL,
	@IdCtt		BIGINT = NULL,
	@SeqEnd		TINYINT = NULL,
	@IdUsr		INT = NULL
AS
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)
	
	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
	IF	@IdPrf IS NOT NULL OR @Prf_Mtr IS NOT NULL OR @Prf_Nme IS NOT NULL OR @Prf_NumCns IS NOT NULL OR 
		@Prf_Cpf IS NOT NULL OR @IdCtt IS NOT NULL OR @SeqEnd IS NOT NULL OR @IdUsr IS NOT NULL
	BEGIN 
		SET @WHERE = ''
		SET @SQL = N'
			SELECT 	IdPrf,
					Cns_Nme,
					Prf_Mtr,
					Prf_Nme,
					Prf_NmeRsm,
					Prf_NumCns,
					Prf_EstCns,
					Prf_Cpf,
					Prf_Tel,
					Prf_Tel2,
					Prf_Fax,
					Prf_Eml,
					CASE WHEN Prf_Sit = ''I'' THEN ''INATIVO''
						 WHEN Prf_Sit = ''A'' THEN ''ATIVO''
					END AS Prf_Sit
			FROM	dbo.Atz_Prf
			INNER JOIN Atz_Cns ON (Prf_IdCns = IdCns)
			WHERE 0=0 '
		IF @IdPrf IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdPrf = @IdPrf '
		IF @Prf_Mtr IS NOT NULL                   
			SET @WHERE = @WHERE + N'AND Prf_Mtr LIKE  ''%'' + @Prf_Mtr + ''%'' '
		IF @Prf_Nme IS NOT NULL                   
			SET @WHERE = @WHERE + N'AND Prf_Nme LIKE  ''%'' + @Prf_Nme + ''%'' or Prf_NmeRsm like ''%'' + @Prf_Nme + ''%'' '
		IF @Prf_NumCns IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_NumCns = @Prf_NumCns '
		IF @Prf_Cpf IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Cpf = @Prf_Cpf '
		IF @IdCtt IS NOT NULL
			SET @WHERE = @WHERE + N'AND IdPrf IN (
				SELECT Pel_IdPrf 
				FROM dbo.Atz_PrfEspLcr, dbo.Atz_Lcr
				WHERE IdLcr = Pel_IdLcr
				AND Lcr_IdCtt = @IdCtt) '
		IF @SeqEnd IS NOT NULL
			SET @WHERE = @WHERE + N'AND IdPrf IN (
				SELECT Pel_IdPrf 
				FROM dbo.Atz_PrfEspLcr, dbo.Atz_Lcr
				WHERE IdLcr = Pel_IdLcr
				AND Lcr_IdCtt = @IdCtt
				AND	Lcr_SeqEnd = @SeqEnd ) '
		IF @IdUsr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_IdUsr = @IdUsr '
		SET @SQL = @SQL + @WHERE + N' ORDER BY Prf_Nme '

		--PRINT @SQL
		EXEC SP_EXECUTESQL @SQL,
			N'@IdPrf BIGINT, @Prf_Mtr VARCHAR(20), @Prf_Nme VARCHAR(70), @Prf_NumCns VARCHAR(15),
				@Prf_Cpf CHAR(14), @IdCtt BIGINT, @SeqEnd TINYINT, @IdUsr INT ',
			@IdPrf, @Prf_Mtr, @Prf_Nme, @Prf_NumCns, @Prf_Cpf, @IdCtt, @SeqEnd, @IdUsr
	END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_NgcPrf]    Script Date: 12/18/2012 09:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- ALTER  date: 09/06/2009
-- Description:	Pesquisa Negociação - Profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_NgcPrf] 
	@IdNgc INT = NULL,
	@Prf_Mtr NVARCHAR(500) = NULL,
	@IdCtt BIGINT = NULL,
	@Cte_SeqEnd TINYINT = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod NVARCHAR(600) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Crt CHAR(1) = NULL
AS
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)
	
	IF (@IdNgc IS NOT NULL OR @Prf_Mtr IS NOT NULL OR @IdCtt IS NOT NULL OR 
		@Cte_SeqEnd IS NOT NULL OR @IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL OR @Ngc_DatFim IS NOT NULL OR @Ngc_Crt IS NOT NULL)
	BEGIN
		SET @SQL = N'
			SELECT	TOP 1000 IdNgc, Lcr_IdCtt, Lcr_SeqEnd, Rde_Nme, Prf_Mtr, 
					Esp_Dsc, Pdm_Cod, Grp_Dsc, Ngc_DatIni, Ngc_DatFim, 
					Ngc_Vlr, Ngc_FtrCh_, Pdm_QtdCh_, Ngc_Crt, Pdm_QtdFlm, Ngc_VlrFlm,			
					CONVERT(NUMERIC(18,2),(Ngc_Vlr + ISNULL(Ngc_VlrFlm,0) * ISNULL(Pdm_QtdFlm,0))) AS Ngc_VlrTot
			FROM	dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Pdm, 
					dbo.Atz_Rde, dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Grp '
					
		SET @WHERE = N'					
			WHERE	IdPel = Ngc_IdPel
			AND		IdLcr = Pel_IdLcr
			AND		IdPrf = Pel_IdPrf
			AND		IdEsp = Pel_IdEsp
			AND		IdPdm = Ngc_IdPdm
			AND		IdRde = Lcr_IdRde
			AND		IdGrp = Pdm_IdGrp '
		
		IF @IdNgc IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdNgc = @IdNgc '
		IF @Prf_Mtr IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Prf_Mtr IN ('+ @Prf_Mtr +') '
		IF @IdCtt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
		IF @Cte_SeqEnd IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_SeqEnd = @Cte_SeqEnd '
		IF @IdRde IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '		
		IF (@Ngc_DatIni IS NOT NULL)
			SET @WHERE = @WHERE + N'AND Ngc_DatIni >= @Ngc_DatIni '
		IF @Ngc_DatFim IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Ngc_DatFim <= @Ngc_DatFim '
		IF @Ngc_Crt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Ngc_Crt = @Ngc_Crt '
			
		SET @SQL = @SQL + @WHERE + N' ORDER BY IdNgc '	

		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, @Cte_SeqEnd TINYINT, 
			@IdEsp SMALLINT, @IdGrp TINYINT, 
			@Ngc_DatIni SMALLDATETIME, @Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1)',
			@IdNgc, @IdCtt, @Cte_SeqEnd, @IdEsp, @IdGrp,	
			@Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt	
	END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_NgcCtt]    Script Date: 12/18/2012 09:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 09/06/2009
-- Description:	Pesquisa Negociação - Profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_NgcCtt]
	@IdNgc INT = NULL,
	@IdCtt BIGINT = NULL,
	@Cte_SeqEnd NVARCHAR(100) = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod NVARCHAR(600) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Crt CHAR(1) = NULL
AS  
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)
	
	IF (@IdNgc IS NOT NULL OR @IdCtt IS NOT NULL OR 
		@Cte_SeqEnd IS NOT NULL OR @IdRde IS NOT NULL OR @IdEsp IS NOT NULL OR 
		@IdGrp IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Ngc_DatIni IS NOT NULL OR @Ngc_DatFim IS NOT NULL OR @Ngc_Crt IS NOT NULL)
	BEGIN
		SET @SQL = N'
			SELECT	TOP 1000 IdNgc, Lcr_IdCtt, Lcr_SeqEnd, Rde_Nme, 
					Esp_Dsc, Pdm_Cod, Grp_Dsc, Ngc_DatIni, Ngc_DatFim,
					Ngc_Vlr, Ngc_FtrCh_, Pdm_QtdCh_, Ngc_Crt, Ngc_VlrFlm, Pdm_QtdFlm,
					CONVERT(NUMERIC(18,2),(Ngc_Vlr + ISNULL(Ngc_VlrFlm,0) * ISNULL(Pdm_QtdFlm,0))) AS Ngc_VlrTot
			FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Pdm, 
					dbo.Atz_Rde, dbo.Atz_Esp, dbo.Atz_Grp '

		SET @WHERE = N'					
			WHERE	IdLce = Ngc_IdLce
			AND		IdLcr = Lce_IdLcr
			AND		IdEsp = Lce_IdEsp
			AND		IdPdm = Ngc_IdPdm
			AND		IdRde = Lcr_IdRde
			AND		IdGrp = Pdm_IdGrp '
		
		IF @IdNgc IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdNgc = @IdNgc '
		IF @IdCtt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
		IF @Cte_SeqEnd IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Lcr_SeqEnd IN ('+ @Cte_SeqEnd +') '
		IF @IdRde IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
		IF @IdGrp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
		IF @Pdm_Cod IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '		
		IF (@Ngc_DatIni IS NOT NULL)
			SET @WHERE = @WHERE + N'AND Ngc_DatIni >= @Ngc_DatIni '
		IF @Ngc_DatFim IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Ngc_DatFim <= @Ngc_DatFim '
		IF @Ngc_Crt IS NOT NULL 
			SET @WHERE = @WHERE + N'AND Ngc_Crt = @Ngc_Crt '
			
		SET @SQL = @SQL + @WHERE + N' ORDER BY IdNgc '	

		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, @IdEsp SMALLINT, @IdGrp TINYINT, 
			@Ngc_DatIni SMALLDATETIME, @Ngc_DatFim SMALLDATETIME, @Ngc_Crt CHAR(1)',
			@IdNgc, @IdCtt, @IdEsp, @IdGrp,	
			@Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt	
	END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Atr]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Pesquisa Atributos de Páginas
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_Atr] 
@IdAtr  SMALLINT = NULL,
@Atr_IdPag  SMALLINT = NULL,
@Atr_Dsc VARCHAR(30) = NULL

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdAtr IS NOT NULL OR  @Atr_Dsc IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT [IdAtr]
		  ,[Atr_Dsc]
	  FROM [dbo].[Sgn_Atr]
	WHERE 1 = 1 '

	IF @IdAtr IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND IdAtr = @IdAtr '
	IF @Atr_IdPag IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND Atr_IdPag = @Atr_IdPag '
	IF @Atr_Dsc IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Atr_Dsc LIKE  ''%'' + @Atr_Dsc + ''%'' '   

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdAtr SMALLINT, @Atr_Dsc VARCHAR(30)',
	@IdAtr, @Atr_Dsc

END
GO
/****** Object:  StoredProcedure [dbo].[ssFat_Fch]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssFat_Fch] 
	@IdOpe  SMALLINT = 1,
	@IdCtt BIGINT = NULL,
	@IdTpd TINYINT = NULL,
	@FchCpc VARCHAR(6) = NULL
AS
	IF (@IdCtt IS NOT NULL OR @IdTpd IS NOT NULL OR @FchCpc IS NOT NULL)
	BEGIN
		DECLARE @WHERE NVARCHAR(2000)
		DECLARE @SQL NVARCHAR(2000)

		SET @WHERE = ''
		SET @SQL = N'
			SELECT	IdFch, 
					IdCtt,
					Ctt_Nme,
					SUBSTRING(LTRIM(STR(Fch_Cpc)),1,4) + SUBSTRING(LTRIM(STR(Fch_Cpc)),5,2) AS Fch_Cpc,
					Fch_DatIni,
					Fch_DatFim,
					Fch_Ent
			FROM dbo.Fat_Fch, dbo.Atz_Ctt
			WHERE IdCtt = Fch_IdCtt '

		IF @IdOpe IS NOT NULL 
		   SET @WHERE = @WHERE + N'AND Fch_IdOpe = @IdOpe '

		IF @IdCtt IS NOT NULL               
		   SET @WHERE = @WHERE + N'AND Fch_IdCtt = @IdCtt '   

		IF @IdTpd IS NOT NULL
			SET @WHERE = @WHERE + N'AND Ctt_IdTpd = @IdTpd '
			
		IF @FchCpc IS NOT NULL               
		   SET @WHERE = @WHERE + N'AND Fch_Cpc = @FchCpc '
		
		IF @FchCpc IS NOT NULL
			SET @SQL = '
				SELECT	IdFch, 
						Fch_IdCtt AS IdCtt ,
						NULL AS Ctt_Nme,
						SUBSTRING(LTRIM(STR(Fch_Cpc)),1,4) + SUBSTRING(LTRIM(STR(Fch_Cpc)),5,2) AS Fch_Cpc,
						Fch_DatIni,
						Fch_DatFim,
						Fch_Ent
				FROM dbo.Fat_Fch 
				WHERE Fch_IdCtt IS NULL
				AND Fch_Cpc = @FchCpc
				UNION ALL '+
				@SQL +
				@WHERE + 
				N' ORDER BY Fch_DatIni DESC '	
		ELSE	
			SET @SQL = '
				SELECT	IdFch, 
						Fch_IdCtt AS IdCtt ,
						NULL AS Ctt_Nme,
						SUBSTRING(LTRIM(STR(Fch_Cpc)),1,4) + SUBSTRING(LTRIM(STR(Fch_Cpc)),5,2) AS Fch_Cpc,
						Fch_DatIni,
						Fch_DatFim,
						Fch_Ent
				FROM dbo.Fat_Fch 
				WHERE Fch_IdCtt IS NULL
				UNION ALL '+
				@SQL +
				@WHERE + 
				N' ORDER BY Fch_DatIni DESC '

		EXEC SP_EXECUTESQL 
			@SQL,
			N'@IdOpe SMALLINT, @IdCtt BIGINT, @IdTpd TINYINT, @FchCpc VARCHAR(6)',
			@IdOpe, @IdCtt, @IdTpd, @FchCpc
	END
GO
/****** Object:  StoredProcedure [dbo].[ssUtl_Lkp]    Script Date: 12/18/2012 09:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 08/07/2009
-- Description:	Pesquisa lookup genérica para tabelas
-- =============================================================================
CREATE PROCEDURE [dbo].[ssUtl_Lkp]
	@TblNme NVARCHAR(50), -- Tabela que será pesquisada
	@Fit NVARCHAR(50) = NULL, -- Filtro para a pesquisa, se necessário
	@IdTbl NVARCHAR(50), -- Nome do campo com o código da tabela (PK)
	@DscTbl NVARCHAR(50), -- Nome do campo com a descrição da tabela
	@IdPar NVARCHAR(50) = NULL, -- Parâmetro código
	@DscPar NVARCHAR(50) = NULL -- Parâmetro descrição
	
AS	
	DECLARE @SQL NVARCHAR(300)
	
	IF @IdPar IS NOT NULL OR @DscPar IS NOT NULL
	BEGIN
		IF @Fit IS NULL	
		BEGIN
			SET @SQL = 'SELECT '+ @IdTbl +', '+ @DscTbl +'  FROM '+ @TblNme
			IF @IdPar IS NOT NULL
				SET @SQL = @SQL + ' WHERE '+ @IdTbl +' = '+ @IdPar
			IF @DscPar IS NOT NULL
				SET @SQL = @SQL + ' WHERE '+ @IdTbl +' LIKE %'+ @DscPar +'% '
				
			SET @SQL = @SQL  +' ORDER BY 2'
		END
		ELSE
		BEGIN
			SET @SQL = 'SELECT '+ @IdTbl +', '+ @DscTbl +'  FROM '+ @TblNme +' WHERE '+ @Fit
			IF @IdPar IS NOT NULL
				SET @SQL = @SQL + ' AND '+ @IdTbl +' = '+ @IdPar +' '
			IF @DscPar IS NOT NULL
				SET @SQL = @SQL + ' AND '+ @DscTbl +' LIKE ''%'+ @DscPar +'%'' '
				
			SET @SQL = @SQL  +' ORDER BY 2'
		END

		EXEC SP_EXECUTESQL @SQL 
	END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_UsrPrf]    Script Date: 12/18/2012 09:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 10/10/2008
-- Description:	Pesquisa Usuário do Profissional
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_UsrPrf] 

@IdUsr INT = NULL,
@UserName NVARCHAR(256) = NULL


AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @UserName IS NOT NULL OR @IdUsr IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT [IdUsr]
		  ,[UserName]	
		  ,[Usr_Nme]
		  ,[Prf_Nme]
		  ,[Prf_NumCns]
		  ,[Prf_EstCns]
	FROM	dbo.Sgn_Usr INNER JOIN
			dbo.aspnet_Users ON dbo.Sgn_Usr.Usr_UserId = dbo.aspnet_Users.UserId LEFT OUTER JOIN
			dbo.Atz_Prf ON dbo.Sgn_Usr.IdUsr = dbo.Atz_Prf.Prf_IdUsr
	WHERE Usr_IdPpl = 2 ' -- Somente profissionais

	IF @IdUsr IS NOT NULL
	   SET @WHERE = @WHERE + N'AND IdUsr = @IdUsr  '   

	IF @UserName IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND UserName LIKE  ''%'' + @UserName + ''%'' '

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdUsr INT, @UserName NVARCHAR(256)',
	@IdUsr, @UserName

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_GrpUsr]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Pesquisa Grupo Usuário
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_GrpUsr] 

@Gpu_IdGrp SMALLINT = NULL

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @Gpu_IdGrp IS NOT NULL
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT [IdUsr]
		  ,[Usr_Nme]
	FROM	[dbo].[Sgn_GrpUsr], [dbo].[Sgn_Usr]
	WHERE	IdUsr = Gpu_IdUsr '

	IF @Gpu_IdGrp IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND Gpu_IdGrp = @Gpu_IdGrp '

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@Gpu_IdGrp SMALLINT',
	@Gpu_IdGrp

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Grp]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Pesquisa Grupo
-- =============================================================================
CREATE PROCEDURE [dbo].[ssSgn_Grp] 
	@RoleName  NVARCHAR(256) = NULL,
	@Description NVARCHAR(256) = NULL

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
--IF @RoleName IS NOT NULL OR  @Description IS NOT NULL 
--BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT RoleName
		  ,Description
		  ,ISNULL(IsOpe,0) AS IsOpe
	  FROM [dbo].[aspnet_Roles]
	WHERE 1 = 1 '

	IF @RoleName IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND LoweredRoleName LIKE ''%'' + LOWER(@RoleName)+ ''%''  '
	IF @Description IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Description LIKE  ''%'' + @Description + ''%'' '   

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@RoleName NVARCHAR(256), @Description NVARCHAR(256)',
	@RoleName, @Description

--END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_UsrCttEnd]    Script Date: 12/18/2012 09:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 10/10/2008
-- Description:	Pesquisa Usuário do Contratado Local
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_UsrCttEnd] 

@IdUsr INT = NULL,
@UserName NVARCHAR(256) = NULL


AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @UserName IS NOT NULL OR @IdUsr IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
		SELECT  IdUsr, dbo.aspnet_Users.UserName, dbo.Sgn_Usr.Usr_Nme
		FROM	dbo.Sgn_Usr INNER JOIN
				dbo.aspnet_Users ON Usr_UserId = UserId
		WHERE	Usr_IdPpl IN (3,4,6) ' -- Somente contratados

	IF @IdUsr IS NOT NULL
	   SET @WHERE = @WHERE + N'AND IdUsr = @IdUsr  '   

	IF @UserName IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND UserName LIKE  ''%'' + @UserName + ''%'' '

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdUsr INT, @UserName NVARCHAR(256)',
	@IdUsr, @UserName

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Usr]    Script Date: 12/18/2012 09:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Pesquisa Usuário
-- =============================================================================
CREATE PROCEDURE [dbo].[ssSgn_Usr] 

	@UserName NVARCHAR(256) = NULL,
	@Usr_Nme VARCHAR(70) = NULL,
	@PplDsc VARCHAR(20) = NULL,
	@GrpDsc NVARCHAR(512) = NULL,
	@PplOpe BIT = NULL -- Exibir somente usuários da operadora [0-Não|1-Sim]

AS
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)

	IF @UserName IS NOT NULL OR @Usr_Nme IS NOT NULL OR @PplDsc IS NOT NULL OR @GrpDsc IS NOT NULL
	BEGIN
		SET @WHERE = ''
		SET @SQL = N'
			SELECT	 IdUsr
					,u.UserId
					,UserName
					,Usr_Nme
					,IdPpl
					,Ppl_Dsc
					,Email
					,Usr_AltSnh
					,IsLockedOut
					,IsApproved
					,Comment
			FROM	 dbo.aspnet_Users u, dbo.aspnet_Membership m, dbo.Sgn_Usr, dbo.Sgn_Ppl
			WHERE	u.UserId = Usr_UserId
			AND		u.UserId = m.UserId
			AND		IdPpl = Usr_IdPpl '
		IF @PplOpe IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Ppl_Ope = @PplOpe '
		IF @UserName IS NOT NULL 
		   SET @WHERE = @WHERE + N'AND UserName LIKE  ''%'' + @UserName + ''%'' '
		IF @Usr_Nme IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Usr_Nme LIKE  ''%'' + @Usr_Nme + ''%'' ' 
		IF @PplDsc IS NOT NULL
			SET @WHERE = @WHERE + N'AND Ppl_Dsc LIKE ''%'' + @PplDsc + ''%'' ' 
		IF @GrpDsc IS NOT NULL
		   SET @WHERE = @WHERE + N'AND IdUsr IN (
										SELECT IdUsr
										FROM dbo.aspnet_usersinroles ur, dbo.aspnet_users u, 
											 dbo.aspnet_roles r, dbo.Sgn_Usr
										WHERE u.userid = ur.userid
										AND r.roleid = ur.roleid
										AND u.userid = Usr_UserId
										AND description LIKE ''%'' + @GrpDsc+ ''%'') '   

		SET @SQL = @SQL + @WHERE + N' ORDER BY Usr_Nme '

		--PRINT @SQL
		EXEC SP_EXECUTESQL 
			@SQL,
			N'@UserName NVARCHAR(256), @Usr_Nme VARCHAR(70), @PplDsc VARCHAR(20), @GrpDsc NVARCHAR(512), @PplOpe BIT',
			@UserName, @Usr_Nme, @PplDsc, @GrpDsc, @PplOpe

	END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Prf]    Script Date: 12/18/2012 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 12/10/2008
-- Description:	Pesquisa Usuário do Profissional
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_Prf] 
@IdPrf      BIGINT = NULL, 
@Prf_Nme    VARCHAR(70) = NULL, 
@Prf_NumCns VARCHAR(15) = NULL,      
@Prf_Cpf    CHAR(14) = NULL  

AS

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)


/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdPrf IS NOT NULL OR  @Prf_Nme IS NOT NULL OR   @Prf_NumCns IS NOT NULL OR @Prf_Cpf IS NOT NULL   
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT 
		IdPrf,
		Prf_Nme,
		Prf_NmeRsm,
		Usr_Nme,
		Prf_NumCns,
		Prf_EstCns,
		Prf_Cpf,
		Prf_Tel,
		Prf_Tel2,
		Prf_Fax,
		Prf_Eml,
		Prf_Sit = 
		CASE WHEN Prf_Sit = ''I'' THEN ''INATIVO''
		     WHEN Prf_Sit = ''A'' THEN ''ATIVO''
		END
		
FROM	dbo.Atz_Prf INNER JOIN
		dbo.Atz_Cns ON dbo.Atz_Prf.Prf_IdCns = dbo.Atz_Cns.IdCns LEFT OUTER JOIN
		dbo.Sgn_Usr ON dbo.Atz_Prf.Prf_IdUsr = dbo.Sgn_Usr.IdUsr
WHERE 1=1 '

IF @IdPrf IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdPrf = @IdPrf '

IF @Prf_Nme IS NOT NULL
begin                    
   SET @WHERE = @WHERE + N'AND Prf_Nme LIKE  ''%'' + @Prf_Nme + ''%'' or Prf_NmeRsm like ''%'' + @Prf_Nme + ''%''    '
   print @WHERE
end

IF @Prf_NumCns IS NOT NULL
   SET @WHERE = @WHERE + N'AND Prf_NumCns = @Prf_NumCns '

IF @Prf_Cpf   IS NOT NULL
   SET @WHERE = @WHERE + N'AND Prf_Cpf = @Prf_Cpf '   

SET @SQL = @SQL + @WHERE + N' ORDER BY Prf_Nme '

--PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@IdPrf BIGINT, @Prf_Nme VARCHAR(70), @Prf_NumCns VARCHAR(15),@Prf_Cpf CHAR(14) ',
@IdPrf, @Prf_Nme, @Prf_NumCns, @Prf_Cpf

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Ppl]    Script Date: 12/18/2012 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Pesquisa Papel
-- =============================================================================
CREATE PROCEDURE [dbo].[ssSgn_Ppl] 
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
		  FROM [dbo].[Sgn_Ppl]
		WHERE 1 = 1 '

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
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Pag]    Script Date: 12/18/2012 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Pesquisa Página
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_Pag] 
@IdPag  SMALLINT = NULL,
@Pag_IdMod SMALLINT = NULL,
@Pag_IdPai SMALLINT = NULL,
@Pag_Dsc VARCHAR(30) = NULL

AS

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)


/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF   @IdPag  IS NOT NULL OR  @Pag_IdMod IS NOT NULL OR   @Pag_IdPai IS NOT NULL OR @Pag_Dsc IS NOT NULL   
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT Sgn_Pag.IdPag      		  
		  ,Sgn_Pag.Pag_IdMod
		  ,Mod_Dsc
		  ,Sgn_Pag.Pag_IdPai
		  ,Sgn_Pai.Pag_Dsc AS Pai_Dsc
		  ,Sgn_Pag.Pag_Dsc
		  ,Sgn_Pag.Pag_Url
		  ,Sgn_Pag.Pag_Anm
		  ,Sgn_Pag.Pag_Ord
	FROM    dbo.Sgn_Pag INNER JOIN
			dbo.Sgn_Mod ON dbo.Sgn_Pag.Pag_IdMod = dbo.Sgn_Mod.IdMod LEFT OUTER JOIN
			dbo.Sgn_Pag AS Sgn_Pai ON dbo.Sgn_Pag.Pag_IdPai = Sgn_Pai.IdPag
	WHERE 1 = 1 '

	IF @IdPag  IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND  Sgn_Pag.IdPag  =   @IdPag  '

	IF @Pag_IdMod IS NOT NULL
	begin                    
	   SET @WHERE = @WHERE + N'AND Sgn_Pag.Pag_IdMod =  @Pag_IdMod  '   
	end

	IF @Pag_IdPai IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Sgn_Pag.Pag_IdPai = @Pag_IdPai '

	IF @Pag_Dsc   IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Sgn_Pag.Pag_Dsc LIKE  ''%'' + @Pag_Dsc + ''%''  '      

	SET @SQL = @SQL + @WHERE + N' ORDER BY Sgn_Pag.Pag_Dsc '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdPag  SMALLINT, @Pag_IdMod SMALLINT, @Pag_IdPai SMALLINT, @Pag_Dsc VARCHAR(30) ',
	  @IdPag , @Pag_IdMod, @Pag_IdPai, @Pag_DSc

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Mod]    Script Date: 12/18/2012 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Pesquisa Módulo
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_Mod] 
@IdMod  SMALLINT = NULL,
@Mod_Dsc VARCHAR(30) = NULL

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdMod IS NOT NULL OR  @Mod_Dsc IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT [IdMod]
		  ,[Mod_Dsc]
	  FROM [dbo].[Sgn_Mod]
	WHERE 1 = 1 '

	IF @IdMod IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND IdMod = @IdMod '
	IF @Mod_Dsc IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Mod_Dsc LIKE  ''%'' + @Mod_Dsc + ''%'' '   

	SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdMod SMALLINT, @Mod_Dsc VARCHAR(30)',
	@IdMod, @Mod_Dsc

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaPdmAtz]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.02.15
-- Description:	Pesquisa os procedimentos autorizados na guia
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaPdmAtz] 
	 @IdGia VARCHAR(100)
AS
BEGIN
	DECLARE @SQL NVARCHAR(2000)

	SET @SQL = 'SELECT	IdPdm, Pdm_Cod, Pdm_DscRsm, Gpd_QtdSol, Gpd_QtdAtz, Sit_Ind
				FROM	dbo.Atz_GiaPdm, dbo.Atz_Pdm, dbo.Atz_Sit
				WHERE	IdPdm = Gpd_IdPdm
				AND		IdSit = Gpd_IdSit
				AND		Sit_Ind = ''A''
				AND		Gpd_IdGia IN ('+@IdGia+')'

	EXEC SP_EXECUTESQL @SQL

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Lcr]    Script Date: 12/18/2012 09:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa contratado Local Rede
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Lcr] 

@IdLcr INT = NULL,
@Ctt_Nme VARCHAR(70) =  NULL, 
@Cte_IdCtt BIGINT = NULL,
@Ctt_NmeRsm VARCHAR(35) = NULL,
@Ctt_Doc VARCHAR(16) = NULL

AS

SET  @Cte_IdCtt = RTRIM(@Cte_IdCtt)
SET  @Cte_IdCtt = LTRIM(@Cte_IdCtt)

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdLcr IS NOT NULL OR @Ctt_Nme IS NOT NULL OR  @Cte_IdCtt IS NOT NULL OR @Ctt_NmeRsm IS NOT NULL OR  @Ctt_Doc IS NOT NULL 
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT IdLcr
      ,Lcr_IdCtt
      ,Lcr_SeqEnd
      ,Lcr_IdRde
	  ,Rde_Nme
	  ,UPPER(Ctt_NmeRsm)+''-''+
       Lgr_Nme+''-''+
       (SELECT UPPER(Tpl_Dsc) FROM dbo.Atz_Tpl WHERE Lgr_IdTpl = IdTpl)+''-''+
        Brr_Nme+''-''+
        Mun_Nme AS CttLocal
FROM ATZ_LCR INNER JOIN ATZ_CTTEND ON (LCR_IDCTT = CTE_IDCTT AND LCR_SEQEND = CTE_SEQEND)
             INNER JOIN ATZ_CTT ON (IDCTT = LCR_IDCTT)
             INNER JOIN ATZ_RDE ON (IDRDE = LCR_IDRDE)
			 INNER JOIN ATZ_LGR ON (CTE_IDLGR = IDLGR)
			 INNER JOIN ATZ_BRR ON (IDBRR = LGR_IDBRR)
             INNER JOIN ATZ_MUN ON (BRR_IDMUN = IDMUN)
WHERE 1=1 '

IF @IdLcr IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdLcr = @IdLcr '

IF @Cte_IdCtt IS NOT NULL 
   SET @WHERE = @WHERE + N'AND Cte_IdCtt = @Cte_IdCtt '

IF @Ctt_Doc IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_Doc LIKE  ''%'' + @Ctt_Doc + ''%'' '   

IF @Ctt_Nme IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_Nme LIKE  ''%'' + @Ctt_Nme + ''%'' ' 

IF @Ctt_NmeRsm IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_NmeRsm LIKE  ''%'' + @Ctt_NmeRsm + ''%'' ' 


SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '

--print @SQL

--PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@IdLcr INT, @Ctt_Nme varchar(70), @Cte_IdCtt bigint,@Ctt_NmeRsm varchar(35),@Ctt_Doc varchar(16) ',
@IdLcr, @Ctt_Nme, @Cte_IdCtt,@Ctt_NmeRsm,@Ctt_Doc

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Lce]    Script Date: 12/18/2012 09:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================
-- Author		: Wesley PS
-- Create date	: 05/09/2008
-- Description	: Pesquisa contratado Local Rede Especialidade
-- Author		: Rubens Jr
-- Alter date	: 21/02/2009
-- Description	: Adicionado campo Lce_TipAtd e campo calculado Lce_TipAtdDsc
-- ============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Lce] 

@Ctt_Nme VARCHAR(70) =  NULL, 
@Cte_IdCtt BIGINT = NULL,
@Ctt_NmeRsm varchar(35) = NULL,
@Ctt_Doc VARCHAR(16) = NULL

AS

SET  @Cte_IdCtt = RTRIM(@Cte_IdCtt)
SET  @Cte_IdCtt = LTRIM(@Cte_IdCtt)

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @Ctt_Nme IS NOT NULL OR  @Cte_IdCtt IS NOT NULL OR @Ctt_NmeRsm IS NOT NULL OR  @Ctt_Doc IS NOT NULL 
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT	 IdLce
		,IdLcr  
		,IdCtt
		,Cte_SeqEnd
		,Lce_IdEsp
		,Lce_TipAtd
		,CASE Lce_TipAtd 
			WHEN ''E'' THEN ''ELETIVO''
			WHEN ''U'' THEN ''URGÊNCIA''
			WHEN ''A'' THEN ''AMBOS''
		 END AS Lce_TipAtdDsc
		,(SELECT ESP_DSC FROM ATZ_ESP WHERE IDESP = LCE_IDESP) AS   Esp_Dsc               
		,Rde_Nme
		,UPPER(Ctt_NmeRsm)+''-''+
		Lgr_Nme+''-''+
		(SELECT UPPER(Tpl_Dsc) FROM dbo.Atz_Tpl WHERE Lgr_IdTpl = IdTpl)+''-''+
        Brr_Nme+''-''+
        Mun_Nme AS CttLocal
FROM ATZ_LCR INNER JOIN ATZ_CTTEND ON (LCR_IDCTT = CTE_IDCTT AND LCR_SEQEND = CTE_SEQEND)
             INNER JOIN ATZ_CTT ON (IDCTT = LCR_IDCTT)
             INNER JOIN ATZ_RDE ON (IDRDE = LCR_IDRDE)
			 INNER JOIN ATZ_LGR ON (CTE_IDLGR = IDLGR)
			 INNER JOIN ATZ_BRR ON (IDBRR = LGR_IDBRR)
             INNER JOIN ATZ_MUN ON (BRR_IDMUN = IDMUN)
             INNER JOIN ATZ_LCRESP ON (LCE_IDLCR = IDLCR)
WHERE 1=1 '

IF @Cte_IdCtt IS NOT NULL 
   SET @WHERE = @WHERE + N'AND Cte_IdCtt = @Cte_IdCtt '

IF @Ctt_Doc IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_Doc LIKE  ''%'' + @Ctt_Doc + ''%'' '   

IF @Ctt_Nme IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_Nme LIKE  ''%'' + @Ctt_Nme + ''%'' ' 

IF @Ctt_NmeRsm IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_NmeRsm LIKE  ''%'' + @Ctt_NmeRsm + ''%'' ' 


SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '

--print @SQL

PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@Ctt_Nme varchar(70), @Cte_IdCtt bigint,@Ctt_NmeRsm varchar(35),@Ctt_Doc varchar(16) ',
@Ctt_Nme, @Cte_IdCtt,@Ctt_NmeRsm,@Ctt_Doc

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Lgr]    Script Date: 12/18/2012 09:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Logradouros
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Lgr] 
@IdLgr INT = NULL,
@IdMun SMALLINT = NULL,
@Lgr_IdBrr INT = NULL,
@Lgr_Nme VARCHAR(50)= NULL,
@Lgr_Cep CHAR(8) = NULL
AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdLgr IS NOT NULL OR  @Lgr_Nme IS NOT NULL OR @Lgr_Cep IS NOT NULL
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
	SELECT IdLgr
		  ,IdBrr
		  ,IdMun
		  ,Brr_Nme
		  ,Mun_Nme
		  ,Lgr_Nme
		  ,Tpl_Dsc
		  ,Lgr_Cep
	  FROM dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Mun, dbo.Atz_Tpl
	WHERE	IdMun = Brr_IdMun
	AND		IdBrr = Lgr_IdBrr
	AND		IdTpl = Lgr_IdTpl '

	IF @IdLgr IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND IdLgr = @IdLgr '

	IF @Lgr_Nme IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Lgr_Nme LIKE  ''%'' + @Lgr_Nme + ''%'' '   

	IF @Lgr_IdBrr IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Lgr_IdBrr = @Lgr_IdBrr ' 

	IF @IdMun IS NOT NULL
	   SET @WHERE = @WHERE + N'AND IdMun = @IdMun ' 

	IF @Lgr_Cep IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Lgr_Cep = @Lgr_Cep '

	SET @SQL = @SQL + @WHERE + N' ORDER BY Lgr_Nme '

	--print @SQL

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdLgr INT, @IdMun SMALLINT, @Lgr_IdBrr INT, @Lgr_Nme VARCHAR(50), @Lgr_Cep CHAR(8) ',
	@IdLgr, @IdMun, @Lgr_IdBrr, @Lgr_Nme, @Lgr_Cep

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaLog]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/01/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_GiaLog] 
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@IdEsp SMALLINT = NULL,
	@Gia_Tip TINYINT = NULL, -- [0-Solicitação SP/SADT|1-Guia de Consulta|2-Guia SP/SADT]
	@IdSit TINYINT = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
DECLARE @WHERE NVARCHAR(600), @WHEREGIA NVARCHAR(300), @WHERESOL NVARCHAR(300)
DECLARE @SQL NVARCHAR(4000) , @SQL2 NVARCHAR(1000), @SQL3 NVARCHAR(1100), @SQL4 NVARCHAR(1000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @Gia_DatIni IS NOT NULL OR
	@Gia_DatFim IS NOT NULL OR
	@Gia_Tip IS NOT NULL OR
	@IdEsp IS NOT NULL OR
	@IdSit IS NOT NULL OR
	@Pdm_Cod IS NOT NULL OR
	@Gia_Snh IS NOT NULL OR
	@Bnf_Mtr IS NOT NULL OR
	@IdCtt IS NOT NULL OR
	@Prf_Mtr IS NOT NULL
BEGIN  

	SET @WHERE = ''
	SET @WHEREGIA = ''
	SET @WHERESOL = ''

	-- Consulta Eletiva
	SET @SQL = N'
		SELECT Gia_DatEms,Bnf_Nme,''CONSULTA ELETIVA'' AS Gia_Tip,Pdm_Cod, '+
				'Sit_Dsc,Pdm_Dsc, '+
				'NULL AS Prf_Sol,Prf_Nme AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,Gpd_QtdSol, '+
				'CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,NULL AS Esp_Sol,Esp_Dsc AS Esp_Exe  '+
		'FROM dbo.Atz_Gia,dbo.Atz_GiaPdm,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd, '+
			 'dbo.Atz_Prf,dbo.Atz_Pdm,dbo.Sgn_Usr,dbo.Atz_Esp,dbo.Atz_Sit '+
		'WHERE IdGia = Gpd_IdGia '+
		'AND IdCtt = Gia_IdCtt '+
		'AND IdCtt = Gia_IdCtt '+
		'AND IdSit = Gpd_IdSit '+
		'AND Gia_SeqEnd = Cte_SeqEnd '+
		'AND IdCtt = Cte_IdCtt '+
		'AND IdPdm = Gpd_IdPdm '+
		'AND IdBnf = Gia_IdBnf '+
		'AND IdPrf = Gia_IdPrf '+
		'AND IdUsr = Gia_IdUsr '+
		'AND IdEsp = Gia_IdEsp '+
		'AND Gia_Tip = 1 '

	-- SP/SADT para procedimentos que não requerem profissional para execução,
	-- somente devem ser listadas se no filtro da pesquisa não estiver a matrícula do profissional
	IF @Prf_Mtr IS  NULL
		SET @SQL2 = N'
		SELECT	Gia_DatEms,Bnf_Nme,''SP/SADT'' AS Gia_Tip,Pdm_Cod,'+
				'Sit_Dsc, Pdm_Dsc,'+
				'('+
					'SELECT	Prf_Nme '+
					'FROM dbo.Atz_Gia, dbo.Atz_Prf '+
					'WHERE IdGia = Gia_IdGiaPrc '+ 
					'AND IdPrf = Gia_IdPrf '+
				') AS Prf_Sol, '+
				'NULL AS Prf_Exe,IdCtt,NULL AS Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,'+
				'Gpd_QtdSol,CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,'+
				'( '+
					'SELECT	Esp_Dsc '+
					'FROM dbo.Atz_Gia, dbo.Atz_Prf, dbo.Atz_Esp '+
					'WHERE IdGia = Gia_IdGiaPrc '+
					'AND IdPrf = Gia_IdPrf '+
					'AND IdEsp = Gia_IdEsp '+
				') AS Esp_Sol, Esp_Dsc AS Esp_Exe '+
		'FROM dbo.Atz_Gia,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,dbo.Atz_Sit, '+
			 'dbo.Atz_GiaPdm,dbo.Atz_Esp,dbo.Atz_Pdm,dbo.Sgn_Usr '+
		'WHERE IdCtt = Cte_IdCtt '+
		'AND IdSit = Gpd_IdSit '+
		'AND IdBnf = Gia_IdBnf '+
		'AND IdGia = Gpd_IdGia '+
		'AND IdEsp = Gia_IdEsp '+
		'AND IdPdm = Gpd_IdPdm '+
		'AND IdUsr = Gia_IdUsr '+
		'AND Gia_IdCtt = Cte_IdCtt '+
		'AND Gia_SeqEnd = Cte_SeqEnd '+
		'AND Gia_IdPrf IS NULL '+
		'AND Gia_Tip = 2 '
		
	-- SP/SADT para procedimentos que requerem profissional para execução
	SET @SQL3 = N'
	SELECT	Gia_DatEms, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,'+
			'Sit_Dsc, Pdm_Dsc,'+
			'('+
				'SELECT Prf_Nme '+
				'FROM dbo.Atz_Gia,dbo.Atz_Prf '+
				'WHERE IdGia = Gia_IdGiaPrc '+
				'AND IdPrf = Gia_IdPrf '+
			') AS Prf_Sol,'+
			'Prf_Nme AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Gpd_QtdAtz,'+
			'Gpd_QtdSol,CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,'+
			'('+
				'SELECT Esp_Dsc '+
				'FROM dbo.Atz_Gia,dbo.Atz_Prf,dbo.Atz_Esp '+
				'WHERE IdGia = Gia_IdGiaPrc '+
				'AND IdPrf = Gia_IdPrf '+
				'AND IdEsp = Gia_IdEsp '+
			') AS Esp_Sol, Esp_Dsc AS Esp_Exe '+
	'FROM dbo.Atz_Gia,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,dbo.Atz_Sit,'+
		'dbo.Atz_Prf,dbo.Atz_GiaPdm,dbo.Atz_Esp,dbo.Atz_Pdm,dbo.Sgn_Usr '+ 
	'WHERE IdCtt = Cte_IdCtt '+
	'AND IdSit = Gpd_IdSit '+
	'AND IdBnf = Gia_IdBnf '+
	'AND IdGia = Gpd_IdGia '+
	'AND IdEsp = Gia_IdEsp '+
	'AND IdPdm = Gpd_IdPdm '+
	'AND IdUsr = Gia_IdUsr '+
	'AND Gia_IdCtt = Cte_IdCtt '+
	'AND Gia_SeqEnd = Cte_SeqEnd '+
	'AND IdPrf = Gia_IdPrf '+
	'AND Gia_Tip = 2 '

	-- Solicitação SP/SADT
	SET @SQL4 = N'
	SELECT Sol_DatEms,Bnf_Nme,''SOLICITAÇÃO'' AS Gia_Tip,Pdm_Cod,'+
			'Sit_Dsc,Pdm_Dsc,'+
			'Prf_Nme AS Prf_Sol,NULL AS Prf_Exe,IdCtt,Prf_Mtr,Bnf_Mtr,Spd_QtdAtz,Spd_QtdSol,'+
			'CASE Sit_Ind WHEN ''A'' THEN Sol_Snh ELSE NULL END AS Gia_Snh,Usr_Nme,Esp_Dsc AS Esp_Sol,NULL AS Esp_Exe '+
	'FROM dbo.Atz_Sol,dbo.Atz_SolPdm,dbo.Atz_Bnf,dbo.Atz_Ctt,dbo.Atz_CttEnd,'+
		'dbo.Atz_Prf,dbo.Atz_Pdm,dbo.Sgn_Usr,dbo.Atz_Esp,dbo.Atz_Sit '+
	'WHERE IdSol = Spd_IdSol '+
	'AND IdCtt = Sol_IdCtt '+
	'AND IdSit = Spd_IdSit '+
	'AND Sol_SeqEnd = Cte_SeqEnd '+
	'AND IdCtt = Cte_IdCtt '+
	'AND IdPdm = Spd_IdPdm '+
	'AND IdBnf = Sol_IdBnf '+
	'AND IdPrf = Sol_IdPrfSol '+ 
	'AND IdUsr = Sol_IdUsr '+
	'AND IdEsp = Sol_IdEsp '

	IF @Gia_DatIni IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms >= @Gia_DatIni '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms >= @Gia_DatIni '
	END

	IF @Gia_DatFim IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms <= @Gia_DatFim '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms <= @Gia_DatFim '
	END

	IF @Gia_Tip IS NOT NULL
	BEGIN 
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip = @Gia_Tip '
		-- As solicitações de SP/SADT não devem ser listadas se o usuário 
		-- filtrar por um tipo de guia que não for a de solcitação de SP/SADT
		IF @Gia_Tip <> 0
			SET @WHERESOL = @WHERESOL + N'AND 0 = 1 '
	END

	IF @IdSit IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdSit = @IdSit '

	IF @IdEsp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '

	IF @Pdm_Cod IS NOT NULL
		SET @WHERE = @WHERE + N'AND Pdm_Cod = @Pdm_Cod '   

	IF @Gia_Snh IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh = @Gia_Snh ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_Snh = @Gia_Snh ' 
	END

	IF @Bnf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Bnf_Mtr = @Bnf_Mtr ' 

	IF @IdCtt IS NOT NULL
		SET @WHERE = @WHERE + N'AND IdCtt = @IdCtt ' 

	-- Se um dos filtros da pesquisa for a matrícula do profissional,
	-- as guias de SP/SADT com procedimentos que não requerem profissional
	-- não devem ser exibidas
	IF @Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
		
		SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL4 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord
	END
	ELSE
		SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL2 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL4 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord

	PRINT '4000 800 1100 800'
	PRINT LEN(@SQL)
	PRINT LEN(@SQL2)
	PRINT LEN(@SQL3)
	PRINT LEN(@SQL4)
	PRINT '800 400 400'
	PRINT LEN(@WHERE)
	PRINT LEN(@WHEREGIA)
	PRINT LEN(@WHERESOL)
	PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
	@Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
	@Prf_Mtr VARCHAR(20) ',
		@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr

	
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Grp]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 544 END #####################################################################

-- 545 BEGIN ###################################################################


-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Grupos
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Grp] 
	@IdGrp  tinyint = null,
	@Grp_Dsc varchar(30) = null
AS
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)

/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdGrp IS NOT NULL OR  @Grp_Dsc IS NOT NULL 
BEGIN  

	SET @WHERE = ''
	SET @SQL = N'
		SELECT IdGrp
			  ,Grp_Dsc
			  ,Grp_QtdCh_
		  FROM dbo.Atz_Grp
		WHERE 1 = 1 '

	IF @IdGrp IS NOT NULL 
	   SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
	IF @Grp_Dsc IS NOT NULL
	   SET @WHERE = @WHERE + N'AND Grp_Dsc LIKE  ''%'' + @Grp_Dsc + ''%'' '   
	
	SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '

	EXEC SP_EXECUTESQL 
		@SQL,
		N'@IdGrp smallint, @Grp_Dsc VARCHAR(30)',
		@IdGrp, @Grp_Dsc

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Brr]    Script Date: 12/18/2012 09:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Logradouros
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Brr] 
@IdBrr int = null,
@Brr_Nme varchar(30)= null

AS
DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @IdBrr IS NOT NULL OR  @Brr_Nme IS NOT NULL 
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT [IdBrr]
      ,(select mun_nme from atz_mun where Brr_IdMun = idmun) as mun_nme
      ,[Brr_Nme]
  FROM [Atz_Brr]
WHERE 1 = 1 '

IF @IdBrr IS NOT NULL 
   SET @WHERE = @WHERE + N'AND IdBrr = @IdBrr '

IF @Brr_Nme IS NOT NULL
   SET @WHERE = @WHERE + N'AND Brr_Nme LIKE  ''%'' + @Brr_Nme + ''%'' '   

SET @SQL = @SQL + @WHERE + N' ORDER BY 1 '

--print @SQL

--PRINT @SQL
EXEC SP_EXECUTESQL @SQL,
N'@IdBrr int, @Brr_Nme VARCHAR(30)',
@IdBrr, @Brr_Nme

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_CttEnd]    Script Date: 12/18/2012 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 541 END #####################################################################

-- 542 BEGIN ###################################################################


-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Contratado Endereço (local de atendimento) 
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_CttEnd] 

	@Ctt_Nme VARCHAR(70) =  NULL, 
	@Cte_IdCtt BIGINT = NULL,
	@Cte_SeqEnd TINYINT = NULL,
	@Ctt_NmeRsm VARCHAR(35) = NULL,
	@Ctt_Doc VARCHAR(16) = NULL,
	@Fit NVARCHAR(100) = NULL

AS
	DECLARE @WHERE NVARCHAR(2000)
	DECLARE @SQL NVARCHAR(2000)

	SET  @Cte_IdCtt = RTRIM(@Cte_IdCtt)
	SET  @Cte_IdCtt = LTRIM(@Cte_IdCtt)

	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
	IF @Ctt_Nme IS NOT NULL OR  @Cte_IdCtt IS NOT NULL OR @Cte_SeqEnd IS NOT NULL OR 
		@Ctt_NmeRsm IS NOT NULL OR  @Ctt_Doc IS NOT NULL 
	BEGIN  

		SET @SQL = N'
			SELECT Cte_IdCtt
				  ,Cte_SeqEnd
				  ,Ctt_NmeRsm
				  ,( SELECT UPPER(Tpl_Dsc) + ''-'' + UPPER(Lgr_Nme) + ''-'' + UPPER(Brr_Nme) + ''-'' + UPPER(Mun_Nme) 
					 FROM dbo.Atz_Lgr
					 INNER JOIN dbo.Atz_Brr ON (IdBrr = Lgr_IdBrr)
					 INNER JOIN dbo.Atz_Mun ON (Brr_IdMun = IdMun) 
					 INNER JOIN dbo.Atz_Tpl ON (IdTpl = Lgr_IdTpl) WHERE IdLgr = Cte_IdLgr) AS local
				  ,Cte_NumEnd      
				  ,Cte_Cpl      
				  ,(SELECT Lgr_Cep FROM dbo.Atz_Lgr WHERE IdLgr = Cte_IdLgr) AS Cte_Cep
				  ,Cte_Tel
				  ,Cte_Tel2
				  ,Cte_Fax
				  ,Cte_Eml
				  ,Cte_NmeCto
				  ,Ctt_Doc
				  ,Ctt_Nme
				  ,ISNULL(Cte_BioCon,0) AS Cte_BioCon
				  ,ISNULL(Cte_BioExe,0) AS Cte_BioExe
				  ,Cte_DatFim
			FROM Atz_CttEnd INNER JOIN Atz_Ctt ON (IdCtt = Cte_IdCtt)
			WHERE 0=0 '
			
		IF @Fit IS NOT NULL
			SET @WHERE = 'AND '+ @Fit
		ELSE
			SET @WHERE = ''			

		IF @Cte_IdCtt IS NOT NULL 
		   SET @WHERE = @WHERE + N'AND Cte_IdCtt = @Cte_IdCtt '

		IF @Cte_SeqEnd IS NOT NULL 
		   SET @WHERE = @WHERE + N'AND Cte_SeqEnd = @Cte_SeqEnd '

		IF @Ctt_Doc IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Ctt_Doc LIKE  ''%'' + @Ctt_Doc + ''%'' '   

		IF @Ctt_Nme IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Ctt_Nme LIKE  ''%'' + @Ctt_Nme + ''%'' ' 

		IF @Ctt_NmeRsm IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Ctt_NmeRsm LIKE  ''%'' + @Ctt_NmeRsm + ''%'' ' 

		SET @SQL = @SQL + @WHERE + N' ORDER BY 2 '

		--PRINT @SQL
		EXEC SP_EXECUTESQL @SQL,
		N'@Ctt_Nme VARCHAR(70), @Cte_IdCtt BIGINT, @Cte_SeqEnd TINYINT, @Ctt_NmeRsm VARCHAR(35), @Ctt_Doc VARCHAR(16) ',
		@Ctt_Nme, @Cte_IdCtt, @Cte_SeqEnd, @Ctt_NmeRsm, @Ctt_Doc

	END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Ctt]    Script Date: 12/18/2012 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 26/08/2008
-- Description:	Pesquisa Contratado
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Ctt] 
@IdCtt      BIGINT = NULL, 
@Ctt_Nme    VARCHAR(70) = NULL, 
@Ctt_NmeRsm VARCHAR(35) = NULL,      
@Ctt_Doc    VARCHAR(18) = NULL  

AS

DECLARE @WHERE NVARCHAR(2000)
DECLARE @SQL NVARCHAR(2000)


/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF   @IdCtt  IS NOT NULL OR  @Ctt_Nme IS NOT NULL OR   @Ctt_NmeRsm IS NOT NULL OR @Ctt_Doc IS NOT NULL   
BEGIN  

SET @WHERE = ''
SET @SQL = N'
SELECT IdCtt      
      ,(SELECT TPD_DSC FROM ATZ_TPD WHERE IDTPD = Ctt_IdTpd  )as TPD_DSC
      ,(select cns_nme from atz_cns where Ctt_IdCns = idcns)  as cns_nme
      ,Ctt_Nme
      ,Ctt_NmeRsm
	  ,case when Ctt_TipDoc = ''J'' then ''JURIDICA''
		     when Ctt_TipDoc = ''F'' then ''FISICA''
       END AS Ctt_TipDoc
      ,Ctt_Doc
      ,Ctt_NumCns
      ,Ctt_EstCns
      ,Ctt_CodCne
      ,case when Ctt_Sit = ''I'' then ''INATIVO''
		     when Ctt_Sit = ''A'' then ''ATIVO''
	   end     as Ctt_Sit  
      ,Ctt_Tel
      ,Ctt_Tel2
      ,Ctt_Fax
      ,Ctt_Eml
      ,Ctt_NmeCto
FROM Atz_Ctt
WHERE 1 = 1 '



IF @IdCtt IS NOT NULL 
   SET @WHERE = @WHERE + N'AND  IdCtt  =   @IdCtt  '

IF @Ctt_Nme IS NOT NULL                   
   SET @WHERE = @WHERE + N'AND Ctt_Nme LIKE  ''%'' + @Ctt_Nme + ''%''  '   

IF @Ctt_NmeRsm IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_NmeRsm = @Ctt_NmeRsm '

IF @Ctt_Doc   IS NOT NULL
   SET @WHERE = @WHERE + N'AND Ctt_Doc = @Ctt_Doc '   



SET @SQL = @SQL + @WHERE + N' ORDER BY Ctt_Nme '

--PRINT @SQL

EXEC SP_EXECUTESQL @SQL,
N'@IdCtt  BIGINT, @Ctt_Nme VARCHAR(70), @Ctt_NmeRsm VARCHAR(35),@Ctt_Doc VARCHAR(18) ',
  @IdCtt , @Ctt_Nme, @Ctt_NmeRsm, @Ctt_Doc

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Esp]    Script Date: 12/18/2012 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Pesquisa Especialidades
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Esp] 

	@IdEsp  SMALLINT = NULL,
	@Esp_Cbo VARCHAR(10) = NULL,
	@Esp_Dsc VARCHAR(80) = NULL

AS
	DECLARE @WHERE NVARCHAR(2000), @SQL NVARCHAR(2000)

	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
	IF @IdEsp IS NOT NULL OR @Esp_Dsc IS NOT NULL OR  @Esp_Cbo IS NOT NULL
	BEGIN
		SET @WHERE = ''
		SET @SQL = N'
		SELECT [IdEsp]
			  ,[Esp_Dsc]
			  ,[Esp_Cbo]
			  ,[Esp_SisGst]
			  ,ISNULL([Esp_AltCpx],0) AS [Esp_AltCpx]
			  ,[Esp_Sxo]
			  ,[Esp_IddMin]
			  ,[Esp_IddMax]
			  ,[Esp_QtdMax]
			  ,[Esp_QtdDia]
			  ,[Esp_QtdMes]
			  ,[Esp_QtdAno]
			  ,[Esp_Rtn]
		  FROM [dbo].[Atz_Esp]
		WHERE 1 = 1 '

		IF @IdEsp IS NOT NULL 
		   SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
		IF @Esp_Cbo IS NOT NULL
		   SET @WHERE = @WHERE + N'AND Esp_Cbo LIKE  ''%'' + @Esp_Cbo + ''%'' '
		IF @Esp_Dsc IS NOT NULL                
		   SET @WHERE = @WHERE + N'AND Esp_Dsc LIKE  ''%'' + @Esp_Dsc + ''%'' '   

		SET @SQL = @SQL + @WHERE + N' ORDER BY Esp_Dsc '

		EXEC SP_EXECUTESQL 
			@SQL,
			N'@IdEsp smallint, @Esp_Cbo VARCHAR(10), @Esp_Dsc VARCHAR(80)',
			@IdEsp, @Esp_Cbo, @Esp_Dsc
	END
GO
/****** Object:  StoredProcedure [dbo].[ssArq_Tab]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.16
-- Description:	Seleciona o nome da tabela
-- =============================================
CREATE PROCEDURE [dbo].[ssArq_Tab] 
	@Tab_Sgl CHAR(3)
AS
BEGIN
    SET NOCOUNT ON

	SELECT	Tab_Nme
	FROM	dbo.Arq_Tab
	WHERE	Tab_Sgl = @Tab_Sgl

END
GO
/****** Object:  StoredProcedure [dbo].[ssArq_Cmp]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.13
-- Description:	Seleciona os campos da tabela
-- =============================================
CREATE PROCEDURE [dbo].[ssArq_Cmp] 
	@Tab_Sgl CHAR(3)
AS
BEGIN
    -- Insert statements for procedure here
	SELECT	Cmp_Nme, Cmp_Tpo, Cmp_Imp, Cmp_Csa
	FROM	dbo.Arq_Cmp, dbo.Arq_Tab
	WHERE	IdTab = Cmp_IdTab
	AND		Tab_Sgl = @Tab_Sgl
	ORDER BY Cmp_Ord
END
GO
/****** Object:  Table [dbo].[SRV_SERVICOS]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRV_SERVICOS](
	[CODIGO] [nvarchar](255) NULL,
	[NOME] [nvarchar](255) NULL,
	[SEXO] [nvarchar](255) NULL,
	[EXIGEAUT] [float] NULL,
	[IDADEMINIMA] [float] NULL,
	[IDADEMAXIMA] [float] NULL,
	[PORSOLICITACAO] [float] NULL,
	[PORDIA] [float] NULL,
	[PORMES] [float] NULL,
	[PORANO] [float] NULL,
	[REUTILIZACAO] [float] NULL,
	[ALTACOMPLEXIDADE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Aud]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/01/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Aud] 
	@IdSit TINYINT = NULL,
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@Gia_Tip TINYINT = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
DECLARE @WHERE NVARCHAR(1000), @WHEREGIA NVARCHAR(500), @WHERESOL NVARCHAR(500)
DECLARE @SQL NVARCHAR(4000) , @SQL2 NVARCHAR(1000), @SQL3 NVARCHAR(1000)
/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
IF @Gia_DatIni IS NOT NULL OR
	@Gia_DatFim IS NOT NULL OR
	@Gia_Tip IS NOT NULL OR
	@Gia_Snh IS NOT NULL OR
	@Bnf_Mtr IS NOT NULL OR
	@IdCtt IS NOT NULL OR
	@Prf_Mtr IS NOT NULL
BEGIN  

	SET @WHERE = ''
	SET @WHEREGIA = ''
	SET @WHERESOL = ''

	-- Consulta Eletiva
	SET @SQL = N'
		SELECT	DISTINCT TOP 1000 IdGia AS IdSol, Bnf_Mtr, Bnf_Nme, Gia_Snh AS Sol_Snh, Gia_DatEms AS Sol_DatEms, Gia_Tip AS Sol_Tip,
				Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Prf_Mtr, Gia_Crt AS Sol_Crt, 
				CASE WHEN (Gpd_DatRel IS NULL) THEN ''CONSULTA'' ELSE ''CONSULTA EXECUTADA'' END AS Sol_TipDsc
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Pdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdPrf = Gia_IdPrf
		AND		IdPdm = Gpd_IdPdm
		AND		Gpd_IdSit <> 10	
		AND		Gia_Tip = 1  '

	-- SP/SADT
	SET @SQL2 = N'
		SELECT	DISTINCT IdGia AS IdSol, Bnf_Mtr, Bnf_Nme, Gia_Snh AS Sol_Snh, Gia_DatEms AS Sol_DatEms, Gia_Tip AS Sol_Tip,
				Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Prf_Mtr, Gia_Crt AS Sol_Crt, ''SP/SADT'' AS Sol_TipDsc
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Pdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdPdm = Gpd_IdPdm
		AND		Gpd_IdSit <> 10
		AND		IdPrf =* Gia_IdPrf		
		AND		Gia_Tip = 2 '

	-- Solicitação SP/SADT
	SET @SQL3 = N'
		SELECT	DISTINCT IdSol, Bnf_Mtr, Bnf_Nme, Sol_Snh, Sol_DatEms, 0 AS Sol_Tip,
				Sol_IdCtt, Sol_SeqEnd, Prf_Mtr, Sol_Crt, ''SOLICITAÇÃO'' AS Sol_TipDsc
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Pdm
		WHERE	IdBnf = Sol_IdBnf
		AND		IdSol = Spd_IdSol
		AND		IdPrf = Sol_IdPrfSol
		AND		IdPdm = Spd_IdPdm
		AND		Spd_IdSit <> 10 '

	IF @IdSit IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_IdSit = @IdSit '
		SET @WHERESOL = @WHERESOL + N'AND Spd_IdSit = @IdSit '
	END

	IF @Gia_DatIni IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms >= @Gia_DatIni '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms >= @Gia_DatIni '
	END

	IF @Gia_DatFim IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms <= @Gia_DatFim '
		SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms <= @Gia_DatFim '
	END

	IF @Gia_Tip IS NOT NULL 
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip = @Gia_Tip '

	IF @Gia_Snh IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh = @Gia_Snh ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_Snh = @Gia_Snh ' 
	END

	IF @Bnf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Bnf_Mtr = @Bnf_Mtr ' 

	IF @IdCtt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdCtt = @IdCtt ' 
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdCtt = @IdCtt ' 
	END

	IF @Prf_Mtr IS NOT NULL
		SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
		
	IF @Pdm_Cod IS NOT NULL
		SET @WHERE = @WHERE + N'AND Pdm_Cod = @Pdm_Cod '

	SET @SQL = @SQL + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL2 + @WHERE + @WHEREGIA +
				' UNION ALL '+ 
				@SQL3 + @WHERE + @WHERESOL +
				N' ORDER BY '+ @Ord

	--PRINT @SQL
	EXEC SP_EXECUTESQL @SQL,
	N'@IdSit TINYINT, @Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT,
	@Gia_Snh VARCHAR(20), @Bnf_Mtr VARCHAR(20), @IdCtt BIGINT, @Prf_Mtr VARCHAR(20), @Pdm_Cod VARCHAR(20) ',
		@IdSit, @Gia_DatIni, @Gia_DatFim, @Gia_Tip, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr, @Pdm_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_AudItn]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 06/10/2009
-- Description:	Pesquisa para auditoria de internação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_AudItn] 
	@Itn_Fit TINYINT, -- [0-Todas|1-Solicitações em aberto|2-Prorrogações em aberto|3-Internados]
	@IdCtt BIGINT = NULL,
	@SeqEnd TINYINT = NULL
AS
	DECLARE @SQL NVARCHAR(4000), @WHERE NVARCHAR(1000)
	SET @WHERE = ''
	CREATE TABLE #TBLRESULT 
		(
			IdGia INT,
			IdItn INT,
			Itn_Tip VARCHAR(30),
			Gia_IdCtt BIGINT,
			Gia_SeqEnd TINYINT,			
			Bnf_Nme VARCHAR(70),
			Esp_Dsc VARCHAR(80),
			Gia_DatItn SMALLDATETIME,
			Itn_Dri SMALLINT,			
			Sit_Dsc VARCHAR(20)			
		)

	IF @IdCtt IS NOT NULL
		SET @WHERE = @WHERE + N'AND IdCtt = @IdCtt ' 		
	IF @SeqEnd IS NOT NULL
		SET @WHERE = @WHERE + N'AND SeqEnd = @SeqEnd '

	IF (@Itn_Fit IN (0,1))
	BEGIN
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT	IdGia, IdItn, ''SOLICITACAO EM ABERTO'' AS Itn_Tip, Gia_IdCtt, 
						Gia_SeqEnd, Bnf_Nme, Esp_Dsc, Gia_DatItn, 
						DATEDIFF(DAY,Gia_DatItn,GETDATE()) AS Itn_Dri,
						CASE Itn_Atz WHEN 1 THEN ''AUTORIZADO'' ELSE ''PENDENTE'' END AS Sit_Dsc
				FROM	dbo.Atz_Gia, dbo.Atz_Itn, dbo.Atz_Bnf, dbo.Atz_Esp, 
						dbo.Atz_Ctt, dbo.Atz_CttEnd
				WHERE	IdGia = Itn_IdGia
				AND		IdBnf = Gia_IdBnf
				AND		IdEsp = Gia_IdEsp
				AND		IdCtt = Cte_IdCtt
				AND		Cte_IdCtt = Gia_IdCtt
				AND		Cte_SeqEnd = Gia_SeqEnd
				AND		Gia_Tip = 3 -- Solicitação de Internação
				AND		Itn_Tip = 1
				AND		Itn_DatAud IS NULL '

		IF (@WHERE IS NOT NULL)
			SET @SQL = @SQL + @WHERE
		
			EXEC SP_EXECUTESQL @SQL,
				N'@IdCtt BIGINT, @SeqEnd TINYINT ',
				@IdCtt, @SeqEnd
	END
	IF (@Itn_Fit IN (0,2))
	BEGIN
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT	IdGia, IdItn, ''PRORROGACAO EM ABERTO'' AS Itn_Tip, Gia_IdCtt, 
						Gia_SeqEnd, Bnf_Nme, Esp_Dsc, Gia_DatItn, 
						DATEDIFF(DAY,Gia_DatItn,GETDATE()) AS Itn_Dri,
						CASE Itn_Atz WHEN 1 THEN ''AUTORIZADO'' ELSE ''PENDENTE'' END AS Sit_Dsc
				FROM	dbo.Atz_Gia, dbo.Atz_Itn, dbo.Atz_Bnf, dbo.Atz_Esp, 
						dbo.Atz_Ctt, dbo.Atz_CttEnd
				WHERE	IdGia = Itn_IdGia
				AND		IdBnf = Gia_IdBnf
				AND		IdEsp = Gia_IdEsp
				AND		IdCtt = Cte_IdCtt
				AND		Cte_IdCtt = Gia_IdCtt
				AND		Cte_SeqEnd = Gia_SeqEnd
				AND		Gia_Tip = 3 -- Solicitação de Internação
				AND		Itn_Tip = 2
				AND		Itn_DatAud IS NULL '

		IF (@WHERE IS NOT NULL)
			SET @SQL = @SQL + @WHERE
		
			EXEC SP_EXECUTESQL @SQL,
				N'@IdCtt BIGINT, @SeqEnd TINYINT ',
				@IdCtt, @SeqEnd
	END
	IF (@Itn_Fit IN (0,3))
	BEGIN
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT	IdGia, IdItn, ''INTERNADO'' AS Itn_Tip, Gia_IdCtt, 
						Gia_SeqEnd, Bnf_Nme, Esp_Dsc, Gia_DatItn, 
						DATEDIFF(DAY,Gia_DatItn,GETDATE()) AS Itn_Dri,
						CASE Itn_Atz WHEN 1 THEN ''AUTORIZADO'' ELSE ''PENDENTE'' END AS Sit_Dsc
				FROM	dbo.Atz_Gia, dbo.Atz_Itn, dbo.Atz_Bnf, dbo.Atz_Esp, 
						dbo.Atz_Ctt, dbo.Atz_CttEnd
				WHERE	IdGia = Itn_IdGia
				AND		IdBnf = Gia_IdBnf
				AND		IdEsp = Gia_IdEsp
				AND		IdCtt = Cte_IdCtt
				AND		Cte_IdCtt = Gia_IdCtt
				AND		Cte_SeqEnd = Gia_SeqEnd
				AND		Gia_Tip = 3 -- Solicitação de Internação
				AND		IdGia NOT IN
					(
						SELECT	Itn_IdGia
						FROM	dbo.Atz_Itn
						WHERE	Itn_DatAud IS NULL
					) '

		IF (@WHERE IS NOT NULL)
			SET @SQL = @SQL + @WHERE
		
			EXEC SP_EXECUTESQL @SQL,
				N'@IdCtt BIGINT, @SeqEnd TINYINT ',
				@IdCtt, @SeqEnd
	END	
	
	SELECT * 
	FROM #TBLRESULT 
	
	DROP TABLE #TBLRESULT
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePtoMun]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 12/08/2011
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional com pontuação por cidade
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePtoMun]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT,
	@IdCtt BIGINT = NULL,
	@PrfMtr  VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@SitInd CHAR(1) = NULL,
	@BnfMtr VARCHAR(20) = NULL,
	@GiaCrt CHAR(1) = NULL,
	@IdMun SMALLINT = NULL,
	@ParMed NUMERIC(18,2) = NULL,
	@ParQtd NUMERIC(18,2) = NULL,
	@ParVlr NUMERIC(18,2) = NULL,
	@OutTot NUMERIC(18,2) OUTPUT
AS
	DECLARE		-- VARIÁVEIS		@Sql NVARCHAR(MAX),		@WhereSol NVARCHAR(MAX) = '',		@WhereCon NVARCHAR(MAX) = '',		@WhereSdt NVARCHAR(MAX) = ''			-- PARÊMETROS PARA SOLICITAÇÃO	IF (@IdEsp IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '	IF (@PrfMtr IS NOT NULL)		SET @WhereSol += N'AND	Prf_Mtr = @PrfMtr '	IF (@IdSit IS NOT NULL)		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '	IF (@SitInd IS NOT NULL)		SET @WhereSol += N'AND	Sit_Ind = @SitInd '	IF (@BnfMtr IS NOT NULL)		SET @WhereSol += N'AND	Bnf_Mtr = @BnfMtr '	IF (@GiaCrt IS NOT NULL)		SET @WhereSol += N'AND	Sol_Crt = @GiaCrt '	IF (@IdMun IS NOT NULL)		SET @WhereSol += N'AND	Brr_IdMun = @IdMun '	-- PARÂMETROS PARA CONSULTA	IF (@IdEsp IS NOT NULL)		SET @WhereCon += N'AND	c.Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereCon += N'AND	c.Gia_IdCtt = @IdCtt '	IF (@PrfMtr IS NOT NULL)		SET @WhereCon += N'AND	Prf_Mtr = @PrfMtr '	IF (@IdSit IS NOT NULL)		SET @WhereCon += N'AND	Gpd_IdSit = @IdSit '	IF (@SitInd IS NOT NULL)		SET @WhereCon += N'AND	Sit_Ind = @SitInd '	IF (@BnfMtr IS NOT NULL)		SET @WhereCon += N'AND	Bnf_Mtr = @BnfMtr '	IF (@GiaCrt IS NOT NULL)		SET @WhereCon += N'AND	Gia_Crt = @GiaCrt '	IF (@IdMun IS NOT NULL)		SET @WhereCon += N'AND	Brr_IdMun = @IdMun '		-- PARÂMETROS PARA SP/SADT	IF (@IdEsp IS NOT NULL)		SET @WhereSdt += N'AND	c.Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSdt += N'AND	e.Gia_IdCtt = @IdCtt '	IF (@PrfMtr IS NOT NULL)		SET @WhereSdt += N'AND	Prf_Mtr = @PrfMtr '	IF (@IdSit IS NOT NULL)		SET @WhereSdt += N'AND	Gpd_IdSit = @IdSit '	IF (@SitInd IS NOT NULL)		SET @WhereSdt += N'AND	Sit_Ind = @SitInd '	IF (@BnfMtr IS NOT NULL)		SET @WhereSdt += N'AND	Bnf_Mtr = @BnfMtr '	IF (@GiaCrt IS NOT NULL)		SET @WhereSdt += N'AND	Gia_Crt = @GiaCrt '	IF (@IdMun IS NOT NULL)		SET @WhereSdt += N'AND	Brr_IdMun = @IdMun '				SET @Sql = N'		WITH cte (IdMun, IdEsp, IdPrf, QtdCon, QtdSol, QtdExaTot, QtdExaPrf, VlrCon, VlrExaTot,					 VlrExaPrf, Eag, VlrEag, Ch_)		AS			(					SELECT	-- CONSULTAS					Brr_IdMun,					Gia_IdEsp, 					Gia_IdPrf,					SUM(Gpd_QtdSol), -- QtdCon 					0.0, -- QtdSol					0, -- QtdExaTot,					0, -- QtdExaPrf,					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz), -- VlrCon					0.0, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag, 					0.0, -- VlrEag					0.0 -- Ch_				FROM					dbo.Atz_Ngc RIGHT OUTER JOIN					dbo.Atz_Gia AS c INNER JOIN					dbo.Atz_GiaPdm ON c.IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN					dbo.Atz_Bnf ON c.Gia_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON c.Gia_IdPrf = IdPrf INNER JOIN					dbo.Atz_Brr INNER JOIN 					dbo.Atz_Lgr ON IdBrr = Lgr_IdBrr INNER JOIN					dbo.Atz_CttEnd ON IdLgr = Cte_IdLgr ON Gia_IdCtt = Cte_IdCtt AND Gia_SeqEnd = Cte_SeqEnd ON 						IdNgc = Gpd_IdNgc				WHERE						Gia_Tip = 1 AND					Gpd_Dat BETWEEN @DatIni AND @DatFim					'+ @WhereCon +'				GROUP BY					Brr_IdMun,					Gia_IdEsp, 					Gia_IdPrf, 					Gia_IdPrfSol								UNION ALL								SELECT	-- SOLICITAÇÕES					Brr_IdMun,					Sol_IdEsp,					Sol_IdPrfSol, 					0, -- QtdCon 					SUM(Spd_QtdSol), -- QtdSol 					0, -- QtdExaTot					0, -- QtdExaPrf					0.0, -- VlrCon					0.0, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag, 					0.0, -- VlrEag					SUM(Pdm_QtdCh_*Spd_QtdSol) -- Ch_				FROM						dbo.Atz_Sol INNER JOIN					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf INNER JOIN					dbo.Atz_Pdm ON Spd_IdPdm = IdPdm INNER JOIN					dbo.Atz_CttEnd ON Sol_IdCtt = Cte_IdCtt AND Sol_SeqEnd = Cte_SeqEnd INNER JOIN					dbo.Atz_Lgr ON Cte_IdLgr = IdLgr INNER JOIN					dbo.Atz_Brr ON Lgr_IdBrr = IdBrr INNER JOIN					dbo.Atz_Mun ON Brr_IdMun = IdMun				WHERE					Spd_Dat BETWEEN @DatIni AND @DatFim AND					Sol_IdEsp = @IdEsp					'+ @WhereSol +'				GROUP BY					Brr_IdMun,					Sol_IdEsp, 					Sol_IdPrfSol WITH ROLLUP				UNION ALL								SELECT	-- SP/SADT solicitada pelo profissional					Brr_IdMun,					c.Gia_IdEsp, 					e.Gia_IdPrfSol,					0, -- QtdCon					0, -- QtdSol					SUM(Gpd_QtdAtz), -- QtdExaTot					0, -- QtdExaPrf					0, -- VlrCon					SUM((Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag					0.0, -- VlrEag					0.0 -- Ch_				FROM						dbo.Atz_Lgr INNER JOIN					dbo.Atz_CttEnd ON IdLgr = Cte_IdLgr INNER JOIN					dbo.Atz_Brr ON Lgr_IdBrr = IdBrr INNER JOIN					dbo.Atz_Gia AS e INNER JOIN					dbo.Atz_Gia AS c ON e.Gia_IdGiaPrc = c.IdGia INNER JOIN					dbo.Atz_GiaPdm ON e.IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm ON Cte_IdCtt = c.Gia_IdCtt AND 						Cte_SeqEnd = c.Gia_SeqEnd				WHERE	Sit_Ind = ''A''					AND		c.Gia_Tip = 1					AND		c.Gia_DatAtd BETWEEN @DatIni AND @DatFim				AND		c.Gia_IdEsp = @IdEsp				'+ @WhereSdt +'				GROUP BY					Brr_IdMun,					c.Gia_IdEsp, 					e.Gia_IdPrfSol									UNION ALL								SELECT	-- SP/SADT executada pelo profissional (pode ter sido solicitado por outro profissional)					Brr_IdMun,					c.Gia_IdEsp, 					e.Gia_IdPrf,					0, -- QtdCon					0, -- QtdSol					0, -- QtdExaTot					SUM(Gpd_QtdAtz), -- QtdExaPrf					0.0, -- VlrCon					0.0, -- VlrExaTot					SUM((Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr, -- VlrExaPrf					SUM(CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN Gpd_QtdAtz ELSE 0 END), -- Cálculo EAG 					SUM(CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz ELSE 0 END), -- VlrEag					0.0 -- Ch_				FROM						dbo.Atz_Lgr INNER JOIN					dbo.Atz_CttEnd ON IdLgr = Cte_IdLgr INNER JOIN					dbo.Atz_Brr ON Lgr_IdBrr = IdBrr INNER JOIN					dbo.Atz_Gia AS e INNER JOIN					dbo.Atz_Gia AS c ON e.Gia_IdGiaPrc = c.IdGia INNER JOIN					dbo.Atz_GiaPdm ON e.IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm ON Cte_IdCtt = e.Gia_IdCtt AND 						Cte_SeqEnd = e.Gia_SeqEnd				WHERE						Sit_Ind = ''A''	AND					c.Gia_Tip = 1 AND					c.Gia_DatAtd BETWEEN @DatIni AND @DatFim AND					c.Gia_IdEsp = @IdEsp 				'+ @WhereSdt +'									GROUP BY					Brr_IdMun,					c.Gia_IdEsp,					e.Gia_IdPrf			)					SELECT			Mun_Nme,			Esp_Dsc, 			Prf_Mtr, 			Prf_Nme, 			SUM(QtdCon) AS QtdCon,			CONVERT(NUMERIC(18,2),SUM(VlrCon)) AS VlrCon,			CONVERT(NUMERIC(18,2),SUM(VlrCon/CASE QtdCon WHEN 0 THEN NULL ELSE QtdCon END)) AS MedCon,			SUM(QtdSol) AS QtdSol,			SUM(Ch_) AS Ch_,			CONVERT(NUMERIC(18,2),SUM(QtdSol)/CASE SUM(QtdCon) WHEN 0 THEN NULL ELSE SUM(QtdCon) END) AS MedSol,			SUM(QtdExaPrf) AS QtdExaPrf,			CONVERT(NUMERIC(18,2),SUM(VlrExaPrf)) AS VlrExaPrf,			SUM(QtdExaTot) AS QtdExaTot,			CONVERT(NUMERIC(18,2),SUM(VlrExaTot)) AS VlrExaTot,			CONVERT(NUMERIC(18,2),SUM(VlrCon + VlrExaPrf)) AS Vlr, 			CONVERT(NUMERIC(18,2),SUM(VlrCon + VlrExaTot + VlrExaPrf)) AS VlrTot,			SUM(Eag) AS Eag, 			SUM(VlrEag) AS VlrEag,			(	CASE 					WHEN ISNULL((SUM(QtdSol)/CASE SUM(QtdCon) WHEN 0 THEN NULL ELSE SUM(QtdCon) END),0.0) <= @ParMed THEN 1 				ELSE 0 END			) +			(				CASE WHEN ISNULL(SUM(QtdCon),0.0) >= @ParQtd THEN 1 ELSE 0 END			) +			(				CASE 					WHEN ISNULL((SUM(VlrCon/CASE QtdCon WHEN 0 THEN NULL ELSE QtdCon END)),0.0) <= @ParVlr THEN 1 				ELSE 0 END			) AS Pto		FROM	cte INNER JOIN				dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp INNER JOIN				dbo.Atz_Prf p ON cte.IdPrf = p.IdPrf INNER JOIN				dbo.Atz_Mun m ON cte.IdMun = m.IdMun		GROUP BY			Mun_Nme,			Esp_Dsc, 			Prf_Mtr, 			Prf_Nme		ORDER BY 			Mun_Nme, 			Esp_Dsc, 			Prf_Nme '		EXEC SP_EXECUTESQL 		@Sql,		N'		@DatIni SMALLDATETIME,		@DatFim SMALLDATETIME,		@IdEsp INT,		@IdCtt BIGINT,		@Prf_Mtr VARCHAR(20),		@IdSit TINYINT,		@SitInd CHAR(1),		@BnfMtr VARCHAR(20),		@GiaCrt CHAR(1),		@IdMun SMALLINT,		@ParMed NUMERIC(18,2),		@ParQtd NUMERIC(18,2),		@ParVlr NUMERIC(18,2)',		@DatIni,		@DatFim,		@IdEsp,		@IdCtt,		@PrfMtr,		@IdSit,		@SitInd,		@BnfMtr,		@GiaCrt,		@IdMun,		@ParMed,		@ParQtd,		@ParVlr	--PRINT @Sql	--PRINT @WhereSol	--PRINT @WhereGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePto]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 12/08/2011
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional com pontuação
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePto]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT,
	@IdCtt BIGINT = NULL,
	@PrfMtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@SitInd CHAR(1) = NULL,
	@BnfMtr VARCHAR(20) = NULL,
	@GiaCrt CHAR(1) = NULL,
	@ParMed NUMERIC(18,2) = NULL,
	@ParQtd NUMERIC(18,2) = NULL,
	@ParVlr NUMERIC(18,2) = NULL,
	@OutTot NUMERIC(18,2) OUTPUT
AS	DECLARE	-- VARIÁVEIS		@Sql NVARCHAR(MAX),		@WhereSol NVARCHAR(MAX) = '',		@WhereGia NVARCHAR(MAX) = ''			-- PARÊMETROS PARA SOLICITAÇÃO	IF (@IdEsp IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '	IF (@PrfMtr IS NOT NULL)		SET @WhereSol += N'AND	Prf_Mtr = @PrfMtr '	IF (@IdSit IS NOT NULL)		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '	IF (@SitInd IS NOT NULL)		SET @WhereSol += N'AND	Sit_Ind = @SitInd '	IF (@BnfMtr IS NOT NULL)		SET @WhereSol += N'AND	Bnf_Mtr = @BnfMtr '	IF (@GiaCrt IS NOT NULL)		SET @WhereSol += N'AND	Sol_Crt = @GiaCrt '	-- PARÂMETROS PARA CONSULTA E SP/SADT	IF (@IdEsp IS NOT NULL)		SET @WhereGia += N'AND	c.Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdCtt = @IdCtt '	IF (@PrfMtr IS NOT NULL)		SET @WhereGia += N'AND	Prf_Mtr = @PrfMtr '	IF (@IdSit IS NOT NULL)		SET @WhereGia += N'AND	Gpd_IdSit = @IdSit '	IF (@SitInd IS NOT NULL)		SET @WhereGia += N'AND	Sit_Ind = @SitInd '	IF (@BnfMtr IS NOT NULL)		SET @WhereGia += N'AND	Bnf_Mtr = @BnfMtr '	IF (@GiaCrt IS NOT NULL)		SET @WhereGia += N'AND	Gia_Crt = @GiaCrt '				SET @Sql = N'		WITH cte (IdEsp, IdPrf, QtdCon, QtdSol, QtdExaTot, QtdExaPrf, VlrCon, VlrExaTot,					 VlrExaPrf, Eag, VlrEag, Ch_)		AS			(					SELECT	-- CONSULTAS					Gia_IdEsp, 					Gia_IdPrf,					SUM(Gpd_QtdSol), -- QtdCon 					0.0, -- QtdSol					0, -- QtdExaTot,					0, -- QtdExaPrf,					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz), -- VlrCon					0.0, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag, 					0.0, -- VlrEag					0.0 -- Ch_				FROM					dbo.Atz_Gia c INNER JOIN					dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN					dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Gia_IdPrf = IdPrf LEFT OUTER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc				WHERE						Gia_Tip = 1 AND					Gpd_Dat BETWEEN @DatIni AND @DatFim					'+ @WhereGia +'				GROUP BY 					Gia_IdEsp, 					Gia_IdPrf, 					Gia_IdPrfSol								UNION ALL								SELECT	-- SOLICITAÇÕES					Sol_IdEsp,					Sol_IdPrfSol, 					0, -- QtdCon 					SUM(Spd_QtdSol), -- QtdSol 					0, -- QtdExaTot					0, -- QtdExaPrf					0.0, -- VlrCon					0.0, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag, 					0.0, -- VlrEag					SUM(Pdm_QtdCh_*Spd_QtdSol) -- Ch_				FROM						dbo.Atz_Sol INNER JOIN					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf INNER JOIN					dbo.Atz_Pdm ON Spd_IdPdm = IdPdm				WHERE					Spd_Dat BETWEEN @DatIni AND @DatFim AND					Sol_IdEsp = @IdEsp					'+ @WhereSol +'				GROUP BY 					Sol_IdEsp, 					Sol_IdPrfSol WITH ROLLUP				UNION ALL								SELECT	-- SP/SADT solicitada pelo profissional					c.Gia_IdEsp, 					e.Gia_IdPrfSol,					0, -- QtdCon					0, -- QtdSol					SUM(Gpd_QtdAtz), -- QtdExaTot					0, -- QtdExaPrf					0, -- VlrCon					SUM((Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr, -- VlrExaTot					0.0, -- VlrExaPrf					0.0, -- Eag					0.0, -- VlrEag					0.0 -- Ch_				FROM						dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c, dbo.Atz_Ngc, dbo.Atz_Pdm				WHERE	c.IdGia = e.Gia_IdGiaPrc				AND		e.IdGia = Gpd_IdGia						AND		IdSit = Gpd_IdSit				AND		IdNgc = Gpd_IdNgc				AND		IdPdm = Gpd_IdPdm				AND		Sit_Ind = ''A''					AND		c.Gia_Tip = 1					AND		c.Gia_DatAtd BETWEEN @DatIni AND @DatFim				AND		c.Gia_IdEsp = @IdEsp				'+ @WhereGia +'				GROUP BY					c.Gia_IdEsp, 					e.Gia_IdPrfSol									UNION ALL												SELECT	-- SP/SADT executada pelo profissional (pode ter sido solicitado por outro profissional)					c.Gia_IdEsp, 					e.Gia_IdPrf,					0, -- QtdCon					0, -- QtdSol					0, -- QtdExaTot					SUM(Gpd_QtdAtz), -- QtdExaPrf					0, -- VlrCon					0.0, -- VlrExaTot					SUM((Ngc_Vlr + ISNULL(Ngc_VlrFlm, 0) * ISNULL(Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr, -- VlrExaPrf					SUM(CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN Gpd_QtdAtz ELSE 0 END), -- Cálculo EAG 					SUM(CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz ELSE 0 END), -- VlrEag					0.0 -- Ch_				FROM						dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c, dbo.Atz_Ngc, dbo.Atz_Pdm				WHERE	c.IdGia = e.Gia_IdGiaPrc				AND		e.IdGia = Gpd_IdGia						AND		IdSit = Gpd_IdSit				AND		IdNgc = Gpd_IdNgc				AND		IdPdm = Gpd_IdPdm				AND		Sit_Ind = ''A''					AND		c.Gia_Tip = 1					AND		c.Gia_DatAtd BETWEEN @DatIni AND @DatFim				AND		c.Gia_IdEsp = @IdEsp				'+ @WhereGia +'									GROUP BY					c.Gia_IdEsp,					e.Gia_IdPrf			)					SELECT  			Esp_Dsc, 			Prf_Mtr, 			Prf_Nme, 			SUM(QtdCon) AS QtdCon,			CONVERT(NUMERIC(18,2),SUM(VlrCon)) AS VlrCon,			CONVERT(NUMERIC(18,2),SUM(VlrCon/CASE QtdCon WHEN 0 THEN NULL ELSE QtdCon END)) AS MedCon,			SUM(QtdSol) AS QtdSol,			SUM(Ch_) AS Ch_,			CONVERT(NUMERIC(18,2),SUM(QtdSol)/CASE SUM(QtdCon) WHEN 0 THEN NULL ELSE SUM(QtdCon) END) AS MedSol,			SUM(QtdExaPrf) AS QtdExaPrf,			CONVERT(NUMERIC(18,2),SUM(VlrExaPrf)) AS VlrExaPrf,			SUM(QtdExaTot) AS QtdExaTot,			CONVERT(NUMERIC(18,2),SUM(VlrExaTot)) AS VlrExaTot,			CONVERT(NUMERIC(18,2),SUM(VlrCon + VlrExaPrf)) AS Vlr, 			CONVERT(NUMERIC(18,2),SUM(VlrCon + VlrExaTot + VlrExaPrf)) AS VlrTot,			SUM(Eag) AS Eag, 			SUM(VlrEag) AS VlrEag,			(	CASE 					WHEN ISNULL((SUM(QtdSol)/CASE SUM(QtdCon) WHEN 0 THEN NULL ELSE SUM(QtdCon) END),0.0) <= @ParMed THEN 1 				ELSE 0 END			) +			(				CASE WHEN ISNULL(SUM(QtdCon),0.0) >= @ParQtd THEN 1 ELSE 0 END			) +			(				CASE 					WHEN ISNULL((SUM(VlrCon/CASE QtdCon WHEN 0 THEN NULL ELSE QtdCon END)),0.0) <= @ParVlr THEN 1 				ELSE 0 END			) AS Pto		FROM	cte INNER JOIN				dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp INNER JOIN				dbo.Atz_Prf p ON cte.IdPrf = p.IdPrf		GROUP BY			Esp_Dsc, 			Prf_Mtr, 			Prf_Nme		ORDER BY 			Prf_Nme '		EXEC SP_EXECUTESQL 		@Sql,		N'		@DatIni SMALLDATETIME,		@DatFim SMALLDATETIME,		@IdEsp INT,		@IdCtt BIGINT,		@Prf_Mtr VARCHAR(20),		@IdSit TINYINT,		@SitInd CHAR(1),		@BnfMtr VARCHAR(20),		@GiaCrt CHAR(1),		@ParMed NUMERIC(18,2),		@ParQtd NUMERIC(18,2),		@ParVlr NUMERIC(18,2)',		@DatIni,		@DatFim,		@IdEsp,		@IdCtt,		@PrfMtr,		@IdSit,		@SitInd,		@BnfMtr,		@GiaCrt,		@ParMed,		@ParQtd,		@ParVlr	--PRINT @Sql	--PRINT @WhereSol	--PRINT @WhereGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePrfMes___]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 19/04/2010
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade e mês
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePrfMes___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
	DECLARE @WHEREGIA NVARCHAR(1000), @WHERESOL NVARCHAR(1000),
			@SQL NVARCHAR(4000)
			
	SET @SQL = ''
	SET @WHEREGIA = ''
	SET @WHERESOL = ''				
		
	IF @IdEsp IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdEsp = @IdEsp '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdEsp = @IdEsp '
	END

	IF @IdCtt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdCtt = @IdCtt '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdCtt = @IdCtt '
	END
		
	IF @IdSit IS NOT NULL
	BEGIN 
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_IdSit = @IdSit '
		SET @WHERESOL = @WHERESOL + N'AND Spd_IdSit = @IdSit '
	END	

	IF @Bnf_Mtr IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Bnf_Mtr = @Bnf_Mtr '
		SET @WHERESOL = @WHERESOL + N'AND Bnf_Mtr = @Bnf_Mtr '
	END

	IF @DatIni IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_DatRel >= @DatIni '
		SET @WHERESOL = @WHERESOL + N'AND Spd_Dat >= @DatIni '
	END

	IF @DatFim IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_DatRel <= @DatFim '
		SET @WHERESOL = @WHERESOL + N'AND Spd_Dat <= @DatFim '
	END

	IF @Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdPrf = (
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 ) '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdPrfSol = (
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 ) '
	END
	
	IF @Sit_Ind IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Sit_Ind = @Sit_Ind '
		SET @WHERESOL = @WHERESOL + N'AND Sit_Ind = @Sit_Ind '
	END
	
	IF @Gia_Crt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Crt = @Gia_Crt '
		SET @WHERESOL = @WHERESOL + N'AND Sol_Crt = @Gia_Crt '
	END


	SET @SQL = N'
		SELECT 
			CASE Mes 
			WHEN 01 THEN ''JAN/'' + LTRIM(STR(Ano))
			WHEN 02 THEN ''FEV/'' + LTRIM(STR(Ano))
			WHEN 03 THEN ''MAR/'' + LTRIM(STR(Ano))
			WHEN 04 THEN ''ABR/'' + LTRIM(STR(Ano))
			WHEN 05 THEN ''MAI/'' + LTRIM(STR(Ano))
			WHEN 06 THEN ''JUN/'' + LTRIM(STR(Ano))
			WHEN 07 THEN ''JUL/'' + LTRIM(STR(Ano))
			WHEN 08 THEN ''AGO/'' + LTRIM(STR(Ano))
			WHEN 09 THEN ''SET/'' + LTRIM(STR(Ano))
			WHEN 10 THEN ''OUT/'' + LTRIM(STR(Ano))
			WHEN 11 THEN ''NOV/'' + LTRIM(STR(Ano))
			WHEN 12 THEN ''DEZ/'' + LTRIM(STR(Ano))
		END AS AnoMes,
		Esp_Dsc, Prf_Mtr, Prf_Nme, SUM(QtdCon) AS QtdCon, SUM(QtdSol) AS QtdSol, SUM(QtdExa) AS QtdExa, 
		CASE SUM(QtdCon) WHEN 0 THEN 0 ELSE SUM(QtdSol)/SUM(QtdCon) END AS Med, 
		CASE SUM(QtdCon) WHEN 0 THEN 0 ELSE SUM(QtdSol)/SUM(QtdCon)*100 END AS Prc, 
		SUM(Eag) AS Eag, SUM(Vlr) AS Vlr		
		FROM (
				SELECT	1 AS Ord, 1 AS Tip, YEAR(Gpd_DatRel) AS Ano, MONTH(Gpd_DatRel) AS Mes, Esp_Dsc, Prf_Mtr, Prf_Nme,
					SUM(ISNULL(Gpd_QtdAtz,0.0)) AS QtdCon, 0.0 AS QtdSol, 0.0 AS QtdExa, 
					SUM(CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN 1 ELSE 0 END) AS Eag, 
					SUM(dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz) AS Vlr
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Ngc, dbo.Atz_Bnf, dbo.Atz_Prf
				WHERE	IdGia =  Gpd_IdGia
				AND		IdSit =  Gpd_IdSit
				AND		IdEsp =  Gia_IdEsp
				AND		IdNgc =* Gpd_IdNgc
				AND		IdBnf =  Gia_IdBnf
				AND		IdPrf =  Gia_IdPrf
				AND		Gia_Tip = 1
				AND		Gpd_IdSit <> 10
				'+ @WHEREGIA +'
				GROUP BY YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc, Prf_Mtr, Prf_Nme
				
				UNION ALL
				
				SELECT	1, 2, YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc, Prf_Mtr, Prf_Nme,
					0.0 AS QtdCon, 0.0 AS QtdSol, SUM(ISNULL(Gpd_QtdAtz,0.0)) AS QtdExa,
					SUM(CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN 1 ELSE 0 END) AS Eag, 
					SUM(dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz)
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Ngc, dbo.Atz_Bnf, dbo.Atz_Prf
				WHERE	IdGia =  Gpd_IdGia
				AND		IdSit =  Gpd_IdSit
				AND		IdEsp =  Gia_IdEsp
				AND		IdNgc =* Gpd_IdNgc
				AND		IdBnf =  Gia_IdBnf
				AND		IdPrf =  Gia_IdPrf
				AND		Gia_Tip = 2
				AND		Gpd_IdSit <> 10
				'+ @WHEREGIA +'
				GROUP BY YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc, Prf_Mtr, Prf_Nme

				
				UNION ALL
				
				SELECT	1, 0, YEAR(Spd_Dat), MONTH(Spd_Dat), Esp_Dsc, Prf_Mtr, Prf_Nme,
					0.0, SUM(ISNULL(Spd_QtdSol,0)), 0.0, 0.0, 0.0
				FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Bnf, dbo.Atz_Prf
				WHERE	IdSol = Spd_IdSol
				AND		IdSit = Spd_IdSit
				AND		IdEsp = Sol_IdEsp
				AND		IdBnf = Sol_IdBnf
				AND		IdPrf = Sol_IdPrfSol
				AND		Spd_IdSit <> 10
				'+ @WHERESOL +'
				GROUP BY YEAR(Spd_Dat), MONTH(Spd_Dat), Esp_Dsc, Prf_Mtr, Prf_Nme
			) AS  Result			
		GROUP BY Ano, Mes, Esp_Dsc, Prf_Mtr, Prf_Nme
		ORDER BY Esp_Dsc, Prf_Nme, Ano, Mes	'	
		
	EXEC SP_EXECUTESQL @SQL,
			N'@DatIni SMALLDATETIME, @DatFim SMALLDATETIME, @IdEsp SMALLINT, @IdSit TINYINT,
			@Prf_Mtr VARCHAR(20), @Sit_Ind CHAR(1),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Gia_Crt CHAR(1)  ',
				@DatIni, @DatFim, @IdEsp, @IdSit, @Prf_Mtr, @Sit_Ind, @Bnf_Mtr, @IdCtt, @Gia_Crt	

-- PRINT @SQL
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePrfMes]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 19/04/2010
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade e mês
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePrfMes]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
DECLARE	-- VARIÁVEIS	@Sql NVARCHAR(MAX),	@WhereSol NVARCHAR(MAX) = '',	@WhereGia NVARCHAR(MAX) = ''			-- PARÊMETROS PARA SOLICITAÇÃO	IF (@IdEsp IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereSol += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereSol += N'AND	Sol_Crt = @Gia_Crt '	-- PARÂMETROS PARA CONSULTA E SP/SADT	IF (@IdEsp IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereGia += N'AND	Gpd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereGia += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereGia += N'AND	Gia_Crt = @Gia_Crt '				SET @Sql = N'		WITH cte (Ano, Mes, IdEsp, IdPrf, Qtd_Con, Qtd_Sol, Qtd_Exa, Eag, Ngc_Vlr)		AS			(					SELECT					YEAR(Spd_Dat),					MONTH(Spd_Dat),					Sol_IdEsp,					Sol_IdPrfSol, 					0 AS Qtd_Con, 					SUM(Spd_QtdSol) AS Qtd_Sol, 					0 AS Qtd_Exa, 					0 AS Eag, 					0 AS Ngc_Vlr				FROM						dbo.Atz_Sol INNER JOIN					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf				WHERE					Spd_Dat BETWEEN @DatIni AND @DatFim 					'+ @WhereSol +'				GROUP BY 					YEAR(Spd_Dat),					MONTH(Spd_Dat),					Sol_IdEsp, 					Sol_IdPrfSol WITH ROLLUP								UNION ALL								SELECT					YEAR(Gpd_Dat),					MONTH(Gpd_Dat),						Gia_IdEsp, 					Gia_IdPrf,					SUM(CASE Gia_Tip WHEN 1 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Con, 					0 AS Qtd_Sol, 					SUM(CASE Gia_Tip WHEN 2 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Exa, 					CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN SUM(Gpd_QtdSol) ELSE 0 END AS Eag, 					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(dbo.Atz_Ngc.Ngc_VlrFlm, 0) * ISNULL(dbo.Atz_Pdm.Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr				FROM					dbo.Atz_Gia INNER JOIN					dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN					dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Gia_IdPrf = IdPrf LEFT OUTER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc				WHERE						Gpd_Dat BETWEEN @DatIni AND @DatFim					'+ @WhereGia +'				GROUP BY 					YEAR(Gpd_Dat),					MONTH(Gpd_Dat), 					Gia_IdEsp, 					Gia_IdPrf, 					Gia_IdPrfSol			)		SELECT 			CASE Mes 				WHEN 01 THEN ''JAN/'' + LTRIM(STR(Ano))				WHEN 02 THEN ''FEV/'' + LTRIM(STR(Ano))				WHEN 03 THEN ''MAR/'' + LTRIM(STR(Ano))				WHEN 04 THEN ''ABR/'' + LTRIM(STR(Ano))				WHEN 05 THEN ''MAI/'' + LTRIM(STR(Ano))				WHEN 06 THEN ''JUN/'' + LTRIM(STR(Ano))				WHEN 07 THEN ''JUL/'' + LTRIM(STR(Ano))				WHEN 08 THEN ''AGO/'' + LTRIM(STR(Ano))				WHEN 09 THEN ''SET/'' + LTRIM(STR(Ano))				WHEN 10 THEN ''OUT/'' + LTRIM(STR(Ano))				WHEN 11 THEN ''NOV/'' + LTRIM(STR(Ano))				WHEN 12 THEN ''DEZ/'' + LTRIM(STR(Ano))			END AS AnoMes,			e.Esp_Dsc, 			p.Prf_Mtr, 			p.Prf_Nme,  			SUM(Qtd_Con) AS QtdCon, 			SUM(Qtd_Sol) AS QtdSol, 			SUM(Qtd_Exa) AS QtdExa,			CONVERT(NUMERIC(18,2),SUM(Qtd_Sol)/CASE SUM(Qtd_Con) WHEN 0 THEN 1 ELSE CONVERT(NUMERIC(18,2),SUM(Qtd_Con)) END) AS Med,			CONVERT(NUMERIC(18,2),SUM(Qtd_Sol)/CONVERT(NUMERIC(18,2),(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL))*100) AS Prc,			SUM(Eag) AS Eag,			CONVERT(NUMERIC(18,2),SUM(Ngc_Vlr)) AS Vlr--,						--(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL)/			--(SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(Qtd_Con,0))) FROM cte) AS EagTot		FROM			cte INNER JOIN			dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp INNER JOIN			dbo.Atz_Prf p ON cte.IdPrf = p.IdPrf		WHERE 			cte.IdEsp IS NOT NULL -- Para não exibir a totalização das solitições obtida pelo ROLLUP		GROUP BY 			cte.Ano,			cte.Mes,			e.IdEsp, 			e.Esp_Dsc, 			p.Prf_Mtr, 			p.Prf_Nme			ORDER BY 			e.Esp_Dsc, 			p.Prf_Nme, 			cte.Ano, 			cte.Mes '		EXEC SP_EXECUTESQL 		@Sql,		N'		@DatIni SMALLDATETIME,		@DatFim SMALLDATETIME,		@IdEsp INT,		@IdCtt BIGINT,		@Prf_Mtr VARCHAR(20),		@IdSit TINYINT,		@Sit_Ind CHAR(1),		@Bnf_Mtr VARCHAR(20),		@Gia_Crt CHAR(1)',		@DatIni,		@DatFim,		@IdEsp,		@IdCtt,		@Prf_Mtr,		@IdSit,		@Sit_Ind,		@Bnf_Mtr,		@Gia_Crt	--PRINT @Sql	--PRINT @WhereSol	--PRINT @WhereGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AceEspMes___]    Script Date: 12/18/2012 09:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 19/04/2010
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade e mês
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AceEspMes___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
	DECLARE @WHEREGIA NVARCHAR(1000), @WHERESOL NVARCHAR(1000),
			@SQL NVARCHAR(4000)
			
	SET @SQL = ''
	SET @WHEREGIA = ''
	SET @WHERESOL = ''				 
		
	IF @IdEsp IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdEsp = @IdEsp '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdEsp = @IdEsp '
	END

	IF @IdCtt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdCtt = @IdCtt '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdCtt = @IdCtt '
	END
		
	IF @IdSit IS NOT NULL
	BEGIN 
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_IdSit = @IdSit '
		SET @WHERESOL = @WHERESOL + N'AND Spd_IdSit = @IdSit '
	END	

	IF @Bnf_Mtr IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Bnf_Mtr = @Bnf_Mtr '
		SET @WHERESOL = @WHERESOL + N'AND Bnf_Mtr = @Bnf_Mtr '
	END

	IF @DatIni IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_DatRel >= @DatIni '
		SET @WHERESOL = @WHERESOL + N'AND Spd_Dat >= @DatIni '
	END

	IF @DatFim IS NOT NULL 
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gpd_DatRel <= @DatFim '
		SET @WHERESOL = @WHERESOL + N'AND Spd_Dat <= @DatFim '
	END

	IF @Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_IdPrf = (
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 ) '
		SET @WHERESOL = @WHERESOL + N'AND Sol_IdPrfSol = (
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 ) '
	END
	
	IF @Sit_Ind IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Sit_Ind = @Sit_Ind '
		SET @WHERESOL = @WHERESOL + N'AND Sit_Ind = @Sit_Ind '
	END
	
	IF @Gia_Crt IS NOT NULL
	BEGIN
		SET @WHEREGIA = @WHEREGIA + N'AND Gia_Crt = @Gia_Crt '
		SET @WHERESOL = @WHERESOL + N'AND Sol_Crt = @Gia_Crt '
	END


	SET @SQL = N'
		SELECT 
			CASE Mes 
			WHEN 01 THEN ''JAN/'' + LTRIM(STR(Ano))
			WHEN 02 THEN ''FEV/'' + LTRIM(STR(Ano))
			WHEN 03 THEN ''MAR/'' + LTRIM(STR(Ano))
			WHEN 04 THEN ''ABR/'' + LTRIM(STR(Ano))
			WHEN 05 THEN ''MAI/'' + LTRIM(STR(Ano))
			WHEN 06 THEN ''JUN/'' + LTRIM(STR(Ano))
			WHEN 07 THEN ''JUL/'' + LTRIM(STR(Ano))
			WHEN 08 THEN ''AGO/'' + LTRIM(STR(Ano))
			WHEN 09 THEN ''SET/'' + LTRIM(STR(Ano))
			WHEN 10 THEN ''OUT/'' + LTRIM(STR(Ano))
			WHEN 11 THEN ''NOV/'' + LTRIM(STR(Ano))
			WHEN 12 THEN ''DEZ/'' + LTRIM(STR(Ano))
		END AS AnoMes,
		Esp_Dsc, SUM(QtdCon) AS QtdCon, SUM(QtdSol) AS QtdSol, SUM(QtdExa) AS QtdExa, 
		CASE SUM(QtdCon) WHEN 0 THEN 0 ELSE SUM(QtdSol)/SUM(QtdCon) END AS Med, 
		CASE SUM(QtdCon) WHEN 0 THEN 0 ELSE SUM(QtdSol)/SUM(QtdCon)*100 END AS Prc, 
		SUM(Eag) AS Eag, SUM(Vlr) AS Vlr		
		FROM (
				SELECT	1 AS Ord, 1 AS Tip, YEAR(Gpd_DatRel) AS Ano, MONTH(Gpd_DatRel) AS Mes,
					Esp_Dsc, SUM(ISNULL(Gpd_QtdAtz,0.0)) AS QtdCon, 0.0 AS QtdSol, 0.0 AS QtdExa, 
					SUM(CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN 1 ELSE 0.0 END) AS Eag, 
					SUM(dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz) AS Vlr
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Ngc, dbo.Atz_Bnf
				WHERE	IdGia =  Gpd_IdGia
				AND		IdSit =  Gpd_IdSit
				AND		IdEsp =  Gia_IdEsp
				AND		IdNgc =* Gpd_IdNgc
				AND		IdBnf =  Gia_IdBnf
				AND		Gia_Tip = 1
				AND		Gpd_IdSit <> 10
				'+ @WHEREGIA +'
				GROUP BY YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc
				
				UNION ALL
				
				SELECT	1, 2, YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc, 0, 0, SUM(ISNULL(Gpd_QtdAtz,0)), 
					SUM(CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN 1 ELSE 0 END) AS Eag, 
					SUM(dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz)
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Ngc, dbo.Atz_Bnf
				WHERE	IdGia =  Gpd_IdGia
				AND		IdSit =  Gpd_IdSit
				AND		IdEsp =  Gia_IdEsp
				AND		IdNgc =* Gpd_IdNgc
				AND		IdBnf =  Gia_IdBnf
				AND		Gia_Tip = 2
				AND		Gpd_IdSit <> 10
				'+ @WHEREGIA +'
				GROUP BY YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Esp_Dsc
				
				UNION ALL
				
				SELECT	1, 0, YEAR(Spd_Dat), MONTH(Spd_Dat), Esp_Dsc, 0, SUM(ISNULL(Spd_QtdRel,0)), 0,  
					0, 0
				FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit, dbo.Atz_Esp, dbo.Atz_Bnf
				WHERE	IdSol = Spd_IdSol
				AND		IdSit = Spd_IdSit
				AND		IdEsp = Sol_IdEsp
				AND		IdBnf = Sol_IdBnf
				AND		Spd_IdSit <> 10
				'+ @WHERESOL +'
				GROUP BY YEAR(Spd_Dat), MONTH(Spd_Dat), Esp_Dsc 
				) AS Result 
			
			GROUP BY Ano, Mes, Esp_Dsc
			ORDER BY Esp_Dsc, Ano, Mes '	
		
	EXEC SP_EXECUTESQL @SQL,
			N'@DatIni SMALLDATETIME, @DatFim SMALLDATETIME, @IdEsp SMALLINT, @IdSit TINYINT,
			@Prf_Mtr VARCHAR(20), @Sit_Ind CHAR(1),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Gia_Crt CHAR(1)  ',
				@DatIni, @DatFim, @IdEsp, @IdSit, @Prf_Mtr, @Sit_Ind, @Bnf_Mtr, @IdCtt, @Gia_Crt	

--PRINT @SQL
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AceEspMes]    Script Date: 12/18/2012 09:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 19/04/2010
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade e mês
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AceEspMes]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
	DECLARE		-- VARIÁVEIS		@Sql NVARCHAR(MAX),		@WhereSol NVARCHAR(MAX) = '',		@WhereGia NVARCHAR(MAX) = ''		-- PARÊMETROS PARA SOLICITAÇÃO	IF (@IdEsp IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereSol += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereSol += N'AND	Sol_Crt = @Gia_Crt '	-- PARÂMETROS PARA CONSULTA E SP/SADT	IF (@IdEsp IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereGia += N'AND	Gpd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereGia += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereGia += N'AND	Gia_Crt = @Gia_Crt '				SET @Sql = N'		WITH cte (Ano, Mes, IdEsp, Qtd_Con, Qtd_Sol, Qtd_Exa, Eag, Ngc_Vlr)		AS			(					SELECT					YEAR(Spd_Dat),					MONTH(Spd_Dat),					Sol_IdEsp, 					0 AS Qtd_Con, 					SUM(Spd_QtdSol) AS Qtd_Sol, 					0 AS Qtd_Exa, 					0 AS Eag, 					0 AS Ngc_Vlr				FROM						dbo.Atz_Sol INNER JOIN					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf				WHERE					Spd_Dat BETWEEN @DatIni AND @DatFim 					'+ @WhereSol +'				GROUP BY 					YEAR(Spd_Dat),					MONTH(Spd_Dat),					Sol_IdEsp WITH ROLLUP								UNION ALL								SELECT					YEAR(Gpd_Dat),					MONTH(Gpd_Dat),					Gia_IdEsp, 					SUM(CASE Gia_Tip WHEN 1 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Con, 					0 AS Qtd_Sol, 					SUM(CASE Gia_Tip WHEN 2 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Exa, 					CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN SUM(Gpd_QtdSol) ELSE 0 END AS Eag, 					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(dbo.Atz_Ngc.Ngc_VlrFlm, 0) * ISNULL(dbo.Atz_Pdm.Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr				FROM					dbo.Atz_Gia INNER JOIN					dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN					dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Gia_IdPrf = IdPrf LEFT OUTER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc				WHERE						Gpd_Dat BETWEEN @DatIni AND @DatFim					'+ @WhereGia +'				GROUP BY					YEAR(Gpd_Dat),					MONTH(Gpd_Dat), 					Gia_IdEsp, 					Gia_IdPrf, 					Gia_IdPrfSol			)		SELECT 			CASE Mes 				WHEN 01 THEN ''JAN/'' + LTRIM(STR(Ano))				WHEN 02 THEN ''FEV/'' + LTRIM(STR(Ano))				WHEN 03 THEN ''MAR/'' + LTRIM(STR(Ano))				WHEN 04 THEN ''ABR/'' + LTRIM(STR(Ano))				WHEN 05 THEN ''MAI/'' + LTRIM(STR(Ano))				WHEN 06 THEN ''JUN/'' + LTRIM(STR(Ano))				WHEN 07 THEN ''JUL/'' + LTRIM(STR(Ano))				WHEN 08 THEN ''AGO/'' + LTRIM(STR(Ano))				WHEN 09 THEN ''SET/'' + LTRIM(STR(Ano))				WHEN 10 THEN ''OUT/'' + LTRIM(STR(Ano))				WHEN 11 THEN ''NOV/'' + LTRIM(STR(Ano))				WHEN 12 THEN ''DEZ/'' + LTRIM(STR(Ano))			END AS AnoMes,			e.Esp_Dsc, 			SUM(Qtd_Con) AS QtdCon, 			SUM(Qtd_Sol) AS QtdSol, 			SUM(Qtd_Exa) AS QtdExa,			CONVERT(NUMERIC(18,2),SUM(Qtd_Sol)/CASE SUM(Qtd_Con) WHEN 0 THEN 1 ELSE CONVERT(NUMERIC(18,2),SUM(Qtd_Con)) END) AS Med,			CONVERT(NUMERIC(18,2),SUM(Qtd_Sol)/CONVERT(NUMERIC(18,2),(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL))*100) AS Prc,			SUM(Eag) AS Eag,			CONVERT(NUMERIC(18,2),SUM(Ngc_Vlr)) AS Vlr--,						--(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL)/			--(SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(Qtd_Con,0))) FROM cte) AS EagTot		FROM			cte INNER JOIN			dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp		WHERE 			cte.IdEsp IS NOT NULL -- Para não exibir a totalização das solitições obtida pelo ROLLUP		GROUP BY			cte.Ano,			cte.Mes, 			e.Esp_Dsc		ORDER BY 			e.Esp_Dsc,			cte.Ano,			cte.Mes '		EXEC SP_EXECUTESQL 		@Sql,		N'		@DatIni SMALLDATETIME,		@DatFim SMALLDATETIME,		@IdEsp INT,		@IdCtt BIGINT,		@Prf_Mtr VARCHAR(20),		@IdSit TINYINT,		@Sit_Ind CHAR(1),		@Bnf_Mtr VARCHAR(20),		@Gia_Crt CHAR(1)',		@DatIni,		@DatFim,		@IdEsp,		@IdCtt,		@Prf_Mtr,		@IdSit,		@Sit_Ind,		@Bnf_Mtr,		@Gia_Crt	--PRINT @Sql	--PRINT @WhereSol	--PRINT @WhereGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePrf]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 05/06/2009
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePrf]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS	
DECLARE	-- VARIÁVEIS	@Sql NVARCHAR(MAX),	@WhereSol NVARCHAR(MAX) = '',	@WhereGia NVARCHAR(MAX) = ''		-- PARÊMETROS PARA SOLICITAÇÃO	IF (@IdEsp IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereSol += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereSol += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereSol += N'AND	Sol_Crt = @Gia_Crt '	-- PARÂMETROS PARA CONSULTA E SP/SADT	IF (@IdEsp IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdEsp = @IdEsp '	IF (@IdCtt IS NOT NULL)		SET @WhereGia += N'AND	Gia_IdCtt = @IdCtt '	IF (@Prf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Prf_Mtr = @Prf_Mtr '	IF (@IdSit IS NOT NULL)		SET @WhereGia += N'AND	Gpd_IdSit = @IdSit '	IF (@Sit_Ind IS NOT NULL)		SET @WhereGia += N'AND	Sit_Ind = @Sit_Ind '	IF (@Bnf_Mtr IS NOT NULL)		SET @WhereGia += N'AND	Bnf_Mtr = @Bnf_Mtr '	IF (@Gia_Crt IS NOT NULL)		SET @WhereGia += N'AND	Gia_Crt = @Gia_Crt '				SET @Sql = N'		DECLARE @tbl TABLE 		( 			Esp_Dsc VARCHAR(80),			Prf_Mtr VARCHAR(20),			Prf_Nme VARCHAR(70),			QtdCon INT,			QtdSol INT, 			QtdExa INT,			Med NUMERIC(18,2),			Prc NUMERIC(18,2),			Eag	INT,			Vlr NUMERIC(18,2)		) 				WITH cte (IdEsp, IdPrf, Qtd_Con, Qtd_Sol, Qtd_Exa, Eag, Ngc_Vlr)		AS			(					SELECT						Sol_IdEsp,					Sol_IdPrfSol, 					0 AS Qtd_Con, 					SUM(Spd_QtdSol) AS Qtd_Sol, 					0 AS Qtd_Exa, 					0 AS Eag, 					0 AS Ngc_Vlr				FROM						dbo.Atz_Sol INNER JOIN					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf				WHERE					Spd_Dat BETWEEN @DatIni AND @DatFim 					'+ @WhereSol +'				GROUP BY 					Sol_IdEsp, 					Sol_IdPrfSol WITH ROLLUP								UNION ALL								SELECT						Gia_IdEsp, 					Gia_IdPrf,					SUM(CASE Gia_Tip WHEN 1 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Con, 					0 AS Qtd_Sol, 					SUM(CASE Gia_Tip WHEN 2 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Exa, 					CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN SUM(Gpd_QtdSol) ELSE 0 END AS Eag, 					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(dbo.Atz_Ngc.Ngc_VlrFlm, 0) * ISNULL(dbo.Atz_Pdm.Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr				FROM					dbo.Atz_Gia INNER JOIN					dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN					dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN					dbo.Atz_Prf ON Gia_IdPrf = IdPrf LEFT OUTER JOIN					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc				WHERE						Gpd_Dat BETWEEN @DatIni AND @DatFim					'+ @WhereGia +'				GROUP BY 					Gia_IdEsp, 					Gia_IdPrf, 					Gia_IdPrfSol			)		INSERT @tbl			SELECT  				e.Esp_Dsc, 				p.Prf_Mtr,				p.Prf_Nme,				SUM(Qtd_Con) AS Qtd_Con, 				SUM(Qtd_Sol) AS Qtd_Sol, 				SUM(Qtd_Exa) AS Qtd_Exa,				SUM(Qtd_Sol)/CASE SUM(Qtd_Con) WHEN 0 THEN 1 ELSE CONVERT(NUMERIC(18,2),SUM(Qtd_Con)) END AS Med,				SUM(Qtd_Sol)/CONVERT(NUMERIC(18,2),				(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL))*100 AS Prc,				SUM(Eag) AS Eag,				SUM(Ngc_Vlr) AS Ngc_Vlr--,								--(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL)/				--(SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(Qtd_Con,0))) FROM cte) AS EagTot			FROM				cte INNER JOIN				dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp INNER JOIN				dbo.Atz_Prf p ON cte.IdPrf = p.IdPrf			WHERE 				cte.IdEsp IS NOT NULL -- Para não exibir a totalização das solitições obtida pelo ROLLUP			GROUP BY				e.Esp_Dsc, 				p.Prf_Mtr, 				p.Prf_Nme				ORDER BY 				e.Esp_Dsc,				p.Prf_Nme 				SELECT *		FROM @tbl				SET @Out_Tot = 			(					SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(QtdSol,0))) FROM @tbl			)/			(				SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(QtdCon,0))) FROM @tbl			)								'	EXEC SP_EXECUTESQL 		@Sql,		N'		@DatIni SMALLDATETIME,		@DatFim SMALLDATETIME,		@IdEsp INT,		@IdCtt BIGINT,		@Prf_Mtr VARCHAR(20),		@IdSit TINYINT,		@Sit_Ind CHAR(1),		@Bnf_Mtr VARCHAR(20),		@Gia_Crt CHAR(1),		@Out_Tot NUMERIC(18,2) OUTPUT',		@DatIni,		@DatFim,		@IdEsp,		@IdCtt,		@Prf_Mtr,		@IdSit,		@Sit_Ind,		@Bnf_Mtr,		@Gia_Crt,		@Out_Tot OUTPUT	--PRINT @Out_Tot	--PRINT @Sql	--PRINT @WhereSol	--PRINT @WhereGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AceEsp]    Script Date: 12/18/2012 09:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 05/06/2009
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AceEsp]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL, 
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS

DECLARE
	-- VARIÁVEIS
	@Sql NVARCHAR(MAX),
	@WhereSol NVARCHAR(MAX) = '',
	@WhereGia NVARCHAR(MAX) = ''
	
	
	
	-- PARÊMETROS PARA SOLICITAÇÃO
	IF (@IdEsp IS NOT NULL)
		SET @WhereSol += N'AND	Sol_IdEsp = @IdEsp '
	IF (@IdCtt IS NOT NULL)
		SET @WhereSol += N'AND	Sol_IdCtt = @IdCtt '
	IF (@Prf_Mtr IS NOT NULL)
		SET @WhereSol += N'AND	Prf_Mtr = @Prf_Mtr '
	IF (@IdSit IS NOT NULL)
		SET @WhereSol += N'AND	Spd_IdSit = @IdSit '
	IF (@Sit_Ind IS NOT NULL)
		SET @WhereSol += N'AND	Sit_Ind = @Sit_Ind '
	IF (@Bnf_Mtr IS NOT NULL)
		SET @WhereSol += N'AND	Bnf_Mtr = @Bnf_Mtr '
	IF (@Gia_Crt IS NOT NULL)
		SET @WhereSol += N'AND	Sol_Crt = @Gia_Crt '
	-- PARÂMETROS PARA CONSULTA E SP/SADT
	IF (@IdEsp IS NOT NULL)
		SET @WhereGia += N'AND	Gia_IdEsp = @IdEsp '
	IF (@IdCtt IS NOT NULL)
		SET @WhereGia += N'AND	Gia_IdCtt = @IdCtt '
	IF (@Prf_Mtr IS NOT NULL)
		SET @WhereGia += N'AND	Prf_Mtr = @Prf_Mtr '
	IF (@IdSit IS NOT NULL)
		SET @WhereGia += N'AND	Gpd_IdSit = @IdSit '
	IF (@Sit_Ind IS NOT NULL)
		SET @WhereGia += N'AND	Sit_Ind = @Sit_Ind '
	IF (@Bnf_Mtr IS NOT NULL)
		SET @WhereGia += N'AND	Bnf_Mtr = @Bnf_Mtr '
	IF (@Gia_Crt IS NOT NULL)
		SET @WhereGia += N'AND	Gia_Crt = @Gia_Crt '
			
	SET @Sql = N'
	
		DECLARE @tbl TABLE 
		( 
			Esp_Dsc VARCHAR(80),
			QtdCon INT,
			QtdSol INT, 
			QtdExa INT,
			Med NUMERIC(18,2),
			Prc NUMERIC(18,2),
			Eag	INT,
			Vlr NUMERIC(18,2)
		)
	
		WITH cte (IdEsp, Qtd_Con, Qtd_Sol, Qtd_Exa, Eag, Ngc_Vlr)
		AS
			(	
				SELECT	
					Sol_IdEsp, 
					0 AS Qtd_Con, 
					SUM(Spd_QtdSol) AS Qtd_Sol, 
					0 AS Qtd_Exa, 
					0 AS Eag, 
					0 AS Ngc_Vlr
				FROM	
					dbo.Atz_Sol INNER JOIN
					dbo.Atz_SolPdm ON IdSol = Spd_IdSol INNER JOIN
					dbo.Atz_Sit ON Spd_IdSit = IdSit INNER JOIN
					dbo.Atz_Bnf ON Sol_IdBnf = IdBnf INNER JOIN
					dbo.Atz_Prf ON Sol_IdPrfSol = IdPrf
				WHERE
					Spd_Dat BETWEEN @DatIni AND @DatFim 
					'+ @WhereSol +'
				GROUP BY 
					Sol_IdEsp WITH ROLLUP
				
				UNION ALL
				
				SELECT	
					Gia_IdEsp, 
					SUM(CASE Gia_Tip WHEN 1 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Con, 
					0 AS Qtd_Sol, 
					SUM(CASE Gia_Tip WHEN 2 THEN Gpd_QtdSol ELSE 0 END) AS Qtd_Exa, 
					CASE WHEN Gia_IdPrf = Gia_IdPrfSol THEN SUM(Gpd_QtdSol) ELSE 0 END AS Eag, 
					SUM((dbo.Atz_Ngc.Ngc_Vlr + ISNULL(dbo.Atz_Ngc.Ngc_VlrFlm, 0) * ISNULL(dbo.Atz_Pdm.Pdm_QtdFlm, 0))* Gpd_QtdAtz) AS Ngc_Vlr
				FROM
					dbo.Atz_Gia INNER JOIN
					dbo.Atz_GiaPdm ON IdGia = Gpd_IdGia INNER JOIN
					dbo.Atz_Sit ON Gpd_IdSit = IdSit INNER JOIN
					dbo.Atz_Pdm ON Gpd_IdPdm = IdPdm INNER JOIN
					dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN
					dbo.Atz_Prf ON Gia_IdPrf = IdPrf LEFT OUTER JOIN
					dbo.Atz_Ngc ON Gpd_IdNgc = IdNgc
				WHERE	
					Gpd_Dat BETWEEN @DatIni AND @DatFim
					'+ @WhereGia +'
				GROUP BY 
					Gia_IdEsp, 
					Gia_IdPrf, 
					Gia_IdPrfSol
			)
		INSERT @tbl
			SELECT
				e.Esp_Dsc,
				SUM(Qtd_Con) AS Qtd_Con, 
				SUM(Qtd_Sol) AS Qtd_Sol, 
				SUM(Qtd_Exa) AS Qtd_Exa,
				SUM(Qtd_Sol)/CASE SUM(Qtd_Con) WHEN 0 THEN 1 ELSE CONVERT(NUMERIC(18,2),SUM(Qtd_Con)) END AS Med,
				SUM(Qtd_Sol)/CONVERT(NUMERIC(18,2),
				(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL))*100 AS Prc,
				SUM(Eag) AS Eag,
				SUM(Ngc_Vlr) AS Ngc_Vlr--,
				
				--(SELECT TOP 1 Qtd_Sol FROM cte WHERE IdEsp IS NULL)/
				--(SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(Qtd_Con,0))) FROM cte) AS EagTot
			FROM
				cte INNER JOIN
				dbo.Atz_Esp e ON cte.IdEsp = e.IdEsp
			WHERE 
				0=0--cte.IdEsp IS NOT NULL -- Para não exibir a totalização das solitições obtida pelo ROLLUP
			GROUP BY 
				e.IdEsp, 
				e.Esp_Dsc
			ORDER BY 
				Esp_Dsc
			
			
	SELECT *
	FROM @tbl
	
	SET @Out_Tot = 
		(	--SELECT TOP 1 QtdSol FROM @tbl WHERE Esp_Dsc IS NULL
			SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(QtdSol,0))) FROM @tbl
		)/
		(
			SELECT CONVERT(NUMERIC(18,2), SUM(ISNULL(QtdCon,0))) FROM @tbl
		)			
	'


	
	EXEC SP_EXECUTESQL 
		@Sql,
		N'
		@DatIni SMALLDATETIME,
		@DatFim SMALLDATETIME,
		@IdEsp INT,
		@IdCtt BIGINT,
		@Prf_Mtr VARCHAR(20),
		@IdSit TINYINT,
		@Sit_Ind CHAR(1),
		@Bnf_Mtr VARCHAR(20),
		@Gia_Crt CHAR(1),
		@Out_Tot NUMERIC(18,2) OUTPUT',
		@DatIni,
		@DatFim,
		@IdEsp,
		@IdCtt,
		@Prf_Mtr,
		@IdSit,
		@Sit_Ind,
		@Bnf_Mtr,
		@Gia_Crt,
		@Out_Tot OUTPUT
	--PRINT @Out_Tot
	--PRINT @Sql
	--PRINT @WhereSol
	--PRINT @WhereGia
GO
/****** Object:  Table [dbo].[SiteMap]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteMap](
	[ID] [int] NOT NULL,
	[Title] [varchar](32) NULL,
	[Description] [varchar](512) NULL,
	[Url] [varchar](512) NULL,
	[Roles] [varchar](512) NULL,
	[Parent] [int] NULL,
	[Sequence] [tinyint] NULL,
 CONSTRAINT [PK_SiteMap_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sgn_Ppl]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Ppl](
	[IdPpl] [smallint] IDENTITY(1,1) NOT NULL,
	[Ppl_Dsc] [varchar](20) NOT NULL,
	[___Ppl_Prf] [bit] NULL,
	[___Ppl_Aud] [bit] NULL,
	[Ppl_QtdCh_] [int] NOT NULL,
	[Ppl_Ope] [bit] NULL,
	[Ppl_Con] [bit] NULL,
	[Ppl_Sdt] [bit] NULL,
 CONSTRAINT [PK_Sgn_Ppl] PRIMARY KEY CLUSTERED 
(
	[IdPpl] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'IdPpl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'Ppl_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'___Ppl_Prf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'___Ppl_Aud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica a quantidade de máxima de CH que o usuário relacionado ao papel pode autorizar na auditoria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'Ppl_QtdCh_'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica papéis que são da operadora [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Ppl', @level2type=N'COLUMN',@level2name=N'Ppl_Ope'
GO
/****** Object:  Table [dbo].[Sgn_Grp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Grp](
	[IdGrp] [smallint] IDENTITY(1,1) NOT NULL,
	[Grp_Dsc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Sgn_Grp] PRIMARY KEY CLUSTERED 
(
	[IdGrp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fxUtl_SetDat]    Script Date: 12/18/2012 09:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 27/06/2009
-- Description:	Retorna uma data ao passar a ano, mês e dia separados
-- =============================================================================
CREATE FUNCTION [dbo].[fxUtl_SetDat](@Year int, @Month int, @Day int)
RETURNS DATETIME
AS
BEGIN
    RETURN DATEADD(MONTH,((@Year-1900)*12)+@Month-1,@Day-1)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fxUtl_GetHor]    Script Date: 12/18/2012 09:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 27/06/2009
-- Description:	Retorna somenta a hora do tipo DATETIME
-- =============================================================================
CREATE FUNCTION [dbo].[fxUtl_GetHor](@DateTime DATETIME)
RETURNS DATETIME
AS
BEGIN
	RETURN DATEADD(DAY, -DATEDIFF(DAY, 0, @datetime), @datetime)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fxUtl_GetDat]    Script Date: 12/18/2012 09:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 27/06/2009
-- Description:	Retira a hora da data retornado somente a data
-- =============================================================================
CREATE FUNCTION [dbo].[fxUtl_GetDat](@DateTime DATETIME)
RETURNS DATETIME
AS
BEGIN
    RETURN DATEADD(dd,0, DATEDIFF(dd,0,@DateTime))
END
GO
/****** Object:  Table [dbo].[Sgn_Mod]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Mod](
	[IdMod] [smallint] IDENTITY(1,1) NOT NULL,
	[Mod_Dsc] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Sgn_Mod] PRIMARY KEY CLUSTERED 
(
	[IdMod] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sgn_Map]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Map](
	[ID] [int] NOT NULL,
	[Title] [varchar](32) NULL,
	[Description] [varchar](512) NULL,
	[Url] [varchar](512) NULL,
	[Roles] [varchar](512) NULL,
	[Parent] [int] NULL,
	[Sequence] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwlItg_CboPdm]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwlItg_CboPdm]
AS
SELECT     E.iCodigoESP AS Cbp_IdEsp, E.sNomeESP AS Cbp_EspNme, E.sCBOS AS Cbp_CodCbo, D.sCodigoSRV AS Cbp_PdmCod, S.sNomeSRV AS Cbp_PdmDsc
FROM         SIGPS.dbo.ESPM_Especialidades AS E INNER JOIN
                      SIGPS.dbo.ESPE_DireitosRealizacao AS D ON E.iCodigoESP = D.iCodigoESP INNER JOIN
                      SIGPS.dbo.SRV_Servicos AS S ON D.sCodigoSRV = S.sCodigoSRV
WHERE S.sNomeTPI IN ('TUSS','AMB')
AND D.sNomeTPI IN ('TUSS','AMB')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[33] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "E"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 99
               Right = 398
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 436
               Bottom = 114
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1275
         Width = 1965
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwlItg_CboPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwlItg_CboPdm'
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_Applications 
 */


  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[stSgn_SitMap]    Script Date: 12/18/2012 09:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description: Mapa do Site - Seleção
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_SitMap]

AS
	SELECT	ID, Title, Description, Url, Roles, Parent, Sequence
	FROM	dbo.SiteMap
	ORDER BY ID
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Ppl]    Script Date: 12/18/2012 09:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Papel - Inserção e manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_Ppl]

	@IdPpl SMALLINT = NULL,
	@Ppl_Dsc VARCHAR(20) = NULL,
	@Ppl_QtdCh_ INT = NULL,
	@Ppl_Ope BIT = NULL,
	@Ppl_Con BIT = NULL,
	@Ppl_Sdt BIT = NULL

AS
	IF (@IdPpl IS NULL)
       INSERT INTO [dbo].[Sgn_Ppl]
           (Ppl_Dsc, Ppl_QtdCh_, Ppl_Ope, Ppl_Con, Ppl_Sdt)
       VALUES
           (@Ppl_Dsc, @Ppl_QtdCh_, @Ppl_Ope, @Ppl_Con, @Ppl_Sdt)
	ELSE
		UPDATE dbo.Sgn_Ppl
		SET	Ppl_Dsc = @Ppl_Dsc,
			Ppl_QtdCh_ = @Ppl_QtdCh_,
			Ppl_Ope = @Ppl_Ope,
			Ppl_Con = @Ppl_Con,
			Ppl_Sdt = @Ppl_Sdt
		WHERE IdPpl = @IdPpl
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Mod]    Script Date: 12/18/2012 09:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 08/09/2008
-- Description:	Módulo - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_Mod]

@IdMod SMALLINT = NULL,
@Mod_Dsc VARCHAR(30) = NULL

AS
	IF (@IdMod IS NULL)
       INSERT INTO [dbo].[Sgn_Mod]
           (Mod_Dsc)
       VALUES
           (@Mod_Dsc)		
	ELSE
		UPDATE dbo.Sgn_Mod
		SET	Mod_Dsc = @Mod_Dsc
		WHERE IdMod = @IdMod
GO
/****** Object:  Table [dbo].[Sgn_Pag]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Pag](
	[IdPag] [smallint] IDENTITY(1,1) NOT NULL,
	[Pag_IdMod] [smallint] NOT NULL,
	[Pag_IdPai] [smallint] NULL,
	[Pag_Dsc] [varchar](30) NOT NULL,
	[Pag_Url] [varchar](50) NULL,
	[Pag_Anm] [bit] NOT NULL,
	[Pag_Ord] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_Pag] PRIMARY KEY CLUSTERED 
(
	[IdPag] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[sp_Analise_CarenciasSRVPorUSR]    Script Date: 12/18/2012 09:52:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[sp_Analise_CarenciasSRVPorUSR]
	(
			@CodigoUSR CHAR(16), 
			@ControleSRV INT,
			@DataRef DATETIME -- = GETDATE()
	)
RETURNS CHAR(100)
BEGIN
	DECLARE @NomePRD CHAR(20);
	DECLARE @BaseCarencia DATETIME;
	DECLARE @CodigoTBN INT;
	DECLARE @Retorno CHAR(10);
	DECLARE @Mensagem VARCHAR(100);
	DECLARE @Quantidade INT;
  
	SET @NomePRD = dbo.fn_ProdutoAtivoDoUsuario(@CodigoUSR,@DataRef);
  
	IF (@NomePRD IS NULL)
		RETURN ('PROIBIDO - Plano cancelado')
  
	SELECT	@CodigoTBN = iCodigoTBN, @BaseCarencia = dBaseCarencia
    FROM	PUSR_ProdutosDosUsuarios
	WHERE	sCodigoUSR = @CodigoUSR
	AND		sNomePRD = @NomePRD;

	EXEC sp_Critica_Procedimento_CobertoPeloContrato @ControleSRV,@CodigoTBN,@Retorno,@Mensagem;
  
	IF (@Retorno = 'NEGADO')
		RETURN('PROIBIDO - Não coberto pelo contrato')

	EXEC sp_Critica_Procedimento_CobertoPeloContrato @ControleSRV,@CodigoTBN,@Retorno,@Mensagem;
  
	IF (@Retorno = 'ERRO')
		return('ERRO: '+ @Mensagem)
  
	EXEC sp_Analise_QtdDiasCarenciaSrvNaTBeneficios @ControleSRV,@CodigoTBN,@Retorno,@Mensagem,@Quantidade;
	
	IF (@Retorno = 'VERDADEIRO')
    IF((@BaseCarencia+@Quantidade) <= @DataRef)
		RETURN('LIBERADO')
	ELSE
		RETURN('CARENCIA - Na carencia até ' + STR(CONVERT(VARCHAR(20),@BaseCarencia+@Quantidade)))

	RETURN('ERRO: '+ @Mensagem)
end
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Cid]    Script Date: 12/18/2012 09:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.14
-- Description:	Pesquisa CID10
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Cid] 
	@IdCid CHAR(5) = NULL, 
	@Cid_Cod CHAR(5) = NULL,
	@Cid_Dsc VARCHAR(300) = NULL,
	@Cid_Aud BIT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@IdCid IS NOT NULL)
		SELECT 	IdCid, Cid_Dsc
		FROM 	dbo.Atz_Cid
		WHERE	IdCid = @IdCid
	ELSE
	IF (@Cid_Cod IS NOT NULL)
		SELECT 	IdCid, Cid_Dsc
		FROM 	dbo.Atz_Cid
		WHERE	IdCid LIKE '%'+ RTRIM(@Cid_Cod) +'%'
		ORDER BY IdCid
	ELSE
	IF (@Cid_Dsc IS NOT NULL)
		SELECT 	IdCid, Cid_Dsc
		FROM 	dbo.Atz_Cid
		WHERE	Cid_Dsc LIKE '%'+ @Cid_Dsc +'%'
		ORDER BY Cid_Dsc
	ELSE
	IF (@Cid_Aud IS NOT NULL)
		SELECT 	IdCid, Cid_Dsc
		FROM 	dbo.Atz_Cid
		WHERE	Cid_Aud = @Cid_Aud
		ORDER BY Cid_Dsc

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Map]    Script Date: 12/18/2012 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssSgn_Map] 
AS 
	SELECT 
		[ID], 
		[Title],
		[Description], 
		[Url], 
		[Roles], 
		[Parent] 
	FROM 
		dbo.Sgn_Map
	ORDER BY 
		[ID]
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Esp]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Especilidades - Inserção e manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Esp]

	@IdEsp SMALLINT = NULL,
	@Esp_Dsc VARCHAR(80),
	@Esp_Cbo VARCHAR(10),
	@Esp_SisGst VARCHAR(10) = NULL,
	@Esp_AltCpx BIT,
	@Esp_Sxo CHAR(1),
	@Esp_IddMin TINYINT = NULL,
	@Esp_IddMax TINYINT = NULL,
	@Esp_QtdMax TINYINT = NULL,
	@Esp_QtdDia TINYINT = NULL,
	@Esp_QtdMes TINYINT = NULL,
	@Esp_QtdAno SMALLINT = NULL,
	@Esp_Rtn SMALLINT = NULL

AS
	IF (@IdEsp IS NULL)
       INSERT [dbo].[Atz_Esp]
           (Esp_Dsc, Esp_Cbo, Esp_SisGst, Esp_AltCpx, Esp_Sxo, Esp_IddMin,
            Esp_IddMax, Esp_QtdMax, Esp_QtdDia, Esp_QtdMes, Esp_QtdAno, 
            Esp_Rtn)
       VALUES
           (@Esp_Dsc, @Esp_Cbo, @Esp_SisGst, @Esp_AltCpx, @Esp_Sxo, @Esp_IddMin,
            @Esp_IddMax, @Esp_QtdMax, @Esp_QtdDia, @Esp_QtdMes, @Esp_QtdAno, 
            @Esp_Rtn)
	ELSE
		UPDATE dbo.Atz_Esp
		SET	Esp_Dsc = @Esp_Dsc,
			 Esp_Cbo = @Esp_Cbo,
			 Esp_SisGst = @Esp_SisGst,
			 Esp_AltCpx = @Esp_AltCpx,
			 Esp_Sxo = @Esp_Sxo, 
			 Esp_IddMin= @Esp_IddMin,
             Esp_IddMax = @Esp_IddMax, 
             Esp_QtdMax = @Esp_QtdMax, 
             Esp_QtdDia = @Esp_QtdDia, 
             Esp_QtdMes = @Esp_QtdMes, 
             Esp_QtdAno = @Esp_QtdAno, 
             Esp_Rtn= @Esp_Rtn
		WHERE IdEsp = @IdEsp
GO
/****** Object:  StoredProcedure [dbo].[ssItg_VldPdmBnf]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssItg_VldPdmBnf]
	(
		@CodigoUsuario VARCHAR(16),
		@CodigoServico VARCHAR(12),
		@Out_Atz BIT OUTPUT,
		@Out_Car DATETIME OUTPUT
	)
AS
BEGIN

	--DECLARE @tmpTable TABLE (	SNUMEROCNT	VARCHAR(10),
	--							SNOMEUSR	VARCHAR(70),
	--							SCODIGOUSR	VARCHAR(16),
	--							SCODIGOSRV	VARCHAR(12),
	--							SNOMESRV	VARCHAR(60),
	--							SITUACAO	CHAR(100),
	--							CARENCIA	DATETIME)

	-- CASO O CODIGO DO USUARIO E O CODIGO DO SERVICO NAO SEJAM NULOS
	--IF @CodigoUsuario IS NOT NULL AND @CodigoServico IS NOT NULL
	--BEGIN
		-- INCLUINDO OS DADOS NA TABELA TEMPORARIA
		--INSERT INTO @tmpTable 
		--	(	SNUMEROCNT,
		--		SNOMEUSR,
		--		SCODIGOUSR,
		--		SCODIGOSRV,
		--		SNOMESRV,
		--		SITUACAO)
		SELECT  --C.SNUMEROCNT, U.SNOMEUSR, P.*
			@Out_Atz = CASE SITUACAO WHEN 'LIBERADO' COLLATE DATABASE_DEFAULT THEN 1 ELSE 0 END,
			@Out_Car = CASE
							WHEN SUBSTRING (SITUACAO, 1, 8) COLLATE DATABASE_DEFAULT = 'CARENCIA' 
								THEN CONVERT( DATETIME, SUBSTRING (SITUACAO, 28, 20))
							ELSE NULL
						END
		
		
		FROM	SIGPS.DBO.CNT_CONTRATOS C, 
				SIGPS.DBO.TIT_TITULARES T, 
				SIGPS.DBO.USR_USUARIOS U,
				(
					SELECT	
						SCODIGOUSR, SCODIGOSRV, SNOMESRV, 
						SIGPS.dbo.sp_Analise_CarenciasSRVPorUSR(SCODIGOUSR, iControleSRV, GETDATE()) AS SITUACAO
					FROM	SIGPS.DBO.USR_USUARIOS, SIGPS.DBO.SRV_SERVICOS
					WHERE SCODIGOUSR COLLATE DATABASE_DEFAULT = @CodigoUsuario 
					  AND SCODIGOSRV COLLATE DATABASE_DEFAULT = @CodigoServico 
				) AS P
		WHERE	C.SNUMEROCNT = T.SNUMEROCNT 
		AND		T.ICONTROLETIT = U.ICONTROLETIT 
		AND		U.SCODIGOUSR = P.SCODIGOUSR 
	--END

	-- CASO O CODIGO DO SERVICO NAO SEJA NULO
	--IF @CodigoUsuario IS NOT NULL AND @CodigoServico IS NULL
	--BEGIN
	--	-- INCLUINDO OS DADOS NA TABELA TEMPORARIA
	--	INSERT INTO @tmpTable 
	--		(	SNUMEROCNT,
	--			SNOMEUSR,
	--			SCODIGOUSR,
	--			SCODIGOSRV,
	--			SNOMESRV,
	--			SITUACAO)
	--	SELECT  C.SNUMEROCNT, U.SNOMEUSR, P.*
	--	FROM	SIGPS.DBO.CNT_CONTRATOS C, 
	--			SIGPS.DBO.TIT_TITULARES T, 
	--			SIGPS.DBO.USR_USUARIOS U,
	--			(
	--				SELECT	TOP 100 PERCENT
	--					SCODIGOUSR, SCODIGOSRV, SNOMESRV, 
	--					SIGPS.dbo.sp_Analise_CarenciasSRVPorUSR(SCODIGOUSR, iControleSRV, GETDATE()) AS SITUACAO
	--				FROM	SIGPS.DBO.USR_USUARIOS, SIGPS.DBO.SRV_SERVICOS
	--				WHERE SCODIGOUSR = @CodigoUsuario
	--			) AS P
	--	WHERE	C.SNUMEROCNT = T.SNUMEROCNT
	--	AND		T.ICONTROLETIT = U.ICONTROLETIT
	--	AND		U.SCODIGOUSR = P.SCODIGOUSR
	--END

	-- ATUALIZANDO A TABELA TEMPORARIA COM A DATA DA CARENCIA
	--UPDATE	@tmpTable
	--SET		CARENCIA =	CASE
	--						WHEN SUBSTRING (SITUACAO, 1, 8) = 'CARENCIA' 
	--							THEN CONVERT( DATETIME, SUBSTRING (SITUACAO, 28, 20))
	--						ELSE NULL
	--					END
	--FROM	@tmpTable

	--SELECT	@Out_Atz = CASE SITUACAO WHEN 'LIBERADO' THEN 1 ELSE 0 END,
	--		@Out_Car = CARENCIA 
	--FROM	@tmpTable


END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Mun]    Script Date: 12/18/2012 09:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.08.18
-- Description:	Pesquisa Município
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Mun] 
	@IdMun SMALLINT = NULL, 
	@Mun_Nme VARCHAR(30) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@IdMun IS NOT NULL)
		SELECT 	IdMun, Mun_Cod, Mun_Nme, Mun_Est
		FROM 	dbo.Atz_Mun
		WHERE	IdMun = @IdMun
	ELSE
	IF (@Mun_Nme IS NOT NULL)
		SELECT 	IdMun, Mun_Cod, Mun_Nme, Mun_Est
		FROM 	dbo.Atz_Mun
		WHERE	Mun_Nme LIKE '%'+ @Mun_Nme +'%'
		ORDER BY Mun_Nme
    
    
END
GO
/****** Object:  StoredProcedure [dbo].[stCad_PdmOrt]    Script Date: 12/18/2012 09:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 29/06/2011
-- Description:	Cadastro e orientãções para prodedimentos
-- =============================================================================
CREATE PROCEDURE [dbo].[stCad_PdmOrt]

	@IdOpe SMALLINT,
	@IdPdm INT,
	@PdoDsc VARCHAR(900),
	@PdoHtm VARCHAR(1100)

AS
	IF NOT EXISTS
		( 
			SELECT * 
			FROM dbo.Cad_PdmOrt 
			WHERE Pdo_IdOpe = @IdOpe
			AND	Pdo_IdPdm = @IdPdm
		)
		INSERT dbo.Cad_PdmOrt
			(Pdo_IdOpe, Pdo_IdPdm, Pdo_Dsc, Pdo_Htm)
		VALUES
			(@IdOpe, @IdPdm, @PdoDsc, @PdoHtm)
	ELSE
		UPDATE dbo.Cad_PdmOrt
		SET	Pdo_IdOpe = @IdOpe,
			Pdo_IdPdm = @IdPdm,
			Pdo_Dsc = @PdoDsc,
			Pdo_Htm = @PdoHtm
GO
/****** Object:  StoredProcedure [dbo].[stItg_Emp]    Script Date: 12/18/2012 09:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stItg_Emp]
	@IdItg INT,
	@Out_Err TINYINT OUTPUT
AS
BEGIN

	-- INSERINDO OS DADOS DOS NOVOS REGISTROS NA TABELA DE EMPRESAS (ATZ_EMP)
	INSERT dbo.Atz_Emp
					(	Emp_IdItg,  -- Código da integração
						Emp_TipItg, -- Tipo de integração
						Emp_Doc,	-- CNPJ/CPF
						Emp_Nme,	-- Nome
						Emp_Sit)	-- Situacao 
	SELECT	DISTINCT	@IdItg,
						'I',
						CONVERT(VARCHAR(14), sCpfCgcResp),
						CONVERT(VARCHAR(50), sNomeResp),
						Situacao = CASE 
							WHEN sSituacao = 'ATIVO' THEN 'A'
							ELSE 'I'
						END
	FROM	SIGPS.dbo.CNT_Contratos
	WHERE	/*sSituacao = 'ATIVO'
	AND*/		sCpfCgcResp COLLATE DATABASE_DEFAULT NOT IN
		(
			SELECT	Emp_Doc
			FROM	dbo.Atz_Emp
		)

	IF @@ERROR <> 0
		GOTO FIM_ERRO	
	
	
	-- ALTERANDO OS DADOS JÁ EXISTENTES
	UPDATE	dbo.Atz_Emp
	SET		Emp_IdItg = @IdItg,
			Emp_TipItg = 'U',
			Emp_Nme = CONVERT(VARCHAR(50), sNomeResp),
			Emp_Sit = CASE 
						WHEN sSituacao = 'ATIVO' THEN 'A'
						ELSE 'I'
					  END
	FROM	dbo.Atz_Emp, SIGPS.dbo.CNT_Contratos
	WHERE	Emp_Doc = CONVERT(VARCHAR(14), sCpfCgcResp) COLLATE DATABASE_DEFAULT
	AND		(Emp_Nme <> CONVERT(VARCHAR(50), sNomeResp) COLLATE DATABASE_DEFAULT
	OR		 Emp_Sit <>	CASE 
							WHEN sSituacao = 'ATIVO' THEN 'A'
							ELSE 'I'
						END COLLATE DATABASE_DEFAULT)
	IF @@ERROR <> 0
		GOTO FIM_ERRO	

	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		SET @Out_Err = 1
		RETURN	

END
GO
/****** Object:  StoredProcedure [dbo].[stItg_Dif]    Script Date: 12/18/2012 09:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 19/01/2009
-- Description:	Integração diferencial copiando
--				os dados do banco SIGPS_AUX para
--				o banco SIGPS.
-- =============================================
CREATE PROCEDURE [dbo].[stItg_Dif]
AS
BEGIN
	-- ESPE_DireitosRealizacao
	MERGE SIGPS.DBO.ESPE_DireitosRealizacao d	USING SIGPS_AUX.DBO.ESPE_DireitosRealizacao o	ON o.iCodigoESP = d.iCodigoESP		AND o.sNomeTPI = d.sNomeTPI		AND o.sCodigoSRV = d.sCodigoSRV	WHEN NOT MATCHED THEN		INSERT VALUES (o.iCodigoESP, o.sNomeTPI, o.sCodigoSRV)	WHEN NOT MATCHED BY SOURCE THEN		DELETE;
	-- ESPD_DireitosRequisicao
	MERGE SIGPS.DBO.ESPD_DireitosRequisicao d	USING SIGPS_AUX.DBO.ESPD_DireitosRequisicao o	ON o.iCodigoESP = d.iCodigoESP		AND o.sNomeTPI = d.sNomeTPI		AND o.sCodigoSRV = d.sCodigoSRV	WHEN NOT MATCHED THEN		INSERT VALUES (o.iCodigoESP, o.sNomeTPI, o.sCodigoSRV)	WHEN NOT MATCHED BY SOURCE THEN		DELETE;

	-- CNT_Contratos
	INSERT	SIGPS.dbo.CNT_Contratos
	SELECT	* 
	FROM	SIGPS_AUX.dbo.CNT_Contratos
	WHERE	sNumeroCNT COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	sNumeroCNT 
			FROM	SIGPS.dbo.CNT_Contratos
		)

	UPDATE	SIGPS.dbo.CNT_Contratos
	SET		dDataContrato	= a.dDataContrato,
			sSituacao		= a.sSituacao,
			sTipoContrato	= a.sTipoContrato,
			sTipoCobranca	= a.sTipoCobranca,
			sCpfCgcResp		= a.sCpfCgcResp,
			sNomeResp		= a.sNomeResp
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.CNT_Contratos a, SIGPS.dbo.CNT_Contratos p
	WHERE	a.sNumeroCNT	COLLATE DATABASE_DEFAULT =  p.sNumeroCNT
	AND		(a.dDataContrato						 <> p.dDataContrato
	OR		a.sSituacao		COLLATE DATABASE_DEFAULT <> p.sSituacao
	OR		a.sTipoContrato	COLLATE DATABASE_DEFAULT <> p.sTipoContrato
	OR		a.sTipoCobranca	COLLATE DATABASE_DEFAULT <> p.sTipoCobranca
	OR		a.sCpfCgcResp	COLLATE DATABASE_DEFAULT <> p.sCpfCgcResp
	OR		a.sNomeResp		COLLATE DATABASE_DEFAULT <> p.sNomeResp)

	-- PRDM_Produtos
	INSERT	SIGPS.dbo.PRDM_Produtos
	SELECT	* 
	FROM	SIGPS_AUX.dbo.PRDM_Produtos
	WHERE	sNomePRD COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	sNomePRD 
			FROM	SIGPS.dbo.PRDM_Produtos
		)

	UPDATE	SIGPS.dbo.PRDM_Produtos
	SET		sTipoProduto	= a.sTipoProduto,
			sCodigoANS		= a.sCodigoANS,
			iCodigoRED		= a.iCodigoRED,
			sNomeProduto	= a.sNomeProduto
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.PRDM_Produtos a, SIGPS.dbo.PRDM_Produtos p
	WHERE	a.sNomePRD		COLLATE DATABASE_DEFAULT =	p.sNomePRD
	AND		(a.sTipoProduto	COLLATE DATABASE_DEFAULT <> ISNULL(p.sTipoProduto,0)
	OR		a.sCodigoANS	COLLATE DATABASE_DEFAULT <> ISNULL(p.sCodigoANS,0)
	OR		a.iCodigoRED							 <> ISNULL(p.iCodigoRED,0)
	OR		a.sNomeProduto	COLLATE DATABASE_DEFAULT <> ISNULL(p.sNomeProduto,0))

	-- PUSR_ProdutosDosUsuarios
	INSERT	SIGPS.dbo.PUSR_ProdutosDosUsuarios
	SELECT	* 
	FROM	SIGPS_AUX.dbo.PUSR_ProdutosDosUsuarios
	WHERE	sCodigoUSR + sNomePRD COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	sCodigoUSR + sNomePRD
			FROM	SIGPS.dbo.PUSR_ProdutosDosUsuarios
		)

	UPDATE	SIGPS.dbo.PUSR_ProdutosDosUsuarios
	SET		iCodigoTBN		= a.iCodigoTBN,
			dBaseCarencia	= a.dBaseCarencia,
			dInclusao		= a.dInclusao,
			dExclusao		= a.dExclusao
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.PUSR_ProdutosDosUsuarios a, SIGPS.dbo.PUSR_ProdutosDosUsuarios p
	WHERE	a.sCodigoUSR	COLLATE DATABASE_DEFAULT =  p.sCodigoUSR
	AND		a.sNomePRD		COLLATE DATABASE_DEFAULT =	p.sNomePRD
	AND		(a.iCodigoTBN							 <> p.iCodigoTBN
	OR		a.dBaseCarencia							 <> p.dBaseCarencia
	OR		a.dInclusao								 <> p.dInclusao
	OR		ISNULL(a.dExclusao,'19000101')			 <> ISNULL(p.dExclusao,'19000101'))

	-- RECM_RectosMestre
	INSERT	SIGPS.dbo.RECM_RectosMestre		
	SELECT	* 
	FROM	SIGPS_AUX.dbo.RECM_RectosMestre
	WHERE	iCodigoREC NOT IN
		(
			SELECT	iCodigoREC 
			FROM	SIGPS.dbo.RECM_RectosMestre
		)

	DELETE FROM	SIGPS.dbo.RECM_RectosMestre
	WHERE	iCodigoREC NOT IN
		(
			SELECT	iCodigoREC 
			FROM	SIGPS_AUX.dbo.RECM_RectosMestre
		)

	UPDATE	SIGPS.dbo.RECM_RectosMestre
	SET		sNumeroCNT	= a.sNumeroCNT,
			dVencto		= a.dVencto,
			dPagamento	= a.dPagamento,
			cSaldo		= a.cSaldo
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.RECM_RectosMestre a, SIGPS.dbo.RECM_RectosMestre p
	WHERE	a.iCodigoREC							 =  p.iCodigoREC
	AND		(a.sNumeroCNT	COLLATE DATABASE_DEFAULT <> p.sNumeroCNT
	OR		a.dVencto								 <> p.dVencto
	OR		ISNULL(a.dPagamento,'19000101')			 <> ISNULL(p.dPagamento,'19000101')
	OR		ISNULL(a.cSaldo,0)						 <> ISNULL(p.cSaldo,0))

	-- SRV_Servicos
	INSERT	SIGPS.dbo.SRV_Servicos
	SELECT	* 
	FROM	SIGPS_AUX.dbo.SRV_Servicos
	WHERE	sNomeTPI + sCodigoSRV COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	sNomeTPI + sCodigoSRV
			FROM	SIGPS.dbo.SRV_Servicos
		)

	UPDATE	SIGPS.dbo.SRV_Servicos
	SET		sNomeSRV		= a.sNomeSRV,
			sNomeGBN		= a.sNomeGBN,
			iControleSRV	= a.iControleSRV
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.SRV_Servicos a, SIGPS.dbo.SRV_Servicos p
	WHERE	a.sNomeTPI		COLLATE DATABASE_DEFAULT =  p.sNomeTPI
	AND		a.sCodigoSRV	COLLATE DATABASE_DEFAULT =	p.sCodigoSRV
	AND		(a.sNomeSRV		COLLATE DATABASE_DEFAULT <> p.sNomeSRV
	OR		a.sNomeGBN		COLLATE DATABASE_DEFAULT <> p.sNomeGBN 
	OR		a.iControleSRV							 <> p.iControleSRV)

	-- TBND_TabelaBeneficios_Grupos
	INSERT	SIGPS.dbo.TBND_TabelaBeneficios_Grupos
	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBND_TabelaBeneficios_Grupos
	WHERE	LTRIM(STR(iCodigoTBN)) + sNomeGBN COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	LTRIM(STR(iCodigoTBN)) + sNomeGBN
			FROM	SIGPS.dbo.TBND_TabelaBeneficios_Grupos
		)

	UPDATE	SIGPS.dbo.TBND_TabelaBeneficios_Grupos
	SET		sTipoTBN	= a.sTipoTBN,
			iPrazo		= a.iPrazo
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBND_TabelaBeneficios_Grupos a, SIGPS.dbo.TBND_TabelaBeneficios_Grupos p
	WHERE	a.iCodigoTBN							 =  p.iCodigoTBN
	AND		a.sNomeGBN		COLLATE DATABASE_DEFAULT =	p.sNomeGBN
	AND		(a.sTipoTBN		COLLATE DATABASE_DEFAULT <> p.sTipoTBN
	OR		a.iPrazo								 <> p.iPrazo)

	-- TBNE_TabelaBeneficios_Excessoes
	INSERT	SIGPS.dbo.TBNE_TabelaBeneficios_Excessoes
	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBNE_TabelaBeneficios_Excessoes
	WHERE	LTRIM(STR(iCodigoTBN)) + sNomeTPI + sCodigoSRV COLLATE DATABASE_DEFAULT  NOT IN
		(
			SELECT	LTRIM(STR(iCodigoTBN)) + sNomeTPI + sCodigoSRV
			FROM	SIGPS.dbo.TBNE_TabelaBeneficios_Excessoes
		)

	UPDATE	SIGPS.dbo.TBNE_TabelaBeneficios_Excessoes
	SET		sTipoTBN	= a.sTipoTBN,
			iPrazo		= a.iPrazo
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBNE_TabelaBeneficios_Excessoes a, SIGPS.dbo.TBNE_TabelaBeneficios_Excessoes p
	WHERE	a.iCodigoTBN							 =  p.iCodigoTBN
	AND		a.sNomeTPI		COLLATE DATABASE_DEFAULT =	p.sNomeTPI
	AND		a.sCodigoSRV		COLLATE DATABASE_DEFAULT =	p.sCodigoSRV
	AND		(a.sTipoTBN		COLLATE DATABASE_DEFAULT <> p.sTipoTBN
	OR		a.iPrazo								 <> p.iPrazo)

	-- TBNM_TabelaBeneficios
	INSERT	SIGPS.dbo.TBNM_TabelaBeneficios
	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBNM_TabelaBeneficios
	WHERE	iCodigoTBN NOT IN
		(
			SELECT	iCodigoTBN 
			FROM	SIGPS.dbo.TBNM_TabelaBeneficios
		)

	UPDATE	SIGPS.dbo.TBNM_TabelaBeneficios
	SET		sNomeTBN		= a.sNomeTBN,
			sItensNaoRelac	= a.sItensNaoRelac,
			nIndiceAuxiliar	= a.nIndiceAuxiliar
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.TBNM_TabelaBeneficios a, SIGPS.dbo.TBNM_TabelaBeneficios p
	WHERE	a.iCodigoTBN								  = p.iCodigoTBN
	AND		(a.sNomeTBN			COLLATE DATABASE_DEFAULT <> p.sNomeTBN
	OR		a.sItensNaoRelac	COLLATE DATABASE_DEFAULT <> p.sItensNaoRelac
	OR		a.nIndiceAuxiliar							 <> p.nIndiceAuxiliar)

	-- TIT_Titulares
	INSERT	SIGPS.dbo.TIT_Titulares
	SELECT	* 
	FROM	SIGPS_AUX.dbo.TIT_Titulares
	WHERE	iControleTit NOT IN
		(
			SELECT	iControleTit 
			FROM	SIGPS.dbo.TIT_Titulares
		)

	UPDATE	SIGPS.dbo.TIT_Titulares
	SET		sNumeroCNT	= a.sNumeroCNT,
			sCodigoUSR	= a.sCodigoUSR
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.TIT_Titulares a, SIGPS.dbo.TIT_Titulares p
	WHERE	a.iControleTit							  = p.iControleTit
	AND		(a.sNumeroCNT	COLLATE DATABASE_DEFAULT <> p.sNumeroCNT
	OR		a.sCodigoUSR	COLLATE DATABASE_DEFAULT <> p.sCodigoUSR)

	-- USR_Usuarios
	INSERT	SIGPS.dbo.USR_Usuarios
	SELECT	* 
	FROM	SIGPS_AUX.dbo.USR_Usuarios
	WHERE	sCodigoUSR COLLATE DATABASE_DEFAULT NOT IN 
		(
			SELECT	sCodigoUSR 
			FROM	SIGPS.dbo.USR_Usuarios
		)

	UPDATE	SIGPS.dbo.USR_Usuarios	
	SET		iControleTit	= a.iControleTit,
			sNomeUSR		= a.sNomeUSR,
			sSexo			= a.sSexo,
			dNascimento		= a.dNascimento,
			sCNS			= a.sCNS
--	SELECT	* 
	FROM	SIGPS_AUX.dbo.USR_Usuarios a, SIGPS.dbo.USR_Usuarios p
	WHERE	a.sCodigoUSR	COLLATE DATABASE_DEFAULT  =  p.sCodigoUSR
	AND		(a.iControleTit							 <> p.iControleTit
	OR		a.sNomeUSR		COLLATE DATABASE_DEFAULT <> p.sNomeUSR
	OR		a.sSexo			COLLATE DATABASE_DEFAULT <> p.sSexo
	OR		a.dNascimento							 <> p.dNascimento
	OR		a.sCNS			COLLATE DATABASE_DEFAULT <> p.sCNS)
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Grp]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 545 END #####################################################################

-- 546 BEGIN ###################################################################

-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Grpecilidades - Inserção e manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Grp]

	@IdGrp TINYINT = NULL,
	@Grp_Dsc VARCHAR(30) = NULL,
	@Grp_QtdCh_ INT = NULL

AS
	IF (@IdGrp IS NULL)
       INSERT INTO [dbo].[Atz_Grp]
           (Grp_Dsc, Grp_QtdCh_)
       VALUES
           (UPPER(@Grp_Dsc), @Grp_QtdCh_)		
	ELSE
		UPDATE dbo.Atz_Grp
		SET	Grp_Dsc = UPPER(@Grp_Dsc), 
			Grp_QtdCh_ = @Grp_QtdCh_
		WHERE IdGrp = @IdGrp
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Mun]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 18/08/2008
-- Description:	Município - Manipulação de Dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Mun]
	@IdMun SMALLINT,
	@Mun_Cod VARCHAR(7),
	@Mun_Nme VARCHAR(30),
	@Mun_Est CHAR(2)
AS
	IF (@IdMun IS NULL)
		INSERT dbo.Atz_Mun
			(Mun_Cod
			,Mun_Nme
			,Mun_Est)
		VALUES
		   (@Mun_Cod
		   ,upper(@Mun_Nme)
		   ,@Mun_Est)
	ELSE
		UPDATE dbo.Atz_Mun
		SET	Mun_Cod = @Mun_Cod,
			Mun_Nme = upper(@Mun_Nme),
			Mun_Est = @Mun_Est
		WHERE IdMun = @IdMun
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Rde]    Script Date: 12/18/2012 09:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Rede - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Rde]

@IdRde smallint = null,
@Rde_Nme varchar(30) = null

AS
	IF (@IdRde IS NULL)
	INSERT INTO Atz_Rde
           (Rde_Nme)
     VALUES
            (upper(@Rde_Nme))		
	ELSE
		UPDATE Atz_Rde
		SET	Rde_Nme = upper(@Rde_Nme)
		WHERE IdRde = @IdRde
GO
/****** Object:  StoredProcedure [dbo].[Dba_LogError]    Script Date: 12/18/2012 09:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dba_LogError] 
    @ErrorLogID [int] = 0 OUTPUT  -- Contains the ErrorLogID of the row inserted
                                  -- by uspLogError in the ErrorLog table.

AS
BEGIN
    SET NOCOUNT ON;

    -- Output parameter value of 0 indicates that error 
    -- information was not logged.
    SET @ErrorLogID = 0;

    BEGIN TRY
        -- Return if there is no error information to log.
        IF ERROR_NUMBER() IS NULL
            RETURN;

        -- Return if inside an uncommittable transaction.
        -- Data insertion/modification is not allowed when 
        -- a transaction is in an uncommittable state.
        IF XACT_STATE() = -1
        BEGIN
            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 
                + 'Rollback the transaction before executing uspLogError in order to successfully log error information.';
            RETURN;
        END;

        INSERT [dbo].[Dba_ErrorLog] 
            (
            [UserName], 
            [ErrorNumber], 
            [ErrorSeverity], 
            [ErrorState], 
            [ErrorProcedure], 
            [ErrorLine], 
            [ErrorMessage]
            ) 
        VALUES 
            (
            CONVERT(sysname, CURRENT_USER), 
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
            );

        -- Pass back the ErrorLogID of the row inserted
        SELECT @ErrorLogID = @@IDENTITY;
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred in stored procedure uspLogError: ';
        EXECUTE [dbo].[Dba_PrintError];
        RETURN -1;
    END CATCH
END;
GO
/****** Object:  UserDefinedFunction [dbo].[fxUtl_SetDatHor]    Script Date: 12/18/2012 09:52:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 27/06/2009
-- Description:	Retorna uma data/hora ao passar a ano, mês, dia, hora, minuto e 
--				segundo separados.
-- =============================================================================
CREATE FUNCTION [dbo].[fxUtl_SetDatHor](@Year INT, @Month INT, @Day INT, @Hour INT, @Minute INT, @Second INT)
RETURNS DATETIME
AS
BEGIN
	RETURN dbo.fxUtl_SetDat(@Year,@Month,@Day) + dbo.fxUtl_SetHor(@Hour, @Minute,@Second)
END
GO
/****** Object:  StoredProcedure [dbo].[proc_GetSiteMap]    Script Date: 12/18/2012 09:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_GetSiteMap] AS SELECT [ID], [Title],
[Description], [Url], [Roles], [Parent] FROM [SiteMap] ORDER BY [ID]
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_LogError]    Script Date: 12/18/2012 09:51:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_LogError]
(
    @ErrorId UNIQUEIDENTIFIER,
    @Application NVARCHAR(60),
    @Host NVARCHAR(30),
    @Type NVARCHAR(100),
    @Source NVARCHAR(60),
    @Message NVARCHAR(500),
    @User NVARCHAR(50),
    @AllXml NTEXT,
    @StatusCode INT,
    @TimeUtc DATETIME
)
AS

    SET NOCOUNT ON

    INSERT
    INTO
        [ELMAH_Error]
        (
            [ErrorId],
            [Application],
            [Host],
            [Type],
            [Source],
            [Message],
            [User],
            [AllXml],
            [StatusCode],
            [TimeUtc]
        )
    VALUES
        (
            @ErrorId,
            @Application,
            @Host,
            @Type,
            @Source,
            @Message,
            @User,
            @AllXml,
            @StatusCode,
            @TimeUtc
        )
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorXml]    Script Date: 12/18/2012 09:51:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorXml]
(
    @Application NVARCHAR(60),
    @ErrorId UNIQUEIDENTIFIER
)
AS

    SET NOCOUNT ON

    SELECT 
        [AllXml]
    FROM 
        [ELMAH_Error]
    WHERE
        [ErrorId] = @ErrorId
    AND
        [Application] = @Application
GO
/****** Object:  StoredProcedure [dbo].[ELMAH_GetErrorsXml]    Script Date: 12/18/2012 09:51:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

    SET NOCOUNT ON

    DECLARE @FirstTimeUTC DATETIME
    DECLARE @FirstSequence INT
    DECLARE @StartRow INT
    DECLARE @StartRowIndex INT

    SELECT 
        @TotalCount = COUNT(1) 
    FROM 
        [ELMAH_Error]
    WHERE 
        [Application] = @Application

    -- Get the ID of the first error for the requested page

    SET @StartRowIndex = @PageIndex * @PageSize + 1

    IF @StartRowIndex <= @TotalCount
    BEGIN

        SET ROWCOUNT @StartRowIndex

        SELECT  
            @FirstTimeUTC = [TimeUtc],
            @FirstSequence = [Sequence]
        FROM 
            [ELMAH_Error]
        WHERE   
            [Application] = @Application
        ORDER BY 
            [TimeUtc] DESC, 
            [Sequence] DESC

    END
    ELSE
    BEGIN

        SET @PageSize = 0

    END

    -- Now set the row count to the requested page size and get
    -- all records below it for the pertaining application.

    SET ROWCOUNT @PageSize

    SELECT 
        errorId     = [ErrorId], 
        application = [Application],
        host        = [Host], 
        type        = [Type],
        source      = [Source],
        message     = [Message],
        [user]      = [User],
        statusCode  = [StatusCode], 
        time        = CONVERT(VARCHAR(50), [TimeUtc], 126) + 'Z'
    FROM 
        [ELMAH_Error] error
    WHERE
        [Application] = @Application
    AND
        [TimeUtc] <= @FirstTimeUTC
    AND 
        [Sequence] <= @FirstSequence
    ORDER BY
        [TimeUtc] DESC, 
        [Sequence] DESC
    FOR
        XML AUTO
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 12/18/2012 09:51:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[Atz_Prd]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Prd](
	[IdPrd] [int] IDENTITY(1,1) NOT NULL,
	[Prd_IdRde] [smallint] NOT NULL,
	[Prd_IdItg] [int] NULL,
	[Prd_TipItg] [char](1) NULL,
	[Prd_Nme] [varchar](40) NOT NULL,
	[Prd_CodAns] [varchar](20) NULL,
	[Prd_SisGst] [varchar](20) NULL,
 CONSTRAINT [PK_Pln] PRIMARY KEY NONCLUSTERED 
(
	[IdPrd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'IdPrd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_IdRde'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do lote de integração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de integração, indica se o produto foi inserido ou alterado via integração [I-Insert|U-Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_TipItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código na ANS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_CodAns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do produto  no sistema de gestão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prd', @level2type=N'COLUMN',@level2name=N'Prd_SisGst'
GO
/****** Object:  Table [dbo].[Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Pdm](
	[IdPdm] [int] IDENTITY(1,1) NOT NULL,
	[Pdm_IdTab] [tinyint] NOT NULL,
	[Pdm_IdTpp] [tinyint] NOT NULL,
	[Pdm_IdGrp] [tinyint] NOT NULL,
	[Pdm_Cod] [varchar](20) NULL,
	[Pdm_Dsc] [varchar](80) NOT NULL,
	[Pdm_AltCpx] [bit] NOT NULL,
	[Pdm_DscRsm] [varchar](35) NOT NULL,
	[Pdm_Sxo] [char](1) NULL,
	[Pdm_IddMin] [tinyint] NULL,
	[Pdm_IddMax] [tinyint] NULL,
	[Pdm_QtdMax] [tinyint] NULL,
	[Pdm_QtdDia] [tinyint] NULL,
	[Pdm_QtdMes] [tinyint] NULL,
	[Pdm_QtdAno] [smallint] NULL,
	[Pdm_Rtn] [smallint] NULL,
	[Pdm_Esp] [bit] NOT NULL,
	[Pdm_Prf] [bit] NULL,
	[_nomegfi] [varchar](50) NULL,
	[Pdm_Atv] [bit] NULL,
	[Pdm_QtdCh_] [numeric](18, 2) NULL,
	[Pdm_BlqUrg] [bit] NULL,
	[Pdm_QtdFlm] [numeric](18, 4) NULL,
	[Pdm_CodAmb] [varchar](20) NULL,
	[Pdm_DscAmb] [varchar](80) NULL,
 CONSTRAINT [PK_Pcd] PRIMARY KEY NONCLUSTERED 
(
	[IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da tabela de procedimentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_IdTab'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_IdTpp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do grupo de procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_IdGrp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código na tabela de procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Cod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Dsc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica procedimento de alta-complexidade [0-Não|1-Sim]. requer autorização da auditoria ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_AltCpx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descrição resumida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_DscRsm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restringe o procedimento ao sexo do beneficiário [M-Masculino|F-Feminino|A-Ambos] ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Sxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define, quando informado,a idade minima para aplicação do procedimento. Vazio indica sem restrição ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_IddMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define, quando informado,a idade máxima para aplicação do procedimento. Vazio indica sem restrição ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_IddMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define a quantidade máxima por solicitação. Vazio indica sem restrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_QtdMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define a quantidade máxima de execuções por dia. Vazio indica sem restrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_QtdDia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define a quantidade máxima de execuções por mês. Vazio indica sem restrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_QtdMes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Define a quantidade máxima de execuções por ano. Vazio indica sem restrição' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_QtdAno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tempo mínimio em dias para executar novamente o procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Rtn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica procedimento especial [0-Não|1-Sim], requer autorização da auditoria para execução quando é especial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Esp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica se exige profisisonal para execução [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Prf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica se o procedimento esta ativo [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Pdm', @level2type=N'COLUMN',@level2name=N'Pdm_Atv'
GO
/****** Object:  View [dbo].[Atz_Msg]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 564 END #####################################################################

-- 565 BEGIN ###################################################################


CREATE VIEW [dbo].[Atz_Msg]
AS
SELECT     dbo.Ans_Msg.*
FROM         dbo.Ans_Msg
GO
/****** Object:  Table [dbo].[Atz_Ctt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Ctt](
	[IdCtt] [bigint] NOT NULL,
	[Ctt_IdTpd] [tinyint] NOT NULL,
	[Ctt_IdCns] [varchar](7) NULL,
	[Ctt_Nme] [varchar](70) NOT NULL,
	[Ctt_NmeRsm] [varchar](35) NOT NULL,
	[Ctt_Doc] [varchar](18) NULL,
	[Ctt_NumCns] [varchar](15) NULL,
	[Ctt_EstCns] [char](2) NULL,
	[Ctt_CodCne] [char](7) NULL,
	[Ctt_Sit] [char](1) NULL,
	[Ctt_Tel] [varchar](20) NULL,
	[Ctt_Tel2] [varchar](20) NULL,
	[Ctt_Fax] [varchar](20) NULL,
	[Ctt_Eml] [varchar](50) NULL,
	[Ctt_NmeCto] [varchar](70) NULL,
	[Ctt_TipDoc] [char](1) NULL,
	[Ctt_DatFim] [smalldatetime] NULL,
 CONSTRAINT [PK_Crd] PRIMARY KEY NONCLUSTERED 
(
	[IdCtt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_IdTpd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do conselho profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_IdCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome resumido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_NmeRsm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CPF ou CNPJ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Doc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número no conselho profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_NumCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado do conselho profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_EstCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código CNES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_CodCne'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação [A-Ativo|I-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Sit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Outro telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Tel2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_Eml'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_NmeCto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo documento [F-Física|J-Jurídica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ctt', @level2type=N'COLUMN',@level2name=N'Ctt_TipDoc'
GO
/****** Object:  Table [dbo].[Atz_Cnt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Cnt](
	[IdCnt] [int] IDENTITY(1,1) NOT NULL,
	[Cnt_IdEmp] [int] NULL,
	[Cnt_IdItg] [int] NULL,
	[Cnt_TipItg] [char](1) NULL,
	[Cnt_Num] [varchar](20) NOT NULL,
	[Cnt_Tip] [tinyint] NOT NULL,
	[Cnt_Sit] [char](1) NOT NULL,
 CONSTRAINT [PK_Atz_Cnt] PRIMARY KEY CLUSTERED 
(
	[IdCnt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'IdCnt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_IdEmp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do lote de integração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de integração, indica se o contrato foi inserido ou alterado via integração [I-Insert|U-Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_TipItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_Num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo [1-Coletivo|2-Individual]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_Tip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação [A-Ativo|I-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cnt', @level2type=N'COLUMN',@level2name=N'Cnt_Sit'
GO
/****** Object:  Table [dbo].[Atz_Brr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Brr](
	[IdBrr] [int] IDENTITY(1,1) NOT NULL,
	[Brr_IdMun] [smallint] NOT NULL,
	[Brr_Nme] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Atz_Brr] PRIMARY KEY CLUSTERED 
(
	[IdBrr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do bairro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Brr', @level2type=N'COLUMN',@level2name=N'IdBrr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do município' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Brr', @level2type=N'COLUMN',@level2name=N'Brr_IdMun'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Brr', @level2type=N'COLUMN',@level2name=N'Brr_Nme'
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_Users__31B762FC] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 12/18/2012 09:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 12/18/2012 09:51:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 12/18/2012 09:51:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK__aspnet_Paths__73852659] PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[IsOpe] [bit] NULL,
 CONSTRAINT [PK__aspnet_Roles__607251E5] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 12/18/2012 09:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 12/18/2012 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 12/18/2012 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK__aspnet_Membershi__41EDCAC5] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_Personali__793DFFAF] PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_Personali__7C1A6C5A] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_Profile__56E8E7AB] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 12/18/2012 09:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 12/18/2012 09:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 12/18/2012 09:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__aspnet_UsersInRo__6442E2C9] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Bnf](
	[IdBnf] [int] IDENTITY(1,1) NOT NULL,
	[Bnf_IdTit] [int] NULL,
	[Bnf_IdCnt] [int] NULL,
	[Bnf_IdItg] [int] NULL,
	[Bnf_TipItg] [char](1) NULL,
	[Bnf_Mtr] [varchar](20) NULL,
	[Bnf_Nme] [varchar](70) NOT NULL,
	[Bnf_Sxo] [char](1) NOT NULL,
	[Bnf_VrsCrt] [smallint] NULL,
	[Bnf_DatNas] [smalldatetime] NULL,
	[Bnf_PosFin] [char](1) NOT NULL,
	[Bnf_NumCns] [char](15) NULL,
	[Bnf_DatVld] [smalldatetime] NULL,
	[Bnf_Sit] [varchar](1) NOT NULL,
	[Bnf_DatPln] [smalldatetime] NULL,
	[Bnf_Bio] [bit] NULL,
 CONSTRAINT [PK_Bnf] PRIMARY KEY NONCLUSTERED 
(
	[IdBnf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário titular, quando preenchido indica que o beneficiário é um dependente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_IdTit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contrato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_IdCnt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do lote de integração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de integração, indica se o beneficiário foi inserido ou alterado via integração [I-Insert|U-Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_TipItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matrículal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_Mtr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sexo [M-Masculino|F-Feminino]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_Sxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_VrsCrt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de nascimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_DatNas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Posição financeira [A-Ativo|I-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_PosFin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número do cartão nacional de saúde (CNS)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_NumCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_DatVld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação [A-Ativo|I-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_Sit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_DatPln'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica se o beneficiário utilizará biometria para elegibilidade [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Bnf', @level2type=N'COLUMN',@level2name=N'Bnf_Bio'
GO
/****** Object:  Table [dbo].[Atz_CbtPdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_CbtPdm](
	[Cbp_IdCbt] [smallint] NOT NULL,
	[Cbp_IdPdm] [int] NOT NULL,
 CONSTRAINT [PK_PdmGrp] PRIMARY KEY NONCLUSTERED 
(
	[Cbp_IdPdm] ASC,
	[Cbp_IdCbt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do grupo de cobertura/carência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CbtPdm', @level2type=N'COLUMN',@level2name=N'Cbp_IdCbt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CbtPdm', @level2type=N'COLUMN',@level2name=N'Cbp_IdPdm'
GO
/****** Object:  Table [dbo].[Atz_CttEsp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_CttEsp](
	[Ces_IdCtt] [bigint] NOT NULL,
	[Ces_IdEsp] [smallint] NOT NULL,
	[Ces_RetCon] [smallint] NULL,
 CONSTRAINT [PK_Cre] PRIMARY KEY NONCLUSTERED 
(
	[Ces_IdCtt] ASC,
	[Ces_IdEsp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEsp', @level2type=N'COLUMN',@level2name=N'Ces_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEsp', @level2type=N'COLUMN',@level2name=N'Ces_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prazo mínimo para retorno da consulta (em dias)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEsp', @level2type=N'COLUMN',@level2name=N'Ces_RetCon'
GO
/****** Object:  Table [dbo].[Atz_EspCon]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_EspCon](
	[Epc_IdEsp] [smallint] NOT NULL,
	[Epc_IdPdm] [int] NOT NULL,
	[Epc_Crt] [char](1) NULL,
 CONSTRAINT [PK_Atz_EspPdm] PRIMARY KEY CLUSTERED 
(
	[Epc_IdEsp] ASC,
	[Epc_IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspCon', @level2type=N'COLUMN',@level2name=N'Epc_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_EspCon', @level2type=N'COLUMN',@level2name=N'Epc_IdPdm'
GO
/****** Object:  Table [dbo].[Atz_Lgr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Lgr](
	[IdLgr] [int] IDENTITY(1,1) NOT NULL,
	[Lgr_IdBrr] [int] NOT NULL,
	[Lgr_IdTpl] [smallint] NOT NULL,
	[Lgr_Nme] [varchar](50) NOT NULL,
	[Lgr_Cep] [char](8) NOT NULL,
 CONSTRAINT [PK_Atz_Lgr] PRIMARY KEY CLUSTERED 
(
	[IdLgr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lgr', @level2type=N'COLUMN',@level2name=N'IdLgr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do bairro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lgr', @level2type=N'COLUMN',@level2name=N'Lgr_IdBrr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de logradouro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lgr', @level2type=N'COLUMN',@level2name=N'Lgr_IdTpl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lgr', @level2type=N'COLUMN',@level2name=N'Lgr_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lgr', @level2type=N'COLUMN',@level2name=N'Lgr_Cep'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 12/18/2012 09:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * PROCEDURE: dbo.aspnet_Roles_CreateRole 
 */

CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  Table [dbo].[Fat_Fch]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fat_Fch](
	[IdFch] [smallint] IDENTITY(1,1) NOT NULL,
	[Fch_IdOpe] [smallint] NOT NULL,
	[Fch_IdCtt] [bigint] NULL,
	[Fch_Cpc] [varchar](6) NOT NULL,
	[Fch_Ano] [smallint] NOT NULL,
	[Fch_Mes] [tinyint] NOT NULL,
	[Fch_Ent] [date] NULL,
	[Fch_DatIni] [smalldatetime] NOT NULL,
	[Fch_DatFim] [smalldatetime] NOT NULL,
	[Fch_Lot] [bit] NOT NULL,
 CONSTRAINT [PK_Fat_Fch] PRIMARY KEY CLUSTERED 
(
	[IdFch] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'IdFch'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Competencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_Cpc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ano da competência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_Ano'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mês da competência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_Mes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de início' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_DatIni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de término' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_DatFim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica que o período foi lançado em lote [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fat_Fch', @level2type=N'COLUMN',@level2name=N'Fch_Lot'
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Pdm]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Wesley PS
-- Create date: 01/09/2008
-- Description:	Procedimento - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Pdm]
	@IdPdm		INT				= NULL,
	@Pdm_Cod	VARCHAR(20)		= NULL,
	@Pdm_IdTab	TINYINT			= NULL,	
	@Pdm_IdTpp	TINYINT			= NULL,	
	@Pdm_IdGrp	TINYINT			= NULL,	
	@Pdm_Dsc	VARCHAR(80)		= NULL,	
	@Pdm_AltCpx	BIT				= NULL,	
	@Pdm_DscRsm	VARCHAR(35)		= NULL,	
	@Pdm_CodAmb	VARCHAR(20)		= NULL,
	@Pdm_DscAmb	VARCHAR(80)		= NULL,
	@Pdm_Sxo	CHAR(1)			= NULL,	
	@Pdm_IddMin	TINYINT			= NULL,	
	@Pdm_IddMax	TINYINT			= NULL,	
	@Pdm_QtdMax	TINYINT			= NULL,	
	@Pdm_QtdDia	TINYINT			= NULL,	
	@Pdm_QtdMes	TINYINT			= NULL,	
	@Pdm_QtdAno	SMALLINT		= NULL,	
	@Pdm_Rtn	SMALLINT		= NULL,
	@Pdm_Esp	BIT				= NULL,
	@Pdm_Prf	BIT				= NULL,
	@Pdm_Atv	BIT				= NULL,
	@Pdm_BlqUrg	BIT				= NULL,
	@Pdm_QtdCh_ NUMERIC(18,2)	= NULL,
	@Pdm_QtdFlm NUMERIC(18,4)	= NULL
AS
	IF (@IdPdm IS NULL)
		INSERT dbo.Atz_Pdm
			(Pdm_Cod
			,Pdm_IdTab
			,Pdm_IdTpp
			,Pdm_IdGrp
			,Pdm_Dsc
			,Pdm_AltCpx
			,Pdm_DscRsm
			,Pdm_CodAmb
			,Pdm_DscAmb
			,Pdm_Sxo
			,Pdm_IddMin
			,Pdm_IddMax
			,Pdm_QtdMax
			,Pdm_QtdDia
			,Pdm_QtdMes
			,Pdm_QtdAno
			,Pdm_Rtn
			,Pdm_Esp
			,Pdm_Prf
			,Pdm_Atv
			,Pdm_BlqUrg
			,Pdm_QtdCh_
			,Pdm_QtdFlm)
		VALUES
			(@Pdm_Cod
			,@Pdm_IdTab
			,@Pdm_IdTpp
			,@Pdm_IdGrp
			,UPPER(@Pdm_Dsc)
			,@Pdm_AltCpx
			,UPPER(@Pdm_DscRsm)
			,@Pdm_CodAmb
			,UPPER(@Pdm_DscAmb)
			,@Pdm_Sxo
			,@Pdm_IddMin
			,@Pdm_IddMax
			,@Pdm_QtdMax
			,@Pdm_QtdDia
			,@Pdm_QtdMes
			,@Pdm_QtdAno
			,@Pdm_Rtn
			,@Pdm_Esp
			,@Pdm_Prf
			,@Pdm_Atv
			,@Pdm_BlqUrg
			,@Pdm_QtdCh_
			,@Pdm_QtdFlm)	
	ELSE
		UPDATE [dbo].[Atz_Pdm]
		SET	 Pdm_Cod	= @Pdm_Cod
			,Pdm_IdTab	= @Pdm_IdTab	
			,Pdm_IdTpp	= @Pdm_IdTpp	
			,Pdm_IdGrp	= @Pdm_IdGrp	
			,Pdm_Dsc	= UPPER(@Pdm_Dsc)	
			,Pdm_AltCpx	= @Pdm_AltCpx
			,Pdm_DscRsm	= UPPER(@Pdm_DscRsm)
			,Pdm_CodAmb = @Pdm_CodAmb
			,Pdm_DscAmb = UPPER(@Pdm_DscAmb)	
			,Pdm_Sxo	= @Pdm_Sxo	
			,Pdm_IddMin	= @Pdm_IddMin	
			,Pdm_IddMax	= @Pdm_IddMax	
			,Pdm_QtdMax	= @Pdm_QtdMax	
			,Pdm_QtdDia	= @Pdm_QtdDia	
			,Pdm_QtdMes	= @Pdm_QtdMes	
			,Pdm_QtdAno	= @Pdm_QtdAno	
			,Pdm_Rtn 	= @Pdm_Rtn 
			,Pdm_Esp	= @Pdm_Esp
			,Pdm_Prf	= @Pdm_Prf
			,Pdm_Atv	= @Pdm_Atv
			,Pdm_BlqUrg	= @Pdm_BlqUrg
			,Pdm_QtdCh_	= @Pdm_QtdCh_
			,Pdm_QtdFlm = @Pdm_QtdFlm
		WHERE IdPdm	  	= @IdPdm
GO
/****** Object:  StoredProcedure [dbo].[stItg_Cnt]    Script Date: 12/18/2012 09:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stItg_Cnt]
	@IdItg INT,
	@Out_Err TINYINT OUTPUT
AS
BEGIN

	-- INSERINDO OS DADOS NA TABELA DE CONTRATOS (ATZ_CNT)
	INSERT dbo.Atz_Cnt
					(	Cnt_IdItg,	-- Código da integração
						Cnt_TipItg, -- Tipo de integração
						Cnt_IdEmp,	-- Empresa
						Cnt_Num,	-- Numero do Contrato
						Cnt_Tip,	-- Tipo do Contrato
						Cnt_Sit)	-- Situacao do Contrato
		SELECT	DISTINCT	
				@IdItg,
				'I',
				NULL, -- SERA ATUALIZADO ABAIXO
				CONVERT(VARCHAR(20), sNumeroCNT),
				Tipo =	CASE 
							WHEN (sTipoContrato = 'EMPRESARIAL' AND sTipoCobranca = 'COLETIVA') THEN 1
						ELSE 2 -- INDIVIDUAL
						END,
				Situacao =	CASE 
							WHEN sSituacao = 'ATIVO' THEN 'A'
							ELSE 'I'
							END
		FROM	SIGPS.dbo.CNT_Contratos
		WHERE	CONVERT(VARCHAR(20), sNumeroCNT) COLLATE DATABASE_DEFAULT NOT IN
			(
				SELECT Cnt_NUm
				FROM	dbo.Atz_Cnt
			)

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 3
		GOTO FIM_ERRO
	END

	-- ATUALIZA O CAMPO DO CODIGO DA EMPRESA
	UPDATE	dbo.Atz_Cnt
	SET		Cnt_IdEmp = IdEmp
	FROM	SIGPS.dbo.CNT_Contratos, 
			dbo.ATZ_Emp
	WHERE	CONVERT(VARCHAR(50), sNomeResp) COLLATE DATABASE_DEFAULT = Emp_Nme COLLATE DATABASE_DEFAULT
	  AND	CONVERT(VARCHAR(20), sNumeroCNT) COLLATE DATABASE_DEFAULT = Cnt_Num COLLATE DATABASE_DEFAULT
	  --AND	CNT_Contratos.sSituacao = 'ATIVO'

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 4
		GOTO FIM_ERRO
	END

	-- ALTERANDO OS CONTRATOS JÁ ESTÃO CADASTRADO MAS QUE MUDARAM DE SITUAÇÃO
	UPDATE	dbo.Atz_Cnt
	SET		Cnt_IdItg = @IdItg,
			Cnt_TipItg = 'U',
			Cnt_Sit = CASE 
							WHEN sSituacao = 'ATIVO' THEN 'A'
							ELSE 'I'
						END
	FROM	dbo.Atz_Cnt, SIGPS.dbo.CNT_Contratos 
	WHERE	Cnt_Num COLLATE DATABASE_DEFAULT = CONVERT(VARCHAR(20), sNumeroCNT) COLLATE DATABASE_DEFAULT
	AND		Cnt_Sit <> CASE 
							WHEN sSituacao = 'ATIVO' THEN 'A'
							ELSE 'I'
						END COLLATE DATABASE_DEFAULT
	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 5
		GOTO FIM_ERRO
	END

	SET @Out_Err = 0
	RETURN

	FIM_ERRO:		
		RETURN	

END
GO
/****** Object:  StoredProcedure [dbo].[stItg_Prd]    Script Date: 12/18/2012 09:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stItg_Prd]
	@IdItg INT,
	@Out_Err TINYINT OUTPUT
AS
BEGIN

	-- INSERINDO OS DADOS DOS NOVOS REGISTROS NA TABELA DE PRODUTOS (ATZ_PRD)
	INSERT dbo.Atz_Prd
					(	Prd_IdItg,  -- Código da integração
						Prd_TipItg, -- Tipo de integração
						Prd_IdRde,	-- Rede
						Prd_Nme,	-- Nome do produto
						Prd_CodAns,	-- Codigo ANS
						Prd_SisGst)	-- Código do produto no sistema de gestão
	SELECT	DISTINCT	
			@IdItg,
			'I',
			CONVERT(SMALLINT, iCodigoRED),
			CONVERT(VARCHAR(40), sNomeProduto),
			CONVERT(VARCHAR(20), sCodigoANS),
			CONVERT(VARCHAR(20), sNomePRD)
	FROM	SIGPS.dbo.PRDM_Produtos
	WHERE	sTipoProduto = 'PLANO'
	AND		sNomePRD COLLATE DATABASE_DEFAULT NOT IN 
		(
			SELECT Prd_SisGst
			FROM dbo.Atz_Prd
		)

	IF @@ERROR <> 0
		GOTO FIM_ERRO	
		
	-- ALTERANDO OS DADOS JÁ EXISTENTES
	UPDATE	dbo.Atz_Prd
	SET		Prd_IdItg = @IdItg,
			Prd_TipItg = 'U',
			Prd_Nme = CONVERT(VARCHAR(40), sNomeProduto),
			Prd_IdRde = CONVERT(SMALLINT, iCodigoRED),
			Prd_CodAns = CONVERT(VARCHAR(20), sCodigoANS)			
			
	FROM	dbo.Atz_Prd, SIGPS.dbo.PRDM_Produtos
	WHERE	sTipoProduto = 'PLANO'
	AND		sNomePRD COLLATE DATABASE_DEFAULT = Prd_SisGst
	AND		(Prd_Nme <> CONVERT(VARCHAR(40), sNomeProduto) OR
			 Prd_IdRde <> CONVERT(SMALLINT, iCodigoRED) OR
			 Prd_CodAns <> CONVERT(VARCHAR(20), sCodigoANS))
	
	IF @@ERROR <> 0
		GOTO FIM_ERRO	

	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		SET @Out_Err = 2
		RETURN	

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_UsrMed]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa Id para usuário executantes(médicos)
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_UsrMed] 
	@UserName NVARCHAR(256)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdMed, Med_Nme
	FROM	dbo.Atz_Med, dbo.Atz_Usr, dbo.Aspnet_Users
	WHERE	IdUsr = Med_IdUsr
	AND		UserId = Usr_UserId
	AND		UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_Acs]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ========================================================================
-- Author:		Rubens Jr
-- Create date: 12/09/2008
-- Description:	Pesquisa as permissões para o usuário para montagem do menu
-- ========================================================================
CREATE PROCEDURE [dbo].[ssSgn_Acs] 
	
	@IdMod INT = NULL,
	@IdPai INT = NULL,
	@UserName NVARCHAR(256) = NULL

AS
	-- Verifica se está na tabela de administrador geral de todos os sistemas
	-- mostrando assim todo o menu
--	IF EXISTS (SELECT Adm_IdSrv FROM Sgn_Adm WHERE Adm_IdSis = @IdSis AND Adm_IdSrv = @Idsrv)
--	BEGIN
		IF @IdPai IS NULL -- Seleciona as páginas pai
		BEGIN
			SELECT IdPag, Pag_Dsc, Pag_IdPai, Pag_Url
			FROM	dbo.Sgn_Pag
			WHERE	Pag_IdPai IS NULL
			AND		Pag_IdMod = @IdMod
			ORDER BY Pag_Ord, Pag_Dsc
		END
		ELSE -- Seleciona as páginas restantes abaixo das páginas pai
		BEGIN
			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url
			FROM	dbo.Sgn_Pag
			WHERE	Pag_IdPai = @IdPai
			ORDER BY Pag_Ord, Pag_Dsc
		END
--	END
--	ELSE
--	-- Demais usuários
--	BEGIN
--		IF @IdPai IS NULL -- Seleciona as páginas pai para grupos ou usuários individuais
--		BEGIN
--			-- Seleciona a página referente ao grupo do usuário
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			--FROM	dbo.Sgn_Pag, dbo.Sgn_Gps, dbo.Sgn_GrpAcs
--			FROM	dbo.Sgn_GrpUsr, dbo.Sgn_Grp, dbo.Sgn_GrpPagAca, dbo.Sgn_Usr,
--					dbo.Sgn_PagAca, dbo.Sgn_Aca, dbo.Sgn_Pag, dbo.Aspnet_Users
--			WHERE	IdGrp		= Gpu_IdGrp
--			AND		IdGrp		= Gpa_IdGrp
--			AND		Gpa_IdPag	= Pga_IdPag
--			AND		Gpa_IdAca	= Pga_IdAca
--			AND		IdAca		= Pga_IdAca
--			AND		IdPag		= Pga_IdPag
--			AND		UserId		= Usr_UserId
--			AND		IdUsr		= Gpu_IdUsr
--			AND		Aca_Cod		= 'VIS'
--			AND		Pag_IdPai 	IS NULL
--			AND		Pag_IdMod 	= @IdMod
--			AND		UserName	= @UserName
--			UNION 
--			-- Seleciona a página referente ao usuário (permissões individuais)
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			FROM	dbo.Sgn_Pag, dbo.Sgn_UsrPagAca, dbo.Sgn_Usr,
--					dbo.Sgn_PagAca, dbo.Sgn_Aca, dbo.Aspnet_Users
--			WHERE	Upa_IdPag	= Pga_IdPag
--			AND		Upa_IdAca	= Pga_IdAca
--			AND		IdAca		= Pga_IdAca
--			AND		IdPag		= Pga_IdPag
--			AND		UserId		= Usr_UserId
--			AND		IdUsr		= Upa_IdUsr
--			AND		Aca_Cod		= 'VIS'
--			AND		Pag_IdPai 	IS NULL
--			AND		Pag_IdMod 	= @IdMod
--			AND		UserName	= @UserName
--			UNION 
--			-- Seleciona o menu das páginas de acesso anônimo
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			FROM	dbo.Sgn_Pag				
--			WHERE	Pag_IdPai 	IS NULL
--			AND		Pag_IdMod 	= @IdMod
--			AND     Pag_Anm		= 1
--			ORDER BY Pag_Ord, Pag_Dsc
--		END
--		ELSE -- Seleciona as páginas filhas
--		BEGIN
--			-- Seleciona o menu referente ao grupo do usuário
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			--FROM	dbo.Sgn_Pag, dbo.Sgn_Gps, dbo.Sgn_GrpAcs
--			FROM	dbo.Sgn_GrpUsr, dbo.Sgn_Grp, dbo.Sgn_GrpPagAca, dbo.Sgn_Usr,
--					dbo.Sgn_PagAca, dbo.Sgn_Aca, dbo.Sgn_Pag, dbo.Aspnet_Users
--			WHERE	IdGrp		= Gpu_IdGrp
--			AND		IdGrp		= Gpa_IdGrp
--			AND		Gpa_IdPag	= Pga_IdPag
--			AND		Gpa_IdAca	= Pga_IdAca
--			AND		IdAca		= Pga_IdAca
--			AND		IdPag		= Pga_IdPag
--			AND		UserId		= Usr_UserId
--			AND		IdUsr		= Gpu_IdUsr
--			AND		Aca_Cod		= 'VIS'
--			AND		Pag_IdPai 	= @IdPai
--			AND		Pag_IdMod 	= @IdMod
--			AND		UserName	= @UserName
--			UNION
--			-- Seleciona o menu referente ao usuário (permissões individuais)
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			FROM	dbo.Sgn_Pag, dbo.Sgn_UsrPagAca, dbo.Sgn_Usr,
--					dbo.Sgn_PagAca, dbo.Sgn_Aca, dbo.Aspnet_Users
--			WHERE	Upa_IdPag	= Pga_IdPag
--			AND		Upa_IdAca	= Pga_IdAca
--			AND		IdAca		= Pga_IdAca
--			AND		IdPag		= Pga_IdPag
--			AND		Aca_Cod		= 'VIS'
--			AND		Pag_IdPai 	= @IdPai
--			AND		Pag_IdMod 	= @IdMod
--			AND		Upa_IdUsr	= IdUsr
--			AND		UserName	= @UserName
--			UNION
--			-- Seleciona o menu referente ao usuário (permissões individuais)
--			SELECT	IdPag, Pag_Dsc, Pag_IdPai, Pag_Url, Pag_Ord
--			FROM	dbo.Sgn_Pag				
--			WHERE	Pag_IdPai 	= @IdPai
--			AND		Pag_IdMod 	= @IdMod
--			AND     Pag_Anm		= 1
--			ORDER BY Pag_Ord, Pag_Dsc
--		END
--	END
GO
/****** Object:  StoredProcedure [dbo].[ssCad_PdmOrt]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author		: Wesley PS
-- Create date	: 29/06/2011
-- Description	: Pesquisa orientações para auditoria do procedimento
-- =============================================================================
CREATE PROCEDURE [dbo].[ssCad_PdmOrt]
	@IdOpe	SMALLINT,
	@IdPdm	INT
AS
	SELECT	Pdm_Cod, Pdm_Dsc, Pdo_Htm
	FROM	dbo.Atz_Pdm, dbo.Cad_PdmOrt
	WHERE	IdPdm = Pdo_IdPdm
	AND		Pdo_IdOpe = @IdOpe
	AND		Pdo_IdPdm = @IdPdm
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Ctt]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * PROCEDURE: dbo.stAtz_Ctt 
 */

-- =============================================
-- Author:		Wesley PS
-- Create date: 26/08/2008
-- Description:	Contratados - Cadastro de contratados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Ctt]
 
 @IdCtt bigint
,@Ctt_IdTpd tinyint
,@Ctt_IdCns varchar(7)=null
,@Ctt_Nme varchar(70)
,@Ctt_NmeRsm varchar(35)
,@Ctt_TipDoc varchar(1) = null
,@Ctt_Doc varchar(18)=null
,@Ctt_NumCns varchar(15)=null
,@Ctt_EstCns char(2)=null
,@Ctt_CodCne char(7)=null
,@Ctt_Sit char(1)=null
,@Ctt_Tel varchar(20)=null
,@Ctt_Tel2 varchar(20)=null
,@Ctt_Fax varchar(20)=null
,@Ctt_Eml varchar(50)=null
,@Ctt_NmeCto varchar(70)=null  

   

AS

IF NOT EXISTS (select * from atz_ctt where idctt = @IdCtt)
	INSERT INTO [dbo].[Atz_Ctt]
		   (IdCtt
         
           ,Ctt_IdTpd
           ,Ctt_IdCns
           ,Ctt_Nme
           ,Ctt_NmeRsm
           ,Ctt_TipDoc
           ,Ctt_Doc
           ,Ctt_NumCns
           ,Ctt_EstCns
           ,Ctt_CodCne
           ,Ctt_Sit
           ,Ctt_Tel
           ,Ctt_Tel2
           ,Ctt_Fax
           ,Ctt_Eml
           ,Ctt_NmeCto  )
   VALUES
           (@IdCtt 
      
           ,@Ctt_IdTpd
           ,upper(@Ctt_IdCns)
           ,upper(@Ctt_Nme)
           ,upper(@Ctt_NmeRsm)
           ,@Ctt_TipDoc
           ,upper(@Ctt_Doc)
           ,upper(@Ctt_NumCns)
           ,upper(@Ctt_EstCns)
           ,upper(@Ctt_CodCne)
           ,upper(@Ctt_Sit)
           ,@Ctt_Tel 
           ,@Ctt_Tel2
           ,@Ctt_Fax 
           ,upper(@Ctt_Eml)
           ,upper(@Ctt_NmeCto)
           )
	ELSE
		UPDATE dbo.Atz_Ctt
		SET	
				  IdCtt			= @IdCtt		  
         
         	     ,Ctt_IdTpd		= @Ctt_IdTpd	   	  
         	     ,Ctt_IdCns		= @Ctt_IdCns	   	  
         	     ,Ctt_Nme		= @Ctt_Nme	   	  
         	     ,Ctt_NmeRsm	= @Ctt_NmeRsm	
                 ,Ctt_TipDoc   	= @Ctt_TipDoc  
         	     ,Ctt_Doc		= @Ctt_Doc	   	  
         	     ,Ctt_NumCns	= @Ctt_NumCns	   	  
         	     ,Ctt_EstCns	= @Ctt_EstCns	   	  
         	     ,Ctt_CodCne	= @Ctt_CodCne	   	  
         	     ,Ctt_Sit		= @Ctt_Sit	   	  
         	     ,Ctt_Tel		= @Ctt_Tel	   	  
         	     ,Ctt_Tel2		= @Ctt_Tel2	   	  
         	     ,Ctt_Fax		= @Ctt_Fax	   	  
         	     ,Ctt_Eml		= @Ctt_Eml	   	  
           	     ,Ctt_NmeCto  	= @Ctt_NmeCto 
		WHERE IdCtt = @IdCtt
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Brr]    Script Date: 12/18/2012 09:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Logradouros - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Brr]

@IdBrr int= null,   
@Brr_IdMun smallint= null,   
@Brr_Nme varchar(30)= null   
 

AS
	IF (@IdBrr IS NULL)
INSERT INTO [Atz_Brr]           
           ([Brr_IdMun]
           ,[Brr_Nme])
     VALUES
           (
            @Brr_IdMun
           ,upper(@Brr_Nme))
	ELSE
UPDATE [Atz_Brr]
   SET 
       Brr_IdMun = @Brr_IdMun
      ,Brr_Nme  = upper(@Brr_Nme)
 WHERE idbrr = @idbrr
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_CpcLocAtd]    Script Date: 12/18/2012 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.15
-- Description:	Pesquisa local de atendimento para médicos
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_CpcLocAtd] 
	@UserName NVARCHAR(256)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT	IdCrd, Crd_Nme, Crd_Lgr, Crd_Brr
	FROM	dbo.Atz_Cpc, dbo.Atz_Med, dbo.Atz_Crd,
			dbo.Atz_Usr, dbo.Aspnet_Users
	WHERE	IdMed = Cpc_IdMed
	AND		IdCrd = Cpc_IdCrd
	AND		IdUsr = Med_IdUsr
	AND		UserId = Usr_UserId
	AND		UserName = @UserName
	ORDER BY Crd_Nme, Crd_Lgr
END
GO
/****** Object:  Table [dbo].[Sgn_Atr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Atr](
	[IdAtr] [smallint] IDENTITY(1,1) NOT NULL,
	[Atr_IdPag] [smallint] NOT NULL,
	[Atr_Dsc] [varchar](30) NOT NULL,
	[Atr_NmeCpn] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sgn_Atr] PRIMARY KEY CLUSTERED 
(
	[IdAtr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_Usr](
	[IdUsr] [int] IDENTITY(1,1) NOT NULL,
	[Usr_UserId] [uniqueidentifier] NOT NULL,
	[Usr_IdPpl] [smallint] NULL,
	[Usr_Nme] [varchar](70) NOT NULL,
	[Usr_Tip] [tinyint] NULL,
	[Usr_AltSnh] [bit] NULL,
 CONSTRAINT [PK_Atz_Usr] PRIMARY KEY CLUSTERED 
(
	[IdUsr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário no framework de segurança' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'Usr_UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do papel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'Usr_IdPpl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'Usr_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'Usr_Tip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica que o usuário deve alterar a senha no próximo login [0-Não|1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_Usr', @level2type=N'COLUMN',@level2name=N'Usr_AltSnh'
GO
/****** Object:  Table [dbo].[Sgn_PagAca]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_PagAca](
	[Pga_IdPag] [smallint] NOT NULL,
	[Pga_IdAca] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_PagAca] PRIMARY KEY CLUSTERED 
(
	[Pga_IdPag] ASC,
	[Pga_IdAca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sgn_GrpMsg]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_GrpMsg](
	[Grm_IdOpe] [smallint] NOT NULL,
	[Grm_RoleId] [uniqueidentifier] NOT NULL,
	[Grm_IdMsg] [smallint] NOT NULL,
 CONSTRAINT [PK_Sgn_GrpMsg] PRIMARY KEY CLUSTERED 
(
	[Grm_IdOpe] ASC,
	[Grm_RoleId] ASC,
	[Grm_IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da operadora' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_GrpMsg', @level2type=N'COLUMN',@level2name=N'Grm_IdOpe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do grupo do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_GrpMsg', @level2type=N'COLUMN',@level2name=N'Grm_RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da mensagem de negativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_GrpMsg', @level2type=N'COLUMN',@level2name=N'Grm_IdMsg'
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Grp]    Script Date: 12/18/2012 09:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	aspnet_Roles -  manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_Grp]
	@RoleName NVARCHAR(256) = NULL,
	@NewRoleName NVARCHAR(256) = NULL,
	@Description NVARCHAR(256) = NULL,
	@IsOpe BIT = NULL
AS
		UPDATE dbo.aspnet_Roles
		SET	[Description] = UPPER(@Description),
			[RoleName] = UPPER(@NewRoleName),
			[LoweredRoleName] = LOWER(@NewRoleName),
			[IsOpe] = @IsOpe
		WHERE LoweredRoleName = LOWER(@RoleName)
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Pag]    Script Date: 12/18/2012 09:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jf
-- Create date: 08/09/2008
-- Description:	Página - Manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_Pag]
 
@IdPag SMALLINT = NULL,
@Pag_IdMod SMALLINT,
@Pag_IdPai SMALLINT = NULL,
@Pag_Dsc VARCHAR(30),
@Pag_Url VARCHAR(50) = NULL,
@Pag_Anm BIT = 0,
@Pag_Ord TINYINT   

AS

IF (@IdPag IS NULL)
	INSERT [dbo].[Sgn_Pag]
		   (Pag_IdMod,
			Pag_IdPai,
			Pag_Dsc,
			Pag_Url,
			Pag_Anm,
			Pag_Ord )
   VALUES
           (@Pag_IdMod,
			@Pag_IdPai,
			UPPER(@Pag_Dsc),
			UPPER(@Pag_Url),
			@Pag_Anm,
			@Pag_Ord 
           )
	ELSE
		UPDATE dbo.Sgn_Pag
		SET	Pag_IdMod = @Pag_IdMod,
			Pag_IdPai = @Pag_IdPai,
			Pag_Dsc = UPPER(@Pag_Dsc),
			Pag_Url = UPPER(@Pag_Url),
			Pag_Anm = @Pag_Anm,
			Pag_Ord = @Pag_Ord 
		WHERE IdPag = @IdPag
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_Users 
 */


  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_WebPartState_Paths 
 */


  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vwAtz_Con]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- ALTER  date: 01/11/2010
-- Description:	Pesquisa procediemntos do tipo consulta
-- =============================================================================
CREATE VIEW [dbo].[vwAtz_Con]
AS
	SELECT IdPdm, Pdm_Dsc, Pdm_DscRsm, Pdm_Cod, 'E' AS Pdm_Crt
	FROM dbo.Atz_Pdm 
	WHERE Pdm_Cod = '10.10.101-2'
	UNION ALL
	SELECT IdPdm, Pdm_Dsc, Pdm_DscRsm, Pdm_Cod, 'U' AS Pdm_Crt
	FROM dbo.Atz_Pdm 
	WHERE Pdm_Cod = '10.10.103-9'
GO
/****** Object:  View [dbo].[vwFat_Fch]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- ALTER  date: 09/09/2009
-- Description:	Pesquisa períodos de fechamento do faturamento
-- =============================================================================
CREATE VIEW [dbo].[vwFat_Fch]
AS
	SELECT	TOP 100 PERCENT IdFch, Fch_DatIni, Fch_DatFim, Fch_Ano, Fch_Mes, STR(Fch_Ano) +'/'+ LTRIM(STR(Fch_Mes)) AS Fch_Cpc
	FROM	dbo.Fat_Fch
	ORDER BY Fch_DatFim DESC
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_WebPartState_Shared 
 */


  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_UsersInRoles 
 */


  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_Profiles 
 */


  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * VIEW: vw_aspnet_MembershipUsers 
 */


  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Usr]    Script Date: 12/18/2012 09:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 553 END #####################################################################

-- 554 BEGIN ###################################################################


-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 02/01/2009
-- Description:	Usuário - Manipulação de dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_Usr]

	@Tip_Aco CHAR(1), -- [I-Inserir|U-Alterar|D-Apagar]
	@IdUsr INT = NULL,
	@Usr_IdPpl SMALLINT = NULL,
	@Usr_Nme VARCHAR(70) = NULL,
	@Email NVARCHAR(256) = NULL,
	@IsLockedOut BIT = NULL,
	@IsApproved BIT = NULL,
	@Comment NTEXT = NULL,
	@Out_Err BIT OUTPUT	-- Indica se houve erro na execução da sp [0-não|1-sim]

AS
BEGIN
	BEGIN TRAN

	IF (@Tip_Aco = 'U')
	BEGIN
		UPDATE	dbo.Sgn_Usr
		SET		Usr_Nme = UPPER(@Usr_Nme),
				Usr_IdPpl = @Usr_IdPpl
		WHERE	IdUsr = @IdUsr

		IF @@ERROR <> 0
			GOTO FIM_ERRO

		UPDATE	dbo.aspnet_Membership
		SET		Email = UPPER(@Email),
				IsLockedOut = @IsLockedOut,
				IsApproved = @IsApproved,
				Comment = @Comment
		FROM	dbo.aspnet_Users u, dbo.aspnet_Membership m, dbo.Sgn_Usr
		WHERE	u.UserId = m.UserId
		AND		u.UserId = Usr_UserId
		AND		IdUsr = @IdUsr

		IF @@ERROR <> 0
			GOTO FIM_ERRO
	END
	ELSE
	IF (@Tip_Aco = 'D')
	BEGIN
		DECLARE @UserId UNIQUEIDENTIFIER

		SELECT	@UserId = Usr_UserId
		FROM	dbo.Sgn_Usr
		WHERE	IdUsr = @IdUsr

		IF @@ERROR <> 0
			GOTO FIM_ERRO

		DELETE	FROM dbo.Sgn_Usr 
		WHERE	IdUsr = @IdUsr

		IF @@ERROR <> 0
			GOTO FIM_ERRO

		DELETE	FROM dbo.aspnet_UsersInRoles
		WHERE	UserId = @UserId

		IF @@ERROR <> 0
			GOTO FIM_ERRO

		DELETE FROM dbo.aspnet_Membership
		WHERE	UserId = @UserId

		IF @@ERROR <> 0
			GOTO FIM_ERRO

		DELETE FROM dbo.aspnet_Users
		WHERE	UserId = @UserId

		IF @@ERROR <> 0
			GOTO FIM_ERRO
	END

	COMMIT TRAN
	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		ROLLBACK TRAN
		SET @Out_Err = 1
		RETURN	
	
END
GO
/****** Object:  Table [dbo].[Sgn_UsrPagAca]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_UsrPagAca](
	[Upa_IdUsr] [int] NOT NULL,
	[Upa_IdPag] [smallint] NOT NULL,
	[Upa_IdAca] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_UsrPagAca] PRIMARY KEY CLUSTERED 
(
	[Upa_IdUsr] ASC,
	[Upa_IdPag] ASC,
	[Upa_IdAca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sgn_GrpAtr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_GrpAtr](
	[Gat_IdGrp] [smallint] NOT NULL,
	[Gat_IdAtr] [smallint] NOT NULL,
 CONSTRAINT [PK_Sgn_GrpAtr] PRIMARY KEY CLUSTERED 
(
	[Gat_IdGrp] ASC,
	[Gat_IdAtr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sgn_BioBnf]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_BioBnf](
	[IdBbf] [int] IDENTITY(1,1) NOT NULL,
	[Bbf_IdBnf] [int] NOT NULL,
	[Bbf_IdUsr] [int] NOT NULL,
	[Bbf_Fir] [varchar](4000) NOT NULL,
	[Bbf_Dat] [smalldatetime] NOT NULL,
	[Bbf_Ded] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_BioBnf] PRIMARY KEY CLUSTERED 
(
	[IdBbf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'IdBbf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'Bbf_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário que cadastrou a biometria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'Bbf_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FIR com a identificação biométrica do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'Bbf_Fir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de cadastro da biometria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'Bbf_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Índice do dedo utilizado na leitura biométrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioBnf', @level2type=N'COLUMN',@level2name=N'Bbf_Ded'
GO
/****** Object:  Table [dbo].[Sgn_AtrUsr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_AtrUsr](
	[Atu_IdAtr] [smallint] NOT NULL,
	[Atu_IdUsr] [int] NOT NULL,
 CONSTRAINT [PK_Sgn_AtrUsr] PRIMARY KEY CLUSTERED 
(
	[Atu_IdAtr] ASC,
	[Atu_IdUsr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sgn_GrpUsr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_GrpUsr](
	[Gpu_IdGrp] [smallint] NOT NULL,
	[Gpu_IdUsr] [int] NOT NULL,
 CONSTRAINT [PK_Sgn_GrpUsr] PRIMARY KEY CLUSTERED 
(
	[Gpu_IdGrp] ASC,
	[Gpu_IdUsr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sgn_GrpPagAca]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sgn_GrpPagAca](
	[Gpa_IdGrp] [smallint] NOT NULL,
	[Gpa_IdPag] [smallint] NOT NULL,
	[Gpa_IdAca] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_GrpPagAca] PRIMARY KEY CLUSTERED 
(
	[Gpa_IdGrp] ASC,
	[Gpa_IdPag] ASC,
	[Gpa_IdAca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_UsrOpe]    Script Date: 12/18/2012 09:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 558 END #####################################################################

-- 559 BEGIN ###################################################################

-- =============================================
-- Author:		Rubens Jr
-- Create date: 02/03/2008
-- Description:	Pesquisa Usuário da Operadora
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_UsrOpe] 

@UserName NVARCHAR(256) = NULL

AS
	SELECT  IdUsr, UserName, Usr_Nme, Usr_IdPpl
	FROM	dbo.Sgn_Usr, dbo.aspnet_Users, dbo.Sgn_Ppl
	WHERE	Usr_UserId = UserId
	AND		IdPpl = Usr_IdPpl
	AND		Ppl_Ope = 1
	AND		UserName = @UserName
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_UsrTip]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa tipo de usuário
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_UsrTip] 
	 @UserName NVARCHAR(256) -- Tipo de usuário [0-admin|1-auditor|2-operadora|3-credenciado|4-médico]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	Usr_Tip
	FROM	dbo.Aspnet_Users, dbo.Sgn_Usr
	WHERE	UserId = Usr_UserId
	AND		UserName = @UserName

END
GO
/****** Object:  StoredProcedure [dbo].[stFat_Fch]    Script Date: 12/18/2012 09:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stFat_Fch]

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
	@FchLot BIT

AS
	IF (@IdFch IS NULL)
	BEGIN
       IF (@IdTpd IS NULL)
			-- Insere contratado individual
			INSERT dbo.Fat_Fch
			   (Fch_IdOpe, Fch_IdCtt, Fch_Cpc, Fch_Ano,
				Fch_Mes, Fch_Ent, Fch_DatIni, Fch_DatFim, Fch_Lot)
			VALUES
			   (@IdOpe, @IdCtt, @FchCpc, @FchAno, @FchMes, 
			    @FchEnt, @FchDatIni, @FchDatFim, @FchLot)
		ELSE
			-- Insere em lote por grupo de contratado
			INSERT dbo.Fat_Fch
			   (Fch_IdOpe, Fch_IdCtt, Fch_Cpc, Fch_Ano,
				Fch_Mes, Fch_Ent, Fch_DatIni, Fch_DatFim, Fch_Lot)
				SELECT @IdOpe, IdCtt, @FchCpc, @FchAno, @FchMes, 
					@FchEnt, @FchDatIni, @FchDatFim, 1
				FROM dbo.Atz_Ctt
				WHERE Ctt_IdTpd = @IdTpd
	END
	ELSE
		UPDATE dbo.Fat_Fch
		SET	Fch_Ent = @FchEnt,
			Fch_DatIni = @FchDatIni,
			Fch_DatFim = @FchDatFim,
			Fch_Lot = 0
		WHERE IdFch = @IdFch
GO
/****** Object:  StoredProcedure [dbo].[stSgn_Atr]    Script Date: 12/18/2012 09:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Atributo de páginas - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_Atr]

@IdAtr SMALLINT = NULL,
@Atr_IdPag SMALLINT,
@Atr_Dsc VARCHAR(30),
@Atr_NmeCpn VARCHAR(20)

AS
	IF (@IdAtr IS NULL)
		INSERT [dbo].[Sgn_Atr]
           ([Atr_IdPag]
           ,[Atr_Dsc]
           ,[Atr_NmeCpn])
     VALUES
           (@Atr_IdPag
		   ,@Atr_Dsc
           ,@Atr_NmeCpn)		
	ELSE
		UPDATE [dbo].[Sgn_Atr]
		   SET [Atr_IdPag] = @Atr_IdPag
			  ,[Atr_Dsc] = @Atr_Dsc
			  ,[Atr_NmeCpn] = @Atr_NmeCpn
		 WHERE IdAtr = @IdAtr
GO
/****** Object:  StoredProcedure [dbo].[stSgn_AltSnh]    Script Date: 12/18/2012 09:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 552 END #####################################################################

-- 553 BEGIN ###################################################################


-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 09/03/2009
-- Description:	Altera indicação de alterar senha no próximo login do usuário
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_AltSnh]

@IdUsr INT,
@Usr_AltSnh BIT

AS

	-- Se estiver reiniciando a senha desbloqueia o usuário
	IF (@Usr_AltSnh = 1)		
		UPDATE	dbo.aspnet_Membership
		SET		IsLockedOut = 0
		FROM	dbo.Sgn_Usr, dbo.aspnet_Users u, dbo.aspnet_Membership m
		WHERE	u.UserId = Usr_UserId
		AND		u.UserId = m.UserId
		AND		IdUsr = @IdUsr

	UPDATE	dbo.Sgn_Usr
	SET		Usr_AltSnh = @Usr_AltSnh
	WHERE	IdUsr = @IdUsr
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Lgr]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Logradouros - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Lgr]

 @IdLgr int= null,   
 @Lgr_IdBrr int= null,   
 @Lgr_IdTpl smallint= null,   
 @Lgr_Nme varchar(50)= null ,
 @Lgr_Cep CHAR(8) = null  

AS
	IF (@IdLgr IS NULL)
	INSERT INTO Atz_Lgr
           (
            Lgr_IdBrr
           ,Lgr_IdTpl
           ,Lgr_Nme
		   ,Lgr_Cep)
     VALUES
           (
            @Lgr_IdBrr
           ,@Lgr_IdTpl
           ,upper(@Lgr_Nme)
		   ,@Lgr_Cep)
	ELSE
			UPDATE  Atz_Lgr 
			   SET  
				    Lgr_IdBrr  = @Lgr_IdBrr
				  , Lgr_IdTpl  = @Lgr_IdTpl
				  , Lgr_Nme  = upper(@Lgr_Nme)
				  , Lgr_Cep = @Lgr_Cep
			 WHERE IdLgr  = @IdLgr
GO
/****** Object:  Table [dbo].[Atz_Prf]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Prf](
	[IdPrf] [int] IDENTITY(1,1) NOT NULL,
	[Prf_IdCns] [varchar](7) NOT NULL,
	[Prf_IdUsr] [int] NULL,
	[Prf_Mtr] [varchar](20) NULL,
	[Prf_Nme] [varchar](70) NULL,
	[Prf_NmeRsm] [varchar](35) NOT NULL,
	[Prf_NumCns] [varchar](15) NOT NULL,
	[Prf_EstCns] [char](2) NULL,
	[Prf_Cpf] [char](14) NULL,
	[Prf_Tel] [varchar](20) NULL,
	[Prf_Tel2] [varchar](20) NULL,
	[Prf_Fax] [varchar](20) NULL,
	[Prf_Eml] [varchar](50) NULL,
	[Prf_Sit] [char](1) NULL,
 CONSTRAINT [PK_Med] PRIMARY KEY NONCLUSTERED 
(
	[IdPrf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'IdPrf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do conselho profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_IdCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Matrícula do Profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Mtr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Nme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome resumido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_NmeRsm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número no conselho profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_NumCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado do conselhro profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_EstCns'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CPF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Cpf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Outro telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Tel2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Eml'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situação [A-Ativo|i-Inativo]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Prf', @level2type=N'COLUMN',@level2name=N'Prf_Sit'
GO
/****** Object:  Table [dbo].[Eml_GrpUsr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eml_GrpUsr](
	[IdGpu] [int] IDENTITY(1,1) NOT NULL,
	[Gpu_IdGrp] [smallint] NOT NULL,
	[Gpu_IdUsr] [int] NOT NULL,
 CONSTRAINT [PK_Eml_GrpUsr] PRIMARY KEY CLUSTERED 
(
	[IdGpu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atz_Cpe]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Cpe](
	[IdCpe] [int] IDENTITY(1,1) NOT NULL,
	[Cpe_IdBnf] [int] NOT NULL,
	[Cpe_IdCid] [char](5) NOT NULL,
	[Cpe_DatInc] [smalldatetime] NOT NULL,
	[Cpe_DatTrm] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Cpe] PRIMARY KEY NONCLUSTERED 
(
	[IdCpe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpe', @level2type=N'COLUMN',@level2name=N'IdCpe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpe', @level2type=N'COLUMN',@level2name=N'Cpe_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpe', @level2type=N'COLUMN',@level2name=N'Cpe_IdCid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de início' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpe', @level2type=N'COLUMN',@level2name=N'Cpe_DatInc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de término' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpe', @level2type=N'COLUMN',@level2name=N'Cpe_DatTrm'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  Table [dbo].[Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_CttEnd](
	[Cte_IdCtt] [bigint] NOT NULL,
	[Cte_SeqEnd] [tinyint] NOT NULL,
	[Cte_IdLgr] [int] NOT NULL,
	[Cte_Cpl] [varchar](15) NULL,
	[Cte_NumEnd] [char](5) NOT NULL,
	[Cte_Cep] [char](10) NULL,
	[Cte_Tel] [varchar](20) NOT NULL,
	[Cte_Tel2] [varchar](20) NULL,
	[Cte_Fax] [varchar](20) NULL,
	[Cte_Eml] [varchar](50) NULL,
	[Cte_NmeCto] [varchar](70) NULL,
	[Cte_DatFim] [smalldatetime] NULL,
	[Cte_Bio] [bit] NULL,
	[Cte_BioExe] [bit] NULL,
	[Cte_BioCon] [bit] NULL,
 CONSTRAINT [PK_Atz_CttEnd] PRIMARY KEY CLUSTERED 
(
	[Cte_IdCtt] ASC,
	[Cte_SeqEnd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequência de endereço' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_SeqEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do logradouro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_IdLgr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complemento do logradouro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Cpl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_NumEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CEP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Cep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Outro telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Tel2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Eml'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do contato' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_NmeCto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica se o contratado local irá identificar os beneficiários por biometria [0-Não-1-Sim]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_CttEnd', @level2type=N'COLUMN',@level2name=N'Cte_Bio'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 12/18/2012 09:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) COLLATE DATABASE_DEFAULT = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name)COLLATE DATABASE_DEFAULT  NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) COLLATE DATABASE_DEFAULT = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) COLLATE DATABASE_DEFAULT NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 12/18/2012 09:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 12/18/2012 09:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 12/18/2012 09:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 12/18/2012 09:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 12/18/2012 09:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) COLLATE DATABASE_DEFAULT = ar.LoweredRoleName COLLATE DATABASE_DEFAULT
		AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name 
		FROM   @tbNames
		WHERE  LOWER(Name) COLLATE DATABASE_DEFAULT NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId  = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) COLLATE DATABASE_DEFAULT = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) COLLATE DATABASE_DEFAULT IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) COLLATE DATABASE_DEFAULT = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  Table [dbo].[Atz_BnfPrd]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_BnfPrd](
	[Bnp_IdBnf] [int] NOT NULL,
	[Bnp_IdPrd] [int] NOT NULL,
	[Bnp_IdItg] [int] NULL,
	[Bnp_TipItg] [char](1) NULL,
	[Bnp_DatIni] [smalldatetime] NOT NULL,
	[Bnp_DatFim] [smalldatetime] NULL,
 CONSTRAINT [PK_Atz_BnfPrd] PRIMARY KEY CLUSTERED 
(
	[Bnp_IdBnf] ASC,
	[Bnp_IdPrd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do produto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_IdPrd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do lote de integração' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_IdItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de integração, indica se o produto do beneficiário foi inserido ou alterado via integração [I-Insert|U-Update]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_TipItg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de início do produt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_DatIni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de término do produto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPrd', @level2type=N'COLUMN',@level2name=N'Bnp_DatFim'
GO
/****** Object:  Table [dbo].[Atz_BnfPdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_BnfPdm](
	[Bnp_IdBnf] [int] NOT NULL,
	[Bnp_IdPdm] [int] NOT NULL,
	[Bnp_IddMin] [tinyint] NULL,
	[Bnp_IddMax] [tinyint] NULL,
	[Bnp_LimDia] [tinyint] NULL,
	[Bnp_LimMes] [tinyint] NULL,
	[Bnp_LimAno] [tinyint] NULL,
	[Bnp_Lim] [smallint] NULL,
	[Bnp_Rtn] [smallint] NULL,
	[Bnp_Car] [smallint] NULL,
 CONSTRAINT [PK_Atz_BnfPdm] PRIMARY KEY CLUSTERED 
(
	[Bnp_IdBnf] ASC,
	[Bnp_IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Idade mínima permitida para execução' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_IddMin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Idade máxima permitida para execução' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_IddMax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade máxima de execuções por dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_LimDia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade máxima de execuções por mês' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_LimMes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade máxima de execuções por ano' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_LimAno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade máxima de execuções na vida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_Lim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Prazo mínimo para retorno (em dias)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_Rtn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Carência para o procedimento (em dias)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfPdm', @level2type=N'COLUMN',@level2name=N'Bnp_Car'
GO
/****** Object:  Table [dbo].[Atz_BnfCbt]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_BnfCbt](
	[Bnc_IdBnf] [int] NOT NULL,
	[Bnc_IdCbt] [smallint] NOT NULL,
	[Bnc_Car] [smallint] NOT NULL,
 CONSTRAINT [PK_BnfGrp] PRIMARY KEY NONCLUSTERED 
(
	[Bnc_IdBnf] ASC,
	[Bnc_IdCbt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfCbt', @level2type=N'COLUMN',@level2name=N'Bnc_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial do grupo de cobertura/carência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfCbt', @level2type=N'COLUMN',@level2name=N'Bnc_IdCbt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de dias em carência para o usuário no grupo de cobertura/carência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_BnfCbt', @level2type=N'COLUMN',@level2name=N'Bnc_Car'
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 12/18/2012 09:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 12/18/2012 09:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 12/18/2012 09:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
  FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 12/18/2012 09:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 12/18/2012 09:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 12/18/2012 09:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 12/18/2012 09:51:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 12/18/2012 09:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 12/18/2012 09:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, @CurrentTimeUtc, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 12/18/2012 09:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 12/18/2012 09:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 12/18/2012 09:51:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 12/18/2012 09:51:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 12/18/2012 09:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * PROCEDURE: dbo.aspnet_PersonalizationAllUsers_GetPageSettings 
 */

CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 12/18/2012 09:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
    AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 12/18/2012 09:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 12/18/2012 09:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * PROCEDURE: dbo.aspnet_Profile_SetProperties 
 */


CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 12/18/2012 09:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* 
 * PROCEDURE: dbo.aspnet_Profile_DeleteProfiles 
 */


CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Table [dbo].[Atz_Gia]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Gia](
	[IdGia] [int] IDENTITY(1,1) NOT NULL,
	[Gia_IdGiaPrc] [int] NULL,
	[Gia_IdCtt] [bigint] NULL,
	[Gia_SeqEnd] [tinyint] NULL,
	[Gia_IdPrf] [int] NULL,
	[Gia_IdEsp] [smallint] NULL,
	[Gia_IdBnf] [int] NOT NULL,
	[Gia_IdPrfSol] [int] NULL,
	[Gia_IdUsr] [int] NULL,
	[Gia_IdTpc] [tinyint] NULL,
	[Gia_IdTpa] [tinyint] NULL,
	[Gia_IdTpi] [tinyint] NULL,
	[Gia_IdAcm] [char](2) NULL,
	[Gia_IdRgm] [tinyint] NULL,
	[Gia_IdSai] [tinyint] NULL,
	[Gia_Tip] [tinyint] NOT NULL,
	[Gia_TipDoe] [char](1) NULL,
	[Gia_TemDoe] [char](4) NULL,
	[Gia_DatEms] [smalldatetime] NOT NULL,
	[Gia_DatAtd] [smalldatetime] NULL,
	[Gia_Snh] [varchar](20) NULL,
	[Gia_DatVld] [smalldatetime] NULL,
	[Gia_Crt] [char](1) NULL,
	[Gia_IndCln] [varchar](500) NULL,
	[Gia_DatItn] [smalldatetime] NULL,
	[Gia_QtdDri] [tinyint] NULL,
	[Gia_Jst] [varchar](100) NULL,
	[Gia_IndAdn] [tinyint] NULL,
 CONSTRAINT [PK_Gia] PRIMARY KEY NONCLUSTERED 
(
	[IdGia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia principal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdGiaPrc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequência de endereço do Contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_SeqEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do Profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdPrf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da Especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do profissional solicitante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdPrfSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de consulta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdTpc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de atendimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdTpa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de internação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdTpi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de acomodação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdAcm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do regime de internação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdRgm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do tipo de saída' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IdSai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo [1-guia de consulta|2-guia de SP/SADT|3-guia de internação]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_Tip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de doença [A-Aguda|C-Crônica]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_TipDoe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tempo de doença no formato 99-X, onde X pode ser A, M ou D [A-ano|M-mês|D-dia] ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_TemDoe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de emissão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_DatEms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAMPO REMOVIDO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_DatAtd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Senha de autorização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_Snh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de validade da senha' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_DatVld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Caráter da solicitação [E-Eletiva|U-Urgência/emergência] ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_Crt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicação clínica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_IndCln'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data provável da internação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_DatItn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de diárias autorizadas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_QtdDri'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justificativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Gia', @level2type=N'COLUMN',@level2name=N'Gia_Jst'
GO
/****** Object:  Table [dbo].[Atz_Cpi]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_Cpi](
	[Cpi_IdCpe] [int] NOT NULL,
	[Cpi_IdPdm] [int] NOT NULL,
	[Cpi_DatInc] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Cpi] PRIMARY KEY NONCLUSTERED 
(
	[Cpi_IdCpe] ASC,
	[Cpi_IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpi', @level2type=N'COLUMN',@level2name=N'Cpi_IdCpe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpi', @level2type=N'COLUMN',@level2name=N'Cpi_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de inclusão do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Cpi', @level2type=N'COLUMN',@level2name=N'Cpi_DatInc'
GO
/****** Object:  Table [dbo].[Atz_Lcr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_Lcr](
	[IdLcr] [int] IDENTITY(1,1) NOT NULL,
	[Lcr_IdCtt] [bigint] NOT NULL,
	[Lcr_SeqEnd] [tinyint] NOT NULL,
	[Lcr_IdRde] [smallint] NOT NULL,
 CONSTRAINT [PK_Atz_Lcr] PRIMARY KEY CLUSTERED 
(
	[IdLcr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lcr', @level2type=N'COLUMN',@level2name=N'IdLcr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lcr', @level2type=N'COLUMN',@level2name=N'Lcr_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequêncai de endereço do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lcr', @level2type=N'COLUMN',@level2name=N'Lcr_SeqEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Lcr', @level2type=N'COLUMN',@level2name=N'Lcr_IdRde'
GO
/****** Object:  Table [dbo].[Atz_UsrCttEnd]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_UsrCttEnd](
	[IdUce] [int] IDENTITY(1,1) NOT NULL,
	[Uce_IdUsr] [int] NOT NULL,
	[Uce_IdCtt] [bigint] NOT NULL,
	[Uce_SeqEnd] [tinyint] NOT NULL,
 CONSTRAINT [PK_Atz_UsrCttEnd] PRIMARY KEY CLUSTERED 
(
	[IdUce] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_UsrCttEnd', @level2type=N'COLUMN',@level2name=N'IdUce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_UsrCttEnd', @level2type=N'COLUMN',@level2name=N'Uce_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_UsrCttEnd', @level2type=N'COLUMN',@level2name=N'Uce_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequência de endereço do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_UsrCttEnd', @level2type=N'COLUMN',@level2name=N'Uce_SeqEnd'
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_PrdRde]    Script Date: 12/18/2012 09:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2009.08.13
-- Description:	Pesquisa a Rede do Produto Beneficiário
-- =============================================================================
CREATE FUNCTION [dbo].[fxAtz_PrdRde] 
(
	@IdBnf INT,
	@DatUtz SMALLDATETIME
)
RETURNS SMALLINT
AS
BEGIN
	DECLARE @Result SMALLINT

	SELECT	@Result = IdRde
	FROM	dbo.Atz_BnfPrd, dbo.Atz_Prd, dbo.Atz_Rde
	WHERE	IdPrd = Bnp_IdPrd
	AND		IdRde = Prd_IdRde
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= @DatUtz AND Bnp_DatFim >= @DatUtz))
	AND		Bnp_IdBnf = @IdBnf

	RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_BnfPrd]    Script Date: 12/18/2012 09:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2009.01.05
-- Description:	Pesquisa o Produto do Beneficiário
-- =============================================================================
CREATE FUNCTION [dbo].[fxAtz_BnfPrd] 
(
	@IdBnf INT,
	@DatUtz SMALLDATETIME
)
RETURNS VARCHAR(40)
AS
BEGIN
	DECLARE @Result VARCHAR(40)

	SELECT	@Result = Prd_Nme
	FROM	dbo.Atz_BnfPrd, dbo.Atz_Prd
	WHERE	IdPrd = Bnp_IdPrd
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= @DatUtz AND Bnp_DatFim >= @DatUtz))
	AND		Bnp_IdBnf = @IdBnf
	
	IF (@@ROWCOUNT = 0)
	BEGIN
		-- Quando não é econtrado produto ativo, tem que selecionar o último produto que o 
		-- usuário possuia para continuar a validação utilizando o último produto
		SELECT	TOP 1 @Result = Prd_Nme
		FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
		WHERE	IdBnf = Bnp_IdBnf
		AND		IdPrd = Bnp_IdPrd
		AND		IdBnf = @IdBnf
		ORDER BY Bnp_DatIni DESC
	END

	RETURN @Result
END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_BnfDatInc]    Script Date: 12/18/2012 09:52:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2009.10.07
-- Description:	Pesquisa a data de inclusão do beneficiário no plano
-- =============================================================================
CREATE FUNCTION [dbo].[fxAtz_BnfDatInc] 
(
	@IdBnf INT
)
RETURNS SMALLDATETIME
AS
BEGIN
	DECLARE @Result SMALLDATETIME

	SELECT	@Result = MIN(Bnp_DatIni)
	FROM	dbo.Atz_BnfPrd
	WHERE	Bnp_IdBnf = @IdBnf

	RETURN @Result

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Prf]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 26/08/2008
-- Description:	Profissionais - Cadastro de profissionais
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Prf]
@IdPrf INT = NULL,
@Prf_IdCns VARCHAR(7) = NULL,
@Prf_Mtr VARCHAR(20) = NULL,
@Prf_Nme VARCHAR(70) = NULL,
@Prf_NmeRsm VARCHAR(35) = NULL,
@Prf_NumCns VARCHAR(15) = NULL,
@Prf_EstCns CHAR(2) = NULL,
@Prf_Cpf CHAR(14) = NULL,
@Prf_Tel VARCHAR(20) = NULL,
@Prf_Tel2 VARCHAR(20) = NULL,
@Prf_Fax VARCHAR(20)= NULL,
@Prf_Eml VARCHAR(50)= NULL,
@Prf_Sit VARCHAR(1) = NULL

AS
	IF @IdPrf IS NULL
	INSERT INTO [dbo].[Atz_Prf]
           (Prf_IdCns
           ,Prf_Mtr
           ,Prf_Nme
           ,Prf_NmeRsm
           ,Prf_NumCns
           ,Prf_EstCns
           ,Prf_Cpf
           ,Prf_Tel
           ,Prf_Tel2
           ,Prf_Fax
           ,Prf_Eml
           ,Prf_Sit)
     VALUES
           (@Prf_IdCns 
           ,UPPER(@Prf_Mtr)
           ,UPPER(@Prf_Nme)
           ,UPPER(@Prf_NmeRsm)
           ,@Prf_NumCns
           ,@Prf_EstCns
           ,@Prf_Cpf
           ,@Prf_Tel
           ,@Prf_Tel2
           ,@Prf_Fax
           ,UPPER(@Prf_Eml)
           ,@Prf_Sit)
	ELSE
		UPDATE dbo.Atz_Prf
		SET	
			Prf_IdCns	=	    @Prf_IdCns 
           ,Prf_Mtr		=	    UPPER(@Prf_Mtr) 
           ,Prf_Nme		=	    UPPER(@Prf_Nme)
           ,Prf_NmeRsm	=	    UPPER(@Prf_NmeRsm)
           ,Prf_NumCns	=	    @Prf_NumCns
           ,Prf_EstCns	=	    @Prf_EstCns
           ,Prf_Cpf		=	    @Prf_Cpf
           ,Prf_Tel		=	    @Prf_Tel
           ,Prf_Tel2	=	    @Prf_Tel2
           ,Prf_Fax		=	    @Prf_Fax
           ,Prf_Eml		=	    UPPER(@Prf_Eml)
           ,Prf_Sit     =	    @Prf_Sit
		WHERE IdPrf = @IdPrf
GO
/****** Object:  StoredProcedure [dbo].[stItg_BnfPrd]    Script Date: 12/18/2012 09:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stItg_BnfPrd]
	@IdItg INT,
	@Out_Err TINYINT OUTPUT
AS 
BEGIN
	-- INSERINDO OS DADOS NA TABELA DE PRODUTOS POR BENEFICIARIOS (ATZ_BNFPRD)
	-- PARA BENEFICIÁRIOS QUE NÃO POSSUEM NENHUM PRODUTO
	INSERT dbo.Atz_BnfPrd
					(	Bnp_IdItg,	-- Código da Integração
						Bnp_TipItg, -- Tipo de Integração
						Bnp_IdBnf,	-- Codigo do Beneficiario
						Bnp_IdPrd,	-- Codigo do Produto
						Bnp_DatIni,	-- Data de Inicio
						Bnp_DatFim)	-- Data de Fim
		SELECT DISTINCT
					@IdItg,
					'I',	
					CONVERT(INT, IdBnf),
					CONVERT(INT, IdPrd),
					CONVERT(SMALLDATETIME, pu.dInclusao),
					CONVERT(SMALLDATETIME, pu.dExclusao)
		   FROM		SIGPS.dbo.PUSR_ProdutosDosUsuarios pu,
					SIGPS.dbo.PRDM_Produtos p,
					dbo.Atz_Bnf,
					dbo.Atz_Prd
		  WHERE		pu.sNomePRD = p.sNomePRD
			AND		pu.sCodigoUSR COLLATE DATABASE_DEFAULT = Bnf_Mtr COLLATE DATABASE_DEFAULT 
			AND		pu.sNomePRD COLLATE DATABASE_DEFAULT = Prd_SisGst COLLATE DATABASE_DEFAULT 
			AND		sTipoProduto = 'PLANO'
			AND		IdBnf NOT IN
				(
					SELECT Bnp_IdBnf
					FROM dbo.Atz_BnfPrd
				)

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 10
		GOTO FIM_ERRO
	END

	-- INSERINDO OS PRODUTOS DOS USUÁRIOS QUE JÁ POSSUEM PELO MENOS 1 PRODUTO
	INSERT dbo.Atz_BnfPrd
					(	Bnp_IdItg,	-- Código da Integração
						Bnp_TipItg, -- Tipo de Integração
						Bnp_IdBnf,	-- Codigo do Beneficiario
						Bnp_IdPrd,	-- Codigo do Produto
						Bnp_DatIni,	-- Data de Inicio
						Bnp_DatFim)	-- Data de Fim
		SELECT 		@IdItg,
					'I',
					CONVERT(INT, IdBnf),
					CONVERT(INT, IdPrd),
					CONVERT(SMALLDATETIME, pu.dInclusao),
					CONVERT(SMALLDATETIME, pu.dExclusao)
		FROM		SIGPS.dbo.PUSR_ProdutosDosUsuarios pu,
					SIGPS.dbo.PRDM_Produtos p,
					dbo.Atz_Bnf,
					dbo.Atz_Prd
		  WHERE		pu.sNomePRD = p.sNomePRD
			AND		pu.sCodigoUSR COLLATE DATABASE_DEFAULT = Bnf_Mtr COLLATE DATABASE_DEFAULT 
			AND		pu.sNomePRD COLLATE DATABASE_DEFAULT = Prd_SisGst COLLATE DATABASE_DEFAULT 
			AND		sTipoProduto = 'PLANO'
			AND		LTRIM(STR(IdBnf)) +'|'+ LTRIM(STR(IdPrd)) NOT IN
				(
					SELECT LTRIM(STR(Bnp_IdBnf)) +'|'+ LTRIM(STR(Bnp_IdPrd))
					FROM dbo.Atz_BnfPrd
				)
	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 10
		GOTO FIM_ERRO
	END


	-- ATUALIZANDO OS PRODUTOS DOS BENEFICIÁRIOS QUE FORAM EXCLUÍDOS
	UPDATE	dbo.Atz_BnfPrd
	SET		Bnp_IdItg = @IdItg,
			Bnp_TipItg = 'U',
			Bnp_DatFim = pu.dExclusao
	FROM	SIGPS.dbo.PUSR_ProdutosDosUsuarios pu,
			SIGPS.dbo.PRDM_Produtos p,
			dbo.Atz_Bnf,
			dbo.Atz_Prd,
			dbo.Atz_BnfPrd
	WHERE	pu.sNomePRD = p.sNomePRD
	AND		pu.sCodigoUSR COLLATE DATABASE_DEFAULT = Bnf_Mtr COLLATE DATABASE_DEFAULT 
	AND		pu.sNomePRD COLLATE DATABASE_DEFAULT = Prd_SisGst COLLATE DATABASE_DEFAULT 
	AND		sTipoProduto = 'PLANO'
	AND		IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		pu.dExclusao IS NOT NULL
	AND		Bnp_DatFim IS NULL

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 10
		GOTO FIM_ERRO
	END

	-- ATUALIZANDO OS PRODUTOS DOS BENEFICIÁRIOS QUE FORAM REATIVADOS
	UPDATE	dbo.Atz_BnfPrd
	SET		Bnp_IdItg = @IdItg,
			Bnp_TipItg = 'U',
			Bnp_DatFim = pu.dExclusao 
	FROM	SIGPS.dbo.PUSR_ProdutosDosUsuarios pu,
			SIGPS.dbo.PRDM_Produtos p,
			dbo.Atz_Bnf,
			dbo.Atz_Prd,
			dbo.Atz_BnfPrd
	WHERE	pu.sNomePRD = p.sNomePRD
	AND		pu.sCodigoUSR COLLATE DATABASE_DEFAULT = Bnf_Mtr COLLATE DATABASE_DEFAULT 
	AND		pu.sNomePRD COLLATE DATABASE_DEFAULT = Prd_SisGst COLLATE DATABASE_DEFAULT 
	AND		sTipoProduto = 'PLANO'
	AND		IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		pu.dExclusao IS NULL
	AND		Bnp_DatFim IS NOT NULL

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 10
		GOTO FIM_ERRO
	END


	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		RETURN	


END
GO
/****** Object:  StoredProcedure [dbo].[stItg_Bnf]    Script Date: 12/18/2012 09:52:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[stItg_Bnf]
	@IdItg INT,
	@Out_Err TINYINT OUTPUT
AS
BEGIN

	-- INSERINDO OS DADOS NA TABELA DE BENEFICIARIOS (ATZ_BNF)
	INSERT dbo.Atz_Bnf
		(	Bnf_IdItg,  -- Código da integração
			Bnf_TipItg, -- Tipo de integração
			Bnf_idTit,	-- Titular
			Bnf_idCnt,	-- Id contrato
			Bnf_Mtr,	-- Matricula
			Bnf_Nme,	-- Nome
			Bnf_Sxo,	-- Sexo
			Bnf_VrsCrt,	-- Versao cartao
			Bnf_DatNas,	-- Data nascimento
			Bnf_PosFin,	-- Posição financeira
			Bnf_NumCns,	-- Numero do cartao adicional de saude
			Bnf_DatVld,	-- Validade carteira
			Bnf_Sit,	-- Situacao usuario
			Bnf_DatPln) -- Data do contrato
		SELECT DISTINCT	
				@IdItg,
				'I',
				NULL, -- O TITULAR SERA ATUALIZADO ABAIXO				
				NULL, -- O CONTRATO SERA ATUALIZADO ABAIXO
				CONVERT(VARCHAR(20), u.sCodigoUSR),
				CONVERT(VARCHAR(70), u.sNomeUSR),
				Sexo = CASE 
					WHEN u.sSexo = 'MASCULINO' THEN 'M'
					WHEN u.sSexo = 'FEMININO' THEN 'F'
					ELSE NULL
				END,
				NULL,
				CONVERT(SMALLDATETIME, u.dNascimento),	
				'A', -- Adimplente (SERA ATUALIZADO ABAIXO)								
				CONVERT(CHAR(15), u.sCNS),					
				NULL,							
				Situacao = CASE 
					WHEN c.sSituacao = 'ATIVO' THEN 'A'
					ELSE 'I'
				END,
				CONVERT(SMALLDATETIME, c.dDataContrato)						
		FROM    SIGPS.dbo.USR_Usuarios u, 
				SIGPS.dbo.TIT_Titulares t, 
				SIGPS.dbo.CNT_Contratos c
		WHERE	u.iControleTIT = t.iControleTIT
		AND		c.sNumeroCNT = t.sNumeroCNT
		--AND		c.sSituacao = 'ATIVO'
		--AND		USR_Usuarios.dExclusao IS NULL
		AND		CONVERT(VARCHAR(20), u.sCodigoUSR) COLLATE DATABASE_DEFAULT NOT IN
			(	
				SELECT	Bnf_Mtr
				FROM	dbo.Atz_Bnf
			)

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 6
		GOTO FIM_ERRO
	END

	-- ALTERANDO OS DADOS JÁ EXISTENTES
	UPDATE	dbo.Atz_Bnf
	SET	Bnf_Nme = CONVERT(VARCHAR(70), u.sNomeUSR),
		Bnf_DatNas = u.dNascimento,
		Bnf_NumCns = CONVERT(CHAR(15), u.sCNS),
		Bnf_Sxo = CASE 
					WHEN u.sSexo = 'MASCULINO' THEN 'M'
					WHEN u.sSexo = 'FEMININO' THEN 'F'
					ELSE NULL
				  END						
	FROM    SIGPS.dbo.USR_Usuarios u, 
			SIGPS.dbo.TIT_Titulares t, 
			SIGPS.dbo.CNT_Contratos c,
			dbo.Atz_Bnf
	WHERE	u.iControleTIT = t.iControleTIT
	AND		c.sNumeroCNT = t.sNumeroCNT
	AND		CONVERT(VARCHAR(20), u.sCodigoUSR) COLLATE DATABASE_DEFAULT = Bnf_Mtr
	AND		(CONVERT(VARCHAR(70), u.sNomeUSR) COLLATE DATABASE_DEFAULT <>  Bnf_Nme 
	OR		u.dNascimento <>  Bnf_DatNas
	OR		CONVERT(CHAR(15), u.sCNS) COLLATE DATABASE_DEFAULT <>  Bnf_NumCns
	OR		CASE 
				WHEN u.sSexo = 'MASCULINO' THEN 'M'
				WHEN u.sSexo = 'FEMININO' THEN 'F'
			ELSE NULL
			END <> Bnf_Sxo)
	
	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 6
		GOTO FIM_ERRO
	END

	-- ATUALIZA O CAMPO CODIGO DO TITULAR, CASO O BENEFICIARIO NAO SEJA TITULAR
	UPDATE	a
	SET		a.Bnf_IdTit = m.IdBnf
	FROM	SIGPS.dbo.USR_Usuarios u, 
			SIGPS.dbo.TIT_Titulares t,
			dbo.Atz_Bnf m,
			dbo.Atz_Bnf a
	WHERE	u.iControleTIT = t.iControleTIT
	  AND	u.sCodigoUSR <> t.sCodigoUSR
	  AND	t.sCodigoUSR COLLATE DATABASE_DEFAULT = m.Bnf_Mtr COLLATE DATABASE_DEFAULT
	  AND   u.sCodigoUSR COLLATE DATABASE_DEFAULT = a.Bnf_Mtr COLLATE DATABASE_DEFAULT 
	  AND	a.Bnf_IdTit IS NULL

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 7
		GOTO FIM_ERRO
	END

	-- ATUALIZA O CAMPO DO CODIGO DO CONTRATO
	UPDATE	dbo.Atz_Bnf
	SET		Bnf_IdCnt = IdCnt
	FROM	SIGPS.dbo.USR_Usuarios u, 
			SIGPS.dbo.TIT_Titulares t,
			dbo.Atz_Cnt,
			dbo.Atz_Bnf
	WHERE	u.iControleTIT = t.iControleTIT
	  AND	t.sNumeroCNT COLLATE DATABASE_DEFAULT = Cnt_Num COLLATE DATABASE_DEFAULT 
	  AND	u.sCodigoUSR COLLATE DATABASE_DEFAULT = Bnf_Mtr COLLATE DATABASE_DEFAULT
	  AND	Bnf_IdCnt IS NULL

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 8
		GOTO FIM_ERRO
	END

	-- ATUALIZA O CAMPO POSICAO FINANCEIRA PARA ADIMPLENTE EM TODOS OS BENEFICIARIOS
	UPDATE	dbo.Atz_Bnf
	SET		Bnf_PosFin = 'A'

	-- ATUALIZA O CAMPO POSICAO FINANCEIRA COM OS INADIMPLENTES (7 DIAS DE ATRASO)
	-- DOS PLANOS EMPRESARIAL E INDIVIDUAL, DESDE QUE SEJAM BENEFICIÁRIOS ATIVOS,
	-- OU SEJA, POSSUAM PLANO ATIVO
	UPDATE	dbo.Atz_Bnf
	SET		Bnf_PosFin = 'I'
	FROM	SIGPS.DBO.CNT_Contratos c, SIGPS.DBO.TIT_Titulares t,
			SIGPS.DBO.USR_Usuarios u, SIGPS.DBO.RECM_RectosMestre r,
			dbo.Atz_Bnf, dbo.Atz_BnfPrd
	WHERE	IdBnf = Bnp_IdBnf
	AND		Bnf_Mtr = u.sCodigoUSR COLLATE DATABASE_DEFAULT
	AND		c.sNumeroCNT = t.sNumeroCNT
	AND		t.iControleTit = u.IControleTit
	AND		t.iControleTit = r.IControleTit
	--AND		c.sTipoContrato = 'EMPRESARIAL'
	AND		c.sTipoCobranca = 'INDIVIDUAL'
	AND		Bnp_DatFim IS NULL
--	AND		r.dPagamento IS NULL
--	AND		((r.dPagamento IS NULL) OR (r.cSaldo > 0))
	AND		r.dPagamento IS NULL
	AND		r.cSaldo > 0
	AND		DATEDIFF(DAY, r.dVencto, GETDATE()) > 30

	-- ATUALIZA O CAMPO POSICAO FINANCEIRA COM OS INADIMPLENTES (7 DIAS DE ATRASO)
	UPDATE	dbo.Atz_Bnf
	SET		Bnf_PosFin = 'I'
	FROM	SIGPS.DBO.CNT_Contratos c, 
			SIGPS.DBO.USR_Usuarios u, SIGPS.DBO.RECM_RectosMestre r,
			dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Cnt
	WHERE	IdBnf = Bnp_IdBnf
	AND		IdCnt = Bnf_IdCnt
	AND		Cnt_Num = c.sNumeroCNT COLLATE DATABASE_DEFAULT
	AND		Bnf_Mtr = u.sCodigoUSR COLLATE DATABASE_DEFAULT
	AND		c.sNumeroCNT = r.sNumeroCNT
	--AND		c.sTipoContrato <> 'EMPRESARIAL'
	AND		c.sTipoCobranca = 'COLETIVA'
	AND		Bnp_DatFim IS NULL
--	AND		r.dPagamento IS NULL
--	AND		((r.dPagamento IS NULL) OR (r.cSaldo > 0))
	AND		r.dPagamento IS NULL
	AND		r.cSaldo > 0
	AND		DATEDIFF(DAY, r.dVencto, GETDATE()) > 30

	IF @@ERROR <> 0
	BEGIN
		SET @Out_Err = 9
		GOTO FIM_ERRO
	END

	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		RETURN	

END
GO
/****** Object:  StoredProcedure [dbo].[stSgn_UsrPrf]    Script Date: 12/18/2012 09:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 12/10/2008
-- Description:	Usuário do Profissional - Manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_UsrPrf]

@IdPrf INT,
@IdUsr INT, 
@Tip_Aco CHAR(1) --[I-Insert|U-Update]

AS
	IF (@Tip_Aco = 'I')
		UPDATE	dbo.Atz_Prf
		SET		Prf_IdUsr = @IdUsr
		WHERE	IdPrf = @IdPrf
	ELSE
	IF (@Tip_Aco = 'U')
		UPDATE	dbo.Atz_Prf
		SET		Prf_IdUsr = NULL
		WHERE	IdPrf = @IdPrf
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldBnf]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldBnf]
	@IdBnf BIGINT,					-- Matrícula do beneficiário
	@IdPdm INT,						-- Código do procedimento
	@Gia_DatEms SMALLDATETIME,		-- Data de emissão da guia
	@Gia_Crt CHAR(1),				-- Caráter da solicitação[E-Eletiva|U-Urgência]
	
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdMsg VARCHAR(200) OUTPUT,	-- Códigos das mensagens com os motivos das negativas
	@Out_BnfSxo CHAR(1) OUTPUT,		-- Sexo do benfeciário
	@Out_BnfIdd TINYINT	OUTPUT,		-- Idade do beneficiário
	@Out_IdRde SMALLINT OUTPUT		-- Rede do produto do beneficiário
AS
BEGIN

	DECLARE /*@Emp_Sit CHAR(1),*/ @Bnf_Sit CHAR(1), @Bnf_PosFin CHAR(1), @Cnt_Sit CHAR(1),
			@IdPrd INT,	@Rst CHAR(1), @Dat_Vcm SMALLDATETIME, @Qtd_Vcm SMALLINT, 
			@Bnf_Mtr VARCHAR(20), @Pdm_Cod VARCHAR(20), @Bnp_DatIni SMALLDATETIME

	-- Selecionado o código do procedimento pelo Id para fazer a validação no banco de integração
	SELECT	@Pdm_Cod = Pdm_Cod 
	FROM	dbo.Atz_Pdm
	WHERE	IdPdm = @IdPdm

	-- Selecionando os dados requeridos para validação do beneficiário/procedimento
	SELECT	/*@Emp_Sit = Emp_Sit,*/ @Bnf_Sit = Bnf_Sit, @Bnf_PosFin = Bnf_PosFin,
			@Out_BnfSxo = Bnf_Sxo, @Out_BnfIdd = DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12, 
			@Bnf_Mtr = Bnf_Mtr, @Cnt_Sit = Cnt_Sit
	FROM	dbo.Atz_Bnf, dbo.Atz_Cnt --, dbo.Atz_Emp
	WHERE	IdCnt = Bnf_IdCnt
	AND		IdBnf = @IdBnf
	
	-- Selecionando o produto do beneficiário

	SELECT	@IdPrd = Bnp_IdPrd,	@Out_IdRde = Prd_IdRde, @Bnp_DatIni = Bnp_DatIni
	FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
	WHERE	IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= @Gia_DatEms AND Bnp_DatFim >= @Gia_DatEms) )
	AND		IdBnf = @IdBnf

	IF (@@ROWCOUNT = 0)
	BEGIN
		-- Quando não é econtrado produto ativo, tem que selecionar o último produto que o 
		-- usuário possuia para continuar a validação utilizando o último produto
		SELECT	TOP 1 @IdPrd = Bnp_IdPrd,	@Out_IdRde = Prd_IdRde, @Bnp_DatIni = Bnp_DatIni
		FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
		WHERE	IdBnf = Bnp_IdBnf
		AND		IdPrd = Bnp_IdPrd
		AND		IdBnf = @IdBnf
		ORDER BY Bnp_DatIni DESC

		SET @Out_IdMsg = @Out_IdMsg + '1014,' -- BENEFICIÁRIO COM DATA DE EXCLUSÃO
		SET @Out_Atz = 0
	END
	

--	ELSE
--	IF (@Emp_Sit = 'I')
--	BEGIN
--		SET @Out_IdMsg = 1018 -- Empresa do beneficiário suspensa / excluída
--		GOTO NAO_AUTORIZADO
--	END

--	Este controle passou a ser verificado somente na tabela Atz_BnfPrd
--	IF (@Bnf_Sit = 'I')
--	BEGIN
--		SET @Out_IdMsg = @Out_IdMsg + '1016,' -- Beneficiário com atendimento suspenso
--		SET @Out_Atz = 0
--	END

	IF (@Cnt_Sit = 'I')
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1018,' -- EMPRESA DO BENEFICIÁRIO SUSPENSA / EXCLUÍDA
		SET @Out_Atz = 0
	END
	
	IF (@Bnp_DatIni > @Gia_DatEms)  -- Data de inclusão no plano posterior à data de solicitação
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1004,' -- SOLICITAÇÃO ANTERIOR À INCLUSÃO DO BENEFICIÁRIO
		SET @Out_Atz = 0
	END

	IF (@Bnf_PosFin = 'I') AND (@Gia_Crt = 'E') -- Beneficiário com pagamento em aberto
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1009,'
		SET @Out_Atz = 0
	END
	
	-- Verificando se o procedimento faz parte do plano contratado pelo beneficiário
-- ### NÃO SERÁ UTILIZADO NESTE MOMENTO
--	SELECT	@Rst = Bnc_Rst, @Out_IdMsg = Bnc_IdMsg--, @Dat_Vcm = Plc_DatVcm, @Qtd_Vcm = Plc_QtdVcm
--	FROM	dbo.Atz_BnfCbt, dbo.Atz_Cbt, dbo.Atz_CbtPdm
--	WHERE	IdCbt = Bnc_IdCbt
--	AND		IdCbt = Cbp_IdCbt	
--	AND		Bnc_IdBnf = @IdBnf
--	AND		Cbp_IdPdm = @IdPdm
--	IF (@Rst = 'N')
--	BEGIN
--		SET @Out_IdMsg = 1407 -- SERVIÇO SOLICITADO NÃO POSSUI COBERTURA
--		GOTO NAO_AUTORIZADO
--	END
	
	-- ## SP CONSULTA SIGPS

	-- A consulta para autorização no SIPGS não deve ser efetuada para solicitação de urgência
	IF (@Gia_Crt = 'E')
	BEGIN
		DECLARE	@return_value INT, @Out_Car DATETIME, @Tmp_Atz BIT

		SET @Tmp_Atz = @Out_Atz

		EXEC	@return_value = [dbo].[ssItg_VldPdmBnf]
				@CodigoUsuario = @Bnf_Mtr,
				@CodigoServico = @Pdm_Cod,
				@Out_Atz = @Out_Atz OUTPUT,
				@Out_Car = @Out_Car OUTPUT
		
		IF (@Out_Atz = 0)
		BEGIN
			-- Verifica se a data de término da carência é maior do que a data 
			-- de emsissão da guia, se for o procedimento é negado por carência
			IF (@Out_Car IS NOT NULL AND (@Out_Car > @Gia_DatEms))
				SET @Out_IdMsg = @Out_IdMsg + '1007,' -- ATENDIMENTO DENTRO DA CARÊNCIA DO BENEFICIÁRIO
			ELSE
				SET @Out_IdMsg = @Out_IdMsg + '1420,' -- SERVIÇO SOLICITADO FORA DA COBERTURA
			SET @Out_Atz = 0
		END

		-- Deve ser verificado se o procedimento já foi negado pois a sp de integração
		-- pode retornar autorizado para um procedimento já negado. Neste caso como 
		-- já foi negado anteriormente, o procedimento deverá continuar negado.
		IF (@Tmp_Atz = 0) AND (@Out_Atz = 1)
			SET @Out_Atz = 0
	END	
	-- FIM CONSULTA SIGPS

	--SELECT	'Return Value' = @return_value

	-- Verificando se o procedimento faz parte do plano contratado pelo beneficiário
--	SELECT	@Rst = Plc_Rst, @Out_IdMsg = Plc_IdMsg, @Dat_Vcm = Plc_DatVcm, @Qtd_Vcm = Plc_QtdVcm
--	FROM	dbo.Atz_PdmCbt, dbo.Atz_Cbt, dbo.Atz_PlnCbt
--	WHERE	IdCbt = Pdc_IdCbt
--	AND		IdCbt = Plc_IdCbt
--	AND		Pdc_IdPdm = @IdPdm
--	AND		Plc_IdPln = @IdPln
--
--	IF (@Rst = 'N') 
--	BEGIN
--		SET @Out_IdMsg = 1420 -- SERVIÇO SOLICITADO FORA DA COBERTURA
--		GOTO NAO_AUTORIZADO
--	END
--	ELSE
--	IF (@Rst = 'A') AND (DATEDIFF(DAY,@Bnf_DatPln,@Gia_DatEms) > @Qtd_Vcm)
--	BEGIN
--		SET @Out_Sts = 1
--		PRINT '1'
--		RETURN 
--	END
	

--	SET @Out_Atz = 1
--	RETURN	

--	NAO_AUTORIZADO:
--	SET @Out_Atz = 0	



END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_BioBnf]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.12.09
-- Description:	Selciona os dados da biometria do beneficiário
-- =============================================================================
CREATE PROCEDURE [dbo].[ssSgn_BioBnf]
	@IdBnf INT,
	@Out_Fir VARCHAR(4000) OUTPUT
AS
	SELECT @Out_Fir = Bbf_Fir
	FROM dbo.Sgn_BioBnf
	WHERE Bbf_IdBnf = @IdBnf
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_UsrPrf]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa Id para usuário executantes(médicos)
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_UsrPrf] 
	@UserName NVARCHAR(256)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdPrf, Prf_Mtr, Prf_Nme
	FROM	dbo.Atz_Prf, dbo.Sgn_Usr, dbo.Aspnet_Users
	WHERE	IdUsr = Prf_IdUsr
	AND		UserId = Usr_UserId
	AND		UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_CttEnd]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 542 END #####################################################################

-- 543 BEGIN ###################################################################

-- =============================================================================
-- Author:		Wesley PS
-- ALTER  date: 05/09/2008
-- Description:	Contratado Endereço (local de atendimento) 
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_CttEnd]

	@Cte_IdCtt BIGINT,
	@Cte_SeqEnd TINYINT,
	@Cte_IdLgr INT,
	@Cte_Cpl VARCHAR(15),
	@Cte_NumEnd CHAR(5),
	@Cte_Tel VARCHAR(20),
	@Cte_Tel2 VARCHAR(20)= NULL,
	@Cte_Fax VARCHAR(20)= NULL,
	@Cte_Eml VARCHAR(50)= NULL,
	@Cte_NmeCto VARCHAR(70)= NULL,
	@Cte_BioCon BIT = NULL,
	@Cte_BioExe BIT = NULL,
	@Cte_DatFim SMALLDATETIME = NULL
 
AS

	IF NOT EXISTS (SELECT * FROM dbo.Atz_CttEnd WHERE Cte_IdCtt = @Cte_IdCtt AND Cte_SeqEnd = @Cte_SeqEnd)
    BEGIN
        DECLARE @sequencial INT
		SET @sequencial = (SELECT ISNULL(MAX(Cte_SeqEnd),0) + 1 from dbo.Atz_CttEnd WHERE Cte_IdCtt = @Cte_IdCtt)

		INSERT INTO dbo.Atz_CttEnd
				   (Cte_IdCtt
				   ,Cte_SeqEnd
				   ,Cte_IdLgr
				   ,Cte_Cpl
				   ,Cte_NumEnd
				   ,Cte_Tel
				   ,Cte_Tel2
				   ,Cte_Fax
				   ,Cte_Eml
				   ,Cte_NmeCto
				   ,Cte_BioCon
				   ,Cte_BioExe
				   ,Cte_DatFim)
			 VALUES
				   (@Cte_IdCtt,
					@sequencial,
					@Cte_IdLgr,
					@Cte_Cpl,
					@Cte_NumEnd,
					@Cte_Tel,
					@Cte_Tel2,
					@Cte_Fax,
					@Cte_Eml,
					@Cte_NmeCto,
					@Cte_BioCon,
					@Cte_BioExe,
					@Cte_DatFim)
    END
	ELSE
		UPDATE Atz_CttEnd
            SET	    Cte_IdCtt = @Cte_IdCtt
				   ,Cte_SeqEnd = @Cte_SeqEnd
				   ,Cte_IdLgr = @Cte_IdLgr
				   ,Cte_Cpl = @Cte_Cpl
				   ,Cte_NumEnd = @Cte_NumEnd
				   ,Cte_Tel = @Cte_Tel
				   ,Cte_Tel2 = @Cte_Tel2
				   ,Cte_Fax = @Cte_Fax
				   ,Cte_Eml = @Cte_Eml
				   ,Cte_NmeCto = @Cte_NmeCto
				   ,Cte_BioCon = @Cte_BioCon
				   ,Cte_BioExe = @Cte_BioExe
				   ,Cte_DatFim = @Cte_DatFim
			WHERE
                  Cte_IdCtt = @Cte_IdCtt AND 
                  Cte_SeqEnd = @Cte_SeqEnd
GO
/****** Object:  Table [dbo].[Sgn_BioPrf]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sgn_BioPrf](
	[IdBpf] [int] IDENTITY(1,1) NOT NULL,
	[Bpf_IdPrf] [int] NOT NULL,
	[Bpf_IdCtt] [bigint] NOT NULL,
	[Bpf_SeqEnd] [tinyint] NOT NULL,
	[Bpf_IdUsr] [int] NOT NULL,
	[Bpf_Fir] [varchar](4000) NOT NULL,
	[Bpf_Dat] [smalldatetime] NOT NULL,
	[Bpf_Ded] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sgn_BioPrf] PRIMARY KEY CLUSTERED 
(
	[IdBpf] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'IdBpf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_IdPrf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequência de endereço do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_SeqEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário que cadastrou a biometria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FIR com a identificação biométrica do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_Fir'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de cadastro da biometria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Índice do dedo utilizado na leitura biométrica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sgn_BioPrf', @level2type=N'COLUMN',@level2name=N'Bpf_Ded'
GO
/****** Object:  StoredProcedure [dbo].[stSgn_BioBnf]    Script Date: 12/18/2012 09:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.12.09
-- Description:	Cadastro dos dados da Biometria
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_BioBnf]
	@Bnf_Mtr VARCHAR(20),
	@IdUsr INT,
	@Bbf_Fir VARCHAR(4000),
	@Bbf_Ded TINYINT,
	@Out_Err BIT OUTPUT
AS
	SET NOCOUNT ON
	
	IF NOT EXISTS (SELECT IdBnf FROM dbo.Sgn_BioBnf, dbo.Atz_Bnf WHERE IdBnf = Bbf_IdBnf AND Bnf_Mtr = @Bnf_Mtr)
	BEGIN
		BEGIN TRAN
		
		INSERT dbo.Sgn_BioBnf 
			(Bbf_IdBnf, Bbf_IdUsr, Bbf_Fir, Bbf_Dat, Bbf_Ded)
			SELECT IdBnf, @IdUsr , @Bbf_Fir, GETDATE(), 1 
			FROM dbo.Atz_Bnf 
			WHERE Bnf_Mtr = @Bnf_Mtr
		
		IF (@@ERROR <> 0)
		BEGIN
			ROLLBACK TRAN
			SET @Out_Err = 1
			RETURN	
		END
		
		UPDATE dbo.Atz_Bnf
		SET	Bnf_Bio = 1
		WHERE Bnf_Mtr = @Bnf_Mtr
		
		IF (@@ERROR <> 0)
		BEGIN
			ROLLBACK
			SET @Out_Err = 1
			RETURN	
		END
		
		COMMIT TRAN
	END
	ELSE
	BEGIN
		UPDATE	dbo.Sgn_BioBnf
		SET		Bbf_Fir = @Bbf_Fir,
				Bbf_Dat = GETDATE(),
				Bbf_Ded = @Bbf_Ded
		FROM	dbo.Atz_Bnf, dbo.Sgn_BioBnf
		WHERE	IdBnf = Bbf_IdBnf
		AND		Bnf_Mtr = @Bnf_Mtr
		
		UPDATE dbo.Atz_Bnf
		SET	Bnf_Bio = 1
		WHERE Bnf_Mtr = @Bnf_Mtr
	END
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[stSgn_GrpUsr]    Script Date: 12/18/2012 09:52:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Grupo Usuário - Inserção de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_GrpUsr]
@Tip_Aco CHAR(1), -- [I-insert|D-delete]
@Gpu_IdGrp SMALLINT,
@Gpu_IdUsr INT

AS
	IF (@Tip_Aco = 'I')
		INSERT [dbo].[Sgn_GrpUsr]
				   ([Gpu_IdGrp],
					[Gpu_IdUsr])
			 VALUES
				   (@Gpu_IdGrp,
					@Gpu_IdUsr)
	ELSE
	IF (@Tip_Aco = 'D')
		DELETE FROM [dbo].[Sgn_GrpUsr]
		WHERE	Gpu_IdGrp = @Gpu_IdGrp
		AND		Gpu_IdUsr = @Gpu_IdUsr
GO
/****** Object:  StoredProcedure [dbo].[stSgn_BioPrf]    Script Date: 12/18/2012 09:52:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2010.04.15
-- Description:	Cadastro dos dados da Biometria do Profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[stSgn_BioPrf]
	@IdCtt BIGINT,
	@SeqEnd TINYINT,
	@Prf_Mtr VARCHAR(20),
	@IdUsr INT,
	@Bpf_Fir VARCHAR(4000),
	@Bpf_Ded TINYINT,
	@Out_Err BIT OUTPUT
AS
	SET NOCOUNT ON
	
	IF NOT EXISTS (SELECT IdBpf FROM dbo.Sgn_BioPrf, dbo.Atz_Prf
					WHERE IdPrf = Bpf_IdPrf AND Prf_Mtr = @Prf_Mtr)
	BEGIN
		BEGIN TRAN
		
		INSERT dbo.Sgn_BioPrf
			(Bpf_IdPrf, Bpf_IdCtt, Bpf_SeqEnd, Bpf_IdUsr, Bpf_Fir, Bpf_Dat, Bpf_Ded)
			SELECT IdPrf, @IdCtt, @SeqEnd, @IdUsr, @Bpf_Fir, GETDATE(), 1 
			FROM dbo.Atz_Prf
			WHERE Prf_Mtr = @Prf_Mtr
		
		IF (@@ERROR <> 0)
		BEGIN
			ROLLBACK TRAN
			SET @Out_Err = 1
			RETURN	
		END
		
		--UPDATE dbo.Atz_Prf
		--SET	Bnf_Bio = 1
		--WHERE Bnf_Mtr = @Bnf_Mtr
		
		IF (@@ERROR <> 0)
		BEGIN
			ROLLBACK
			SET @Out_Err = 1
			RETURN	
		END
		
		COMMIT TRAN
	END
	ELSE
		UPDATE	dbo.Sgn_BioPrf
		SET		Bpf_Fir = @Bpf_Fir,
				Bpf_Dat = GETDATE(),
				Bpf_Ded = @Bpf_Ded
		FROM	dbo.Atz_Prf, dbo.Sgn_BioPrf
		WHERE	IdPrf = Bpf_IdPrf
		AND		Bpf_IdCtt = @IdCtt
		AND		Bpf_SeqEnd = @SeqEnd
		AND		Prf_Mtr = @Prf_Mtr
	
	SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaCnc]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.11
-- Description:	Pesquisa Guias para cancelamento
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaCnc] 

	 @IdCtt BIGINT
	,@Cte_SeqEnd TINYINT
	,@Bnf_Mtr VARCHAR(20) = NULL
	,@Bnf_Nme VARCHAR(70) = NULL
	,@Gia_DatEms SMALLDATETIME = NULL

AS
BEGIN
	SET NOCOUNT ON;

	IF (@Gia_DatEms IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_Snh, Gia_DatEms				
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf
		WHERE	IdBnf = Gia_IdBnf
		--AND		Gia_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
		AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
		AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
	END
	ELSE
	IF (@Bnf_Mtr IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_Snh, Gia_DatEms				
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf
		WHERE	IdBnf = Gia_IdBnf
		--AND		Gia_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Mtr = @Bnf_Mtr
	END
	ELSE
	IF (@Bnf_Nme IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_Snh, Gia_DatEms				
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf
		WHERE	IdBnf = Gia_IdBnf
		--AND		Gia_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Nme LIKE '%'+ @Bnf_Nme +'%'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_CttLocRde]    Script Date: 12/18/2012 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 05/09/2008
-- Description:	Pesquisa Contratado Local Rede
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_CttLocRde] 

@IdCtt BIGINT = NULL,
@SeqEnd TINYINT = NULL,
@IdLcr INT = NULL

AS

	IF (@IdLcr IS NOT NULL)
		SELECT	 IdLcr  
				,IdCtt              
				,Rde_Nme
				,UPPER(Ctt_NmeRsm)+'-'+
					Lgr_Nme+'-'+
					(SELECT UPPER(Tpl_Dsc) FROM dbo.Atz_Tpl WHERE Lgr_IdTpl = IdTpl)+'-'+
					Brr_Nme+'-'+
					Mun_Nme AS Ctt_LocRde
		FROM dbo.Atz_Lcr INNER JOIN Atz_CttEnd ON (Lcr_IdCtt = Cte_IdCtt AND Lcr_SeqEnd = Cte_SeqEnd)
					 INNER JOIN dbo.Atz_Ctt ON (IdCtt = LCR_IDCTT)
					 INNER JOIN dbo.Atz_Rde ON (IdRde = Lcr_IdRde)
					 INNER JOIN dbo.Atz_Lgr ON (Cte_IdLgr = IdLgr)
					 INNER JOIN dbo.Atz_Brr ON (IdBrr = Lgr_IdBrr)
					 INNER JOIN dbo.Atz_Mun ON (Brr_IdMun = IdMun)
		WHERE	IdLcr = @IdLcr
		ORDER BY 4
	ELSE
		SELECT	 IdLcr  
				,IdCtt              
				,Rde_Nme
				,UPPER(Ctt_NmeRsm)+'-'+
					Lgr_Nme+'-'+
					(SELECT UPPER(Tpl_Dsc) FROM dbo.Atz_Tpl WHERE Lgr_IdTpl = IdTpl)+'-'+
					Brr_Nme+'-'+
					Mun_Nme AS Ctt_LocRde
		FROM dbo.Atz_Lcr INNER JOIN Atz_CttEnd ON (Lcr_IdCtt = Cte_IdCtt AND Lcr_SeqEnd = Cte_SeqEnd)
					 INNER JOIN dbo.Atz_Ctt ON (IdCtt = LCR_IDCTT)
					 INNER JOIN dbo.Atz_Rde ON (IdRde = Lcr_IdRde)
					 INNER JOIN dbo.Atz_Lgr ON (Cte_IdLgr = IdLgr)
					 INNER JOIN dbo.Atz_Brr ON (IdBrr = Lgr_IdBrr)
					 INNER JOIN dbo.Atz_Mun ON (Brr_IdMun = IdMun)
		WHERE	Cte_IdCtt = @IdCtt
		AND		Cte_SeqEnd = @SeqEnd
		ORDER BY 4
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Bnf]    Script Date: 12/18/2012 09:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.15
-- Description:	Pesquisa beneficiário
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Bnf]
	@IdBnf INT = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL, 
	@Bnf_Nme VARCHAR(70) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@IdBnf IS NOT NULL)
		SELECT	IdBnf, Bnf_Mtr, Bnf_Nme,
				dbo.fxAtz_BnfPrd(IdBnf,GETDATE()) AS Prd_Nme,
				dbo.fxAtz_PrdRde(IdBnf,GETDATE()) AS IdRde,
				Bnf_IdTit, Bnf_Sxo, Bnf_DatNas, Bnf_PosFin,
				Bnf_Sit, Bnf_Bio,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd
		FROM	dbo.Atz_Bnf
		WHERE	IdBnf = @IdBnf
	ELSE
	IF (@Bnf_Mtr IS NOT NULL) 
		SELECT	IdBnf, Bnf_Mtr, Bnf_Nme,
				dbo.fxAtz_BnfPrd(IdBnf,GETDATE()) AS Prd_Nme,
				dbo.fxAtz_PrdRde(IdBnf,GETDATE()) AS IdRde,
				Bnf_IdTit, Bnf_Sxo, Bnf_DatNas, Bnf_PosFin,
				Bnf_Sit, Bnf_Bio,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd
		FROM	dbo.Atz_Bnf
		WHERE	Bnf_Mtr = @Bnf_Mtr
		ORDER BY Bnf_Nme
	ELSE
	IF (@Bnf_Nme IS NOT NULL)
		SELECT	IdBnf, Bnf_Mtr, Bnf_Nme,
				dbo.fxAtz_BnfPrd(IdBnf,GETDATE()) AS Prd_Nme,
				dbo.fxAtz_PrdRde(IdBnf,GETDATE()) AS IdRde,
				Bnf_IdTit, Bnf_Sxo, Bnf_DatNas, Bnf_PosFin,
				Bnf_Sit, Bnf_Bio,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd
		FROM	dbo.Atz_Bnf
		WHERE	Bnf_Nme LIKE '%'+ @Bnf_Nme +'%'
		ORDER BY Bnf_Nme

END
GO
/****** Object:  StoredProcedure [dbo].[srAtz_GiaSdt]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 22/01/2009
-- Description:	Pesquisa da Guia de SP/SADT para impressão
-- =============================================
CREATE PROCEDURE [dbo].[srAtz_GiaSdt]
	@IdGia INT
AS
BEGIN
	SELECT	giasdt.IdGia, giasdt.Gia_Snh, giasdt.Gia_DatEms, Bnf_Mtr, Bnf_Nme,  
			LTRIM(STR(IdTpa)) +' - '+ Tpa_Dsc AS Tpa_Dsc,
			LTRIM(STR(IdSai)) +' - '+ Sai_Dsc AS Sai_Dsc,
			giasdt.Gia_Crt, cttsdt.IdCtt, cttsdt.Ctt_Nme, Tpl_Dsc,
			Lgr_Nme +' '+ ctesdt.Cte_NumEnd +' '+ ISNULL(ctesdt.Cte_Cpl,'') AS Ctt_End, 
			Mun_Nme, Mun_Est, ctesdt.Cte_Cep, prfsdt.Prf_Nme, ISNULL(giasdt.Gia_DatAtd,GETDATE()) AS Gia_DatAtd, 
			cttcon.IdCtt AS IdCttCon, cttcon.Ctt_Nme AS Ctt_NmeCon, prfcon.Prf_Mtr AS Prf_MtrCont, prfcon.Prf_Nme AS Prf_NmeCon,
			dbo.fxAtz_BnfPrd(IdBnf,GETDATE()) AS Prd_Nme,
			DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd
	FROM	dbo.Atz_Gia giasdt, dbo.Atz_Bnf, dbo.Atz_Ctt cttsdt, 
			dbo.Atz_CttEnd ctesdt, dbo.Atz_Prf prfsdt, dbo.Atz_Tpa, 
			dbo.Atz_Sai, dbo.Atz_Tpl, dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Mun, 
			-- Tabelas Guia de Consulta 
			dbo.Atz_Gia giacon, dbo.Atz_Ctt cttcon, dbo.Atz_CttEnd ctecon, dbo.Atz_Prf prfcon
	WHERE	cttsdt.IdCtt = ctesdt.Cte_IdCtt
	AND		IdBnf = giasdt.Gia_IdBnf
	AND		giasdt.Gia_IdCtt = ctesdt.Cte_IdCtt
	AND		giasdt.Gia_SeqEnd = ctesdt.Cte_SeqEnd
	AND		IdLgr = ctesdt.Cte_IdLgr
	AND		prfsdt.IdPrf =* giasdt.Gia_IdPrf
	AND		IdSai =* giasdt.Gia_IdSai
	AND		IdTpa =* giasdt.Gia_IdTpa
	AND		IdTpl = Lgr_IdTpl
	AND		IdMun = Brr_IdMun
	AND		IdBrr = Lgr_IdBrr
	--		Relação entre as Guias de Consulta e SP/SADT
	AND		giacon.IdGia = giasdt.Gia_IdGiaPrc
	--		JOINS Guia de Consulta
	AND		cttcon.IdCtt = ctecon.Cte_IdCtt
	AND		giacon.Gia_IdCtt = ctecon.Cte_IdCtt
	AND		giacon.Gia_SeqEnd = ctecon.Cte_SeqEnd
	AND		prfcon.IdPrf = giacon.Gia_IdPrf	
	
	AND		giasdt.IdGia = @IdGia

END
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_CttEnd]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Usuário do Contratado Endereço  
-- =============================================
CREATE PROCEDURE [dbo].[ssSgn_CttEnd] 

@Uce_IdCtt BIGINT,
@Uce_SeqEnd TINYINT
AS

	SELECT	IdUsr, UserName, Usr_Nme
	FROM	dbo.Atz_UsrCttEnd, dbo.Sgn_Usr, dbo.aspnet_Users
	WHERE	IdUsr = Uce_IdUsr
	AND		UserId = Usr_UserId
	AND		Uce_IdCtt = @Uce_IdCtt
	AND		Uce_SeqEnd = @Uce_SeqEnd
	ORDER BY Usr_Nme
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_UsrCrd]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa o credenciado do usuário
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_UsrCrd] 
	@UserName NVARCHAR(256)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdUsr, IdCtt, Ctt_Nme, Cte_SeqEnd, Lgr_Nme
	FROM	dbo.Atz_Ctt, dbo.Atz_CttEdn, dbo.Atz_UsrCttEnd, 
			dbo.Atz_Usr, dbo.Atz_Lgr, dbo.Aspnet_Users
	WHERE	IdLgr = Cte_IdLgr
	AND		IdCtt = Cte_IdCtt
	AND		IdUsr = Uce_IdUsr
	AND		Cte_IdCtt = Uce_IdCtt
	AND		Cte_SeqEnd = Uce_SeqEnd
	AND		IdCrd = Usr_IdCrd
	AND		UserId = Usr_UserId
--	AND		Cte_IdCtt = @IdCtt
--	AND		Cte_SeqEnd = @Cte_SeqEnd
	AND		UserName = @UserName
END
GO
/****** Object:  StoredProcedure [dbo].[stSgn_UsrCttEnd]    Script Date: 12/18/2012 09:52:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 12/10/2008
-- Description:	Usuário do Contratado Local - Manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stSgn_UsrCttEnd]

@Cte_IdCtt BIGINT,
@Cte_SeqEnd TINYINT, 
@IdUsr INT, 
@Tip_Aco CHAR(1) --[I-Insert|U-Update]

AS
	IF (@Tip_Aco = 'I')
		INSERT dbo.Atz_UsrCttEnd
		VALUES (@IdUsr, @Cte_IdCtt, @Cte_SeqEnd)
	ELSE
	IF (@Tip_Aco = 'D')
		DELETE 
		FROM dbo.Atz_UsrCttEnd
		WHERE	Uce_IdCtt = @Cte_IdCtt
		AND		Uce_SeqEnd = @Cte_SeqEnd
		AND		Uce_IdUsr = @IdUsr
GO
/****** Object:  StoredProcedure [dbo].[stItg_Exe]    Script Date: 12/18/2012 09:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stItg_Exe]
	@Out_Err TINYINT OUTPUT
AS
BEGIN
	DECLARE @IdItg INT

	INSERT dbo.Log_Itg
	VALUES (GETDATE(), 0, 0)
	
	SET @IdItg = SCOPE_IDENTITY()

	EXEC	dbo.stItg_Emp
			@IdItg = @IdItg,
			@Out_Err = @Out_Err OUTPUT
	
	IF (@Out_Err <> 0)
		GOTO FIM_ERRO

	EXEC	dbo.stItg_Prd
			@IdItg = @IdItg,
			@Out_Err = @Out_Err OUTPUT
	
	IF (@Out_Err <> 0)
		GOTO FIM_ERRO

	EXEC	dbo.stItg_Cnt
			@IdItg = @IdItg,
			@Out_Err = @Out_Err OUTPUT
	
	IF (@Out_Err <> 0)
		GOTO FIM_ERRO

	EXEC	dbo.stItg_Bnf
			@IdItg = @IdItg,
			@Out_Err = @Out_Err OUTPUT
	
	IF (@Out_Err <> 0)
		GOTO FIM_ERRO

	EXEC	dbo.stItg_BnfPrd
			@IdItg = @IdItg,
			@Out_Err = @Out_Err OUTPUT
	
	IF (@Out_Err <> 0)
		GOTO FIM_ERRO

	UPDATE dbo.Log_Itg
	SET Itg_Sts = 0
	WHERE IdItg = @IdItg

	RETURN

	FIM_ERRO:
		RETURN	

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Lcr]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Contratado Local Rede
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_Lcr]

@IdLcr  int,
@Lcr_IdCtt bigint,
@Lcr_SeqEnd tinyint,
@Lcr_IdRde smallint
 
AS


	IF @IdLcr is null
    INSERT INTO Atz_Lcr
           (Lcr_IdCtt
           ,Lcr_SeqEnd
           ,Lcr_IdRde)
     VALUES
           (
			@Lcr_IdCtt ,
			@Lcr_SeqEnd ,
			@Lcr_IdRde
			)
	ELSE
	UPDATE ATZ_LCR SET
			Lcr_IdCtt = @Lcr_IdCtt ,
			Lcr_SeqEnd = @Lcr_SeqEnd ,
			Lcr_IdRde = @Lcr_IdRde
     WHERE IdLcr = @IdLcr
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_BnfUltAtd]    Script Date: 12/18/2012 09:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 2008.07.15
-- Description:	Pesquisa data do último atendimento do beneficiário
-- =============================================
CREATE FUNCTION [dbo].[fxAtz_BnfUltAtd] 
(
	-- Add the parameters for the function here
	@IdBnf BIGINT
)
RETURNS SMALLDATETIME
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result SMALLDATETIME

	SELECT  @Result = MAX(Gia_DatAtd) 
	FROM	dbo.Atz_Gia
	WHERE	Gia_DatAtd IS NOT NULL
	AND		Gia_IdBnf = @IdBnf

	-- Return the result of the function
	RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_BnfUltCon]    Script Date: 12/18/2012 09:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 2009.01.05
-- Description:	Pesquisa data da última consulta do beneficiário
-- =============================================
CREATE FUNCTION [dbo].[fxAtz_BnfUltCon] 
(
	@IdBnf INT
)
RETURNS SMALLDATETIME
AS
BEGIN
	DECLARE @Result SMALLDATETIME

	SELECT  @Result = MAX(Gia_DatAtd) 
	FROM	dbo.Atz_Gia
	WHERE	Gia_Tip = 1 -- Guia de Consulta
	AND		Gia_DatAtd IS NOT NULL
	AND		Gia_IdBnf = @IdBnf

	RETURN @Result

END
GO
/****** Object:  Table [dbo].[Atz_PrfEspLcr]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_PrfEspLcr](
	[IdPel] [int] IDENTITY(1,1) NOT NULL,
	[Pel_IdPrf] [int] NOT NULL,
	[Pel_IdEsp] [smallint] NOT NULL,
	[Pel_IdLcr] [int] NOT NULL,
 CONSTRAINT [PK_Atz_PrfEspLcr] PRIMARY KEY CLUSTERED 
(
	[IdPel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_PrfEspLcr', @level2type=N'COLUMN',@level2name=N'IdPel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do profissional' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_PrfEspLcr', @level2type=N'COLUMN',@level2name=N'Pel_IdPrf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_PrfEspLcr', @level2type=N'COLUMN',@level2name=N'Pel_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do local na rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_PrfEspLcr', @level2type=N'COLUMN',@level2name=N'Pel_IdLcr'
GO
/****** Object:  Table [dbo].[Atz_Sol]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Sol](
	[IdSol] [int] IDENTITY(1,1) NOT NULL,
	[Sol_IdGia] [int] NULL,
	[Sol_IdCtt] [bigint] NULL,
	[Sol_SeqEnd] [tinyint] NULL,
	[Sol_IdEsp] [smallint] NULL,
	[Sol_IdPrfSol] [int] NULL,
	[Sol_IdBnf] [int] NULL,
	[Sol_IdUsr] [int] NULL,
	[Sol_TipDoe] [char](1) NULL,
	[Sol_TemDoe] [char](4) NULL,
	[Sol_DatEms] [smalldatetime] NOT NULL,
	[Sol_DatAtd] [smalldatetime] NULL,
	[Sol_Snh] [varchar](20) NULL,
	[Sol_DatVld] [smalldatetime] NOT NULL,
	[Sol_Crt] [char](1) NULL,
	[Sol_IndCln] [varchar](200) NULL,
	[Sol_Jst] [varchar](100) NULL,
 CONSTRAINT [PK_Sol] PRIMARY KEY NONCLUSTERED 
(
	[IdSol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'IdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia que originou a solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdCtt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sequência de endereço do contratado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_SeqEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do profissional solicitante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdPrfSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do beneficiário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdBnf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário que fez a solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de doença' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_TipDoe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tempo da doença' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_TemDoe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de emissão' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_DatEms'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do atendimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_DatAtd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Senha de autorização' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_Snh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de validade da senha' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_DatVld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Caráter da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_Crt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicação clínica da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_IndCln'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justificativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Sol', @level2type=N'COLUMN',@level2name=N'Sol_Jst'
GO
/****** Object:  Table [dbo].[Atz_GiaCid]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_GiaCid](
	[Gcd_IdGia] [int] NOT NULL,
	[Gcd_IdCid] [char](5) NOT NULL,
	[Gcd_Seq] [tinyint] NULL,
 CONSTRAINT [PK_GiaCid] PRIMARY KEY NONCLUSTERED 
(
	[Gcd_IdGia] ASC,
	[Gcd_IdCid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaCid', @level2type=N'COLUMN',@level2name=N'Gcd_IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do CID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaCid', @level2type=N'COLUMN',@level2name=N'Gcd_IdCid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial de inclusão do CID na guia [1-Principal|2-Segundo|3-Terceiro|4-Quarto]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaCid', @level2type=N'COLUMN',@level2name=N'Gcd_Seq'
GO
/****** Object:  Table [dbo].[Atz_LcrEsp]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_LcrEsp](
	[IdLce] [int] IDENTITY(1,1) NOT NULL,
	[Lce_IdLcr] [int] NOT NULL,
	[Lce_IdEsp] [smallint] NOT NULL,
	[Lce_TipAtd] [char](1) NULL,
 CONSTRAINT [PK_Atz_LcrEsp] PRIMARY KEY CLUSTERED 
(
	[IdLce] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_LcrEsp', @level2type=N'COLUMN',@level2name=N'IdLce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do local da rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_LcrEsp', @level2type=N'COLUMN',@level2name=N'Lce_IdLcr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_LcrEsp', @level2type=N'COLUMN',@level2name=N'Lce_IdEsp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica o tipo de atendimento que o Contratado Local Rede Especialidade pode fazer [E-Eletivo|U-Urgência|A-Ambos]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_LcrEsp', @level2type=N'COLUMN',@level2name=N'Lce_TipAtd'
GO
/****** Object:  Table [dbo].[Atz_Itn]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Itn](
	[IdItn] [int] IDENTITY(1,1) NOT NULL,
	[Itn_IdGia] [int] NOT NULL,
	[Itn_IdTpi] [tinyint] NOT NULL,
	[Itn_IdRgm] [tinyint] NOT NULL,
	[Itn_IdAcm] [tinyint] NULL,
	[Itn_IdUsr] [int] NOT NULL,
	[Itn_IdUsrAud] [int] NULL,
	[Itn_Tip] [tinyint] NOT NULL,
	[Itn_Dat] [smalldatetime] NULL,
	[Itn_Snh] [varchar](20) NULL,
	[Itn_DriSol] [tinyint] NOT NULL,
	[Itn_DriAtz] [tinyint] NULL,
	[Itn_Jst] [varchar](240) NULL,
	[Itn_DatAud] [smalldatetime] NULL,
	[Itn_DatRel] [smalldatetime] NULL,
	[Itn_Atz] [bit] NULL,
	[Itn_Loc] [varchar](50) NULL,
	[Itn_IdCtt] [bigint] NULL,
	[Itn_SeqEnd] [tinyint] NULL,
	[Itn_Obs] [varchar](500) NULL,
 CONSTRAINT [PK_Atz_Itn] PRIMARY KEY CLUSTERED 
(
	[IdItn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atz_Ngc]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_Ngc](
	[IdNgc] [int] IDENTITY(1,1) NOT NULL,
	[Ngc_IdPel] [int] NULL,
	[Ngc_IdLce] [int] NULL,
	[Ngc_IdPdm] [int] NOT NULL,
	[Ngc_Uni] [char](10) NOT NULL,
	[Ngc_Vlr] [numeric](18, 2) NOT NULL,
	[Ngc_VlrFlm] [numeric](18, 4) NULL,
	[Ngc_DatIni] [smalldatetime] NOT NULL,
	[Ngc_DatFim] [smalldatetime] NULL,
	[Ngc_FtrCh_] [numeric](18, 5) NULL,
	[Ngc_Crt] [char](1) NULL,
	[Ngc_IdUsrInc] [int] NULL,
	[Ngc_IdUsrExc] [int] NULL,
 CONSTRAINT [PK_Atz_Ngc] PRIMARY KEY CLUSTERED 
(
	[IdNgc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'IdNgc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do profissional na especialidade e local rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_IdPel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da especialdiade no local rede' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_IdLce'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unidade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_Uni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_Vlr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do filme' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_VlrFlm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de início da negociação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_DatIni'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de término da negociação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_Ngc', @level2type=N'COLUMN',@level2name=N'Ngc_DatFim'
GO
/****** Object:  Table [dbo].[Atz_ItnOpm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_ItnOpm](
	[Ito_IdOpm] [int] IDENTITY(1,1) NOT NULL,
	[Ito_IdItn] [int] NOT NULL,
	[Ito_Dsc] [varchar](60) NOT NULL,
	[Ito_Qtd] [tinyint] NOT NULL,
 CONSTRAINT [PK_Atz_ItnOpm] PRIMARY KEY CLUSTERED 
(
	[Ito_IdOpm] ASC,
	[Ito_IdItn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Atz_SolPdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_SolPdm](
	[Spd_IdSol] [int] NOT NULL,
	[Spd_IdPdm] [int] NOT NULL,
	[Spd_IdSit] [tinyint] NULL,
	[Spd_IdMsg] [smallint] NULL,
	[Spd_QtdSol] [tinyint] NOT NULL,
	[Spd_QtdAtz] [tinyint] NOT NULL,
	[Spd_QtdRel] [tinyint] NULL,
	[Spd_Dat] [smalldatetime] NULL,
	[Spd_DatVld] [smalldatetime] NULL,
 CONSTRAINT [PK_Atz_SolPdm] PRIMARY KEY NONCLUSTERED 
(
	[Spd_IdSol] ASC,
	[Spd_IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_IdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_IdSit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da mensagem de negativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_IdMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade solicitada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_QtdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade autorizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_QtdAtz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade realizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_QtdRel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de validade do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdm', @level2type=N'COLUMN',@level2name=N'Spd_DatVld'
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_FhaPciCid]    Script Date: 12/18/2012 09:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 2009.01.05
-- Description:	Pesquisa o CID da Guia de Consulta para ficha do paciente
-- =============================================
CREATE FUNCTION [dbo].[fxAtz_FhaPciCid] 
(
	@IdGia INT
)
RETURNS VARCHAR(310)
AS
BEGIN
	DECLARE @Result VARCHAR(310)

	SELECT  TOP 1 @Result = Gcd_IdCid +' - '+ Cid_Dsc
	FROM	dbo.Atz_Gia, dbo.Atz_GiaCid, dbo.Atz_Cid
	WHERE	IdGia = Gcd_IdGia
	AND		IdCid = Gcd_IdCid
	AND		IdGia = @IdGia

	RETURN @Result

END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_CidSeq]    Script Date: 12/18/2012 09:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2009.09.12
-- Description:	Pesquisa o CID da guia
-- =============================================================================
CREATE FUNCTION [dbo].[fxAtz_CidSeq]
(
	@IdGia INT,
	@Seq TINYINT
)
RETURNS CHAR(5)
AS
BEGIN
	RETURN 
		(
			SELECT	Gcd_IdCid
			FROM	dbo.Atz_GiaCid
			WHERE	Gcd_IdGia = @IdGia
			AND		Gcd_Seq = @Seq
		)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_BnfUltCid]    Script Date: 12/18/2012 09:52:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 2009.01.05
-- Description:	Pesquisa o último CID da última consulta do beneficiário
-- =============================================
CREATE FUNCTION [dbo].[fxAtz_BnfUltCid] 
(
	@IdBnf INT
)
RETURNS VARCHAR(310)
AS
BEGIN
	DECLARE @Result VARCHAR(310)

	SELECT  TOP 1 @Result = Gcd_IdCid +' - '+ Cid_Dsc
	FROM	dbo.Atz_Gia, dbo.Atz_GiaCid, dbo.Atz_Cid
	WHERE	IdGia = Gcd_IdGia
	AND		IdCid = Gcd_IdCid
	AND		Gia_Tip = 1 -- Guia de Consulta
	AND		Gia_DatAtd IS NOT NULL
	AND		Gia_IdBnf = @IdBnf
	ORDER BY Gia_DatAtd DESC

	RETURN @Result

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaSdt]    Script Date: 12/18/2012 09:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 26/01/2009
-- Description:	Guia SP/SADT - Manipulação de Dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_GiaSdt]
	 @IdSol INT
    ,@Gia_IdCtt BIGINT
	,@Gia_SeqEnd TINYINT
	,@Gia_IdUsr INT
	,@Gia_DatEms SMALLDATETIME
    ,@Gia_Snh VARCHAR(20)
	,@Gia_IdTpa TINYINT
	,@Gia_IdSai TINYINT
	,@Gia_IdPrf INT = NULL
	,@Gia_IdEsp INT
	,@Gia_Crt CHAR(1)

	,@Out_IdGia INT OUTPUT
	,@Out_Err BIT OUTPUT--[0-Operação efetuada|1-Erro]
	,@Out_Snh VARCHAR(20) OUTPUT 

AS
BEGIN
	DECLARE @ErrorLogID INT
	----	Tratamento para evitar inserção de guia em duplicidade
	--SELECT	@Out_IdGia = IdGia, @Out_Snh = Gia_Snh
	--FROM	dbo.Atz_Gia, dbo.Atz_Sol 
	--WHERE	Gia_IdGiaPrc = Sol_IdGia
	--AND		Gia_Tip = 2
	--AND		Gia_IdBnf = Sol_IdBnf
	--AND		Gia_IdCtt = @Gia_IdCtt
	--AND		Gia_SeqEnd = @Gia_SeqEnd
	--AND		Gia_IdEsp = @Gia_IdEsp
	--AND		Gia_IdUsr = @Gia_IdUsr
	--AND		Gia_Crt = @Gia_Crt
	--AND		Gia_DatEms = @Gia_DatEms	
	--AND		Gia_IdTpa = @Gia_IdTpa
	--AND		Gia_IdSai = @Gia_IdSai
	
	---- Se encontrar alguma guia já cadastrada em duplicidade,
	---- retorna o código da guia e senha cadastrada anteriormente.
	--IF (@@ROWCOUNT > 0)
	--BEGIN
	--	SET @Out_Err = 0
	--	RETURN
	--END

	BEGIN TRY

	INSERT	dbo.Atz_Gia
		(
			Gia_IdGiaPrc, Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf,
			Gia_IdPrf, Gia_IdPrfSol, Gia_IdUsr, Gia_IdTpa, Gia_IdSai, Gia_Tip, 
			Gia_Crt, Gia_TipDoe, Gia_TemDoe, Gia_DatEms, Gia_DatAtd, Gia_DatVld,
			Gia_IndCln
		)
		SELECT	Sol_IdGia, @Gia_IdCtt, @Gia_SeqEnd, @Gia_IdEsp, Sol_IdBnf,
				@Gia_IdPrf, Sol_IdPrfSol, @Gia_IdUsr, @Gia_IdTpa, @Gia_IdSai, 2, 
				@Gia_Crt, Sol_TipDoe, Sol_TemDoe, @Gia_DatEms, @Gia_DatEms, Sol_DatVld,
				Sol_IndCln
		FROM	dbo.Atz_Sol
		WHERE	IdSol = @IdSol	

	SET @Out_IdGia = SCOPE_IDENTITY()

	-- A senha de autorização é formada pelo número sequencial
	-- da guia mais a string randômica enviada pelo autorizador
	SET @Out_Snh = LTRIM(STR(@Out_IdGia)) + @Gia_Snh

	UPDATE dbo.Atz_Gia
	SET	Gia_Snh = @Out_Snh
	WHERE IdGia = @Out_IdGia

	SET @Out_Err = 0
	
	END TRY
	
	BEGIN CATCH
		
		DELETE FROM dbo.Atz_Gia WHERE IdGia = @Out_IdGia
 
		EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
		SET @Out_Err = 1
		
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Sol]    Script Date: 12/18/2012 09:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/07/2008
-- Description:	Guia SP/SADT - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Sol]
	 @IdGia INT
	,@Sol_IdUsr INT
	,@Sol_DatEms SMALLDATETIME
    ,@Sol_Snh VARCHAR(20)
	,@Sol_IndCln VARCHAR(200)
	,@Sol_Crt CHAR(1)

	,@Out_Err BIT OUTPUT -- Indica que houve erro na execução da sp [0-não|1-sim]
	,@Out_Snh VARCHAR(20) OUTPUT
	,@Out_IdSol INT OUTPUT
	,@Out_Dpl BIT OUTPUT -- Indica solicitação em duplicidade [0-não|1-sim]

AS
BEGIN
	DECLARE @ErrorLogID INT
	
	SET @Out_Dpl = 0
	
	--	Tratamento para evitar inserção de solicitação em duplicidade
	SELECT	@Out_IdSol = IdSol, @Out_Snh = Sol_Snh
	FROM	dbo.Atz_Sol
	WHERE	Sol_IdGia = @IdGia
	AND		Sol_IdUsr = @Sol_IdUsr
	AND		Sol_DatEms = @Sol_DatEms
	
	-- Se encontrar alguma guia já cadastrada em duplicidade,
	-- retorna o código da guia e senha cadastrada anteriormente.
	IF (@@ROWCOUNT > 0)
	BEGIN
		SET @Out_Err = 0
		SET @Out_Dpl = 1
		RETURN
	END

	BEGIN TRY
	
	INSERT dbo.Atz_Sol
		(Sol_IdGia, Sol_IdUsr, Sol_DatEms, Sol_DatVld, Sol_IndCln)
	 VALUES
		(@IdGia, @Sol_IdUsr, @Sol_DatEms, GETDATE() + 30, @Sol_IndCln)

	SET @Out_IdSol = SCOPE_IDENTITY()

	UPDATE	dbo.Atz_Sol
	SET		Sol_IdCtt = Gia_IdCtt,
			Sol_SeqEnd = Gia_SeqEnd,
			Sol_IdPrfSol = Gia_IdPrf,
			Sol_IdEsp = Gia_IdEsp,
			Sol_IdBnf = Gia_IdBnf,
			Sol_TipDoe = Gia_TipDoe,
			Sol_TemDoe = Gia_TemDoe,
			Sol_Crt = Gia_Crt
	FROM	dbo.Atz_Sol, dbo.Atz_Gia
	WHERE	IdGia = Sol_IdGia	
	AND		IdGia = @IdGia

	-- A senha de solicitação é formada pelo número sequencial
	-- da solicitação mais a string randômica enviada pelo autorizador
	SET @Out_Snh = LTRIM(STR(@Out_IdSol)) + @Sol_Snh

	UPDATE dbo.Atz_Sol
	SET	Sol_Snh = @Out_Snh
	WHERE IdSol = @Out_IdSol

	SET @Out_Err = 0
	END TRY
	
	BEGIN CATCH
	
	DELETE FROM dbo.Atz_Sol WHERE IdSol = @Out_IdSol
	EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
	SET @Out_Err = 1
	
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_PrfEspLcr]    Script Date: 12/18/2012 09:52:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Wesley PS
-- Create date: 05/09/2008
-- Description:	Profissional Contratado Local Rede Especialidade - Inserção e manipulação de dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_PrfEspLcr]

@IdPel int,
@Pel_IdPrf bigint,
@Pel_IdEsp smallint,
@Pel_IdLcr int

AS
	IF (@IdPel IS NULL)
	INSERT INTO Atz_PrfEspLcr
           (--IdPel
           Pel_IdPrf
           ,Pel_IdEsp
           ,Pel_IdLcr)
     VALUES
           (--@IdPel
            @Pel_IdPrf
           ,@Pel_IdEsp
           ,@Pel_IdLcr)
	ELSE
		UPDATE Atz_PrfEspLcr
		SET	
            --IdPel = @IdPel
            Pel_IdPrf = @Pel_IdPrf
           ,Pel_IdEsp = @Pel_IdEsp
           ,Pel_IdLcr = @Pel_IdLcr
		WHERE IdPel = @IdPel
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaCid]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 14/07/2008
-- Description:	Guia CID10 - Manipulação de Dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_GiaCid]
	 @Gcd_IdGia INT
    ,@Gcd_IdCid CHAR(5)
AS
BEGIN
	DECLARE @Seq TINYINT
	
	SELECT	@Seq = COUNT(*) + 1
	FROM	dbo.Atz_GiaCid 
	WHERE	Gcd_IdGia = @Gcd_IdGia
	
	INSERT dbo.Atz_GiaCid
           (Gcd_IdGia
           ,Gcd_IdCid
           ,Gcd_Seq)
     VALUES
           (@Gcd_IdGia
           ,@Gcd_IdCid
           ,@Seq)
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Itn]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 03/10/2009
-- Description:	Internação - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Itn]
	 @Itn_IdGia INT
	,@Itn_IdTpi TINYINT
	,@Itn_IdRgm TINYINT
	,@Itn_Snh VARCHAR(20)
	,@Itn_IdUsr INT
	,@Itn_DriSol TINYINT
	,@Itn_Loc VARCHAR(50) = NULL
	,@Out_IdItn INT OUTPUT
AS
	INSERT dbo.Atz_Itn
           (Itn_IdGia
           ,Itn_IdTpi
           ,Itn_IdRgm
           ,Itn_Tip
           ,Itn_Snh
           ,Itn_IdUsr
           ,Itn_DriSol
           ,Itn_Loc)
     VALUES
           (@Itn_IdGia
           ,@Itn_IdTpi
           ,@Itn_IdRgm
           ,1
           ,@Itn_Snh
           ,@Itn_IdUsr
           ,@Itn_DriSol
           ,UPPER(@Itn_Loc))
	SET @Out_IdItn = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Lce]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author		: Wesley PS
-- Create date	: 05/09/2008
-- Description	: Contratado Local Rede Especialidade
-- Author		: Rubens Jr
-- Alter date	: 21/02/2009
-- Description	: Adicionado o campo tipo de atendimento (Lce_TipAtd)
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Lce]

	@IdLce INT,
	@Lce_IdLcr INT,
	@Lce_IdEsp SMALLINT,
	@Lce_TipAtd CHAR(1) -- [E-Eletivo|U-Urgência|A-Ambos]
 
AS
	IF @IdLce IS NULL
		INSERT INTO Atz_LcrEsp
           (Lce_IdLcr, Lce_IdEsp, Lce_TipAtd)
		VALUES
           (@Lce_IdLcr, @Lce_IdEsp, @Lce_TipAtd)
	ELSE
		UPDATE Atz_LcrEsp 
		SET	Lce_IdLcr = @Lce_IdLcr,
			Lce_IdEsp = @Lce_IdEsp,
			Lce_TipAtd = @Lce_TipAtd			
		WHERE IdLce = @IdLce
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_SolExa]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.11.02
-- Description:	Pesquisa solicitações de SP/SADT
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_SolExa] 

	 @IdSol INT = NULL
	,@IdCtt BIGINT = NULL
	,@Cte_SeqEnd TINYINT = NULL
	,@Bnf_Mtr VARCHAR(20) = NULL
	,@Bnf_Nme VARCHAR(70) = NULL
	,@Sol_DatEms SMALLDATETIME = NULL

AS
BEGIN
	SET NOCOUNT ON;

	IF (@IdSol IS NOT NULL)
	BEGIN
		SELECT	IdSol, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Sol_IdPrfSol, Sol_IdEsp
		FROM	dbo.Atz_Sol, dbo.Atz_Bnf
		WHERE	IdBnf = Sol_IdBnf
		AND		IdSol = @IdSol
	END
	ELSE
	IF (@Sol_DatEms IS NOT NULL)
	BEGIN
		SELECT	IdSol, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Sol_IdPrfSol, Sol_IdEsp
		FROM	dbo.Atz_Sol, dbo.Atz_Bnf
		WHERE	IdBnf = Sol_IdBnf
		AND		Sol_IdCtt = @IdCtt
		AND		Sol_SeqEnd = @Cte_SeqEnd
		AND		DATEPART(YEAR,Sol_DatEms) = DATEPART(YEAR,@Sol_DatEms)
		AND		DATEPART(MONTH,Sol_DatEms) = DATEPART(MONTH,@Sol_DatEms)
		AND		DATEPART(DAY,Sol_DatEms) = DATEPART(DAY,@Sol_DatEms) 
	END
	ELSE
	IF (@Bnf_Mtr IS NOT NULL)
	BEGIN
		SELECT	IdSol, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Sol_IdPrfSol, Sol_IdEsp
		FROM	dbo.Atz_Sol, dbo.Atz_Bnf
		WHERE	IdBnf = Sol_IdBnf
		AND		Sol_IdCtt = @IdCtt
		AND		Sol_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Mtr = @Bnf_Mtr
	END
	ELSE
	IF (@Bnf_Nme IS NOT NULL)
	BEGIN
		SELECT	IdSol, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Sol_IdPrfSol, Sol_IdEsp
		FROM	dbo.Atz_Sol, dbo.Atz_Bnf
		WHERE	IdBnf = Sol_IdBnf
		AND		Sol_IdCtt = @IdCtt
		AND		Sol_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Nme LIKE '%'+ @Bnf_Nme +'%'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_PrfLocRde]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 15/10/2008
-- Description:	Pesquisa Profissional Local Rede
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_PrfLocRde] 

@IdCtt BIGINT = NULL,
@SeqEnd TINYINT = NULL,
@IdEsp SMALLINT = NULL,
@IdPrf INT =NULL

AS

	SELECT IdLcr
	FROM dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Prf
	WHERE IdLcr = Pel_IdLcr
	AND IdPrf = Pel_IdPrf
	AND	IdPrf = @IdPrf
	AND Pel_IdEsp = @IdEsp
	AND	Lcr_IdCtt = @IdCtt
	AND Lcr_SeqEnd = @SeqEnd
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_UsrCttEnd]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.21
-- Description:	Pesquisa os endereços do contratado 
--				em que o usuário esta relacionado.
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_UsrCttEnd] 
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
		SELECT	IdUsr, IdCtt, Cte_SeqEnd, Ctt_Nme, Lgr_Nme, Brr_Nme,
				Ctt_Nme + ' - '+ Tpl_Dsc +' '+ Lgr_Nme +', '+	Brr_Nme +' - '+ Mun_Nme AS Uce_Loc,
				LTRIM(STR(IdCtt)) +'|'+ LTRIM(STR(Cte_SeqEnd)) +'|'+ Ctt_Nme + '|'+ Tpl_Dsc +' '+ Lgr_Nme +'|'+
				Brr_Nme +'|'+ Mun_Nme +'|'+ LTRIM(STR(IdUsr)) +'|'+ Usr_Nme +'|'+ LTRIM(STR(Usr_IdPpl)) +'|'+ 
				CASE Cte_BioCon WHEN 1 THEN 'S' ELSE 'N' END +'|'+
				CASE Cte_BioExe WHEN 1 THEN 'S' ELSE 'N' END +'|'+ 
				CASE ISNULL(IdBpf,0) WHEN 0 THEN 'N' ELSE 'S' END AS Uce_Dad
		FROM	dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_PrfEspLcr, dbo.Atz_Prf, dbo.Atz_Lcr, dbo.Sgn_Usr, 
				dbo.Atz_Lgr, dbo.Atz_Mun, dbo.Atz_Brr, dbo.Atz_Tpl, dbo.Aspnet_Users, dbo.Sgn_BioPrf
		WHERE	IdLgr = Cte_IdLgr
		AND		IdTpl = Lgr_IdTpl
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		IdCtt = Cte_IdCtt
		AND		IdUsr = Prf_IdUsr
		AND		IdPrf = Pel_IdPrf
		AND		IdLcr = Pel_IdLcr
		AND		Cte_IdCtt = Lcr_IdCtt
		AND		Cte_SeqEnd = Lcr_SeqEnd
		AND		UserId = Usr_UserId
		AND		Cte_IdCtt *= Bpf_IdCtt
		AND		Cte_SeqEnd *= Bpf_SeqEnd
		AND		IdPrf *= Bpf_IdPrf
		AND		(Cte_DatFim IS NULL OR Cte_DatFim > GETDATE())
		AND		UserName = @UserName
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
GO
/****** Object:  StoredProcedure [dbo].[ssSgn_BioPrf]    Script Date: 12/18/2012 09:52:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 12/04/2010
-- Description:	Pesquisa Usuário do Profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[ssSgn_BioPrf] 
	@IdPrf      INT = NULL, 
	@Prf_Mtr	VARCHAR(20) = NULL,
	@Prf_Nme    VARCHAR(70) = NULL
AS
	IF @IdPrf IS NOT NULL
		SELECT  DISTINCT IdPrf,	Prf_Mtr, Prf_Nme, IdCtt, 
				Ctt_Nme, Cte_SeqEnd, Lgr_Nme,
				CONVERT(BIT,CASE ISNULL(IdBpf,0) WHEN 0 THEN 0 ELSE 1 END) AS Prf_Bio
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Prf, 
				dbo.Atz_CttEnd, dbo.Atz_Ctt, dbo.Atz_Lgr, dbo.Sgn_BioPrf
		WHERE	IdLcr = Pel_IdLcr
		AND		IdPrf = Pel_IdPrf
		AND		IdCtt = Cte_IdCtt
		AND		IdLgr = Cte_IdLgr
		AND		Lcr_IdCtt = Cte_IdCtt
		AND		Lcr_SeqEnd = Cte_SeqEnd
		AND		IdPrf *= Bpf_IdPrf
		AND		IdCtt *= Bpf_IdCtt
		AND		Cte_SeqEnd *= Bpf_SeqEnd
		AND		IdPrf = @IdPrf
		ORDER BY Ctt_Nme, Cte_SeqEnd
	ELSE
	IF @Prf_Mtr IS NOT NULL	
		SELECT  DISTINCT IdPrf,	Prf_Mtr, Prf_Nme, IdCtt,
				Ctt_Nme, Cte_SeqEnd, Lgr_Nme,
				CONVERT(BIT,CASE ISNULL(IdBpf,0) WHEN 0 THEN 0 ELSE 1 END) AS Prf_Bio
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Prf, 
				dbo.Atz_CttEnd, dbo.Atz_Ctt, dbo.Atz_Lgr, dbo.Sgn_BioPrf
		WHERE	IdLcr = Pel_IdLcr
		AND		IdPrf = Pel_IdPrf
		AND		IdCtt = Cte_IdCtt
		AND		IdLgr = Cte_IdLgr
		AND		Lcr_IdCtt = Cte_IdCtt
		AND		Lcr_SeqEnd = Cte_SeqEnd
		AND		IdPrf *= Bpf_IdPrf
		AND		IdCtt *= Bpf_IdCtt
		AND		Cte_SeqEnd *= Bpf_SeqEnd
		AND		Prf_Mtr = @Prf_Mtr
		ORDER BY Ctt_Nme, Cte_SeqEnd 		
	ELSE
	IF @Prf_Nme IS NOT NULL	
		SELECT  DISTINCT IdPrf,	Prf_Mtr, Prf_Nme, IdCtt,
				Ctt_Nme, Cte_SeqEnd, Lgr_Nme,
				CONVERT(BIT,CASE ISNULL(IdBpf,0) WHEN 0 THEN 0 ELSE 1 END) AS Prf_Bio
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Prf, 
				dbo.Atz_CttEnd, dbo.Atz_Ctt, dbo.Atz_Lgr, dbo.Sgn_BioPrf
		WHERE	IdLcr = Pel_IdLcr
		AND		IdPrf = Pel_IdPrf
		AND		IdCtt = Cte_IdCtt
		AND		IdLgr = Cte_IdLgr
		AND		Lcr_IdCtt = Cte_IdCtt
		AND		Lcr_SeqEnd = Cte_SeqEnd
		AND		IdPrf *= Bpf_IdPrf
		AND		IdCtt *= Bpf_IdCtt
		AND		Cte_SeqEnd *= Bpf_SeqEnd
		AND		Prf_Nme LIKE '%'+ @Prf_Nme +'%'
		ORDER BY Ctt_Nme, Cte_SeqEnd
GO
/****** Object:  StoredProcedure [dbo].[stAtz_AudItn]    Script Date: 12/18/2012 09:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 29/10/2009
-- Description:	Auditoria de internação
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_AudItn]
	@IdItn INT,
	@Itn_Dat SMALLDATETIME,
	@Itn_DriAtz TINYINT,
	@IdAcm TINYINT,
	@Itn_Obs VARCHAR(500),
	@IdCtt BIGINT,
	@SeqEnd TINYINT,
	@Itn_IdUsrAud INT,
	@Itn_Atz BIT
	--@Out_Sts TINYINT OUTPUT 
-- @Out_Sts
-- Indica o resultado da execução 
-- 0-Operação realizada
-- 1-Procedimento solicitado para troca já esta na solicitação
-- 2-Solicitação de procedimento já executada
-- 3-Não é permitido prorrogar validade de SP/SADT 
-- 4-Não é permitido prorrogar a validade de SP/SADT para procedimento sem saldo para execução
-- 5-Não é permitido alterar o procedimento com validade vencida
AS
	UPDATE	dbo.Atz_Itn
	SET		Itn_Dat = @Itn_Dat,
			Itn_DriAtz = @Itn_DriAtz,
			Itn_IdAcm = @IdAcm,
			Itn_Obs = UPPER(@Itn_Obs),
			Itn_IdCtt = @IdCtt,
			Itn_SeqEnd = @SeqEnd,
			Itn_IdUsrAud = @Itn_IdUsrAud,
			Itn_DatAud = GETDATE(),
			Itn_Atz = @Itn_Atz
	WHERE	IdItn = @IdItn
GO
/****** Object:  StoredProcedure [dbo].[srAtz_Sol]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 16/04/2009
-- Description:	Pesquisa de solicitação de SP/SADT para impressão
-- =============================================================================
 
CREATE PROCEDURE [dbo].[srAtz_Sol]
	@IdSol INT
AS
BEGIN

	SELECT	Sol_DatEms, Prf_Nme, Bnf_Mtr, Bnf_Nme,
			dbo.fxAtz_BnfPrd(IdBnf,GETDATE()) AS Prd_Nme,
			DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd
	FROM	dbo.Atz_Sol, dbo.Atz_Bnf, dbo.Atz_Prf
	WHERE	IdBnf = Sol_IdBnf
	AND		IdPrf = Sol_IdPrfSol
	AND		IdSol = @IdSol
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_AudDet]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 2009.03.10
-- Description:	Pesquisa dados da solicitação/guia para auditoria
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_AudDet] 
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
		SELECT	Bnf_Mtr, Bnf_Nme, Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Ctt_Nme, 
				Prf_Mtr, Prf_Nme, Prf_Tel, Prf_Tel2, Prf_Fax, Gia_IndCln AS Sol_IndCln,
				(
					SELECT	TOP 1 IdCid + ' - '+ Cid_Dsc 
					FROM	dbo.Atz_Cid, dbo.Atz_GiaCid 
					WHERE	IdCid = Gcd_IdCid
					AND		Gcd_IdGia = IdGia
				) AS Cid_Dsc, Tpl_Dsc +' '+ Lgr_Nme +' - '+ Brr_Nme +' - '+ Mun_Nme AS Ctt_End
		FROM	dbo.Atz_Gia, dbo.Atz_Ctt, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_CttEnd,
				dbo.Atz_Mun, dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Tpl
		WHERE	IdCtt = Gia_IdCtt
		AND		IdBnf = Gia_IdBnf
		AND		IdPrf =* Gia_IdPrf
		AND		Cte_IdCtt = Gia_IdCtt
		AND		Cte_SeqEnd = Gia_SeqEnd
		AND		IdMun = Brr_IdMun
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdTpl = Lgr_IdTpl
		AND		IdGia = @IdSol

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Cpc]    Script Date: 12/18/2012 09:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.15
-- Description:	Pesquisa Corpo Clínico
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Cpc] 
	 @IdLcr BIGINT
	,@IdEsp SMALLINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdPrf, Prf_Nme
	FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Prf
	WHERE	IdPrf = Pel_IdPrf
	AND		Pel_IdLcr = @IdLcr
	AND		Pel_IdEsp = @IdEsp
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_AudItnDet]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 07/10/2009
-- Description:	Pesquisa para detalhe da auditoria de internação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_AudItnDet] 
	@IdItn INT
AS
	SELECT	IdGia, IdItn, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfPrd(dbo.Atz_Bnf.IdBnf, GETDATE()) AS Prd_Nme, 
			DATEDIFF(MONTH, Bnf_DatNas, GETDATE()) / 12 AS Bnf_Idd, Bnf_Sxo, 
			dbo.fxAtz_BnfDatInc(dbo.Atz_Bnf.IdBnf) AS Prd_DatInc, 
			Prf_Nme, Itn_IdCtt, Itn_SeqEnd, Gia_Crt, Tpi_Dsc, Rgm_Dsc, Acm_Dsc,
			DATEDIFF(DAY, Gia_DatItn, GETDATE()) AS Int_Dri, Gia_IndCln, Gia_TipDoe, Gia_TemDoe,
			(
				SELECT	TOP 1 IdCid + ' - '+ Cid_Dsc 
				FROM	dbo.Atz_Cid, dbo.Atz_GiaCid 
				WHERE	IdCid = Gcd_IdCid
				AND		Gcd_IdGia = IdGia
			) AS Cid_Dsc, Ctt_Nme, Prf_Mtr, Prf_Nme, Prf_Tel, Prf_Tel2, Prf_Fax,
			CASE Itn_Atz WHEN 1 THEN 'AUTORIZADO' WHEN 0 THEN 'NEGADO' ELSE 'PENDENTE' END AS Itn_Atz
	FROM	dbo.Atz_Prf INNER JOIN
			dbo.Atz_Gia INNER JOIN
			dbo.Atz_Itn ON IdGia = dbo.Atz_Itn.Itn_IdGia INNER JOIN
			dbo.Atz_Bnf ON Gia_IdBnf = IdBnf INNER JOIN
			dbo.Atz_Esp ON Gia_IdEsp = IdEsp ON IdPrf = Gia_IdPrf INNER JOIN
			dbo.Atz_Tpi ON Itn_IdTpi = IdTpi INNER JOIN
			dbo.Atz_Rgm ON Itn_IdRgm = IdRgm LEFT OUTER JOIN
			dbo.Atz_Acm ON Itn_IdAcm = IdAcm LEFT OUTER JOIN
			dbo.Atz_CttEnd INNER JOIN
			dbo.Atz_Ctt ON Cte_IdCtt = IdCtt ON Itn_IdCtt = Cte_IdCtt AND 
			Itn_SeqEnd = Cte_SeqEnd
	WHERE	Gia_Tip = 3 
	AND		Itn_Tip = 1
	AND		IdItn = @IdItn
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_EspCon]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.04
-- Description:	Pesquisa Especialidade para consulta
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_EspCon] 
	 @IdEsp SMALLINT = NULL
	,@IdCtt BIGINT = NULL
	,@Cte_SeqEnd TINYINT = NULL
	,@IdPrf INT = NULL
	,@Lce_TipAtd CHAR(1) = NULL
AS 
BEGIN
	SET NOCOUNT ON;
	-- Seleciona o procedimento relacionado à especialidade pesquisada
	IF (@IdEsp IS NOT NULL)
		SELECT 	IdPdm, Pdm_Dsc
		FROM 	dbo.Atz_Pdm, dbo.Atz_EspCon
		WHERE	IdPdm = Epc_IdPdm
		AND		Epc_IdEsp = @IdEsp
		AND		Epc_Crt = @Lce_TipAtd
	ELSE
	-- Seleciona as Especialidades do Profissional no Contratado Local
	IF @IdPrf IS NOT NULL
	BEGIN
		-- Na Execução ao selecionar o profissional, todas as especialidades
		-- devem ser exibidas independente do caráter da execução
		IF (@Lce_TipAtd IS NULL)
			SELECT	DISTINCT IdEsp, Esp_Dsc
			FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Esp, dbo.Atz_LcrEsp
			WHERE	IdLcr = Pel_IdLcr
			AND		IdEsp = Pel_IdEsp
			AND		Pel_IdEsp = Lce_IdEsp
			AND		Pel_IdLcr = Lce_IdLcr
			AND		Lcr_IdCtt = @IdCtt
			AND		Lcr_SeqEnd = @Cte_SeqEnd
			AND		Pel_IdPrf = @IdPrf
			ORDER BY Esp_Dsc	
		ELSE
		-- Se o parâmetro tipo atendimento for A-Ambos, ele não deverá
		-- estar no filtro pois o contratado pode executar procedimentos
		-- E-Eletivos e U-Urgência
		IF (@Lce_TipAtd = 'A')
			SELECT	DISTINCT IdEsp, Esp_Dsc
			FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Esp, dbo.Atz_LcrEsp
			WHERE	IdLcr = Pel_IdLcr
			AND		IdEsp = Pel_IdEsp
			AND		Pel_IdEsp = Lce_IdEsp
			AND		Pel_IdLcr = Lce_IdLcr
			AND		Lcr_IdCtt = @IdCtt
			AND		Lcr_SeqEnd = @Cte_SeqEnd
			AND		Pel_IdPrf = @IdPrf
			ORDER BY Esp_Dsc	
		ELSE
			SELECT	DISTINCT IdEsp, Esp_Dsc
			FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, dbo.Atz_Esp, dbo.Atz_LcrEsp
			WHERE	IdLcr = Pel_IdLcr
			AND		IdEsp = Pel_IdEsp
			AND		Pel_IdEsp = Lce_IdEsp
			AND		Pel_IdLcr = Lce_IdLcr
			AND		Lcr_IdCtt = @IdCtt
			AND		Lcr_SeqEnd = @Cte_SeqEnd
			AND		Pel_IdPrf = @IdPrf
			AND		(Lce_TipAtd = @Lce_TipAtd OR Lce_TipAtd = 'A')
			ORDER BY Esp_Dsc
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaSolExa]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================
-- Author: Rubens F. de Paula Jr
-- Create date: 2009.01.15
-- Description: Pesquisa Guias de Consulta para solicitação de SP/SADT
-- ============================================================================
CREATE PROCEDURE [dbo].[ssAtz_GiaSolExa]
	@IdGia INT
AS
BEGIN
	SET NOCOUNT ON;

    SELECT	Gia_IdPrf, Bnf_Mtr, Bnf_Nme, Prf_Nme, Esp_Dsc,
            (
				SELECT	TOP 1 IdCid +' - '+ Cid_Dsc 
				FROM	dbo.Atz_Cid, dbo.Atz_GiaCid
				WHERE	IdCid = Gcd_IdCid
				AND		Gcd_IdGia = @IdGia
			) AS Cid_Dsc, Gia_IdEsp, IdBnf, Gia_Crt
    FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_Esp
    WHERE	IdBnf = Gia_IdBnf
    AND		IdPrf = Gia_IdPrf
    AND		IdEsp = Gia_IdEsp
    AND		IdGia = @IdGia
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaPel]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.15
-- Description:	Pesquisa Corpo Clínico
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_GiaPel] 
	 @IdCtt BIGINT
	,@Cte_SeqEnd TINYINT
	,@IdUsr INT = NULL
	,@Lce_TipAtd CHAR(1) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF (@IdUsr IS NOT NULL AND @Lce_TipAtd IS NULL)
		SELECT	DISTINCT IdPrf, Prf_Nme
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Prf, dbo.Atz_Lcr, dbo.Atz_LcrEsp
		WHERE	IdPrf = Pel_IdPrf
		AND		IdLcr = Pel_IdLcr
		AND		Pel_IdEsp = Lce_IdEsp
		AND		Pel_IdLcr = Lce_IdLcr
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @Cte_SeqEnd
		AND		Prf_IdUsr = @IdUsr
		ORDER BY Prf_Nme
	ELSE
	IF (@IdUsr IS NOT NULL AND @Lce_TipAtd IS NOT NULL)
		SELECT	DISTINCT IdPrf, Prf_Nme
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Prf, dbo.Atz_Lcr, dbo.Atz_LcrEsp
		WHERE	IdPrf = Pel_IdPrf
		AND		IdLcr = Pel_IdLcr
		AND		Pel_IdEsp = Lce_IdEsp
		AND		Pel_IdLcr = Lce_IdLcr
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @Cte_SeqEnd
		AND		Prf_IdUsr = @IdUsr
		AND		(Lce_TipAtd = @Lce_TipAtd OR Lce_TipAtd = 'A')
		ORDER BY Prf_Nme
	ELSE
		SELECT	DISTINCT IdPrf, Prf_Nme
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Prf, dbo.Atz_Lcr
		WHERE	IdPrf = Pel_IdPrf
		AND		IdLcr = Pel_IdLcr
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @Cte_SeqEnd
		ORDER BY Prf_Nme
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_LcrEsp]    Script Date: 12/18/2012 09:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 15/10/2008
-- Description:	Pesquisa Contratado Local Rede pela Especialidade
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_LcrEsp] 

@IdCtt BIGINT = NULL,
@SeqEnd TINYINT = NULL,
@IdEsp SMALLINT = NULL,
@Lce_TipAtd CHAR(1) = NULL

AS
	-- Se o tipo de atendimento for A-Ambos, deve retornar
	-- todas as especialidades do Contratado (SELECT do ELSE)
	IF (@Lce_TipAtd IS NOT NULL) AND (@Lce_TipAtd <> 'A')
		SELECT	DISTINCT IdEsp, Esp_Dsc
		FROM	dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Esp
		WHERE	IdLcr = Lce_IdLcr
		AND		IdEsp = Lce_IdEsp
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @SeqEnd
		AND		Lce_TipAtd = @Lce_TipAtd
		ORDER BY Esp_Dsc
	ELSE
	IF (@IdEsp IS NOT NULL)
		SELECT IdLcr
		FROM dbo.Atz_Lcr, dbo.Atz_LcrEsp
		WHERE IdLcr = Lce_IdLcr
		AND Lce_IdEsp = @IdEsp
		AND	Lcr_IdCtt = @IdCtt
		AND Lcr_SeqEnd = @SeqEnd
	ELSE
		-- Seleciona as especialidade do contratado
		SELECT	DISTINCT IdEsp, Esp_Dsc
		FROM	dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Esp
		WHERE	IdLcr = Lce_IdLcr
		AND		IdEsp = Lce_IdEsp
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @SeqEnd
		ORDER BY Esp_Dsc


/****** Object:  StoredProcedure [dbo].[ssAtz_EspCon]    Script Date: 09/24/2009 16:34:17 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_ItnOpm]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 12/10/2009
-- Description:	Pesquisa OPM na internação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_ItnOpm] 	
	@IdItn INT
AS
	SELECT	Ito_Dsc, Ito_Qtd
	FROM	dbo.Atz_ItnOpm
	WHERE	Ito_IdItn = @IdItn
	ORDER BY Ito_Dsc
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_FhaPciExa]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.15
-- Description:	Pesquisa Ficha do Paciente - Últimos exames realizados
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_FhaPciExa] 
	@IdBnf INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	TOP 30 Spd_Dat, ': '+ Pdm_Cod AS Pdm_Cod, ' - '+ Pdm_Dsc AS Pdm_Dsc
	FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Pdm, dbo.Atz_Sit
	WHERE	IdSol = Spd_IdSol
	AND		IdPdm = Spd_IdPdm
	AND		IdSit = Spd_IdSit 
	AND		Sit_Ind = 'A'
	AND		Sol_IdBnf = @IdBnf
	ORDER BY Spd_Dat DESC

END
GO
/****** Object:  StoredProcedure [dbo].[srAtz_SolPdm]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 16/04/2009
-- Description:	Pesquisa de procedimentos da solicitação de SP/SADT para impressão
-- =============================================================================
 
CREATE PROCEDURE [dbo].[srAtz_SolPdm]
	@IdSol INT
AS
BEGIN
	SELECT	Spd_IdSit, Sit_Dsc, Pdm_Cod, Pdm_Dsc, Spd_QtdSol
	FROM	dbo.Atz_SolPdm, dbo.Atz_Pdm, dbo.Atz_Sit
	WHERE	IdPdm = Spd_IdPdm
	AND		IdSit = Spd_IdSit
	AND		Spd_IdSol = @IdSol
	ORDER BY Spd_IdSit DESC, Pdm_Cod
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldCtt]    Script Date: 12/18/2012 09:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldCtt]
	@IdCtt BIGINT,					-- Matrícula do contratado
	@Cte_SeqEnd TINYINT,			-- Sequência de endereço do contratado
	@IdEsp SMALLINT,				-- Código da Especialidade
	@IdPdm INT,						-- Código do procedimento
	@IdRde SMALLINT,				-- Código da rede do profissional
	@Gia_DatEms SMALLDATETIME,		-- Data de emissão da guia
	@Ngc_Crt CHAR(1),				-- Caráter da solicitação
	
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdNgc INT OUTPUT,			-- Código da negociação que resultou na autorização
	@Out_IdMsg VARCHAR(200) OUTPUT	-- Códigos das mensagens com os motivos das negativas
	
AS
BEGIN 

	DECLARE @IdMsg SMALLINT, @IdLce INT

	-- Verifica se o Contratado atende à rede do beneficiário
	SELECT	@IdLce = IdLce
	FROM	Atz_LcrEsp, Atz_Lcr 
	WHERE	IdLcr = Lce_IdLcr
	AND		Lce_IdEsp = @IdEsp
	AND		Lcr_IdCtt = @IdCtt
	AND		Lcr_SeqEnd = @Cte_SeqEnd
	AND		Lcr_IdRde = @IdRde

	IF (@IdLce IS NULL)
	BEGIN
		SET @Out_Atz = 0
		SET @Out_IdMsg = @Out_IdMsg + '1207,' -- CREDENCIADO NÃO PERTENCE À REDE CREDENCIADA
	END

	SET @Out_IdNgc =	
			(
					SELECT	IdNgc
					FROM	dbo.Atz_Ngc
					WHERE	Ngc_IdPdm = @IdPdm
					AND		(Ngc_Crt = 'A' OR Ngc_Crt = @Ngc_Crt)
					AND		Ngc_IdLce = @IdLce
					AND		((@Gia_DatEms BETWEEN Ngc_DatIni AND Ngc_DatFim) OR
							(Ngc_DatIni < @Gia_DatEms AND Ngc_DatFim IS NULL) OR
							(Ngc_DatFim > @Gia_DatEms AND Ngc_DatIni IS NULL))
			)
	IF @Out_IdNgc IS NULL
	BEGIN
		SET @Out_Atz = 0
		SET @Out_IdMsg = @Out_IdMsg + '1214,' --- CREDENCIADO NÃO HABILITADO A REALIZAR O PROCEDIMENTO
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldPrf]    Script Date: 12/18/2012 09:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldPrf]
	@IdCtt BIGINT,				-- Matrícula do contratado
	@Cte_SeqEnd TINYINT,		-- Sequência de endereço do contratado
	@IdPrf INT,					-- Código do profissional
	@IdEsp SMALLINT,			-- Código da Especialidade
	@IdPdm INT,					-- Código do procedimento
	@IdRde SMALLINT,			-- Código da rede do profissional
	@Gia_DatEms SMALLDATETIME,	-- Data de emissão da guia
	@Ngc_Crt CHAR(1),			-- Caráter da solicitação
	
	@Out_IdPel INT OUTPUT,			-- Código do Profissional Especialidade Local Rede
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdNgc INT OUTPUT,			-- Código da negociação que resultou na autorização
	@Out_IdMsg VARCHAR(200) OUTPUT	-- Códigos das mensagens com os motivos das negativas
	
AS
BEGIN
	
	-- Verifica se existe algum Profissional associado à Rede e ao Local do Contratado
	SELECT	@Out_IdPel = IdPel
	FROM	Atz_PrfEspLcr, Atz_Lcr 
	WHERE	IdLcr = Pel_IdLcr
	AND		Pel_IdPrf = @IdPrf	
	AND		Pel_IdEsp = @IdEsp
	AND		Lcr_IdCtt = @IdCtt
	AND		Lcr_SeqEnd = @Cte_SeqEnd
	AND		Lcr_IdRde = @IdRde

	IF (@Out_IdPel IS NULL)
	BEGIN
		SET @Out_Atz = 0
		SET @Out_IdMsg = @Out_IdMsg + '1207,' -- CREDENCIADO NÃO PERTENCE À REDE CREDENCIADA
	END

	SET @Out_IdNgc =	
			(
					SELECT	IdNgc
					FROM	dbo.Atz_Ngc
					WHERE	Ngc_IdPdm = @IdPdm
					AND		(Ngc_Crt = 'A' OR Ngc_Crt = @Ngc_Crt)
					AND		Ngc_IdPel = @Out_IdPel
					AND		((@Gia_DatEms BETWEEN Ngc_DatIni AND Ngc_DatFim) OR
							(Ngc_DatIni < @Gia_DatEms AND Ngc_DatFim IS NULL) OR
							(Ngc_DatFim > @Gia_DatEms AND Ngc_DatIni IS NULL))
			)
	IF @Out_IdNgc IS NULL
	BEGIN
		SET @Out_Atz = 0
		SET @Out_IdMsg = @Out_IdMsg + '1214,' --- CREDENCIADO NÃO HABILITADO A REALIZAR O PROCEDIMENTO
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_NgcCttDet]    Script Date: 12/18/2012 09:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 20/06/2009
-- Description:	Pesquisa Negociação - Contratado, detalhe da negociação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_NgcCttDet] 
	@IdNgc INT
AS
	SELECT IdNgc, IdCtt, Ctt_Nme, Lcr_SeqEnd, 
			( 
				SELECT Tpl_Dsc + '-' + Lgr_Nme + '-' + Brr_Nme + '-' + Mun_Nme 
				FROM dbo.Atz_Lgr
					 INNER JOIN dbo.Atz_Brr ON (IdBrr = Lgr_IdBrr)
					 INNER JOIN dbo.Atz_Mun ON (IdMun = Brr_IdMun) 
					 INNER JOIN dbo.Atz_Tpl ON (IdTpl = Lgr_IdTpl) 
				WHERE IdLgr = Cte_IdLgr  
			) AS Ctt_Loc,
			Rde_Nme, Esp_Dsc, Pdm_Cod, Pdm_Dsc, 
			Grp_Dsc, Ngc_Uni, Ngc_Vlr, Ngc_VlrFlm, Ngc_DatIni, Ngc_DatFim
	FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Pdm, dbo.Atz_Rde, 
			dbo.Atz_Esp, dbo.Atz_Grp, dbo.Atz_Ctt, dbo.Atz_CttEnd
	WHERE	IdLce = Ngc_IdLce
	AND		IdLcr = Lce_IdLcr
	AND		IdEsp = Lce_IdEsp
	AND		IdPdm = Ngc_IdPdm
	AND		IdRde = Lcr_IdRde
	AND		IdGrp = Pdm_IdGrp
	AND		IdCtt = Cte_IdCtt
	AND		Lcr_IdCtt = Cte_IdCtt
	AND		Lcr_SeqEnd = Cte_SeqEnd
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Pdm]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author : Wesley PS
-- Create date : 26/08/2008
-- Description : Pesquisa Procedimento
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Pdm]

	@IdPdm INT = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,            
	@Pdm_IdGrp SMALLINT = NULL,
	@Pdm_Dsc VARCHAR(80) = NULL,
	@Grp_Dsc VARCHAR(30) = NULL,
	@Pdm_Atv BIT = NULL,
	@Pdm_Fvt BIT = 0,
	@IdEsp SMALLINT = NULL

AS

	DECLARE @WHERE NVARCHAR(2000), @SQL NVARCHAR(2000)
	
	IF @Pdm_Fvt = 1
		-- Pesquisa de procedimentos favoritos(mais solicitados) por especialidade
		SELECT	TOP 18 Pdm_Cod, Pdm_Dsc, Pdm_DscRsm, Grp_Dsc
		FROM	dbo.Atz_Sol INNER JOIN dbo.Atz_SolPdm ON
				IdSol = Spd_IdSol INNER JOIN dbo.Atz_Pdm ON
				IdPdm = Spd_IdPdm INNER JOIN dbo.Atz_Grp ON
				IdGrp = Pdm_IdGrp
		WHERE	Sol_IdEsp = @IdEsp AND
				DATEDIFF(DAY, Spd_Dat, GETDATE()) < 90
		GROUP BY Sol_IdEsp, Pdm_Cod, Pdm_Dsc, Pdm_DscRsm, Grp_Dsc
		ORDER BY 3 DESC
	
	ELSE
	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTR¡RIO, RETORNA VAZIO*/
	IF	@IdPdm IS NOT NULL OR  @Pdm_IdGrp IS NOT NULL OR @Pdm_Dsc IS NOT NULL OR 
		@Grp_Dsc IS NOT NULL OR @Pdm_Cod IS NOT NULL
	BEGIN 
		SET @WHERE = ''
		SET @SQL = N'
			SELECT IdPdm
			  ,Pdm_Cod
			  ,Pdm_IdTab
			  ,Pdm_IdTpp
			  ,Pdm_IdGrp
			  ,(SELECT Tab_Dsc FROM dbo.Atz_Tab WHERE IdTab = Pdm_IdTab) as Tab_Dsc
			  ,(SELECT Tpp_Dsc FROM dbo.Atz_Tpp WHERE IdTpp = Pdm_IdTpp) as Tpp_Dsc
			  ,(SELECT Grp_Dsc FROM dbo.Atz_Grp WHERE IdGrp = Pdm_IdGrp) as Grp_Dsc
			  ,Pdm_Dsc
			  ,Pdm_AltCpx      
			  ,Pdm_DscRsm
			  ,Pdm_CodAmb
			  ,Pdm_DscAmb
			  ,Pdm_Sxo
			  ,Pdm_IddMin
			  ,Pdm_IddMax
			  ,Pdm_QtdMax
			  ,Pdm_QtdDia
			  ,Pdm_QtdMes
			  ,Pdm_QtdAno
			  ,Pdm_Rtn
			  ,Pdm_Esp
			  ,ISNULL(Pdm_Prf,0) AS Pdm_Prf
			  ,ISNULL(Pdm_Atv,0) AS Pdm_Atv
			  ,ISNULL(Pdm_BlqUrg,0) AS Pdm_BlqUrg
			  ,Pdm_QtdCh_
			  ,Pdm_QtdFlm
			  ,ISNULL(Grp_QtdCh_,-1) AS Grp_QtdCh_
			FROM dbo.Atz_Pdm, dbo.Atz_Grp  
			WHERE IdGrp = Pdm_IdGrp '

		IF @IdPdm IS NOT NULL
			SET @WHERE = @WHERE + N'AND IdPdm = @IdPdm '

		IF @Pdm_Cod IS NOT NULL
			SET @WHERE = @WHERE + N'AND (Pdm_Cod LIKE ''%'' + @Pdm_Cod + ''%'' OR Pdm_CodAmb LIKE ''%'' + @Pdm_Cod + ''%'') '

		IF @Pdm_Dsc IS NOT NULL
			SET @WHERE = @WHERE + N'AND (Pdm_Dsc LIKE ''%'' + @Pdm_Dsc + ''%'' OR Pdm_DscRsm LIKE ''%'' + @Pdm_Dsc + ''%'' OR Pdm_DscAmb LIKE ''%'' + @Pdm_Dsc + ''%'') '

		IF @Pdm_IdGrp IS NOT NULL
			SET @WHERE = @WHERE + N'AND Pdm_IdGrp = @Pdm_IdGrp '
			
		IF @Grp_Dsc IS NOT NULL
			SET @WHERE = @WHERE + N'AND Pdm_IdGrp IN (SELECT IdGrp FROM dbo.Atz_Grp WHERE Grp_Dsc LIKE ''%'' + @Grp_Dsc + ''%'' ) '

		IF @Pdm_Atv IS NOT NULL
			SET @WHERE = @WHERE + N'AND Pdm_Atv = @Pdm_Atv '

		SET @SQL = @SQL + @WHERE + N' ORDER BY Pdm_Dsc '

		EXEC SP_EXECUTESQL 
			@SQL,
			N'@IdPdm int, @Pdm_Cod VARCHAR(20), @Pdm_IdGrp SMALLINT, 
			@Pdm_Dsc VARCHAR(80), @Grp_Dsc VARCHAR(30), @Pdm_Atv BIT',
			@IdPdm, @Pdm_Cod, @Pdm_IdGrp, @Pdm_Dsc, @Grp_Dsc, @Pdm_Atv

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_SolPdm]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.22
-- Description:	Pesquisa os procedimentos da solicitados
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_SolPdm] 
	 @IdSol INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	Spd_IdSol, Spd_IdPdm, Pdm_Cod, Pdm_DscRsm, Spd_QtdSol, Spd_QtdAtz
	FROM	dbo.Atz_SolPdm, dbo.Atz_Pdm, dbo.Atz_Sit
	WHERE	IdPdm = Spd_IdPdm
	AND		IdSit = Spd_IdSit
	AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
	AND		Spd_IdSol = @IdSol

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_PelEsp]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 20/10/2008
-- Description:	Pesquisa Especialidade do Profissional no Local Rede
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_PelEsp] 

@IdNgc INT = NULL, 
@IdLcr INT = NULL 

AS
	IF (@IdLcr IS NOT NULL)
		SELECT  IdPel,
				--IdPrf,
				Prf_Mtr,
				Prf_Nme,
				Esp_Dsc
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Esp, dbo.Atz_Prf
		WHERE	IdEsp = Pel_IdEsp
		AND		IdPrf = Pel_IdPrf
		AND		Pel_IdLcr = @IdLcr
		ORDER BY Prf_Nme, Esp_Dsc
	ELSE
	IF (@IdNgc IS NOT NULL)
		SELECT  IdPel,
				--IdPrf,
				Prf_Mtr,
				Prf_Nme,
				Esp_Dsc
		FROM	dbo.Atz_PrfEspLcr, dbo.Atz_Esp, dbo.Atz_Prf, dbo.Atz_Ngc
		WHERE	IdEsp = Pel_IdEsp
		AND		IdPrf = Pel_IdPrf
		AND		IdPel = Ngc_IdPel
		AND		IdNgc = @IdNgc
		ORDER BY Prf_Nme, Esp_Dsc
GO
/****** Object:  StoredProcedure [dbo].[stAtz_NgcCttFim]    Script Date: 12/18/2012 09:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.07.29
-- Description:	Finaliza o contrato do contrataado e bloqueia o 
--				acesso dos usuários
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_NgcCttFim]
	@TipAco CHAR(1), -- [S-Select|U-Update] 	
	@IdNgc INT = NULL,
	@IdCtt BIGINT = NULL,
	@SeqEnd NVARCHAR(100) = NULL, 
	@IdRde NVARCHAR(100) = NULL,	
	@IdEsp SMALLINT = NULL,
	@IdGrp TINYINT = NULL,	
	@Pdm_Cod VARCHAR(20) = NULL,
	@Ngc_DatIni SMALLDATETIME = NULL,
	@Ngc_DatFim SMALLDATETIME = NULL,
	@Ngc_Crt CHAR(1) = NULL,
	@IdUsr INT = NULL,	
	@Out_TotNgc INT OUTPUT,
	@Out_Err BIT OUTPUT
	
AS
BEGIN
	DECLARE @WHERE NVARCHAR(2000),
			@SQL NVARCHAR(2000)
			
	SET @Out_TotNgc = 0
	
	SET @WHERE = ''
	IF (@TipAco = 'S')
		SET @SQL = N' SELECT @Out_TotNgc = COUNT(*) '
	ELSE
		SET @SQL = N' 
			UPDATE dbo.Atz_Ngc 
			SET		Ngc_DatFim = @Ngc_DatFim,
					Ngc_IdUsrExc = @IdUsr '
	
	SET @SQL = @SQL +	
		'FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr, dbo.Atz_Pdm, 
				dbo.Atz_Rde, dbo.Atz_Esp, dbo.Atz_Grp 
		WHERE	IdLce = Ngc_IdLce
		AND		IdLcr = Lce_IdLcr
		AND		IdEsp = Lce_IdEsp
		AND		IdPdm = Ngc_IdPdm
		AND		IdRde = Lcr_IdRde
		AND		IdGrp = Pdm_IdGrp
		AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > @Ngc_DatFim) '
		
	IF @IdNgc IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdNgc = @IdNgc '
	IF @IdCtt IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Lcr_IdCtt = @IdCtt '
	IF @SeqEnd IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Lcr_SeqEnd IN ('+ @SeqEnd +') '
	IF @IdRde IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdRde IN ('+ @IdRde +') '
	IF @IdEsp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdEsp = @IdEsp '
	IF @IdGrp IS NOT NULL 
		SET @WHERE = @WHERE + N'AND IdGrp = @IdGrp '
	IF @Pdm_Cod IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Pdm_Cod IN ('+ @Pdm_Cod +') '
	IF @Ngc_DatIni IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Ngc_DatIni >= @Ngc_DatIni '
	IF @Ngc_Crt IS NOT NULL 
		SET @WHERE = @WHERE + N'AND Ngc_Crt = @Ngc_Crt '
	
	SET @SQL = @SQL + @WHERE	
	
	IF (@TipAco = 'S')
	BEGIN 
		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, 
			@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, @Ngc_DatFim SMALLDATETIME, 
			@Ngc_Crt CHAR(1), @Out_TotNgc INT OUTPUT',
			@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt, @Out_TotNgc  OUTPUT
	END
	ELSE	
	IF (@TipAco = 'U')
	BEGIN
		BEGIN TRAN
		
		EXEC SP_EXECUTESQL @SQL,
			N'@IdNgc INT, @IdCtt BIGINT, 
			@IdEsp SMALLINT, @IdGrp TINYINT, @Ngc_DatIni SMALLDATETIME, @Ngc_DatFim SMALLDATETIME, 
			@Ngc_Crt CHAR(1), @IdUsr INT ',
			@IdNgc, @IdCtt, @IdEsp, @IdGrp, @Ngc_DatIni, @Ngc_DatFim, @Ngc_Crt, @IdUsr
			
		SET @Out_TotNgc = @@ROWCOUNT
	
		IF NOT EXISTS
			(	-- Verifica se existe alguma negociação ativa para o contratado ...
				SELECT	*
				FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr
				WHERE	IdLce = Ngc_IdLce
				AND		IdLcr = Lce_IdLcr
				AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > GETDATE())
				AND		Lcr_IdCtt = @IdCtt
			)
		BEGIN
			-- ... se não existir bloqueia o acesso dos usuários do contratado
			UPDATE	aspnet_Membership
			SET		IsApproved = 0
			FROM	dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_UsrCttEnd,	
					dbo.Sgn_Usr, dbo.Aspnet_Users u, dbo.aspnet_Membership m
			WHERE	IdCtt = Cte_IdCtt
			AND		IdUsr = Uce_IdUsr
			AND		Cte_IdCtt = Uce_IdCtt
			AND		Cte_SeqEnd = Uce_SeqEnd
			AND		u.UserId = Usr_UserId
			AND		u.UserId = m.UserId
			AND		IdCtt = @IdCtt
			
			IF @@ERROR <> 0 GOTO FIM_ERRO	
			
			UPDATE	dbo.Atz_Ctt
			SET		Ctt_DatFim = @Ngc_DatFim
			WHERE	IdCtt = @IdCtt
			
			IF @@ERROR <> 0 GOTO FIM_ERRO
			
			UPDATE	dbo.Atz_CttEnd
			SET		Cte_DatFim = @Ngc_DatFim
			WHERE	Cte_DatFim IS NULL
			AND		Cte_IdCtt = @IdCtt		
			
			IF @@ERROR <> 0 GOTO FIM_ERRO
		END
		ELSE
		IF	(@SeqEnd IS NOT NULL) AND
			NOT EXISTS
			(	-- Verifica se existe alguma negociação ativa para o contratado local ...
				SELECT	* 
				FROM	dbo.Atz_Ngc, dbo.Atz_LcrEsp, dbo.Atz_Lcr
				WHERE	IdLce = Ngc_IdLce
				AND		IdLcr = Lce_IdLcr
				AND		(Ngc_DatFim IS NULL OR Ngc_DatFim > GETDATE())
				AND		Lcr_IdCtt = @IdCtt
				AND		Lcr_SeqEnd = @SeqEnd		
			)
		BEGIN
			-- ... se não existir bloqueia o acesso dos usuários do contratado local
			UPDATE	aspnet_Membership
			SET		IsApproved = 0
			FROM	dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_UsrCttEnd,	
					dbo.Sgn_Usr, dbo.Aspnet_Users u, dbo.aspnet_Membership m
			WHERE	IdCtt = Cte_IdCtt
			AND		IdUsr = Uce_IdUsr
			AND		Cte_IdCtt = Uce_IdCtt
			AND		Cte_SeqEnd = Uce_SeqEnd
			AND		u.UserId = Usr_UserId
			AND		u.UserId = m.UserId
			AND		IdCtt = @IdCtt
			AND		Cte_SeqEnd = @SeqEnd
			
			IF @@ERROR <> 0 GOTO FIM_ERRO
			
			UPDATE	dbo.Atz_CttEnd
			SET		Cte_DatFim = @Ngc_DatFim
			WHERE	Cte_DatFim IS NULL
			AND		Cte_IdCtt = @IdCtt
			AND		Cte_SeqEnd = @SeqEnd	
			
			IF @@ERROR <> 0 GOTO FIM_ERRO
		END	
		
		COMMIT TRAN
		SET @Out_Err = 0
		RETURN

		FIM_ERRO:
			ROLLBACK TRAN
			SET @Out_Err = 1
			RETURN
	END -- IF (@TipAco = 'U') ...

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_ItnOpm]    Script Date: 12/18/2012 09:52:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 05/10/2009
-- Description:	OPM - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_ItnOpm]
 @Ito_IdItn INT
,@Ito_Dsc VARCHAR(60)
,@Ito_Qtd TINYINT
AS
	INSERT dbo.Atz_ItnOpm
           (Ito_IdItn
           ,Ito_Dsc
           ,Ito_Qtd)
     VALUES
           (@Ito_IdItn
           ,@Ito_Dsc
           ,@Ito_Qtd)
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaItn]    Script Date: 12/18/2012 09:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 03/10/2009
-- Description:	Guia Solicitação de Internação - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaItn]
	 @IdGia INT
	,@Gia_IdUsr INT
	,@Gia_DatEms SMALLDATETIME
    ,@Gia_Snh VARCHAR(20)
	,@Gia_Crt CHAR(1)
	,@Gia_TipDoe CHAR(1)
	,@Gia_TemDoe CHAR(4)	
	,@Gia_IndCln VARCHAR(200)
	,@Gia_IndAdn TINYINT = NULL
	,@Itn_IdTpi TINYINT
	,@Itn_IdRgm TINYINT
	,@Itn_DriSol TINYINT
	,@Itn_Loc VARCHAR(50) = NULL

	,@Out_IdGia INT OUTPUT
	,@Out_IdItn INT OUTPUT
	,@Out_Err BIT OUTPUT--[0-Operação efetuada|1-Erro]
	,@Out_Snh VARCHAR(20) OUTPUT 

AS
BEGIN
	DECLARE @IdPrf INT
	
	SELECT	@IdPrf = IdPrf
	FROM	dbo.Atz_Prf
	WHERE	Prf_IdUsr = @Gia_IdUsr
	
	BEGIN TRAN
	INSERT	dbo.Atz_Gia
		(
			Gia_IdGiaPrc, Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf,
			Gia_IdPrf, Gia_IdUsr, Gia_Tip, 
			Gia_Crt, Gia_TipDoe, Gia_TemDoe, Gia_DatEms, Gia_IndCln, Gia_IndAdn
		)
		SELECT	IdGia, Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf,
				@IdPrf, @Gia_IdUsr, 3, 
				@Gia_Crt, @Gia_TipDoe, @Gia_TemDoe, @Gia_DatEms, UPPER(@Gia_IndCln), @Gia_IndAdn 
		FROM	dbo.Atz_Gia
		WHERE	IdGia = @IdGia

	IF @@ERROR <> 0
		GOTO FIM_ERRO	

	SET @Out_IdGia = SCOPE_IDENTITY()

	-- A senha de autorização é formada pelo número sequencial
	-- da guia mais a string randômica enviada pelo autorizador
	SET @Out_Snh = LTRIM(STR(@Out_IdGia)) + @Gia_Snh

	UPDATE dbo.Atz_Gia
	SET	Gia_Snh = @Out_Snh
	WHERE IdGia = @Out_IdGia

	IF @@ERROR <> 0
		GOTO FIM_ERRO
		
	DECLARE	@return_value int

	EXEC	@return_value = dbo.stAtz_Itn
			@Itn_IdGia = @Out_IdGia,
			@Itn_IdTpi = @Itn_IdTpi,
			@Itn_IdRgm = @Itn_IdRgm,
			@Itn_Snh = @Out_Snh,
			@Itn_IdUsr = @Gia_IdUsr,
			@Itn_DriSol = @Itn_DriSol,
			@Itn_Loc = @Itn_Loc,
			@Out_IdItn = @Out_IdItn OUTPUT

	IF @return_value <> 0
		GOTO FIM_ERRO

	SET @Out_Err = 0
	COMMIT TRAN
	RETURN

	FIM_ERRO:
		SET @Out_Err = 1
		ROLLBACK TRAN

END
GO
/****** Object:  UserDefinedFunction [dbo].[fxAtz_GetNgcVlr]    Script Date: 12/18/2012 09:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:        Rubens Jr
-- Create date: 2009.10.24
-- Description:    Cálculo do valor da negociação
-- =============================================================================
CREATE FUNCTION [dbo].[fxAtz_GetNgcVlr]
(
    @IdNgc INT
)
    RETURNS NUMERIC(18,2)
AS
BEGIN
    DECLARE @Result NUMERIC(18,2)

    SELECT    @Result = (Ngc_Vlr + (ISNULL(Ngc_VlrFlm,0) * (ISNULL(Pdm_QtdFlm,0))))
    FROM    dbo.Atz_Ngc, dbo.Atz_Pdm
    WHERE    IdPdm = Ngc_IdPdm
    AND        IdNgc = @IdNgc

    RETURN @Result

END
GO
/****** Object:  Table [dbo].[Atz_SolPdmMsg]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_SolPdmMsg](
	[Spm_IdSol] [int] NOT NULL,
	[Spm_IdPdm] [int] NOT NULL,
	[Spm_IdMsg] [smallint] NOT NULL,
 CONSTRAINT [PK_Atz_SolPdmMsg] PRIMARY KEY CLUSTERED 
(
	[Spm_IdSol] ASC,
	[Spm_IdPdm] ASC,
	[Spm_IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmMsg', @level2type=N'COLUMN',@level2name=N'Spm_IdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmMsg', @level2type=N'COLUMN',@level2name=N'Spm_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmMsg', @level2type=N'COLUMN',@level2name=N'Spm_IdMsg'
GO
/****** Object:  Table [dbo].[Atz_SolPdmAud]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_SolPdmAud](
	[IdSpa] [int] IDENTITY(1,1) NOT NULL,
	[Spa_IdSol] [int] NOT NULL,
	[Spa_IdPdm] [int] NOT NULL,
	[Spa_IdSit] [tinyint] NOT NULL,
	[Spa_IdUsr] [int] NOT NULL,
	[Spa_Dat] [smalldatetime] NOT NULL,
	[Spa_Jst] [varchar](200) NULL,
 CONSTRAINT [PK_Atz_SolPdmAud] PRIMARY KEY CLUSTERED 
(
	[IdSpa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'IdSpa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_IdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da situação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_IdSit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário que alterou a situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da mudança da situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justificativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_SolPdmAud', @level2type=N'COLUMN',@level2name=N'Spa_Jst'
GO
/****** Object:  Table [dbo].[Atz_GiaPdm]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_GiaPdm](
	[Gpd_IdGia] [int] NOT NULL,
	[Gpd_IdPdm] [int] NOT NULL,
	[Gpd_IdSit] [tinyint] NULL,
	[Gpd_IdNgc] [int] NULL,
	[Gpd_QtdSol] [tinyint] NOT NULL,
	[Gpd_QtdAtz] [tinyint] NOT NULL,
	[Gpd_DatRel] [smalldatetime] NULL,
	[Gpd_Dat] [smalldatetime] NULL,
	[Gpd_DatVld] [smalldatetime] NULL,
 CONSTRAINT [PK_Dgi] PRIMARY KEY NONCLUSTERED 
(
	[Gpd_IdGia] ASC,
	[Gpd_IdPdm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_IdSit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da negociação que resultou na autorização do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_IdNgc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade solicitada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_QtdSol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade autorizada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_QtdAtz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de realização do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_DatRel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da solicitação' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de validade do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdm', @level2type=N'COLUMN',@level2name=N'Gpd_DatVld'
GO
/****** Object:  View [dbo].[VW_GIA]    Script Date: 12/18/2012 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VW_GIA]
AS
SELECT dbo.Atz_Gia.Gia_IdGiaPrc, dbo.Atz_GiaPdm.Gpd_IdPdm, dbo.Atz_GiaPdm.Gpd_QtdSol, dbo.Atz_GiaPdm.Gpd_QtdAtz
FROM  dbo.Atz_Gia INNER JOIN
               dbo.Atz_GiaPdm ON dbo.Atz_Gia.IdGia = dbo.Atz_GiaPdm.Gpd_IdGia
WHERE (dbo.Atz_Gia.Gia_Tip = 2) AND (dbo.Atz_GiaPdm.Gpd_IdSit = 0)
GO
/****** Object:  View [dbo].[vwAtz_ConUrgSmn]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAtz_ConUrgSmn]
AS
	SELECT
		Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd
	FROM 
		dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, 
		dbo.Atz_Sit, dbo.Atz_BnfPrd, dbo.Atz_Cnt
	WHERE IdGia = Gpd_IdGia
	AND IdBnf = Gia_IdBnf
	AND IdSit = Gpd_IdSit
	AND IdBnf = Bnp_IdBnf
	AND IdCnt = Bnf_IdCnt
	AND Gia_Crt = 'U' -- Consulta urgência
	AND Sit_Ind = 'A' -- Situação autorizada
	AND Gia_Tip = 1 -- Guia de consulta
	AND Cnt_Sit = 'A' -- Contrato ativo
	AND Bnp_DatFim IS NULL -- Beneficiario ativo
	AND DATEDIFF(DAY, Gpd_DatRel,GETDATE()) < 7
	AND Cnt_Num NOT IN
		(
			'A050639','A050643','A053087','A056885',
			'A056887','A056621','A051244','A055314',
			'A050886','A059394','A053081','A053083',
			'A050658','A053277','A053091','A055317',
			'A057590','A061683','A050291','A050636',
			'A057782','A055616','A050599','A050416',
			'A059233','A050185','A055330','A050527',
			'A056527','A050186','A050276','A054242',
			'A050269','A050271','A050273','A050657',
			'A053614','A059859','A050530','A050182',
			'A050184','A053302','A050526','A053301',
			'A050294','A056520','A050287','A050289',
			'A055581','A054175','A050179','A061146',
			'A050240','A050249','A050250','A059838','A050268'
		)
	GROUP BY Bnf_Mtr, Bnf_Nme
	HAVING COUNT(*) > 1
GO
/****** Object:  View [dbo].[vwAtz_ConUrgMes]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAtz_ConUrgMes]
AS
	SELECT
		Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd
	FROM 
		dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, 
		dbo.Atz_Sit, dbo.Atz_BnfPrd, dbo.Atz_Cnt
	WHERE IdGia = Gpd_IdGia
	AND IdBnf = Gia_IdBnf
	AND IdSit = Gpd_IdSit
	AND IdBnf = Bnp_IdBnf
	AND IdCnt = Bnf_IdCnt
	AND Gia_Crt = 'U' -- Consulta urgência
	AND Sit_Ind = 'A' -- Situação autorizada
	AND Gia_Tip = 1 -- Guia de consulta
	AND Cnt_Sit = 'A' -- Contrato ativo
	AND Bnp_DatFim IS NULL -- Beneficiario ativo
	AND DATEDIFF(DAY, Gpd_DatRel,GETDATE()) < 30
	AND Cnt_Num NOT IN
		(
			'A050639','A050643','A053087','A056885',
			'A056887','A056621','A051244','A055314',
			'A050886','A059394','A053081','A053083',
			'A050658','A053277','A053091','A055317',
			'A057590','A061683','A050291','A050636',
			'A057782','A055616','A050599','A050416',
			'A059233','A050185','A055330','A050527',
			'A056527','A050186','A050276','A054242',
			'A050269','A050271','A050273','A050657',
			'A053614','A059859','A050530','A050182',
			'A050184','A053302','A050526','A053301',
			'A050294','A056520','A050287','A050289',
			'A055581','A054175','A050179','A061146',
			'A050240','A050249','A050250','A059838','A050268'
		)
	GROUP BY Bnf_Mtr, Bnf_Nme
	HAVING COUNT(*) > 3
GO
/****** Object:  View [dbo].[vwAtz_ConUrgAno]    Script Date: 12/18/2012 09:48:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAtz_ConUrgAno]
AS
	SELECT 
		Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd
	FROM dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
	WHERE IdGia = Gpd_IdGia
	AND IdBnf = Gia_IdBnf
	AND IdSit = Gpd_IdSit
	AND Gia_Crt = 'U'
	AND Sit_Ind = 'A'
	AND Gia_Tip = 1
	AND DATEDIFF(DAY, Gpd_DatRel,GETDATE()) < 365
	GROUP BY Bnf_Mtr, Bnf_Nme
	HAVING COUNT(*) > 11
GO
/****** Object:  Table [dbo].[Atz_GiaPdmMsg]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atz_GiaPdmMsg](
	[Gpm_IdGia] [int] NOT NULL,
	[Gpm_IdPdm] [int] NOT NULL,
	[Gpm_IdMsg] [smallint] NOT NULL,
 CONSTRAINT [PK_Atz_GiaPdmMsg] PRIMARY KEY CLUSTERED 
(
	[Gpm_IdGia] ASC,
	[Gpm_IdPdm] ASC,
	[Gpm_IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmMsg', @level2type=N'COLUMN',@level2name=N'Gpm_IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmMsg', @level2type=N'COLUMN',@level2name=N'Gpm_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da mensagem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmMsg', @level2type=N'COLUMN',@level2name=N'Gpm_IdMsg'
GO
/****** Object:  Table [dbo].[Atz_GiaPdmAud]    Script Date: 12/18/2012 09:48:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Atz_GiaPdmAud](
	[IdGpa] [int] IDENTITY(1,1) NOT NULL,
	[Gpa_IdGia] [int] NOT NULL,
	[Gpa_IdPdm] [int] NOT NULL,
	[Gpa_IdSit] [tinyint] NOT NULL,
	[Gpa_IdUsr] [int] NOT NULL,
	[Gpa_Dat] [smalldatetime] NOT NULL,
	[Gpa_Jst] [varchar](200) NULL,
 CONSTRAINT [PK_Atz_GiaPdmAud] PRIMARY KEY CLUSTERED 
(
	[IdGpa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código sequencial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'IdGpa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da guia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_IdGia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_IdPdm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_IdSit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_IdUsr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da situação do procedimento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_Dat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justificativa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Atz_GiaPdmAud', @level2type=N'COLUMN',@level2name=N'Gpa_Jst'
GO
/****** Object:  StoredProcedure [dbo].[Dba_SdtDpl]    Script Date: 12/18/2012 09:51:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	Lista procedimento SP/SADT executados em duplicidade*/CREATE PROCEDURE [dbo].[Dba_SdtDpl]	@dia SMALLINT, 	@mes SMALLINT, 	@ano SMALLINTAS	DECLARE @tbl TABLE		(Gia_Snh VARCHAR(20), Bnf_Mtr VARCHAR(20), Pdm_Cod VARCHAR(20), Seq INT, IdGia INT, IdPdm INT, IdGiaPrc INT)		WITH cte (IdCtt, SeqEnd, IdEsp, GiaIdBnf, IdUsr, IdPrf, Crt, Dat, 				IdTpa, IdSai, IndCln, GpdIdPdm, QtdSol, QtdAtz, Qtd)	AS (			SELECT	Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf, Gia_IdUsr, Gia_IdPrf,					Gia_Crt, Gpd_Dat, Gia_IdTpa, Gia_IdSai, Gia_IndCln, Gpd_IdPdm, Gpd_QtdSol,					Gpd_QtdAtz, COUNT(*)			FROM	Atz_Gia, Atz_GiaPdm, Atz_Sit			WHERE	IdGia = Gpd_IdGia			AND		IdSit = Gpd_IdSit			AND		Gia_Tip = 2			AND		Sit_Ind = 'A'			AND		Gia_IdPrf IS NOT NULL			AND		YEAR(Gia_DatEms) = @ano			AND		MONTH(Gia_DatEms) = @mes			AND		DAY(Gia_DatEms) = @dia			GROUP BY Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf, Gia_IdUsr, Gia_IdPrf,				Gpd_IdPdm, Gia_Crt, Gpd_Dat, Gia_IdTpa, Gia_IdSai, Gia_IndCln, 				Gpd_QtdSol,	Gpd_QtdAtz			HAVING COUNT(*) > 1			UNION ALL			SELECT	Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf, Gia_IdUsr, NULL,					Gia_Crt, Gpd_Dat, Gia_IdTpa, Gia_IdSai, Gia_IndCln, Gpd_IdPdm, Gpd_QtdSol,					Gpd_QtdAtz, COUNT(*)			FROM	Atz_Gia, Atz_GiaPdm, Atz_Sit			WHERE	IdGia = Gpd_IdGia			AND		IdSit = Gpd_IdSit			AND		Gia_Tip = 2			AND		Sit_Ind = 'A'			AND		Gia_IdPrf IS NULL			AND		YEAR(Gia_DatEms) = @ano			AND		MONTH(Gia_DatEms) = @mes			AND		DAY(Gia_DatEms) = @dia			GROUP BY Gia_IdCtt, Gia_SeqEnd, Gia_IdEsp, Gia_IdBnf, Gia_IdUsr,				Gpd_IdPdm, Gia_Crt, Gpd_Dat, Gia_IdTpa, Gia_IdSai, Gia_IndCln,				Gpd_QtdSol, Gpd_QtdAtz			HAVING COUNT(*) > 1	)	INSERT @tbl		SELECT				Gia_Snh AS [Autorização],			Bnf_Mtr AS [Matrícula],			Pdm_Cod AS Procedimento,			ROW_NUMBER() 				OVER(PARTITION BY Gia_IdGiaPrc, Gpd_IdPdm ORDER BY Gia_IdGiaPrc, Gpd_IdGia, Gpd_IdPdm) AS [Sequência],			IdGia,			IdPdm,			Gia_IdGiaPrc			--,Gia_IdGiaPrc, IdGia, IdCtt, SeqEnd, IdEsp, IdBnf, IdUsr, Crt, Dat, 			--IdTpa, IdSai, Gpd_IdPdm, Gpd_QtdSol, Gpd_QtdAtz, Sit_Ind, Qtd		FROM 			cte, Atz_Gia, Atz_GiaPdm, Atz_Sit, Atz_Pdm, Atz_Bnf		WHERE 			IdGia = Gpd_IdGia AND			IdSit = Gpd_IdSit AND			IdCtt = Gia_IdCtt AND			SeqEnd = Gia_SeqEnd AND			IdBnf = Gia_IdBnf AND			IdUsr = Gia_IdUsr AND			Crt = Gia_Crt AND			Dat = Gpd_Dat AND			IdTpa = Gia_IdTpa AND			IdSai = Gia_IdSai AND			IndCln = Gia_IndCln AND			IdPdm = Gpd_IdPdm AND			IdGia = Gpd_IdGia AND			IdPrf IS NULL				UNION ALL				SELECT				Gia_Snh AS [Autorização],			Bnf_Mtr AS [Matrícula],			Pdm_Cod AS Procedimento,			ROW_NUMBER() 				OVER(PARTITION BY Gia_IdGiaPrc, Gpd_IdPdm ORDER BY Gia_IdGiaPrc, Gpd_IdGia, Gpd_IdPdm) AS [Sequência],			IdGia,			IdPdm,			Gia_IdGiaPrc			--,Gia_IdGiaPrc, IdGia, IdCtt, SeqEnd, IdEsp, IdBnf, IdUsr, Crt, Dat, 			--IdTpa, IdSai, Gpd_IdPdm, Gpd_QtdSol, Gpd_QtdAtz, Sit_Ind, Qtd		FROM			cte, Atz_Gia, Atz_GiaPdm, Atz_Sit, Atz_Pdm, Atz_Bnf		WHERE			IdGia = Gpd_IdGia AND			IdSit = Gpd_IdSit AND			IdCtt = Gia_IdCtt AND			SeqEnd = Gia_SeqEnd AND			IdBnf = Gia_IdBnf AND			IdUsr = Gia_IdUsr AND			Crt = Gia_Crt AND			Dat = Gpd_Dat AND				IdTpa = Gia_IdTpa AND			IdSai = Gia_IdSai AND			IndCln = Gia_IndCln AND			IdPrf = Gia_IdPrf AND			IdPdm = Gpd_IdPdm AND			IdGia = Gpd_IdGia			SELECT		Gia_Snh AS [Autorização],		Bnf_Mtr AS [Matrícula],		Pdm_Cod AS Procedimento,		Seq AS [Sequência],		IdGia,		IdPdm	FROM @tbl	ORDER BY IdGiaPrc, IdPdm, Seq
GO
/****** Object:  StoredProcedure [dbo].[stAtz_SolPdm]    Script Date: 12/18/2012 09:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 28/07/2008
-- Description:	Solicitação Procedimento - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_SolPdm]
	 @Spd_IdSol INT
    ,@Spd_IdPdm INT
    ,@Spd_IdSit TINYINT
    ,@Spm_IdMsg VARCHAR(200) = NULL
    ,@Spd_QtdSol TINYINT
	,@Spd_Dat SMALLDATETIME
	
	,@Out_Err BIT OUTPUT --[0-Operação efetuada|1-Erro]
AS
BEGIN	
	DECLARE @Spd_QtdAtz TINYINT
	DECLARE @IdUsr INT
	DECLARE @SQL NVARCHAR(2000)
	DECLARE @ErrorLogID INT

	--	Tratamento para evitar inserção de procedimento em duplicidade
	SELECT	*
	FROM	dbo.Atz_SolPdm 
	WHERE	Spd_IdSol = @Spd_IdSol
    AND		Spd_IdPdm = @Spd_IdPdm
	
	IF (@@ROWCOUNT > 0)
	BEGIN
		RETURN
	END

	BEGIN TRY

	SELECT	@IdUsr = Sol_IdUsr
	FROM	dbo.Atz_Sol
	WHERE	IdSol = @Spd_IdSol

	-- Se a autorização foi negada para o procedimento o quantidade autorizada deve ser igual a zero (0)
	IF (@Spd_IdSit = 0)
		SET @Spd_QtdAtz = 0
	ELSE
		SET @Spd_QtdAtz = @Spd_QtdSol

	INSERT	dbo.Atz_SolPdm
		(
			Spd_IdSol, Spd_IdPdm, Spd_IdSit, Spd_Dat,
			Spd_DatVld, Spd_QtdSol, Spd_QtdAtz, Spd_QtdRel
		)
     VALUES
		(
			@Spd_IdSol, @Spd_IdPdm, @Spd_IdSit, @Spd_Dat,
			GETDATE() + 30, @Spd_QtdSol, @Spd_QtdAtz, 0
		)

	-- Se o procedimento foi negado é inserido o log da negativa
	IF (@Spd_IdSit = 0)
	BEGIN
		INSERT dbo.Atz_SolPdmAud
			(Spa_IdSol ,Spa_IdPdm, Spa_IdSit, Spa_IdUsr, Spa_Dat, Spa_Jst)
		VALUES
			(@Spd_IdSol, @Spd_IdPdm, @Spd_IdSit, @IdUsr, GETDATE(), 'NEGATIVA AUTOMATICA PELAS REGRAS DO SISTEMA')

		-- É inserido também as mensagens da negativa
		SET @SQL = N'INSERT dbo.Atz_SolPdmMsg
					(Spm_IdSol, Spm_IdPdm, Spm_IdMsg)
					SELECT	@IdSol, @IdPdm, IdMsg
					FROM	dbo.Atz_Msg
					WHERE	IdMsg IN ('+@Spm_IdMsg+')'

		EXEC SP_EXECUTESQL @SQL, N'@IdSol INT, @IdPdm INT', @Spd_IdSol, @Spd_IdPdm		
	END

	SET @Out_Err = 0
	END TRY
	
	BEGIN CATCH	
		-- Excluindo os registros quando ocorre erro
		DELETE FROM dbo.Atz_SolPdmAud WHERE Spa_IdSol = @Spd_IdSol
		DELETE FROM dbo.Atz_SolPdmMsg WHERE Spm_IdSol = @Spd_IdSol
		DELETE FROM dbo.Atz_SolPdm WHERE Spd_IdSol = @Spd_IdSol
		DELETE FROM dbo.Atz_Sol WHERE IdSol = @Spd_IdSol
		
		EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
		
		SET @Out_Err = 1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaConAtd]    Script Date: 12/18/2012 09:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 04/05/2007
-- Description:	Guia Consulta - Finalização
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_GiaConAtd]
	 @IdGia INT
	,@Gia_DatAtd SMALLDATETIME
	,@Gia_IdTpc TINYINT
	,@Gia_IdSai TINYINT
	,@Gia_TipDoe CHAR(1) = NULL
	,@Gia_TemDoe CHAR(4) = NULL

	,@Out_Err BIT OUTPUT	-- Indica que houve erro na execução da sp [0-não|1-sim]
	,@Out_Sts BIT OUTPUT	--[0-Consulta já esta finalizada|1-Consulta finalizada com sucesso]
	,@Out_Snh VARCHAR(20) OUTPUT -- Senha da guia de consulta

AS
BEGIN
	DECLARE @Out_IdNgc INT, @return_value INT, @IdCtt BIGINT, @Cte_SeqEnd TINYINT, @IdPrf INT,
		@IdEsp INT, @IdPdm INT, @IdRde SMALLINT, @Gia_DatEms SMALLDATETIME, @IdPel INT, 
		@Gia_Crt CHAR(1), @Out_Atz BIT, @Out_IdMsg INT, @Out_Msg VARCHAR(160)
	IF EXISTS
		(
			SELECT	*
			FROM	dbo.Atz_Gia
			WHERE	IdGia = @IdGia
			AND		Gia_DatAtd IS NOT NULL
		)
	BEGIN
		SET @Out_Err = 0
		SET @Out_Sts = 0
	END
	ELSE
	BEGIN
		SELECT @Out_Snh = Gia_Snh, @IdCtt = Gia_IdCtt, @Cte_SeqEnd = Gia_SeqEnd,
			@IdPrf = Gia_IdPrf, @IdEsp = Gia_IdEsp, @IdPdm = Gpd_IdPdm, @Gia_Crt = Gia_Crt,
			@IdRde = dbo.fxAtz_PrdRde(Gia_IdBnf,GETDATE()), @Gia_DatEms = Gia_DatEms
		FROM dbo.Atz_Gia, dbo.Atz_GiaPdm 
		WHERE IdGia = Gpd_IdGia 
		AND IdGia = @IdGia
		
		-- Verificando se o profissional possui negociação para executar a consulta
		-- caso a consulta não tenha sido autorizada na solicitação	
		IF (@Out_IdNgc IS NULL)
		BEGIN
			-- Validando as regras de profissional
			EXEC	@return_value = [dbo].[ssAtz_VldPrf]
					@IdCtt = @IdCtt,
					@Cte_SeqEnd = @Cte_SeqEnd,
					@IdPrf = @IdPrf,
					@IdEsp = @IdEsp,
					@IdPdm = @IdPdm,
					@IdRde = @IdRde,
					@Gia_DatEms = @Gia_DatEms,
					@Ngc_Crt = @Gia_Crt,
					@Out_IdPel = @IdPel OUTPUT,
					@Out_IdNgc = @Out_IdNgc OUTPUT,
					@Out_Atz = @Out_Atz OUTPUT,
					@Out_IdMsg = @Out_IdMsg OUTPUT
			
			IF (@return_value <> 0)
			BEGIN
				SET @Out_Msg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldPrf]'
				GOTO ERRO
			END
		END			

		BEGIN TRAN

		-- Finalizando a Guia de Consulta
		UPDATE dbo.Atz_Gia
		   SET Gia_DatAtd	= @Gia_DatAtd
			  ,Gia_IdTpc	= @Gia_IdTpc
			  ,Gia_IdSai	= @Gia_IdSai
			  ,Gia_TipDoe	= @Gia_TipDoe
			  ,Gia_TemDoe	= @Gia_TemDoe
		 WHERE IdGia = @IdGia
		
		IF @@ERROR <> 0
			GOTO ERRO

		-- Definindo a data de realização da consulta
		IF @Out_IdNgc IS NOT NULL
			UPDATE	dbo.Atz_GiaPdm
			SET		Gpd_DatRel = @Gia_DatAtd,
					Gpd_IdNgc = @Out_IdNgc
			WHERE	Gpd_IdGia = @IdGia
		ELSE
			UPDATE	dbo.Atz_GiaPdm
			SET		Gpd_DatRel = @Gia_DatAtd
			WHERE	Gpd_IdGia = @IdGia

		IF @@ERROR <> 0
			GOTO ERRO
		
		COMMIT TRAN
		SET @Out_Err = 0
		SET @Out_Sts = 1
		RETURN

		ERRO:
			ROLLBACK TRAN
			SET @Out_Err = 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Sol]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.27
-- Description:	Pesquisa Guias de consulta para solicitar SP/SADT
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_Sol] 

	 @IdGia INT = NULL
	,@IdCtt BIGINT = NULL
	,@Cte_SeqEnd TINYINT = NULL
	,@Bnf_Mtr VARCHAR(20) = NULL
	,@Bnf_Nme VARCHAR(70) = NULL
	,@Gia_DatEms SMALLDATETIME = NULL

AS
BEGIN
	SET NOCOUNT ON;

	IF (@IdGia IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Gia_IdPrf, Gia_IdEsp
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_DatAtd IS NOT NULL
		AND		IdGia = @IdGia
	END
	ELSE
	IF (@Gia_DatEms IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Gia_IdPrf, Gia_IdEsp
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_DatAtd IS NOT NULL
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
		AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
		AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
	END
	ELSE
	IF (@Bnf_Mtr IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo, 
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Gia_IdPrf, Gia_IdEsp
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_DatAtd IS NOT NULL
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Mtr = @Bnf_Mtr
	END
	ELSE
	IF (@Bnf_Nme IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd, Bnf_Sxo,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd, Gia_IdPrf, Gia_IdEsp
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_DatAtd IS NOT NULL
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Bnf_Nme LIKE '%'+ @Bnf_Nme +'%'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_Pes]    Script Date: 12/18/2012 09:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 22/10/2009
-- Description:	Pesquisa guias e solicitações 
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_Pes] 
	@Gia_DatIni SMALLDATETIME = NULL,
	@Gia_DatFim SMALLDATETIME = NULL,
	@IdEsp SMALLINT = NULL,
	@Gia_Tip TINYINT = NULL, -- [0-Solicitação SP/SADT|1-Guia de Consulta|2-Guia SP/SADT|3-Solicitação Internação]
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Pdm_Cod VARCHAR(20) = NULL,
	@Gia_Snh VARCHAR(20) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdPpl SMALLINT = NULL,
	@Ord NVARCHAR(20) = '1'
	
AS
	DECLARE @WHERE NVARCHAR(600), @WHEREGIA NVARCHAR(300), @WHERESOL NVARCHAR(300), @WHEREITN NVARCHAR(300)
	DECLARE @SQL NVARCHAR(4000) 

	/*SE HOUVER AO MENOS UM PARAMETRO NAO NULO, ELE ENTRA NA QUERY, DO CONTRÁRIO, RETORNA VAZIO*/
	IF @Gia_DatIni IS NOT NULL OR @Gia_DatFim IS NOT NULL OR @Gia_Tip IS NOT NULL OR
		@IdEsp IS NOT NULL OR @IdSit IS NOT NULL OR	@Pdm_Cod IS NOT NULL OR
		@Gia_Snh IS NOT NULL OR	@Bnf_Mtr IS NOT NULL OR	@IdCtt IS NOT NULL OR
		@Prf_Mtr IS NOT NULL
	BEGIN
		SET @WHERE = ''
		SET @WHEREGIA = ''
		SET @WHERESOL = ''	
		SET @WHEREITN = ''	
		CREATE TABLE #TBLRESULT 
			(
				Gia_DatEms SMALLDATETIME,
				Bnf_Nme VARCHAR(70),
				Gia_Tip VARCHAR(30),
				Pdm_Cod VARCHAR(20),
				Sit_Dsc VARCHAR(20),
				Pdm_Dsc VARCHAR(80),
				Gia_Crt CHAR(1),
				Prf_Sol VARCHAR(70),
				Prf_Exe VARCHAR(70),
				IdCtt BIGINT,
				Prf_Mtr VARCHAR(20),
				Bnf_Mtr VARCHAR(20),
				Gpd_QtdAtz TINYINT,
				Gpd_QtdSol TINYINT,
				Gia_Snh VARCHAR(20),
				Usr_Nme VARCHAR(70),
				Esp_Sol VARCHAR(80),
				Esp_Exe VARCHAR(80),
				IdSit TINYINT,
				Sit_Ind CHAR(1),
				IdNgc INT,
				Ngc_Vlr NUMERIC(18,2),
				Pdm_QtdCh_ NUMERIC(18,2)
			)					

		IF @IdEsp IS NOT NULL 
			SET @WHERE = @WHERE + N'AND IdEsp=@IdEsp '

		IF @Bnf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Bnf_Mtr=@Bnf_Mtr ' 

		IF @IdCtt IS NOT NULL
			SET @WHERE = @WHERE + N'AND IdCtt=@IdCtt ' 
			
		IF @Pdm_Cod IS NOT NULL
		BEGIN
			-- VERIFICAR AQUI QUANDO INTERNAÇÃO ESTIVER FUNCIONANDO
			SET @WHEREGIA = @WHEREGIA + N'AND Pdm_Cod=@Pdm_Cod '
			SET @WHERESOL = @WHERESOL + N'AND Pdm_Cod=@Pdm_Cod '
		END
			
		IF @IdSit IS NOT NULL
		BEGIN 
			SET @WHEREGIA = @WHEREGIA + N'AND IdSit=@IdSit '
			SET @WHERESOL = @WHERESOL + N'AND IdSit=@IdSit '
			IF @IdSit = 1 
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=1 '
			ELSE
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=0 '
		END		
		
		IF @Sit_Ind IS NOT NULL
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Sit_Ind=@Sit_Ind '
			SET @WHERESOL = @WHERESOL + N'AND Sit_Ind=@Sit_Ind '
			IF @Sit_Ind = 'A'
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=1 '
			ELSE
				SET @WHEREITN = @WHEREITN + N'AND Itn_Atz=0 '
		END
			
		IF @Gia_Snh IS NOT NULL
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_Snh=@Gia_Snh ' 
			SET @WHERESOL = @WHERESOL + N'AND Sol_Snh=@Gia_Snh ' 
			SET @WHEREITN = @WHEREITN + N'AND Gia_Snh=@Gia_Snh ' 
		END		
		
		IF @Gia_DatIni IS NOT NULL 
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms>=@Gia_DatIni '
			SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms>=@Gia_DatIni '
			SET @WHEREITN = @WHEREITN + N'AND Gia_DatEms>=@Gia_DatIni '
		END

		IF @Gia_DatFim IS NOT NULL 
		BEGIN
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_DatEms<=@Gia_DatFim '
			SET @WHERESOL = @WHERESOL + N'AND Sol_DatEms<=@Gia_DatFim '
			SET @WHEREITN = @WHEREITN + N'AND Gia_DatEms<=@Gia_DatFim '
		END

		IF @Gia_Tip IS NOT NULL
		BEGIN 
			SET @WHEREGIA = @WHEREGIA + N'AND Gia_Tip=@Gia_Tip '
			SET @WHEREITN = @WHEREITN + N'AND Gia_Tip=@Gia_Tip '
			-- As solicitações de SP/SADT não devem ser listadas se o usuário 
			-- filtrar por um tipo de guia que não for a de solcitação de SP/SADT
			IF @Gia_Tip <> 0
				SET @WHERESOL = @WHERESOL + N'AND 0=1 '
		END	
					
		-- Consulta Eletiva
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, ''CONSULTA ELETIVA'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						NULL AS Prf_Sol, Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz, Gpd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, NULL AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdGia = Gpd_IdGia
				AND		IdSit = Gpd_IdSit
				AND		IdCtt = Cte_IdCtt
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd			
				AND		IdPdm = Gpd_IdPdm
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrf
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp
				AND		Gia_Tip = 1 '
			
		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
		BEGIN
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
			SET @SQL = @SQL + @WHERE + @WHEREGIA +
					N' ORDER BY '+ @Ord
		END
		ELSE
			SET @SQL = @SQL + @WHERE + @WHEREGIA +
					N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
			
		-- SP/SADT para procedimentos que não requerem profissional para execução,
		-- somente devem ser listadas se no filtro da pesquisa não estiver a matrícula do profissional
		IF @Prf_Mtr IS NULL
		BEGIN
			SET @SQL = N'
				INSERT #TBLRESULT
					SELECT	Gpd_DatRel, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,
							Sit_Dsc, Pdm_Dsc, Gia_Crt,
							(
								SELECT	Prf_Nme
								FROM	dbo.Atz_Gia sol, dbo.Atz_Prf
								WHERE	sol.IdGia = gia.Gia_IdGiaPrc 
								AND		IdPrf = sol.Gia_IdPrf
							) AS Prf_Sol,
							NULL AS Prf_Exe, IdCtt, NULL AS Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz,
							Gpd_QtdSol, CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme,
							(
								SELECT	Esp_Dsc
								FROM	dbo.Atz_Gia sol, dbo.Atz_Prf, dbo.Atz_Esp
								WHERE	sol.IdGia = gia.Gia_IdGiaPrc
								AND	IdPrf = sol.Gia_IdPrf
								AND	IdEsp = sol.Gia_IdEsp
							) AS Esp_Sol,  Esp_Dsc AS Esp_Exe,
							IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
					FROM	dbo.Atz_Gia gia, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_Sit,
							dbo.Atz_GiaPdm, dbo.Atz_Esp, dbo.Atz_Pdm, dbo.Sgn_Usr
					WHERE	IdSit = Gpd_IdSit
					AND		IdBnf = Gia_IdBnf
					AND		IdGia = Gpd_IdGia
					AND		IdEsp = Gia_IdEsp
					AND		IdPdm = Gpd_IdPdm
					AND		IdUsr = Gia_IdUsr
					AND		IdCtt = Cte_IdCtt
					AND		Gia_IdCtt = Cte_IdCtt
					AND		Gia_SeqEnd = Cte_SeqEnd
					AND		Gia_IdPrf IS NULL
					AND		Gia_Tip = 2 '		
				
			-- Se um dos filtros da pesquisa for a matrícula do profissional,
			-- as guias de SP/SADT com procedimentos que não requerem profissional
			-- não devem ser exibidas
			SET @SQL = @SQL + @WHERE + @WHEREGIA + N' ORDER BY '+ @Ord
					
			
			EXEC SP_EXECUTESQL @SQL,
				N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
				@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
				@Prf_Mtr VARCHAR(20) ',
					@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
		END	
		
		-- SP/SADT para procedimentos que requerem profissional para execução
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT	Gpd_DatRel, Bnf_Nme, ''SP/SADT'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						(
							SELECT	Prf_Nme
							FROM	dbo.Atz_Gia sol, dbo.Atz_Prf
							WHERE	sol.IdGia = gia.Gia_IdGiaPrc
							AND		IdPrf = sol.Gia_IdPrf
						) AS Prf_Sol,
						Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz,
						Gpd_QtdSol, CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme,
						(
							SELECT	Esp_Dsc
							FROM	dbo.Atz_Gia sol, dbo.Atz_Prf, dbo.Atz_Esp
							WHERE	sol.IdGia = gia.Gia_IdGiaPrc
							AND		IdPrf = sol.Gia_IdPrf
							AND		IdEsp = sol.Gia_IdEsp
						) AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia gia, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd, dbo.Atz_Sit,
						dbo.Atz_Prf, dbo.Atz_GiaPdm, dbo.Atz_Esp, dbo.Atz_Pdm, dbo.Sgn_Usr
				WHERE	IdSit = Gpd_IdSit
				AND		IdBnf = Gia_IdBnf
				AND		IdGia = Gpd_IdGia
				AND		IdEsp = Gia_IdEsp
				AND		IdPdm = Gpd_IdPdm
				AND		IdUsr = Gia_IdUsr
				AND		IdCtt = Cte_IdCtt			
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd
				AND		IdPrf = Gia_IdPrf
				AND		Gia_Tip = 2
				 ' 

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '

		SET @SQL = @SQL + @WHERE + @WHEREGIA +	N' ORDER BY '+ @Ord	
			
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	
		
		
		-- Solicitação SP/SADT
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT  Sol_DatEms, Bnf_Nme, ''SOLICITAÇÃO'' AS Gia_Tip,Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Sol_Crt,
						Prf_Nme AS Prf_Sol, NULL AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Spd_QtdAtz, Spd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Sol_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, Esp_Dsc AS Esp_Sol, NULL AS Esp_Exe,
						IdSit, Sit_Ind, NULL, NULL, Pdm_QtdCh_
				FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdSol = Spd_IdSol
				AND		IdCtt = Cte_IdCtt
				AND		Sol_IdCtt = Cte_IdCtt
				AND		Sol_SeqEnd = Cte_SeqEnd
				AND		IdSit = Spd_IdSit			
				AND		IdPdm = Spd_IdPdm
				AND		IdBnf = Sol_IdBnf
				AND		IdPrf = Sol_IdPrfSol
				AND		IdUsr = Sol_IdUsr
				AND		IdEsp = Sol_IdEsp '	
		
		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
		BEGIN
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
			SET @SQL = @SQL + @WHERE + @WHERESOL + N' ORDER BY '+ @Ord
		END
		ELSE
			SET @SQL = @SQL + @WHERE + @WHERESOL + N' ORDER BY '+ @Ord	
					
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- SP/SADT da Solicitação de Internação
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, ''SOLICITACAO INTERNACAO'' AS Gia_Tip, Pdm_Cod,
						Sit_Dsc, Pdm_Dsc, Gia_Crt,
						NULL AS Prf_Sol, Prf_Nme AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Gpd_QtdAtz, Gpd_QtdSol,
						CASE Sit_Ind WHEN ''A'' THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, NULL AS Esp_Sol, Esp_Dsc AS Esp_Exe,
						IdSit, Sit_Ind, Gpd_IdNgc, 0, Pdm_QtdCh_
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Sgn_Usr, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdGia = Gpd_IdGia			
				AND		IdSit = Gpd_IdSit
				AND		IdCtt = Cte_IdCtt
				AND		Gia_IdCtt = Cte_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd			
				AND		IdPdm = Gpd_IdPdm
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrf
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp
				AND		Gia_Tip = 3 '

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
		SET @SQL = @SQL + @WHERE + @WHEREGIA + N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Pdm_Cod VARCHAR(20), @Gia_Snh VARCHAR(20),	@Bnf_Mtr VARCHAR(20), @IdCtt BIGINT,
			@Prf_Mtr VARCHAR(20) ',
				@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Pdm_Cod, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- Solicitação/Prorrogação de Internação
		SET @SQL = N'
			INSERT #TBLRESULT
				SELECT Gia_DatEms, Bnf_Nme, 
						CASE Itn_Tip WHEN 1 THEN ''SOLICITACAO INTERNACAO'' WHEN 2 THEN ''PROROGACAO INTERNACAO'' END AS Gia_Tip, 
						NULL AS Pdm_Cod, CASE Itn_Atz WHEN 1 THEN ''AUTORIZADO'' ELSE ''PENDENTE'' END AS Sit_Dsc, NULL AS Pdm_Dsc, Gia_Crt,
						Prf_Nme AS Prf_Sol, NULL AS Prf_Exe, IdCtt, Prf_Mtr, Bnf_Mtr, Itn_DriAtz AS Gpd_QtdAtz, Itn_DriSol AS Gpd_QtdSol,
						CASE Itn_Atz WHEN 1 THEN Gia_Snh ELSE NULL END AS Gia_Snh, Usr_Nme, Esp_Dsc AS Esp_Sol, NULL AS Esp_Exe,
						Itn_Atz AS IdSit, NULL, NULL, 0, 0
				FROM	dbo.Atz_Gia, dbo.Atz_Itn, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
						dbo.Atz_Prf, dbo.Sgn_Usr, dbo.Atz_Esp
				WHERE	IdCtt = Gia_IdCtt
				AND		Gia_SeqEnd = Cte_SeqEnd
				AND		IdGia = Itn_IdGia		
				AND		IdCtt = Cte_IdCtt
				AND		IdBnf = Gia_IdBnf
				AND		IdPrf = Gia_IdPrfSol
				AND		IdUsr = Gia_IdUsr
				AND		IdEsp = Gia_IdEsp '

		-- Se um dos filtros da pesquisa for a matrícula do profissional,
		-- as guias de SP/SADT com procedimentos que não requerem profissional
		-- não devem ser exibidas
		IF @Prf_Mtr IS NOT NULL
			SET @WHERE = @WHERE + N'AND Prf_Mtr = @Prf_Mtr '
			
		SET @SQL = @SQL + @WHERE  + @WHEREITN + N' ORDER BY '+ @Ord
		
		EXEC SP_EXECUTESQL @SQL,
			N'@Gia_DatIni SMALLDATETIME, @Gia_DatFim SMALLDATETIME, @Gia_Tip TINYINT, @IdEsp SMALLINT, @IdSit TINYINT,
			@Sit_Ind CHAR(1), @Gia_Snh VARCHAR(20), @Bnf_Mtr VARCHAR(20), @IdCtt BIGINT, @Prf_Mtr VARCHAR(20) ',
			@Gia_DatIni, @Gia_DatFim, @Gia_Tip, @IdEsp, @IdSit, @Sit_Ind, @Gia_Snh, @Bnf_Mtr, @IdCtt, @Prf_Mtr	

		-- O valor da negociação é exibido somente para os papéis da operadora.
		IF EXISTS (SELECT * FROM dbo.Sgn_Ppl WHERE Ppl_Ope = 1 AND IdPpl = @IdPpl)
			UPDATE #TBLRESULT 
			SET Ngc_Vlr = dbo.fxAtz_GetNgcVlr(IdNgc)
			WHERE IdNgc IS NOT NULL

		SELECT *
		FROM #TBLRESULT	

		DROP TABLE #TBLRESULT	
		
		--PRINT '4000 1000 1100 1000'
		--PRINT LEN(@SQL)
		--PRINT LEN(@SQL2)
		--PRINT LEN(@SQL3)
		--PRINT LEN(@SQL4)
		--PRINT '600 300 300'
		--PRINT LEN(@WHERE)
		--PRINT LEN(@WHEREGIA)
		--PRINT LEN(@WHERESOL)
		--PRINT @SQL	
	END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_SolPdmMsg]    Script Date: 12/18/2012 09:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author: Wesley PS
-- Create date: 25/01/2009
-- Description: Pesquisa Mensagens de Negativas para Solicitações de SADT
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_SolPdmMsg]
	@IdSol INT,
	@Expande INT = NULL
AS
	IF @Expande IS NULL
		SELECT TOP 1 
			LTRIM(STR(IdMsg)) +' - '+ Msg_DscAtz AS Msg_DscAtz,
			Msg_Dsc,
			Pdm_Dsc =
				(SELECT Pdm_Cod +' : '+ Pdm_Dsc FROM dbo.Atz_Pdm WHERE IdPdm = Spm_IdPdm),
			IdMsg     
		FROM	dbo.Atz_Msg, dbo.Atz_SolPdmMsg
		WHERE	IdMsg = Spm_IdMsg
		AND		Spm_IdSol = @IdSol
		ORDER BY 1
	ELSE
		SELECT  LTRIM(STR(IdMsg)) +' - '+ LTRIM(RTRIM(Msg_DscAtz)) AS Msg_DscAtz,
			Msg_Dsc,
			Pdm_Dsc = 
				(SELECT Pdm_Cod +' : '+ LTRIM(RTRIM(Pdm_Dsc)) from atz_Pdm where idPdm = Spm_IdPdm),
			IdMsg      
		FROM	dbo.Atz_Msg, dbo.Atz_SolPdmMsg
		WHERE	IdMsg = Spm_IdMsg
		AND		Spm_IdSol = @IdSol
		ORDER BY 1
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldPdm]    Script Date: 12/18/2012 09:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ssAtz_VldPdm]
	@IdBnf BIGINT,					-- Matrícula do beneficiário
	@IdPdm INT,						-- Código do procediment
	@Bnf_Sxo CHAR(1),				-- Sexo do benfeciário
	@Bnf_Idd TINYINT,				-- Idade do beneficiário
	@Pdm_Qtd TINYINT,				-- Quantidade solicitada
	@Gia_DatEms SMALLDATETIME,		-- Data de emissão da guia
	@Gia_Crt CHAR(1),				-- Caráter da solicitação [E-Eletiva|U-Urgência]

	--*** Parâmetros utilizados apenas para o retorno consulta *********
	@IdPrf INT = NULL,				-- Código do profissional executante
	@IdEsp SMALLINT = NULL,			-- Código da Especialidade
	@IdCtt BIGINT = NULL,			-- Código do contratado
	@SeqEnd TINYINT = NULL,			-- Sequência do endereço
	--******************************************************************

	@Gia_Tip TINYINT,				-- Indica o tipo da solicitação/execução [0-Solicitação|1-Consulta|2-SP/SADT]

	@Out_Atz BIT OUTPUT,			-- [0-autorizado|1-não autorizado]
	@Out_IdMsg VARCHAR(200) OUTPUT	-- Códigsa das mensagens com os motivos das negativas
	
AS
BEGIN
	DECLARE @Sxo CHAR(1), @IddMin TINYINT, @IddMax TINYINT, 
			@QtdMax TINYINT, @QtdDia TINYINT, @QtdMes TINYINT,	
			@QtdAno TINYINT, @Rtn SMALLINT, @Tmp_Qtd TINYINT, @Pdm_BlqUrg BIT,
			@IdTpp TINYINT, @Pde_Rst CHAR(1), @Pdm_AltCpx BIT, @Pdm_Esp BIT

	-- Selecionando a parametrização para consultas eletivas na especialidade,
	-- consulta de urgência deve pegar a parametrização no procedimento
	IF (@IdPrf IS NOT NULL AND @Gia_Crt = 'E')
		-- Selecionando os dados para validação do procedimento
		SELECT	@Sxo = Esp_Sxo, @IddMin = Esp_IddMin, @IddMax = Esp_IddMax, 
				@QtdMax = Esp_QtdMax, @QtdDia = Esp_QtdDia, @QtdMes = Esp_QtdMes,	
				@QtdAno = Esp_QtdAno, @Rtn = Esp_Rtn, @IdTpp = 1--,
				--@Pdm_AltCpx = Pdm_AltCpx, @Pdm_Esp = Pdm_Esp, @Pdm_BlqUrg = Pdm_BlqUrg
		FROM	dbo.Atz_Esp
		WHERE	IdEsp = @IdEsp
	-- Selecionando a parametrização para solicitações e SP/SADT no procedimento
	ELSE
		-- Selecionando os dados para validação do procedimento
		SELECT	@Sxo = Pdm_Sxo, @IddMin = Pdm_IddMin, @IddMax = Pdm_IddMax, 
				@QtdMax = Pdm_QtdMax, @QtdDia = Pdm_QtdDia, @QtdMes = Pdm_QtdMes,	
				@QtdAno = Pdm_QtdAno, @Rtn = Pdm_Rtn, @IdTpp = Pdm_IdTpp,
				@Pdm_AltCpx = Pdm_AltCpx, @Pdm_Esp = Pdm_Esp, @Pdm_BlqUrg = Pdm_BlqUrg
		FROM	dbo.Atz_Pdm
		WHERE	IdPdm = @IdPdm

	-- Validação de retorno...
	IF (@IdPrf IS NOT NULL) 
	BEGIN 
		-- ... para consulta eletiva
		IF 	(@Gia_Crt = 'E') AND EXISTS 
			(	
				SELECT	*
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Esp, dbo.Atz_Sit
				WHERE	IdGia = Gpd_IdGia
				AND		IdEsp = Gia_IdEsp
				AND		IdSit = Gpd_IdSit
				AND		Sit_Ind = 'A'
				AND		Gia_IdPrf = @IdPrf				
				AND		Gia_IdEsp = @IdEsp
				AND		Gia_Tip = 1 -- Consulta
				AND		Gia_IdBnf = @IdBnf
				AND		DATEDIFF(HOUR,Gia_DatEms,GETDATE()) < Esp_Rtn*24 -- Converte de dias para hora
			)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1408,' -- QUANTIDADE SERVIÇO SOLICITADA ACIMA DA AUTORIZADA
			SET @Out_Atz = 0
		END
		--- ... para consulta de urgência
		IF 	(@Gia_Crt = 'U') AND EXISTS 
			(	
				SELECT	*
				FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm
				WHERE	IdGia = Gpd_IdGia
				AND		IdPdm = Gpd_IdPdm
				AND		IdSit = Gpd_IdSit
				AND		Sit_Ind = 'A'
				AND		Gia_Tip = 1 -- Consulta
				AND		Gia_IdCtt = @IdCtt
				AND		Gia_SeqEnd = @SeqEnd
				AND		Gia_IdBnf = @IdBnf
				AND		DATEDIFF(HOUR,Gia_DatEms,GETDATE()) < Pdm_Rtn*24 -- Converte de dias para hora
			)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1408,' -- QUANTIDADE SERVIÇO SOLICITADA ACIMA DA AUTORIZADA
			SET @Out_Atz = 0
		END
	END
	-- Retorno para solicitação de SP/SADT
	IF (@Gia_Crt = 'E' AND @Gia_Tip = 0) AND 	
		EXISTS 
		(	
			SELECT	*
			FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Pdm, dbo.Atz_Sit
			WHERE	IdSol = Spd_IdSol
			AND		IdPdm = Spd_IdPdm
			AND		IdSit = Spd_IdSit
			AND		Sit_Ind = 'A'
			AND		Sol_IdBnf = @IdBnf
			AND		IdPdm = @IdPdm
			AND		DATEDIFF(DAY,Sol_DatEms,GETDATE()) < Pdm_Rtn
		)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1408,' -- QUANTIDADE SERVIÇO SOLICITADA ACIMA DA AUTORIZADA
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'U' AND @Pdm_BlqUrg = 1)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1899,' -- OUTROS
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'E' AND @Pdm_AltCpx = 1)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1427,' -- NECESSIDADE DE AUDITORIA MÉDICA
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'E' AND @Pdm_Esp = 1)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1426,' -- NÃO AUTORIZADO PELA AUDITORIA MÉDICA
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'E' AND @Pdm_Qtd > @QtdMax)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1423,' -- QUANTIDADE SOLICITADA ACIMA DA QUANTIDADE PERMITIDA
		SET @Out_Atz = 0
	END

	IF (@Sxo <> 'A') AND (@Sxo <> @Bnf_Sxo)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1802,' -- PROCEDIMENTO INCOMPATÍVEL COM O SEXO DO BENEFICIÁRIO
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'E') AND (@IddMin IS NOT NULL) AND (@Bnf_Idd < @IddMin) 
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1803,' -- IDADE DO BENEFICIÁRIO INCOMPATÍVEL COM O PROCEDIMENTO
		SET @Out_Atz = 0
	END

	IF (@Gia_Crt = 'E') AND (@IddMax IS NOT NULL) AND (@Bnf_Idd > @IddMax)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '1015,' -- IDADE DO BENEFICIÁRIO ACIMA IDADE LIMITE
		SET @Out_Atz = 0
	END
	
	IF (@Gia_Crt = 'E' AND @QtdDia IS NOT NULL) 
	BEGIN
		-- Verficiando a quantidade de solicitações
		IF (@Gia_Tip = 0)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Spd_QtdAtz) 
					FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
					WHERE	IdSol = Spd_IdSol
					AND		IdSit = Spd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Sol_IdBnf = @IdBnf 
					AND		Spd_IdPdm = @IdPdm
					AND		DATEDIFF(DAY, Sol_DatEms, @Gia_DatEms) < 1
				)
		ELSE
		-- Verificando a quantidade de execuções de SP/SADT
		IF (@Gia_Tip = 2)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Gpd_QtdAtz) 
					FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
					WHERE	IdGia = Gpd_IdGia
					AND		IdSit = Gpd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Gia_IdBnf = @IdBnf 
					AND		Gpd_IdPdm = @IdPdm
					AND		DATEDIFF(DAY, Gpd_DatRel, @Gia_DatEms) < 1
				)
	
		-- Verifica se: a quantidade de procedimento solicitada ou executada no mesmo dia + a 
		-- quantidade solicitadada é maior que a quantidade permitida para o dia
		IF (ISNULL(@Tmp_Qtd,0) + @Pdm_Qtd > @QtdDia)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1423,' --  QUANTIDADE SOLICITADA ACIMA DA QUANTIDADE PERMITIDA
			SET @Out_Atz = 0
		END
	END	

	IF (@Gia_Crt = 'E' AND @QtdMes IS NOT NULL) 
	BEGIN
		-- Verficiando a quantidade de solicitações
		IF (@Gia_Tip = 0)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Spd_QtdAtz)
					FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit 
					WHERE	IdSol = Spd_IdSol 
					AND		IdSit = Spd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Sol_IdBnf = @IdBnf 
					AND		Spd_IdPdm = @IdPdm
					AND		DATEDIFF(MONTH, Sol_DatEms, @Gia_DatEms) < 1
				)
		ELSE
		-- Verificando a quantidade de execuções de SP/SADT
		IF (@Gia_Tip = 2)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Gpd_QtdAtz)
					FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit 
					WHERE	IdGia = Gpd_IdGia
					AND		IdSit = Gpd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Gia_IdBnf = @IdBnf 
					AND		Gpd_IdPdm = @IdPdm
					AND		DATEDIFF(MONTH, Gpd_DatRel, @Gia_DatEms) < 1
				)
		IF (ISNULL(@Tmp_Qtd,0) + @Pdm_Qtd > @QtdMes)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1423,' --  QUANTIDADE SOLICITADA ACIMA DA QUANTIDADE PERMITIDA
			SET @Out_Atz = 0
		END
	END

	IF (@Gia_Crt = 'E' AND @QtdAno IS NOT NULL)
	BEGIN
		IF (@Gia_Tip = 0)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Spd_QtdAtz)
					FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
					WHERE	IdSol = Spd_IdSol
					AND		IdSit = Spd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Sol_IdBnf = @IdBnf 
					AND		Spd_IdPdm = @IdPdm
					AND		DATEDIFF(YEAR, Sol_DatEms, @Gia_DatEms) < 1
				)
		ELSE
		IF (@Gia_Tip = 2)
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Gpd_QtdAtz)
					FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
					WHERE	IdGia = Gpd_IdGia
					AND		IdSit = Gpd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Gia_IdBnf = @IdBnf 
					AND		Gpd_IdPdm = @IdPdm
					AND		DATEDIFF(YEAR, Gpd_DatRel, @Gia_DatEms) < 1
				)
		IF (ISNULL(@Tmp_Qtd,0) + @Pdm_Qtd > @QtdAno)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1423,' --  QUANTIDADE SOLICITADA ACIMA DA QUANTIDADE PERMITIDA
			SET @Out_Atz = 0
		END
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldAud]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 550 END #####################################################################

-- 551 BEGIN ###################################################################


CREATE PROCEDURE [dbo].[ssAtz_VldAud]
	@IdGia INT,						-- Código da guia
	@IdPdm INT,						-- Código do procedimento

	@OutErr BIT OUTPUT,				-- Indica que houve erro na execução da sp [0-não|1-sim]
	@OutAtz BIT OUTPUT,				-- [0-não autorizado|1-autorizado]
	@OutIdMsg VARCHAR(200) OUTPUT,	-- Códigos das mensagens com os motivos das negativas
	@OutIdNgc INT OUTPUT,			-- Código da negociação que resultou na autorização
	@OutMsg VARCHAR(100) OUTPUT		-- Mensagem de erro
AS
BEGIN
	DECLARE	@return_value INT, @BnfSxo CHAR(1),  
		@IdRde SMALLINT, @PdmPrf BIT, @IdPel INT, @IdBnf BIGINT, 
		@IdCtt INT,	@CteSeqEnd TINYINT, @IdEsp SMALLINT,
		@IdPrf INT = NULL, @GiaCrt CHAR(1), @Dat SMALLDATETIME
	
	SELECT	@IdBnf = Gia_IdBnf, @IdPdm = Gpd_IdPdm, @IdCtt = Gia_IdCtt,
			@CteSeqEnd = Gia_SeqEnd, @IdEsp = Gia_IdEsp, @PdmPrf = Pdm_Prf,
			@Dat = Gpd_Dat, @GiaCrt = Gia_Crt, @IdPrf = Gia_IdPrf
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Pdm
	WHERE	IdGia = Gpd_IdGia AND
			IdPdm = Gpd_IdPdm AND
			IdGia = @IdGia		

	SET @OutIdMsg = ''
	SET @OutErr = 0
	SET @OutAtz = 1

	SELECT	@BnfSxo = Bnf_Sxo,	@IdRde = Prd_IdRde
	FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
	WHERE	IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= @Dat AND Bnp_DatFim >= @Dat))
	AND		IdBnf = @IdBnf

	-- Verifica se o procedimento exige profissional para execução
	IF	(@PdmPrf = 1)
	BEGIN
		-- Validando as regras de profissional
		EXEC	@return_value = [dbo].[ssAtz_VldPrf]
				@IdCtt = @IdCtt,
				@Cte_SeqEnd = @CteSeqEnd,
				@IdPrf = @IdPrf,
				@IdEsp = @IdEsp,
				@IdPdm = @IdPdm,
				@IdRde = @IdRde,
				@Gia_DatEms = @Dat,
				@Ngc_Crt = @GiaCrt,
				@Out_IdPel = @IdPel OUTPUT,
				@Out_IdNgc = @OutIdNgc OUTPUT,
				@Out_Atz = @OutAtz OUTPUT,
				@Out_IdMsg = @OutIdMsg OUTPUT
		
		IF (@return_value <> 0)
		BEGIN
			SET @OutMsg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldPrf]'
			GOTO FIM_ERRO
		END
	END
	ELSE
	BEGIN
		-- Validando as regras de contratado
		EXEC	@return_value = [dbo].[ssAtz_VldCtt]
				@IdCtt = @IdCtt,
				@Cte_SeqEnd = @CteSeqEnd,
				@IdEsp = @IdEsp,
				@IdPdm = @IdPdm,
				@IdRde = @IdRde,
				@Gia_DatEms = @Dat,
				@Ngc_Crt = @GiaCrt,
				@Out_IdNgc = @OutIdNgc OUTPUT,
				@Out_Atz = @OutAtz OUTPUT,
				@Out_IdMsg = @OutIdMsg OUTPUT

		IF (@return_value <> 0)
		BEGIN
			SET @OutMsg = 'Erro na validação do contratado. Tente novamente mais tarde.[ssAtz_VldCtt]'
			GOTO FIM_ERRO
		END
	END

	IF (@OutIdMsg <> '')
		SET @OutIdMsg = SUBSTRING(@OutIdMsg,1,LEN(@OutIdMsg) -1)

	RETURN 

	FIM_ERRO:
		SET @OutErr = 1
		SET @OutAtz = 0
		RETURN	
END
GO
/****** Object:  StoredProcedure [dbo].[ssMpv_CidCon]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 10/05/2009
-- Description:	Pesquisa de CID10 em consultas para medicina preventiva
-- =============================================================================
 
CREATE PROCEDURE [dbo].[ssMpv_CidCon]
	@DatIni SMALLDATETIME,
	@DatFim	SMALLDATETIME
AS
BEGIN

	SELECT	Gpd_DatRel, Bnf_Mtr, Bnf_Nme, Esp_Dsc, IdCid,
			DATEDIFF(MONTH,Bnf_DatNas, GETDATE())/12 AS Bnf_Idd
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf,
			dbo.Atz_Esp, dbo.Atz_GiaCid, dbo.Atz_Cid
	WHERE	IdBnf = Gia_IdBnf
	AND		IdGia = Gpd_IdGia
	AND		IdEsp = Gia_IdEsp
	AND		IdCid = Gcd_IdCid
	AND		IdGia = Gcd_IdGia
	AND		Gia_Tip = 1
	AND		Cid_Aud = 1
	AND		Gpd_DatRel >= @DatIni
	AND		Gpd_DatRel <= @DatFim
	ORDER BY 3
END
GO
/****** Object:  StoredProcedure [dbo].[ssFat_ArqTxt]    Script Date: 12/18/2012 09:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- ALTER  date: 26/02/2012
-- Description:	Pesquisa procedimentos autorizados para geração de arquivo texto
--				para importação no sistema de gestão
-- =============================================================================
CREATE PROCEDURE [dbo].[ssFat_ArqTxt]
	@FchCpc VARCHAR(6),
	@IdTpd TINYINT
AS

	SELECT	'000000000000' AS NumLot, -- Número do Lote
			Gpd_DatRel, -- DataAux
			IdGia, -- NumGuiaPrestador
			Gia_Snh, -- SenhaAutorizacao
			REPLACE(Bnf_Nme,'''','') AS Bnf_Nme, -- NomeBeneficiario
			Bnf_Mtr AS Bnf_Mtr, -- Carteira
			dbo.fxAtz_BnfPrd(Gia_IdBnf,Gpd_DatRel) AS Prd_Nme, -- NomePlano				
			-- Na consulta o solicitante é também o executante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS CodSol, -- CodSolicitante 
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Nme_Sol, -- NomeSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS Prf_MtrSol, -- CodPROSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Prf_NmeSol, -- NomePROSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_IdCns ELSE sol.Prf_IdCns END AS IdCnsSol, -- SiglaConelhoSol 
			CASE Gia_Tip WHEN 1 THEN exe.Prf_NumCns ELSE sol.Prf_NumCns END AS Prf_NumCnsSol, -- NumeroConselhoSol
			CASE Gia_Tip WHEN 1 THEN exe.Prf_EstCns ELSE sol.Prf_EstCns END AS Prf_EstCnsSol, -- UFConselhoSol
			
			exe.Prf_Mtr AS CodExe, -- CodExecutante 
			REPLACE(exe.Prf_Nme,'''','') AS Nme_Exe, -- NomeExecutante
			exe.Prf_Mtr AS Prf_MtrExe, -- CodPROExecutante
			REPLACE(exe.Prf_Nme,'''','') AS Prf_NmeExe, -- NomePROExecutante
			exe.Prf_IdCns AS IdCnsExe, -- SiglaConelhoExec
			exe.Prf_NumCns AS Prf_NumCnsExe, -- NumeroConselhoExec
			exe.Prf_EstCns AS Prf_EstCnsExe, -- UFConselhoExec				

			Esp_SisGst, -- CBOSExec
			Gia_Crt, -- Carater_Atendimento [E-Eletiva|U-Urgência]
			Gia_IdSai, -- Tipo de saída
			CASE Gia_Tip WHEN 1 THEN 4 ELSE 5 END AS Gia_IdTpa, -- Tipo de atendimento
			Gia_IdCtt, -- Prestador	
			
			-- DETALHE
			Pdm_Cod, -- CodigoSRV
			Gpd_DatRel, -- DataProced
			Gpd_QtdAtz, -- QuantExecut
			dbo.fxAtz_GetNgcVlr(IdNgc) AS Ngc_Vlr, -- Valor
			CASE Pdm_Atv WHEN 1 THEN 16 ELSE 94 END AS Pdm_IdTab, -- Tabela
			'U' AS Via_Acs, -- Via de acesso
			'C' AS Tec_Utz -- Técnica utilizada
						
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, dbo.Atz_Ngc, dbo.Atz_Ctt,
			dbo.Atz_Prf sol, dbo.Atz_Prf exe, dbo.Atz_Esp, dbo.Atz_Bnf, dbo.Fat_Fch
	WHERE	IdGia = Gpd_IdGia
	AND		IdSit = Gpd_IdSit
	AND		IdPdm = Gpd_IdPdm
	AND		IdNgc = Gpd_IdNgc
	AND		exe.IdPrf =* Gia_IdPrf
	AND		sol.IdPrf =* Gia_IdPrfSol
	AND		IdEsp = Gia_IdEsp
	AND		IdBnf = Gia_IdBnf
	
	AND		Fch_Cpc = @FchCpc
	AND		Ctt_IdTpd = @IdTpd
	AND		IdCtt = Gia_IdCtt
	AND		Gia_IdCtt = Fch_IdCtt
	
	AND		Gia_Tip = 1 -- Guias de consultas
	AND		Sit_Ind = 'A'		
	AND		Gpd_DatRel >= Fch_DatIni
	AND		Gpd_DatRel <= Fch_DatFim
	UNION ALL
	SELECT	'000000000000' AS NumLot, -- Número do Lote
			Gpd_DatRel, -- DataAux
			IdGia, -- NumGuiaPrestador
			Gia_Snh, -- SenhaAutorizacao
			REPLACE(Bnf_Nme,'''','') AS Bnf_Nme, -- NomeBeneficiario
			Bnf_Mtr AS Bnf_Mtr, -- Carteira
			dbo.fxAtz_BnfPrd(Gia_IdBnf,Gpd_DatRel) AS Prd_Nme, -- NomePlano				
			-- Na consulta o solicitante é também o executante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS CodSol, -- CodSolicitante 
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Nme_Sol, -- NomeSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS Prf_MtrSol, -- CodPROSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Prf_NmeSol, -- NomePROSolicitante
			CASE Gia_Tip WHEN 1 THEN exe.Prf_IdCns ELSE sol.Prf_IdCns END AS IdCnsSol, -- SiglaConelhoSol 
			CASE Gia_Tip WHEN 1 THEN exe.Prf_NumCns ELSE sol.Prf_NumCns END AS Prf_NumCnsSol, -- NumeroConselhoSol
			CASE Gia_Tip WHEN 1 THEN exe.Prf_EstCns ELSE sol.Prf_EstCns END AS Prf_EstCnsSol, -- UFConselhoSol
			
			exe.Prf_Mtr AS CodExe, -- CodExecutante 
			REPLACE(exe.Prf_Nme,'''','') AS Nme_Exe, -- NomeExecutante
			exe.Prf_Mtr AS Prf_MtrExe, -- CodPROExecutante
			REPLACE(exe.Prf_Nme,'''','') AS Prf_NmeExe, -- NomePROExecutante
			exe.Prf_IdCns AS IdCnsExe, -- SiglaConelhoExec
			exe.Prf_NumCns AS Prf_NumCnsExe, -- NumeroConselhoExec
			exe.Prf_EstCns AS Prf_EstCnsExe, -- UFConselhoExec				

			Esp_SisGst, -- CBOSExec
			Gia_Crt, -- Carater_Atendimento [E-Eletiva|U-Urgência]
			Gia_IdSai, -- Tipo de saída
			CASE Gia_Tip WHEN 1 THEN 4 ELSE 5 END AS Gia_IdTpa, -- Tipo de atendimento
			Gia_IdCtt, -- Prestador	
			
			-- DETALHE
			Pdm_Cod, -- CodigoSRV
			Gpd_DatRel, -- DataProced
			Gpd_QtdAtz, -- QuantExecut
			dbo.fxAtz_GetNgcVlr(IdNgc) AS Ngc_Vlr, -- Valor
			CASE Pdm_Atv WHEN 1 THEN 16 ELSE 94 END AS Pdm_IdTab, -- Tabela
			'U' AS Via_Acs, -- Via de acesso
			'C' AS Tec_Utz -- Técnica utilizada
						
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, dbo.Atz_Ngc, dbo.Atz_Ctt,
			dbo.Atz_Prf sol, dbo.Atz_Prf exe, dbo.Atz_Esp, dbo.Atz_Bnf, dbo.Fat_Fch
	WHERE	IdGia = Gpd_IdGia
	AND		IdSit = Gpd_IdSit
	AND		IdPdm = Gpd_IdPdm
	AND		IdNgc = Gpd_IdNgc
	AND		exe.IdPrf =* Gia_IdPrf
	AND		sol.IdPrf =* Gia_IdPrfSol
	AND		IdEsp = Gia_IdEsp
	AND		IdBnf = Gia_IdBnf
	
	AND		Fch_Cpc = @FchCpc
	AND		Ctt_IdTpd = @IdTpd
	AND		IdCtt = Gia_IdCtt
	AND		Gia_IdCtt = Fch_IdCtt
	
	AND		Gia_Tip = 2 -- Guias de SP/SADT
	AND		Sit_Ind = 'A'
	AND		Gpd_DatRel >= Fch_DatIni
	AND		Gpd_DatRel <= Fch_DatFim
	ORDER BY Gia_IdCtt, IdGia
GO
/****** Object:  UserDefinedFunction [dbo].[fxMpv_ExeConQtd]    Script Date: 12/18/2012 09:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 10/05/2009
-- Description:	Pesquisa quantidade de consultas executadas por beneficiário
-- =============================================================================

CREATE FUNCTION [dbo].[fxMpv_ExeConQtd](@Dat_Ref SMALLDATETIME)
	RETURNS @retTable TABLE 
		( 
			Per_Exe VARCHAR(10),
			IdBnf INT,
			Bnf_Mtr VARCHAR(20), 
			Bnf_Nme VARCHAR(70),
			Qtd_Con SMALLINT
		)
AS
BEGIN
	INSERT @retTable
		SELECT	'30 DIAS', IdBnf, Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd_Con
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel IS NOT NULL
		AND		DATEDIFF(DAY,Gpd_DatRel, @Dat_Ref) <= 30
		GROUP BY IdBnf, Bnf_Mtr, Bnf_Nme
		HAVING COUNT(*) >= 3

	INSERT @retTable
		SELECT	'60 DIAS', IdBnf, Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd_Con
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel IS NOT NULL
		AND		DATEDIFF(DAY,Gpd_DatRel, @Dat_Ref) <= 60
		AND		IdBnf NOT IN (SELECT IdBnf FROM @retTable)
		GROUP BY IdBnf, Bnf_Mtr, Bnf_Nme
		HAVING COUNT(*) >= 4

	INSERT @retTable
		SELECT	'90 DIAS', IdBnf, Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd_Con
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel IS NOT NULL
		AND		DATEDIFF(DAY,Gpd_DatRel, @Dat_Ref) <= 90
		AND		IdBnf NOT IN (SELECT IdBnf FROM @retTable)
		GROUP BY IdBnf, Bnf_Mtr, Bnf_Nme
		HAVING COUNT(*) >= 5

	INSERT @retTable
		SELECT	'120 DIAS', IdBnf, Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd_Con
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel IS NOT NULL
		AND		DATEDIFF(DAY,Gpd_DatRel, @Dat_Ref) <= 120
		AND		IdBnf NOT IN (SELECT IdBnf FROM @retTable)
		GROUP BY IdBnf, Bnf_Mtr, Bnf_Nme
		HAVING COUNT(*) >= 6

	INSERT @retTable
		SELECT	'150 DIAS', IdBnf, Bnf_Mtr, Bnf_Nme, COUNT(*) AS Qtd_Con
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel IS NOT NULL
		AND		DATEDIFF(DAY,Gpd_DatRel, @Dat_Ref) <= 150
		AND		IdBnf NOT IN (SELECT IdBnf FROM @retTable)
		GROUP BY IdBnf, Bnf_Mtr, Bnf_Nme
		HAVING COUNT(*) >= 7

	RETURN

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_ArqTxt]    Script Date: 12/18/2012 09:52:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- ALTER  date: 30/04/2009
-- Description:	Pesquisa procedimentos autorizados para geração de arquivo texto
--				para importação no sistema de gestão
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_ArqTxt]
	@Tip TINYINT = 1, --[1-Primeiro Layout|2-Segundo Layout]
	@DatIni SMALLDATETIME,
	@DatFim SMALLDATETIME
AS
	IF (@Tip = 1)
			SELECT	'077' AS Ems, -- Número EMS
				IdGia, -- Sequência de transação
				Bnf_Mtr, -- Usuário
				Gpd_DatRel, -- Data/hora
				CASE Gia_Tip WHEN 2 THEN '07' ELSE '01' END AS Tip_Trn, -- Tipo transação
				LTRIM(STR(Gia_IdCtt) +'01') AS Gia_IdCtt, -- Prestador 
				'80851795' AS Tmn, -- Terminal
				'I' AS Tip_Tmn, -- Tipo terminal
				'D' AS Fnt_Usr, -- Fonte dados usuário
				'D' AS Fnt_Prs, -- Fonte dados prestador
				'00000000000' AS Ctr_Atd, -- Central de atendimento
				CASE Gia_Tip
					WHEN 2 THEN Pdm_Cod
				ELSE
					CASE Gia_Crt       
						WHEN 'U' THEN '00.01.007-3'
					ELSE
						Pdm_Cod
					END
				END AS Pdm_Cod, -- Procedimento
				IdGia, -- Autorização
				Gpd_QtdAtz, -- Sessões
				(SELECT TOP 1 SUBSTRING(Gcd_IdCid,1,3) AS IdCid FROM dbo.Atz_GiaCid WHERE Gcd_IdGia = IdGia) AS Cid_Dsc, -- CID
				'A' AS Sit, -- Situação
				'000' AS Msg, -- Mensagem
				Prf_NumCns AS Prf_Sol, -- Solicitante
				'000000000000000' AS Prf_Exe, -- Executante
				Esp_SisGst, -- Especialidade
				IdGia, -- Número atendimento
				CASE Gia_Crt WHEN 'U' THEN 3 ELSE 1 END AS Gia_Crt -- Tipo procedimento
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, 
				dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Bnf
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		IdPrf =* Gia_IdPrf
		AND		IdEsp = Gia_IdEsp
		AND		IdBnf = Gia_IdBnf
		AND		Gia_Tip = 1 -- Guias de Consultas
		AND		Sit_Ind = 'A'
		AND		IdSit <> 3 -- Não listar autorizado auditoria
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		UNION ALL
		SELECT	'077' AS Ems, -- Número EMS
				IdGia, -- Sequência de transação
				Bnf_Mtr, -- Usuário
				Gpd_DatRel, -- Data/hora
				CASE Gia_Tip WHEN 2 THEN '07' ELSE '01' END AS Tip_Trn, -- Tipo transação
				LTRIM(STR(Gia_IdCtt) +'01') AS Gia_IdCtt, -- Prestador 
				'80851795' AS Tmn, -- Terminal
				'I' AS Tip_Tmn, -- Tipo terminal
				'D' AS Fnt_Usr, -- Fonte dados usuário
				'D' AS Fnt_Prs, -- Fonte dados prestador
				'00000000000' AS Ctr_Atd, -- Central de atendimento
				CASE Gia_Tip
					WHEN 2 THEN Pdm_Cod
				ELSE
					CASE Gia_Crt       
						WHEN 'U' THEN '00.01.007-3'
					ELSE
						Pdm_Cod
					END
				END AS Pdm_Cod, -- Procedimento
				IdGia, -- Autorização
				Gpd_QtdAtz, -- Sessões
				(SELECT TOP 1 SUBSTRING(Gcd_IdCid,1,3) AS IdCid FROM dbo.Atz_GiaCid WHERE Gcd_IdGia = IdGia) AS Cid_Dsc, -- CID
				'A' AS Sit, -- Situação
				'000' AS Msg, -- Mensagem
				Prf_NumCns AS Prf_Sol, -- Solicitante
				'000000000000000' AS Prf_Exe, -- Executante
				Esp_SisGst, -- Especialidade
				IdGia, -- Número atendimento
				CASE Gia_Crt WHEN 'U' THEN 3 ELSE 1 END AS Gia_Crt -- Tipo procedimento
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, 
				dbo.Atz_Prf, dbo.Atz_Esp, dbo.Atz_Bnf
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		IdPrf =* Gia_IdPrf
		AND		IdEsp = Gia_IdEsp
		AND		IdBnf = Gia_IdBnf
		AND		Gia_Tip = 2 -- Guias de SP/SADT
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		ORDER BY 2
	ELSE
	BEGIN
		SELECT	'000000000000' AS NumLot, -- Número do Lote
				Gpd_DatRel, -- DataAux
				IdGia, -- NumGuiaPrestador
				Gia_Snh, -- SenhaAutorizacao
				REPLACE(Bnf_Nme,'''','') AS Bnf_Nme, -- NomeBeneficiario
				Bnf_Mtr AS Bnf_Mtr, -- Carteira
				dbo.fxAtz_BnfPrd(Gia_IdBnf,Gpd_DatRel) AS Prd_Nme, -- NomePlano				
				-- Na consulta o solicitante é também o executante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS CodSol, -- CodSolicitante 
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Nme_Sol, -- NomeSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS Prf_MtrSol, -- CodPROSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Prf_NmeSol, -- NomePROSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_IdCns ELSE sol.Prf_IdCns END AS IdCnsSol, -- SiglaConelhoSol 
				CASE Gia_Tip WHEN 1 THEN exe.Prf_NumCns ELSE sol.Prf_NumCns END AS Prf_NumCnsSol, -- NumeroConselhoSol
				CASE Gia_Tip WHEN 1 THEN exe.Prf_EstCns ELSE sol.Prf_EstCns END AS Prf_EstCnsSol, -- UFConselhoSol
				
				exe.Prf_Mtr AS CodExe, -- CodExecutante 
				REPLACE(exe.Prf_Nme,'''','') AS Nme_Exe, -- NomeExecutante
				exe.Prf_Mtr AS Prf_MtrExe, -- CodPROExecutante
				REPLACE(exe.Prf_Nme,'''','') AS Prf_NmeExe, -- NomePROExecutante
				exe.Prf_IdCns AS IdCnsExe, -- SiglaConelhoExec
				exe.Prf_NumCns AS Prf_NumCnsExe, -- NumeroConselhoExec
				exe.Prf_EstCns AS Prf_EstCnsExe, -- UFConselhoExec				

				Esp_SisGst, -- CBOSExec
				Gia_Crt, -- Carater_Atendimento [E-Eletiva|U-Urgência]
				Gia_IdSai, -- Tipo de saída
				CASE Gia_Tip WHEN 1 THEN 4 ELSE 5 END AS Gia_IdTpa, -- Tipo de atendimento
				Gia_IdCtt, -- Prestador	
				
				-- DETALHE
				Pdm_Cod, -- CodigoSRV
				Gpd_DatRel, -- DataProced
				Gpd_QtdAtz, -- QuantExecut
				dbo.fxAtz_GetNgcVlr(IdNgc) AS Ngc_Vlr, -- Valor
				CASE Pdm_Atv WHEN 1 THEN 16 ELSE 94 END AS Pdm_IdTab, -- Tabela
				'U' AS Via_Acs, -- Via de acesso
				'C' AS Tec_Utz -- Técnica utilizada
							
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, dbo.Atz_Ngc,
				dbo.Atz_Prf sol, dbo.Atz_Prf exe, dbo.Atz_Esp, dbo.Atz_Bnf
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		IdNgc = Gpd_IdNgc
		AND		exe.IdPrf =* Gia_IdPrf
		AND		sol.IdPrf =* Gia_IdPrfSol
		AND		IdEsp = Gia_IdEsp
		AND		IdBnf = Gia_IdBnf
		AND		Gia_Tip = 1 -- Guias de consultas
		AND		Sit_Ind = 'A'		
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		UNION ALL
		SELECT	'000000000000' AS NumLot, -- Número do Lote
				Gpd_DatRel, -- DataAux
				IdGia, -- NumGuiaPrestador
				Gia_Snh, -- SenhaAutorizacao
				REPLACE(Bnf_Nme,'''','') AS Bnf_Nme, -- NomeBeneficiario
				Bnf_Mtr AS Bnf_Mtr, -- Carteira
				dbo.fxAtz_BnfPrd(Gia_IdBnf,Gpd_DatRel) AS Prd_Nme, -- NomePlano				
				-- Na consulta o solicitante é também o executante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS CodSol, -- CodSolicitante 
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Nme_Sol, -- NomeSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Mtr ELSE sol.Prf_Mtr END AS Prf_MtrSol, -- CodPROSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_Nme ELSE sol.Prf_Nme END AS Prf_NmeSol, -- NomePROSolicitante
				CASE Gia_Tip WHEN 1 THEN exe.Prf_IdCns ELSE sol.Prf_IdCns END AS IdCnsSol, -- SiglaConelhoSol 
				CASE Gia_Tip WHEN 1 THEN exe.Prf_NumCns ELSE sol.Prf_NumCns END AS Prf_NumCnsSol, -- NumeroConselhoSol
				CASE Gia_Tip WHEN 1 THEN exe.Prf_EstCns ELSE sol.Prf_EstCns END AS Prf_EstCnsSol, -- UFConselhoSol
				
				exe.Prf_Mtr AS CodExe, -- CodExecutante 
				REPLACE(exe.Prf_Nme,'''','') AS Nme_Exe, -- NomeExecutante
				exe.Prf_Mtr AS Prf_MtrExe, -- CodPROExecutante
				REPLACE(exe.Prf_Nme,'''','') AS Prf_NmeExe, -- NomePROExecutante
				exe.Prf_IdCns AS IdCnsExe, -- SiglaConelhoExec
				exe.Prf_NumCns AS Prf_NumCnsExe, -- NumeroConselhoExec
				exe.Prf_EstCns AS Prf_EstCnsExe, -- UFConselhoExec				

				Esp_SisGst, -- CBOSExec
				Gia_Crt, -- Carater_Atendimento [E-Eletiva|U-Urgência]
				Gia_IdSai, -- Tipo de saída
				CASE Gia_Tip WHEN 1 THEN 4 ELSE 5 END AS Gia_IdTpa, -- Tipo de atendimento
				Gia_IdCtt, -- Prestador	
				
				-- DETALHE
				Pdm_Cod, -- CodigoSRV
				Gpd_DatRel, -- DataProced
				Gpd_QtdAtz, -- QuantExecut
				dbo.fxAtz_GetNgcVlr(IdNgc) AS Ngc_Vlr, -- Valor
				CASE Pdm_Atv WHEN 1 THEN 16 ELSE 94 END AS Pdm_IdTab, -- Tabela
				'U' AS Via_Acs, -- Via de acesso
				'C' AS Tec_Utz -- Técnica utilizada
							
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm, dbo.Atz_Ngc,
				dbo.Atz_Prf sol, dbo.Atz_Prf exe, dbo.Atz_Esp, dbo.Atz_Bnf
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		IdNgc = Gpd_IdNgc
		AND		exe.IdPrf =* Gia_IdPrf
		AND		sol.IdPrf =* Gia_IdPrfSol
		AND		IdEsp = Gia_IdEsp
		AND		IdBnf = Gia_IdBnf
		AND		Gia_Tip = 2 -- Guias de SP/SADT
		AND		Sit_Ind = 'A'
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		ORDER BY Gia_IdCtt, IdGia
	END
GO
/****** Object:  StoredProcedure [dbo].[srAtz_GiaSdtPdm]    Script Date: 12/18/2012 09:52:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 22/01/2009
-- Description:	Pesquisa de procedimentos da Guia de SP/SADT para impressão
-- =============================================================================

CREATE PROCEDURE [dbo].[srAtz_GiaSdtPdm]
	@IdGia INT = NULL,
	@IdGiaLte NVARCHAR(50) = NULL
AS
BEGIN
	-- Na impressão da guia SP/SADT são exibidos somente os procedimentos autorizados
	IF @IdGia IS NOT NULL
		SELECT	Pdm_Cod, Pdm_Dsc, Gpd_QtdSol, Gpd_QtdAtz, Pdm_IdTab, Gpd_IdSit, Sit_Dsc
		FROM	dbo.Atz_GiaPdm, dbo.Atz_Pdm, dbo.Atz_Sit
		WHERE	IdPdm = Gpd_IdPdm
		AND		IdSit = Gpd_IdSit
		AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
		AND		Gpd_IdGia = @IdGia
	ELSE
	BEGIN
		-- Na impressão do relatório de execução pode exisitr mais de uma guia,
		-- por este motivo agrupo os procedimentos
		DECLARE @SQL NVARCHAR (2000)
		
		SET @SQL = 'SELECT	Pdm_Cod, Pdm_Dsc, Gpd_QtdSol, Gpd_QtdAtz, 
							Pdm_IdTab, Gpd_IdSit, Sit_Dsc
					FROM	dbo.Atz_GiaPdm, dbo.Atz_Pdm, dbo.Atz_Sit
					WHERE	IdPdm = Gpd_IdPdm
					AND		IdSit = Gpd_IdSit
					AND		Gpd_IdGia IN ('+ @IdGiaLte +')'
					
		EXEC SP_EXECUTESQL @SQL,
			N'@IdGiaLte NVARCHAR(2000)',
			@IdGiaLte
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePto___]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 12/08/2011
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional com pontuação
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePto___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT,
	@IdCtt BIGINT = NULL,
	@PrfMtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@SitInd CHAR(1) = NULL,
	@BnfMtr VARCHAR(20) = NULL,
	@GiaCrt CHAR(1) = NULL,
	@ParMed NUMERIC(18,2) = NULL,
	@ParQtd NUMERIC(18,2) = NULL,
	@ParVlr NUMERIC(18,2) = NULL,
	@OutTot NUMERIC(18,2) OUTPUT
AS
	DECLARE @retTable TABLE 
		( 
			Esp_Dsc VARCHAR(80),
			Prf_Mtr VARCHAR(20),
			Prf_Nme VARCHAR(70),
			QtdCon INT,
			QtdSol INT, 
			QtdExaTot INT,
			QtdExaPrf INT,
			Ch_ NUMERIC(18,2),
			MedCon NUMERIC(18,2),
			MedSol NUMERIC(18,2),
			Eag NUMERIC(18,2),
			VlrCon NUMERIC(18,2),
			VlrExaTot NUMERIC(18,2),			
			VlrExaPrf NUMERIC(18,2),
			VlrEag NUMERIC(18,2)
		) 
		
	DECLARE @tmpTable TABLE
		(
			GiaTip TINYINT,
			GiaCrt CHAR(1),
			GpdDatRel SMALLDATETIME,
			GiaIdEsp SMALLINT,
			GiaIdCtt BIGINT,
			GiaIdPrf INT,
			GiaIdPrfSol INT,
			GpdIdSit TINYINT,
			SitInd CHAR(1),
			GiaIdBnf INT,
			Ch_ NUMERIC(18,2),
			QtdCon INT,
			QtdSol INT,
			QtdExaTot INT,
			QtdExaPrf INT,
			VlrCon NUMERIC(18,2),
			VlrExaTot NUMERIC(18,2),
			VlrExaPrf NUMERIC(18,2),
			Eag NUMERIC(18,2),
			VlrEag NUMERIC(18,2)	
		)
		
	INSERT @tmpTable
		(
			GiaTip, GiaCrt, GpdDatRel, GiaIdEsp,
			GiaIdCtt, GiaIdPrf,	GiaIdPrfSol, GpdIdSit, SitInd,
			GiaIdBnf, Ch_, QtdCon, QtdSol, QtdExaTot, 
			QtdExaPrf, VlrCon, VlrExaTot, VlrExaPrf, Eag, VlrEag
		)
		-- 	
		-- Consultas
		SELECT  Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, 
				Gia_IdCtt, Gia_IdPrf, NULL, Gpd_IdSit, Sit_Ind, 
				Gia_IdBnf, 0.0, 1, 0, 0, 
				0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 0.0, 0.0, 0.0, 0.0
		FROM dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND		Gia_IdEsp = @IdEsp
		UNION ALL
		-- Solicitação de SP/SADT 
		SELECT	0 AS Gia_Tip, Sol_Crt, Spd_Dat, Sol_IdEsp, 
				Sol_IdCtt, Sol_IdPrfSol, NULL, Spd_IdSit, Sit_Ind, 
				Sol_IdBnf, Pdm_QtdCh_, 0, Spd_QtdSol, 0, 
				0, 0.0, 0.0, 0.0, 0.0, 0.0
		FROM dbo.Atz_Gia, dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit, dbo.Atz_Pdm
		WHERE	IdGia = Sol_IdGia
		AND		IdSol = Spd_IdSol		
		AND		IdSit = Spd_IdSit
		AND		IdPdm = Spd_IdPdm	
		AND		Gia_Tip = 1
		AND		Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND		Gia_IdEsp = @IdEsp
		UNION ALL
		-- SP/SADT solicitada pelo profissional
		SELECT	e.Gia_Tip, e.Gia_Crt, Gpd_DatRel, c.Gia_IdEsp, 
				e.Gia_IdCtt, e.Gia_IdPrfSol, e.Gia_IdPrf, Gpd_IdSit, Sit_Ind, 
				e.Gia_IdBnf, 0.0, 0, 0.0, Gpd_QtdAtz, 
				0, 0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 0.0,
				0.0, 0.0
		FROM	dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c
		WHERE c.IdGia = e.Gia_IdGiaPrc
		AND e.IdGia = Gpd_IdGia		
		AND		IdSit = Gpd_IdSit
		AND		Sit_Ind = 'A'	
		AND c.Gia_Tip = 1	
		AND c.Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND c.Gia_IdEsp = @IdEsp
		UNION ALL
		-- SP/SADT executada pelo profissional (pode ter sido solicitado por outro profissional)
		SELECT  e.Gia_Tip, e.Gia_Crt, Gpd_DatRel, c.Gia_IdEsp, 
				e.Gia_IdCtt, e.Gia_IdPrf, e.Gia_IdPrfSol, Gpd_IdSit, Sit_Ind, 
				e.Gia_IdBnf, 0.0, 0, 0, 0.0, 
				Gpd_QtdAtz, 0, 0.0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 
				CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN Gpd_QtdAtz ELSE 0 END, -- Cálculo EAG
				CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz ELSE 0 END
		FROM	dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c
		WHERE	c.IdGia = e.Gia_IdGiaPrc
		AND		e.IdGia = Gpd_IdGia		
		AND		IdSit = Gpd_IdSit
		AND		Sit_Ind = 'A'	
		AND		c.Gia_Tip = 1	
		AND		c.Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND		c.Gia_IdEsp = @IdEsp
		
	IF @IdEsp IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdEsp <> @IdEsp
	IF @IdCtt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdCtt <> @IdCtt
	IF @PrfMtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdPrf NOT IN
			(
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @PrfMtr
			 )
	IF @IdSit IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GpdIdSit <> @IdSit
	IF @SitInd IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	SitInd <> @SitInd
	IF @BnfMtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdBnf NOT IN
			(	
				SELECT	IdBnf
				FROM	dbo.Atz_Bnf
				WHERE	Bnf_Mtr = @BnfMtr
			)
	IF @GiaCrt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaCrt <> @GiaCrt
	
	-- Resultado agrupado por especialidade e profissional
	INSERT @retTable
		(Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, QtdSol, QtdExaTot, QtdExaPrf, 
		 Ch_, MedCon, MedSol, VlrCon, VlrExaPrf, VlrExaTot, Eag, VlrEag)
		SELECT  Esp_Dsc, Prf_Mtr, Prf_Nme, SUM(QtdCon), SUM(QtdSol), SUM(QtdExaTot), SUM(QtdExaPrf),
				SUM(Ch_), 0.0, 0.0, SUM(VlrCon), SUM(VlrExaPrf), SUM(VlrExaTot),
				SUM(Eag), SUM(VlrEag)
		FROM	@tmpTable t, dbo.Atz_Prf, dbo.Atz_Esp
		WHERE	IdPrf = t.GiaIdPrf
		AND		IdEsp = t.GiaIdEsp
		GROUP BY GiaIdEsp, Esp_Dsc, GiaIdPrf, Prf_Mtr, Prf_Nme	
	
	UPDATE @retTable 
	SET MedCon = VlrCon/QtdCon, MedSol = QtdSol/CONVERT(NUMERIC(18,2),QtdCon)
	WHERE QtdCon > 0
	
	SELECT 	
		Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, VlrCon, MedCon, 
		QtdSol, Ch_, MedSol, QtdExaPrf, VlrExaPrf, QtdExaTot, VlrExaTot,
		VlrCon + VlrExaPrf AS Vlr, VlrCon + VlrExaTot + VlrExaPrf AS VlrTot,
		Eag, VlrEag,
		(CASE WHEN ISNULL(MedSol,0.0) <= @ParMed THEN 1 ELSE 0 END) +
		(CASE WHEN ISNULL(QtdCon,0.0) >= @ParQtd THEN 1 ELSE 0 END) +
		(CASE WHEN ISNULL(MedCon,0.0) <= @ParVlr THEN 1 ELSE 0 END) 
		AS Pto			
	FROM 
		@retTable
	ORDER BY 
		Esp_Dsc, Prf_Nme
GO
/****** Object:  StoredProcedure [dbo].[srAtz_GiaExeQtd]    Script Date: 12/18/2012 09:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/05/2009
-- Description:	Pesquisa quantidade de guias executadas por competência
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_GiaExeQtd]
	@IdFch SMALLINT,
	@IdCtt BIGINT,
	@Cte_SeqEnd TINYINT = NULL
AS
	DECLARE @DatIni SMALLDATETIME, @DatFim SMALLDATETIME, @Ano SMALLINT, @Mes TINYINT
	
	SELECT	@Ano = Fch_Ano, @Mes = Fch_Mes,
			@DatIni = Fch_DatIni, @DatFim = Fch_DatFim
	FROM	dbo.Fat_Fch
	WHERE	IdFch = @IdFch

	IF @Cte_SeqEnd IS NOT NULL
		SELECT	@Ano AS Ano, @Mes AS Mes, LTRIM(STR(IdCtt)) +'-'+ LTRIM(STR(Cte_SeqEnd)) AS Ctt_Mtr, Ctt_Nme, 
				CASE Ctt_TipDoc 
					WHEN 'J' THEN 'CNPJ' 
					WHEN 'F' THEN 'CPF' 
				ELSE NULL END
				AS Ctt_TipDoc,
				Ctt_Doc, Ctt_NumCns,
				'CONSULTAS' AS Gia_TipDsc, COUNT(*) AS Qtd
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, 
				dbo.Atz_Ctt, dbo.Atz_CttEnd
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdCtt = Cte_IdCtt
		AND		Gia_IdCtt = Cte_IdCtt
		AND		Gia_SeqEnd = Cte_SeqEnd
		AND		Sit_Ind = 'A'
		AND		Gia_Tip = 1 -- Guia de consulta
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		GROUP BY IdCtt, Ctt_Nme, Cte_SeqEnd, Ctt_TipDoc, Ctt_Doc, Ctt_NumCns
		UNION ALL	
		SELECT	@Ano AS Ano, @Mes AS Mes, LTRIM(STR(IdCtt)) +'-'+ LTRIM(STR(Cte_SeqEnd)) AS Ctt_Mtr, Ctt_Nme,
				CASE Ctt_TipDoc 
					WHEN 'J' THEN 'CNPJ' 
					WHEN 'F' THEN 'CPF' 
				ELSE NULL 
				END AS Ctt_TipDoc,
				Ctt_Doc, Ctt_NumCns,
				'SP/SADT' AS Gia_TipDsc, COUNT(*) AS Qtd
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit,
				dbo.Atz_Ctt, dbo.Atz_CttEnd	
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdCtt = Cte_IdCtt
		AND		Gia_IdCtt = Cte_IdCtt
		AND		Gia_SeqEnd = Cte_SeqEnd	
		AND		Sit_Ind = 'A'
		AND		Gia_Tip = 2 -- Guia de SP/SADT
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		GROUP BY IdCtt, Ctt_Nme, Cte_SeqEnd, Ctt_TipDoc, Ctt_Doc, Ctt_NumCns
	ELSE
		SELECT 	@Ano AS Ano, @Mes AS Mes, LTRIM(STR(IdCtt)) AS Ctt_Mtr, Ctt_Nme,
				CASE Ctt_TipDoc 
					WHEN 'J' THEN 'CNPJ' 
					WHEN 'F' THEN 'CPF' 
				ELSE NULL END
				AS Ctt_TipDoc,
				Ctt_Doc, Ctt_NumCns,
				'CONSULTAS' AS Gia_TipDsc, COUNT(*) AS Qtd
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit, 
				dbo.Atz_Ctt, dbo.Atz_CttEnd
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdCtt = Cte_IdCtt
		AND		Gia_IdCtt = Cte_IdCtt
		AND		Gia_SeqEnd = Cte_SeqEnd
		AND		Sit_Ind = 'A'
		AND		Gia_Tip = 1 -- Guia de consulta
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		AND		Gia_IdCtt = @IdCtt
		GROUP BY IdCtt, Ctt_Nme, Ctt_TipDoc, Ctt_Doc, Ctt_NumCns
		UNION ALL	
		SELECT	@Ano AS Ano, @Mes AS Mes, LTRIM(STR(IdCtt)) AS Ctt_Mtr, Ctt_Nme,
				CASE Ctt_TipDoc 
					WHEN 'J' THEN 'CNPJ' 
					WHEN 'F' THEN 'CPF' 
				ELSE NULL 
				END AS Ctt_TipDoc,
				Ctt_Doc, Ctt_NumCns,
				'SP/SADT' AS Gia_TipDsc, COUNT(*) AS Qtd
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit,
				dbo.Atz_Ctt, dbo.Atz_CttEnd	
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdCtt = Cte_IdCtt
		AND		Gia_IdCtt = Cte_IdCtt
		AND		Gia_SeqEnd = Cte_SeqEnd	
		AND		Sit_Ind = 'A'
		AND		Gia_Tip = 2 -- Guia de SP/SADT
		AND		Gpd_DatRel >= @DatIni
		AND		Gpd_DatRel <= @DatFim
		AND		Gia_IdCtt = @IdCtt
		GROUP BY IdCtt, Ctt_Nme, Ctt_TipDoc, Ctt_Doc, Ctt_NumCns
GO
/****** Object:  StoredProcedure [dbo].[srAtz_GiaCon]    Script Date: 12/18/2012 09:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 21/01/2009
-- Description:	Pesquisa Guia de Consulta para impressão
-- =============================================
CREATE PROCEDURE [dbo].[srAtz_GiaCon]
	@IdGia INT
AS
	SELECT	IdGia, Gia_Snh, Gia_DatEms, Bnf_Mtr, Prd_Nme, Bnf_Nme, 
			LTRIM(STR(IdTpc)) +' - '+ Tpc_Dsc AS Tpc_Dsc,
			LTRIM(STR(IdSai)) +' - '+ Sai_Dsc AS Sai_Dsc,
			Bnf_DatVld, IdCtt, Ctt_Nme, Tpl_Dsc, Gia_TemDoe, Gia_TipDoe,
			Lgr_Nme +' '+ Cte_NumEnd +' '+ ISNULL(Cte_Cpl,'') AS Ctt_End, 
			Mun_Nme, Mun_Est, Cte_Cep, Prf_Nme, ISNULL(Gia_DatAtd,GETDATE()) AS Gia_DatAtd, Pdm_Cod,
			Pdm_IdTab, Ctt_CodCne, Cns_Nme, Prf_NumCns, Prf_EstCns, Esp_Cbo
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Ctt, dbo.Atz_CttEnd,
			dbo.Atz_Prf, dbo.Atz_Pdm, dbo.Atz_Prd, dbo.Atz_BnfPrd, dbo.Atz_Tpc, dbo.Atz_Esp, 
			dbo.Atz_Sai, dbo.Atz_Tpl, dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Mun, dbo.Atz_Cns
	WHERE	IdGia = Gpd_IdGia
	AND		IdCtt = Cte_IdCtt
	AND		Cte_IdCtt = Gia_IdCtt
	AND		Cte_SeqEnd = Gia_SeqEnd
	AND		IdCtt = Cte_IdCtt
	AND		IdPdm = Gpd_IdPdm
	AND		IdBnf = Gia_IdBnf
	AND		IdBnf = Bnp_IdBnf
	AND		IdLgr = Cte_IdLgr
	AND		IdPrd = Bnp_IdPrd
	AND		IdPrf = Gia_IdPrf
	AND		IdTpc =* Gia_IdTpc
	AND		IdSai =* Gia_IdSai
	AND		IdTpl = Lgr_IdTpl
	AND		IdMun = Brr_IdMun
	AND		IdBrr = Lgr_IdBrr
	AND		IdCns = Prf_IdCns
	AND		IdEsp = Gia_IdEsp 
	AND		Gia_Tip = 1
	AND		Bnp_DatFim IS NULL	
	AND		IdGia = @IdGia
GO
/****** Object:  StoredProcedure [dbo].[srAtz_Aud]    Script Date: 12/18/2012 09:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2011.07.17
-- Description:	Relatório da solicitação/guia para auditoria
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_Aud]
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
				) AS Cid_Dsc, Tpl_Dsc +' '+ Lgr_Nme +' - '+ Brr_Nme +' - '+ Mun_Nme AS Ctt_End,
				Sit_Dsc, Spd_QtdSol, Spd_QtdAtz, 
				Spd_Dat, Spd_DatVld, Pdm_Cod, Pdm_QtdCh_, Pdm_Dsc, Sit_Ind
		FROM	dbo.Atz_Sol, dbo.Atz_Ctt, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_CttEnd, dbo.Atz_Mun, 
				dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Tpl, dbo.Atz_SolPdm, dbo.Atz_Sit, dbo.Atz_Pdm
		WHERE	IdCtt = Cte_IdCtt
		AND		IdBnf = Sol_IdBnf
		AND		IdPrf = Sol_IdPrfSol
		AND		Cte_IdCtt = Sol_IdCtt
		AND		Cte_SeqEnd = Sol_SeqEnd
		AND		IdMun = Brr_IdMun
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdTpl = Lgr_IdTpl
		AND		IdSol = Spd_IdSol
		AND		IdSit = Spd_IdSit
		AND		IdPdm = Spd_IdPdm
		AND		IdSol = @IdSol
	ELSE
		-- Seleciona os procedimentos quando é consulta ou SP/SADT
		SELECT	Bnf_Mtr, Bnf_Nme, Gia_IdCtt AS Sol_IdCtt, Gia_SeqEnd AS Sol_SeqEnd, Ctt_Nme, 
				Prf_Mtr, Prf_Nme, Prf_Tel, Prf_Tel2, Prf_Fax, Gia_IndCln AS Sol_IndCln,
				(
					SELECT	TOP 1 IdCid + ' - '+ Cid_Dsc 
					FROM	dbo.Atz_Cid, dbo.Atz_GiaCid 
					WHERE	IdCid = Gcd_IdCid
					AND		Gcd_IdGia = IdGia
				) AS Cid_Dsc, Tpl_Dsc +' '+ Lgr_Nme +' - '+ Brr_Nme +' - '+ Mun_Nme AS Ctt_End,
				Sit_Dsc, Gpd_QtdSol AS Spd_QtdSol, Gpd_QtdAtz AS Spd_QtdAtz, 
				Gpd_Dat AS Spd_Dat, Gpd_DatVld AS Spd_DatVld, Pdm_Cod, Pdm_QtdCh_, Pdm_Dsc, Sit_Ind
		FROM	dbo.Atz_Gia, dbo.Atz_Ctt, dbo.Atz_Bnf, dbo.Atz_Prf, dbo.Atz_CttEnd,	dbo.Atz_Mun, 
				dbo.Atz_Lgr, dbo.Atz_Brr, dbo.Atz_Tpl, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Pdm
		WHERE	IdCtt = Gia_IdCtt
		AND		IdBnf = Gia_IdBnf
		AND		IdPrf =* Gia_IdPrf
		AND		Cte_IdCtt = Gia_IdCtt
		AND		Cte_SeqEnd = Gia_SeqEnd
		AND		IdMun = Brr_IdMun
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdTpl = Lgr_IdTpl
		AND		IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		IdGia = @IdSol
END
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePtoMun___]    Script Date: 12/18/2012 09:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 12/08/2011
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional com pontuação por cidade
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePtoMun___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT,
	@IdCtt BIGINT = NULL,
	@PrfMtr  VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@SitInd CHAR(1) = NULL,
	@BnfMtr VARCHAR(20) = NULL,
	@GiaCrt CHAR(1) = NULL,
	@ParMed NUMERIC(18,2) = NULL,
	@ParQtd NUMERIC(18,2) = NULL,
	@ParVlr NUMERIC(18,2) = NULL,
	@OutTot NUMERIC(18,2) OUTPUT
AS
	DECLARE @retTable TABLE 
		( 
			Mun_Nme VARCHAR(30),
			Esp_Dsc VARCHAR(80),
			Prf_Mtr VARCHAR(20),
			Prf_Nme VARCHAR(70),
			QtdCon INT,
			QtdSol INT, 
			QtdExaTot INT,
			QtdExaPrf INT,
			Ch_ NUMERIC(18,2),
			MedCon NUMERIC(18,2),
			MedSol NUMERIC(18,2),
			Eag	NUMERIC(18,2),
			VlrCon NUMERIC(18,2),
			VlrExaTot NUMERIC(18,2),			
			VlrExaPrf NUMERIC(18,2),
			VlrEag NUMERIC(18,2)
		) 
		
	DECLARE @tmpTable TABLE
		(
			Mun_Nme VARCHAR(30),
			GiaTip TINYINT,
			GiaCrt CHAR(1),
			GpdDatRel SMALLDATETIME,
			GiaIdEsp SMALLINT,
			GiaIdCtt BIGINT,
			GiaIdPrf INT,
			GiaIdPrfSol INT,
			GpdIdSit TINYINT,
			SitInd CHAR(1),
			GiaIdBnf INT,
			Ch_ NUMERIC(18,2),
			QtdCon INT,
			QtdSol INT,
			QtdExaTot INT,
			QtdExaPrf INT,
			VlrCon NUMERIC(18,2),
			VlrExaTot NUMERIC(18,2),
			VlrExaPrf NUMERIC(18,2),
			Eag NUMERIC(18,2),
			VlrEag NUMERIC(18,2)	
		)
		
	INSERT @tmpTable
		(
			Mun_Nme, GiaTip, GiaCrt, GpdDatRel, GiaIdEsp,
			GiaIdCtt, GiaIdPrf,	GiaIdPrfSol, GpdIdSit, SitInd,
			GiaIdBnf, Ch_, QtdCon, QtdSol, QtdExaTot, 
			QtdExaPrf, VlrCon, VlrExaTot, VlrExaPrf, Eag, VlrEag
		)
		-- Consultas
		SELECT Mun_Nme, Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, 
				Gia_IdCtt, Gia_IdPrf, NULL, Gpd_IdSit, Sit_Ind, 
				Gia_IdBnf, 0.0, 1, 0, 0, 
				0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 0.0, 0.0, 0.0, 0.0
		FROM dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit,
			dbo.Atz_CttEnd, Atz_Lgr, Atz_Brr, Atz_Mun
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit		
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		Cte_IdCtt = Gia_IdCtt
		AND		Cte_SeqEnd = Gia_SeqEnd
		AND		Gia_Tip = 1
		AND		Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND		Gia_IdEsp = @IdEsp
		UNION ALL
		-- Solicitação de SP/SADT		
		SELECT	Mun_Nme, 0 AS Gia_Tip, Sol_Crt, Spd_Dat, Sol_IdEsp, 
				Sol_IdCtt, Sol_IdPrfSol, NULL, Spd_IdSit, Sit_Ind, 
				Sol_IdBnf, Pdm_QtdCh_, 0, Spd_QtdSol, 0, 
				0, 0.0, 0.0, 0.0, 0.0, 0.0
		FROM dbo.Atz_Gia, dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit, 
			dbo.Atz_Pdm, dbo.Atz_CttEnd, Atz_Lgr, Atz_Brr, Atz_Mun
		WHERE	IdGia = Sol_IdGia
		AND		IdSol = Spd_IdSol		
		AND		IdSit = Spd_IdSit
		AND		IdPdm = Spd_IdPdm
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		Cte_IdCtt = Sol_IdCtt
		AND		Cte_SeqEnd = Sol_SeqEnd		
		AND		Gia_Tip = 1
		AND		Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND		Gia_IdEsp = @IdEsp
		UNION ALL		
		-- SP/SADT executadas - solicitante é o profissional avaliado
		SELECT	Mun_Nme, e.Gia_Tip, e.Gia_Crt, Gpd_DatRel, c.Gia_IdEsp, 
				e.Gia_IdCtt, e.Gia_IdPrfSol, e.Gia_IdPrf, Gpd_IdSit, Sit_Ind, 
				e.Gia_IdBnf, 0.0, 0, 0.0, Gpd_QtdAtz, 
				0, 0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 0.0,
				0.0, 0.0
		FROM	dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c,
				dbo.Atz_CttEnd, Atz_Lgr, Atz_Brr, Atz_Mun
		WHERE c.IdGia = e.Gia_IdGiaPrc
		AND e.IdGia = Gpd_IdGia		
		AND		IdSit = Gpd_IdSit
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		Cte_IdCtt = c.Gia_IdCtt
		AND		Cte_SeqEnd = c.Gia_SeqEnd
		AND		Sit_Ind = 'A'	
		AND c.Gia_Tip = 1	
		AND c.Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND c.Gia_IdEsp = @IdEsp		
		UNION ALL
		-- SP/SADT executada pelo profissional (pode ter sido solicitado por outro profissional)
		SELECT	Mun_Nme, e.Gia_Tip, e.Gia_Crt, Gpd_DatRel, c.Gia_IdEsp, 
				e.Gia_IdCtt, e.Gia_IdPrf, e.Gia_IdPrfSol, Gpd_IdSit, Sit_Ind, 
				e.Gia_IdBnf, 0.0, 0, 0, 0.0, 
				Gpd_QtdAtz, 0, 0.0, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz, 
				CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN Gpd_QtdAtz ELSE 0 END, -- Cálculo EAG
				CASE WHEN c.Gia_IdPrf = e.Gia_IdPrf THEN dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz ELSE 0 END
		FROM	dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Sit, dbo.Atz_Gia c,
				dbo.Atz_CttEnd, Atz_Lgr, Atz_Brr, Atz_Mun
		WHERE c.IdGia = e.Gia_IdGiaPrc
		AND e.IdGia = Gpd_IdGia		
		AND		IdSit = Gpd_IdSit
		AND		IdLgr = Cte_IdLgr
		AND		IdBrr = Lgr_IdBrr
		AND		IdMun = Brr_IdMun
		AND		Cte_IdCtt = e.Gia_IdCtt
		AND		Cte_SeqEnd = e.Gia_SeqEnd
		AND		Sit_Ind = 'A'	
		AND c.Gia_Tip = 1	
		AND c.Gia_DatAtd BETWEEN @DatIni AND @DatFim
		AND c.Gia_IdEsp = @IdEsp
		
		
	IF @IdEsp IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdEsp <> @IdEsp
	IF @IdCtt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdCtt <> @IdCtt
	IF @PrfMtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdPrf NOT IN
			(
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @PrfMtr
			 )
	IF @IdSit IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GpdIdSit <> @IdSit
	IF @SitInd IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	SitInd <> @SitInd
	IF @BnfMtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaIdBnf NOT IN
			(	
				SELECT	IdBnf
				FROM	dbo.Atz_Bnf
				WHERE	Bnf_Mtr = @BnfMtr
			)
	IF @GiaCrt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	GiaCrt <> @GiaCrt
	
	-- Resultado agrupado por especialidade e profissional
	INSERT @retTable
		(Mun_Nme, Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, QtdSol, QtdExaTot, QtdExaPrf, 
		 Ch_, MedCon, MedSol, /*Prc,*/ VlrCon, VlrExaPrf, VlrExaTot, Eag, VlrEag)
		SELECT	Mun_Nme, Esp_Dsc, Prf_Mtr, Prf_Nme, SUM(QtdCon), SUM(QtdSol), SUM(QtdExaTot), SUM(QtdExaPrf),
				SUM(Ch_), 0.0, 0.0, /*0,*/ SUM(VlrCon), SUM(VlrExaPrf), SUM(VlrExaTot),
				SUM(Eag), SUM(VlrEag)
		FROM	@tmpTable t, dbo.Atz_Prf, dbo.Atz_Esp
		WHERE	IdPrf = t.GiaIdPrf
		AND		IdEsp = t.GiaIdEsp
		GROUP BY Mun_Nme, GiaIdEsp, Esp_Dsc, GiaIdPrf, Prf_Mtr, Prf_Nme	
	
	UPDATE @retTable 
	SET MedCon = VlrCon/QtdCon, MedSol = QtdSol/CONVERT(NUMERIC(18,2),QtdCon)
	WHERE QtdCon > 0
	
	SELECT 	
		Mun_Nme, Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, VlrCon, MedCon, 
		QtdSol, Ch_, MedSol, QtdExaPrf, VlrExaPrf, QtdExaTot, VlrExaTot,
		VlrCon + VlrExaPrf AS Vlr, VlrCon + VlrExaTot + VlrExaPrf AS VlrTot,
		Eag, VlrEag,
		(CASE WHEN ISNULL(MedSol,0.0) <= @ParMed THEN 1 ELSE 0 END) +
		(CASE WHEN ISNULL(QtdCon,0.0) >= @ParQtd THEN 1 ELSE 0 END) +
		(CASE WHEN ISNULL(MedCon,0.0) <= @ParVlr THEN 1 ELSE 0 END) 
		AS Pto			
	FROM 
		@retTable
	ORDER BY 
		Mun_Nme, Esp_Dsc, Prf_Nme
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AcePrf___]    Script Date: 12/18/2012 09:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 05/06/2009
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AcePrf___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
		
	DECLARE @retTable TABLE 
		( 
			Esp_Dsc VARCHAR(80),
			Prf_Mtr VARCHAR(20),
			Prf_Nme VARCHAR(70),
			QtdCon INT,
			QtdSol INT, 
			QtdExa INT,
			Med NUMERIC(18,2),
			Prc NUMERIC(18,2),
			Eag	INT,
			Vlr NUMERIC(18,2)
		) 
		
	DECLARE @tmpTable TABLE
		(
			Gia_Tip TINYINT,
			Gia_Crt CHAR(1),
			Gpd_DatRel SMALLDATETIME,
			Gia_IdEsp SMALLINT,
			Gia_IdCtt BIGINT,
			Gia_IdPrf INT,
			Gia_IdPrfSol INT,
			Gpd_IdSit TINYINT,
			Sit_Ind CHAR(1),
			Gia_IdBnf INT,
			Gpd_Qtd NUMERIC(18,2),
			Ngc_Vlr NUMERIC(18,2)
		)
		
	INSERT @tmpTable		
		SELECT	Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				NULL, Gpd_IdSit, Sit_Ind, Gia_IdBnf, 1, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				Gia_IdPrfSol, Gpd_IdSit, Sit_Ind, Gia_IdBnf, Gpd_QtdAtz, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 2
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	0 AS Gia_Tip, Sol_Crt, Spd_Dat, Sol_IdEsp, Sol_IdCtt, Sol_IdPrfSol, 
				NULL, Spd_IdSit, Sit_Ind, Sol_IdBnf, Spd_QtdSol, 0
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
		WHERE	IdSol = Spd_IdSol
		AND		IdSit = Spd_IdSit
		AND		Spd_IdSit <> 10
		AND		Spd_Dat BETWEEN @DatIni AND @DatFim
		
	IF @IdEsp IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdEsp <> @IdEsp
	IF @IdCtt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdCtt <> @IdCtt
	IF @Prf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdPrf NOT IN
			(
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 )
	IF @IdSit IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gpd_IdSit <> @IdSit
	IF @Sit_Ind IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Sit_Ind <> @Sit_Ind
	IF @Bnf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdBnf NOT IN
			(	
				SELECT	IdBnf
				FROM	dbo.Atz_Bnf
				WHERE	Bnf_Mtr = @Bnf_Mtr
			)
	IF @Gia_Crt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_Crt <> @Gia_Crt
	
	-- Resultado agrupado por especialidade e profissional
	INSERT @retTable
		(Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, QtdSol, QtdExa, Med, Prc, Eag, Vlr)
		SELECT	Esp_Dsc, Prf_Mtr, Prf_Nme, 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf						
				), 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 2
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
					AND		Gpd_Qtd > 0
				)/					
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				((
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				)/
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
				)) * 100,
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	c.Gia_IdPrf = c.Gia_IdPrfSol
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf	
				),
				SUM(Ngc_Vlr)
		FROM	@tmpTable t, dbo.Atz_Prf, dbo.Atz_Esp
		WHERE	IdPrf = t.Gia_IdPrf
		AND		IdEsp = t.Gia_IdEsp
		GROUP BY Gia_IdEsp, Esp_Dsc, Gia_IdPrf, Prf_Mtr, Prf_Nme	

	

	SELECT * 
	FROM @retTable
	ORDER BY Esp_Dsc, Prf_Nme

	SET @Out_Tot = 
		(	SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 0
		)/
		(
			SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 1
		)
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AceMes]    Script Date: 12/18/2012 09:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 19/04/2010
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				profissional e mês
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AceMes]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL,
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
		
	DECLARE @retTable TABLE 
		(
			Ord TINYINT,
			Ano CHAR(4),
			Mes CHAR(2),
			AnoMes CHAR(8),
			Esp_Dsc VARCHAR(80),
			Prf_Mtr VARCHAR(20),
			Prf_Nme VARCHAR(70),
			QtdCon INT,
			QtdSol INT, 
			QtdExa INT,
			Med NUMERIC(18,2),
			Prc NUMERIC(18,2),
			Eag	INT,
			Vlr NUMERIC(18,2)
		) 
		
	DECLARE @tmpTable TABLE
		(
			Ano CHAR(4),
			Mes CHAR(2),
			Gia_Tip TINYINT,
			Gia_Crt CHAR(1),
			Gpd_DatRel SMALLDATETIME,
			Gia_IdEsp SMALLINT,
			Gia_IdCtt BIGINT,
			Gia_IdPrf INT,
			Gia_IdPrfSol INT,
			Gpd_IdSit TINYINT,
			Sit_Ind CHAR(1),
			Gia_IdBnf INT,
			Gpd_Qtd NUMERIC(18,2),
			Ngc_Vlr NUMERIC(18,2)
		)
		
	INSERT @tmpTable		
		SELECT	YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				NULL, Gpd_IdSit, Sit_Ind, Gia_IdBnf, 1, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	YEAR(Gpd_DatRel), MONTH(Gpd_DatRel), Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				Gia_IdPrfSol, Gpd_IdSit, Sit_Ind, Gia_IdBnf, Gpd_QtdAtz, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 2
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	YEAR(Spd_Dat), MONTH(Spd_Dat), 0 AS Gia_Tip, Sol_Crt, Spd_Dat, Sol_IdEsp, Sol_IdCtt, Sol_IdPrfSol, 
				NULL, Spd_IdSit, Sit_Ind, Sol_IdBnf, Spd_QtdSol, 0
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
		WHERE	IdSol = Spd_IdSol
		AND		IdSit = Spd_IdSit
		AND		Spd_IdSit <> 10
		AND		Spd_Dat BETWEEN @DatIni AND @DatFim
		
	IF @IdEsp IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdEsp <> @IdEsp
	IF @IdCtt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdCtt <> @IdCtt
	IF @Prf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdPrf NOT IN
			(
				SELECT	IdPrf
				FROM	dbo.Atz_Prf
				WHERE	Prf_Mtr = @Prf_Mtr
			 )
	IF @IdSit IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gpd_IdSit <> @IdSit
	IF @Sit_Ind IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Sit_Ind <> @Sit_Ind
	IF @Bnf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdBnf NOT IN
			(	
				SELECT	IdBnf
				FROM	dbo.Atz_Bnf
				WHERE	Bnf_Mtr = @Bnf_Mtr
			)
	IF @Gia_Crt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_Crt <> @Gia_Crt
	
	-- Resultado agrupado por especialidade e profissional
	INSERT @retTable
		(Ord, Ano, Mes, AnoMes, Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, QtdSol, QtdExa, Med, Prc, Eag, Vlr)
		SELECT	1, Ano, Mes, NULL, Esp_Dsc, Prf_Mtr, Prf_Nme, 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf						
				), 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 2
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
					AND		Gpd_Qtd > 0
				)/					
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				),
				((
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf
				)/
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
				)) * 100,
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	c.Gia_IdPrf = c.Gia_IdPrfSol
					AND		c.Gia_IdEsp = t.Gia_IdEsp
					AND		c.Gia_IdPrf = t.Gia_IdPrf	
				),
				SUM(Ngc_Vlr)
		FROM	@tmpTable t, dbo.Atz_Prf, dbo.Atz_Esp
		WHERE	IdPrf = t.Gia_IdPrf
		AND		IdEsp = t.Gia_IdEsp
		GROUP BY Ano, Mes, Gia_IdEsp, Esp_Dsc, Gia_IdPrf, Prf_Mtr, Prf_Nme		
	
	UPDATE @retTable
	SET	AnoMes =	CASE Mes 
						WHEN 01 THEN 'JAN/' + LTRIM(STR(Ano))
						WHEN 02 THEN 'FEV/' + LTRIM(STR(Ano))
						WHEN 03 THEN 'MAR/' + LTRIM(STR(Ano))
						WHEN 04 THEN 'ABR/' + LTRIM(STR(Ano))
						WHEN 05 THEN 'MAI/' + LTRIM(STR(Ano))
						WHEN 06 THEN 'JUN/' + LTRIM(STR(Ano))
						WHEN 07 THEN 'JUL/' + LTRIM(STR(Ano))
						WHEN 08 THEN 'AGO/' + LTRIM(STR(Ano))
						WHEN 09 THEN 'SET/' + LTRIM(STR(Ano))
						WHEN 10 THEN 'OUT/' + LTRIM(STR(Ano))
						WHEN 11 THEN 'NOV/' + LTRIM(STR(Ano))
						WHEN 12 THEN 'DEZ/' + LTRIM(STR(Ano))
					END

	INSERT @retTable
		(Ord, Ano, Mes, AnoMes, Esp_Dsc, Prf_Mtr, Prf_Nme, QtdCon, QtdSol, QtdExa, Med, Prc, Eag, Vlr)
		SELECT  2, Ano, Mes, AnoMes, NULL, NULL, 'TOTAL MÊS', SUM(QtdCon), SUM(QtdSol), SUM(QtdExa), 0, 0, 0, SUM(Vlr)
		FROM @retTable
		GROUP BY Ano, Mes, AnoMes
	
	SELECT * 
	FROM @retTable
	ORDER BY Ord, Prf_Nme, Esp_Dsc, Ano, Mes
	
	SET @Out_Tot = 
		(	SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 0
		)/
		(
			SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 1
		)
GO
/****** Object:  StoredProcedure [dbo].[srAtz_AceEsp___]    Script Date: 12/18/2012 09:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:	Rubens Jr
-- Create date: 05/06/2009
-- Description:	Pesquisa quantidade de consultas, solicitações e execuções por
--				especialidade
-- =============================================================================
CREATE PROCEDURE [dbo].[srAtz_AceEsp___]
	@DatIni SMALLDATETIME, 
	@DatFim SMALLDATETIME,
	@IdEsp INT = NULL,
	@IdCtt BIGINT = NULL,
	@Prf_Mtr VARCHAR(20) = NULL, 
	@IdSit TINYINT = NULL,
	@Sit_Ind CHAR(1) = NULL,
	@Bnf_Mtr VARCHAR(20) = NULL,
	@Gia_Crt CHAR(1) = NULL,
	@Out_Tot NUMERIC(18,2) OUTPUT
AS
	DECLARE @retTable TABLE 
		( 
			Esp_Dsc VARCHAR(80),
			QtdCon INT,
			QtdSol INT, 
			QtdExa INT,
			Med NUMERIC(18,2),
			Prc NUMERIC(18,2),
			Eag	INT,
			Vlr NUMERIC(18,2)
		) 

	DECLARE @tmpTable TABLE
		(
			Gia_Tip TINYINT,
			Gia_Crt CHAR(1),
			Gpd_DatRel SMALLDATETIME,
			Gia_IdEsp SMALLINT,
			Gia_IdCtt BIGINT,
			Gia_IdPrf INT,
			Gia_IdPrfSol INT,
			Gpd_IdSit TINYINT,
			Sit_Ind CHAR(1),
			Gia_IdBnf INT,
			Gpd_Qtd NUMERIC(18,2),
			Ngc_Vlr NUMERIC(18,2)
		)
		
	INSERT @tmpTable
		SELECT	Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				NULL, Gpd_IdSit, Sit_Ind, Gia_IdBnf, 1, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	Gia_Tip, Gia_Crt, Gpd_DatRel, Gia_IdEsp, Gia_IdCtt, Gia_IdPrf, 
				Gia_IdPrfSol, Gpd_IdSit, Sit_Ind, Gia_IdBnf, Gpd_QtdAtz, dbo.fxAtz_GetNgcVlr(Gpd_IdNgc) * Gpd_QtdAtz
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 2
		AND		Gpd_IdSit <> 10
		AND		Gpd_DatRel BETWEEN @DatIni AND @DatFim
		UNION ALL
		SELECT	0 AS Gia_Tip, Sol_Crt, Spd_Dat, Sol_IdEsp, Sol_IdCtt, Sol_IdPrfSol, 
				NULL, Spd_IdSit, Sit_Ind, Sol_IdBnf, Spd_QtdSol, 0
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
		WHERE	IdSol = Spd_IdSol
		AND		IdSit = Spd_IdSit
		AND		Spd_IdSit <> 10
		AND		Spd_Dat BETWEEN @DatIni AND @DatFim
		
	IF @IdEsp IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdEsp <> @IdEsp
	IF @IdCtt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdCtt <> @IdCtt
	IF @Prf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdPrf NOT IN
			(
				SELECT IdPrf
				FROM dbo.Atz_Prf
				WHERE Prf_Mtr = @Prf_Mtr
			 )
	IF @IdSit IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gpd_IdSit <> @IdSit
	IF @Sit_Ind IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Sit_Ind <> @Sit_Ind
	IF @Bnf_Mtr IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_IdBnf NOT IN
			(	
				SELECT	IdBnf
				FROM	dbo.Atz_Bnf
				WHERE	Bnf_Mtr = @Bnf_Mtr
			)
	IF @Gia_Crt IS NOT NULL
		DELETE	FROM @tmpTable
		WHERE	Gia_Crt <> @Gia_Crt
	
	INSERT @retTable
		(Esp_Dsc, QtdCon, QtdSol, QtdExa, Med, Prc, Eag, Vlr)
		SELECT	Esp_Dsc, 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				), 
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 2
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				),
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				)/					
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 1
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				),
				((
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				)/
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	Gia_Tip = 0
				)) * 100
				,
				(
					SELECT	SUM(Gpd_Qtd)
					FROM	@tmpTable c
					WHERE	c.Gia_IdPrf = c.Gia_IdPrfSol
					AND		c.Gia_IdEsp = t.Gia_IdEsp
				),
				SUM(Ngc_Vlr)
		FROM	@tmpTable t, dbo.Atz_Esp
		WHERE	IdEsp = t.Gia_IdEsp
		GROUP BY Gia_IdEsp, Esp_Dsc

	SELECT *
	FROM @retTable 
	ORDER BY Esp_Dsc

	SET @Out_Tot = 
		(	SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 0
		)/
		(
			SELECT	SUM(Gpd_Qtd)
			FROM	@tmpTable
			WHERE	Gia_Tip = 1
		)
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_FhaPci]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Rubens F. de Paula Jr
-- Create date: 2009.01.05
-- Description:    Pesquisa Ficha do Paciente - Beneficiário
-- Alterado em 2009.02.02: Wesley
-- =============================================

CREATE PROCEDURE [dbo].[ssAtz_FhaPci]
    @Gia_IdCtt BIGINT,
    @Gia_SeqEnd TINYINT,
	@Prf_IdUsr INT, -- O Profissional executante é selecionado pelo usuário
	@Gia_IdBnf INT = NULL,	
	@Bnf_Mtr VARCHAR(20) = NULL,
    @Bnf_Nme VARCHAR(70) = NULL
	
AS
BEGIN
	SET NOCOUNT ON;

	IF @Gia_IdBnf IS NOT NULL

		SELECT	TOP 1 IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_DatAtd,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				dbo.fxAtz_FhaPciCid(IdGia) AS Bnf_UltCid
		FROM    dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit, 
				dbo.Atz_Prf, dbo.Sgn_Usr
		WHERE	IdGia = Gpd_IdGia
		AND		IdBnf = Gia_IdBnf
		AND		IdSit = Gpd_IdSit
		AND		IdUsr = Prf_IdUsr
		AND		IdPrf = Gia_IdPrf
		AND		Gia_Tip = 1 -- Somente Guia de Consulta
		AND		Sit_Ind = 'A' -- Somente Consulta autorizada
		AND		Gia_IdCtt = @Gia_IdCtt 
		AND		Gia_SeqEnd = @Gia_SeqEnd
		AND		Prf_IdUsr = @Prf_IdUsr
		AND		Gia_IdBnf = @Gia_IdBnf
		ORDER BY IdGia DESC

	ELSE

	IF @Bnf_Mtr IS NOT NULL

		SELECT	TOP 1 IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_DatAtd,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				dbo.fxAtz_FhaPciCid(IdGia) AS Bnf_UltCid
		FROM    dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit, 
				dbo.Atz_Prf, dbo.Sgn_Usr
		WHERE	IdGia = Gpd_IdGia
		AND		IdBnf = Gia_IdBnf
		AND		IdSit = Gpd_IdSit
		AND		IdUsr = Prf_IdUsr
		AND		IdPrf = Gia_IdPrf
		AND		Gia_Tip = 1 -- Somente Guia de Consulta
		AND		Sit_Ind = 'A' -- Somente Consulta autorizada
		AND		Gia_IdCtt = @Gia_IdCtt 
		AND		Gia_SeqEnd = @Gia_SeqEnd
		AND		Prf_IdUsr = @Prf_IdUsr
		AND		Bnf_Mtr LIKE '%' + @Bnf_Mtr + '%'
		ORDER BY IdGia DESC

	ELSE
	IF @Bnf_Nme IS NOT NULL

		SELECT	TOP 1 IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Gia_DatAtd,
				DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				dbo.fxAtz_FhaPciCid(IdGia) AS Bnf_UltCid
		FROM    dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Sit,
				dbo.Atz_Prf, dbo.Sgn_Usr
		WHERE	IdGia = Gpd_IdGia
		AND		IdBnf = Gia_IdBnf
		AND		IdSit = Gpd_IdSit
		AND		IdUsr = Prf_IdUsr
		AND		IdPrf = Gia_IdPrf
		AND		Gia_Tip = 1 -- Somente Guia de Consulta
		AND		Sit_Ind = 'A' -- Somente Consulta autorizada
		AND		Gia_IdCtt = @Gia_IdCtt 
		AND		Gia_SeqEnd = @Gia_SeqEnd
		AND		Prf_IdUsr = @Prf_IdUsr
		AND		Bnf_Nme LIKE '%' +  @Bnf_Nme +  '%'
		ORDER BY IdGia DESC

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_ExeExa]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 540 BEGIN ###################################################################

-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.01.26
-- Description:	Pesquisa solicitações de procedimentos para execução
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_ExeExa]
	 @IdCtt BIGINT
	,@Lcr_SeqEnd TINYINT
	,@IdBnf INT
	-- Parâmetro utilizado para diferenciar se os procedimentos 
	-- a serem executados requerem ou não Profissional
	,@Pdm_Prf BIT -- [0-Não|1-Sim]
AS
BEGIN
	DECLARE @IdRde SMALLINT, @DatVld SMALLDATETIME
	
	-- Definindo a data de referência para o cálculo da validade
	-- com sendo a data corrente à zero hora
	SET @DatVld = dbo.fxUtl_GetDat(GETDATE()) 

	-- Selecione a rede do plano do beneficiário
	SELECT	@IdRde = Prd_IdRde
	FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
	WHERE	IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= GETDATE() AND Bnp_DatFim >= GETDATE()) )
	AND		IdBnf = @IdBnf
	
	IF (@Pdm_Prf = 0)
		-- Seleciona procedimentos que não requerem profissional para execução, 
		-- neste caso a negociação esta no Contratado
		SELECT  DISTINCT 
			IdPdm, IdSol, Pdm_Cod, Pdm_DscRsm AS Pdm_Dsc, Pdm_Prf, Spd_QtdAtz, Spd_QtdRel, Spd_IdSit,
			-- Se a consulta que originou a solicitação foi executada a menos de 24h
			-- e for de urgência a execuação do SP/SADT também será de urgência, senão será eletivo
			CASE 
				WHEN (Gia_Crt = 'U' AND DATEDIFF(HOUR,Gpd_DatRel,GETDATE()) < 24) THEN 'U'
				ELSE 'E'
			END AS Gia_Crt, Prf_Nme
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_CttEnd, dbo.Atz_Ngc, dbo.Atz_LcrEsp, 
				dbo.Atz_Lcr, dbo.Atz_Pdm, dbo.Atz_Sit, dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Prf
		WHERE	IdSol = Spd_IdSol
		AND		IdPdm = Spd_IdPdm
		AND		IdSit = Spd_IdSit
		AND		IdGia = Sol_IdGia
		AND		IdGia = Gpd_IdGia
		AND		Cte_IdCtt = Lcr_IdCtt
		AND		Cte_SeqEnd = Lcr_SeqEnd
		AND		IdLcr = Lce_IdLcr
		AND		IdLce = Ngc_IdLce
		AND		IdPdm = Ngc_IdPdm
		AND		IdPrf = Sol_IdPrfSol
		AND		Sit_Ind = 'A' -- Somente Autorizados
		AND		Spd_QtdAtz > ISNULL(Spd_QtdRel,0) -- Somente Procedimento com saldo positivo
		AND		Spd_DatVld > @DatVld -- Somente procedimentos com data válida
		AND		(Pdm_Prf IS NULL OR Pdm_Prf = 0)
		AND		Lcr_IdCtt = @IdCtt 
		AND		Cte_SeqEnd = @Lcr_SeqEnd
		AND		Lcr_IdRde = @IdRde
		AND		Sol_IdBnf = @IdBnf
	ELSE
		-- Seleciona procedimentos que requerem profissional para execução, 
		-- neste caso a negociação esta no Profissional
		SELECT  DISTINCT 
			IdPdm, IdSol, Pdm_Cod, Pdm_DscRsm AS Pdm_Dsc, Pdm_Prf, Spd_QtdAtz, Spd_QtdRel, Spd_IdSit,
			-- Se a consulta que originou a solicitação foi executada a menos de 24h
			-- e for de urgência a execuação do SP/SADT também será de urgência, senão será eletivo
			CASE 
				WHEN (Gia_Crt = 'U' AND DATEDIFF(HOUR,Gpd_DatRel,GETDATE()) < 24) THEN 'U'
				ELSE 'E'
			END AS Gia_Crt, Prf_Nme
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Ngc, dbo.Atz_PrfEspLcr, dbo.Atz_Lcr, 
				dbo.Atz_Pdm, dbo.Atz_Sit, dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Prf
		WHERE	IdSol = Spd_IdSol
		AND		IdPdm = Spd_IdPdm
		AND		IdSit = Spd_IdSit
		AND		IdGia = Sol_IdGia
		AND		IdGia = Gpd_IdGia
		AND		IdLcr = Pel_IdLcr
		AND		IdPel = Ngc_IdPel
		AND		IdPdm = Ngc_IdPdm
		AND		IdPrf = Sol_IdPrfSol
		AND		Sit_Ind = 'A' -- Somente Autorizados
		AND		Spd_QtdAtz > ISNULL(Spd_QtdRel,0) -- Somente Procedimento com saldo positivo
		AND		Spd_DatVld > @DatVld -- Somente procedimentos com data válida
		AND		Pdm_Prf = 1	
		AND		Lcr_IdCtt = @IdCtt
		AND		Lcr_SeqEnd = @Lcr_SeqEnd
		AND		Lcr_IdRde = @IdRde
		AND		Sol_IdBnf = @IdBnf
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_AudPdm]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 2009.03.01
-- Description:	Pesquisa os procedimentos da solicitação/guia para auditoria
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_AudPdm] 
	@IdSol INT,
	@Sol_Tip TINYINT
AS
BEGIN
	SET NOCOUNT ON;

	IF @Sol_Tip = 0
		SELECT	IdPdm, IdSit, Sit_Dsc, Spd_QtdSol, Spd_QtdAtz, 
				Spd_Dat, Spd_DatVld, Pdm_Cod, Pdm_QtdCh_, Pdm_Dsc, Sit_Ind
		FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Pdm, dbo.Atz_Sit
		WHERE	IdSol = Spd_IdSol
		AND		IdSit = Spd_IdSit
		AND		IdPdm = Spd_IdPdm
		AND		Spd_IdSit <> 10
		AND		IdSol = @IdSol
	ELSE
		SELECT	IdPdm, IdSit, Sit_Dsc, Gpd_QtdSol AS Spd_QtdSol, Gpd_QtdAtz AS Spd_QtdAtz, 
				Gpd_Dat AS Spd_Dat, Gpd_DatVld AS Spd_DatVld, Pdm_Cod, Pdm_QtdCh_, Pdm_Dsc, Sit_Ind
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Pdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		IdPdm = Gpd_IdPdm
		AND		Gpd_IdSit <> 10
		AND		IdGia = @IdSol
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_ItnSdt]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 07/10/2009
-- Description:	Pesquisa SP/SADT para auditoria de internação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_ItnSdt] 	
	@IdBnf INT
AS
	SELECT	Pdm_Cod, Pdm_Dsc, Gpd_DatRel, 'SP/SADT' AS Gia_Tip
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit, dbo.Atz_Pdm
	WHERE	IdGia = Gpd_IdGia
	AND		IdBnf = Gia_IdBnf
	AND		IdEsp = Gia_IdEsp
	AND		IdSit = Gpd_IdSit
	AND		IdPdm = Gpd_IdPdm
	AND		Gia_Tip = 2				-- Guia de SP/SADT
	AND		Sit_Ind = 'A'			-- Mostrar somente guias autorizadas
	AND		Gia_IdBnf = @IdBnf
	UNION ALL
	SELECT	Pdm_Cod, Pdm_Dsc, Spd_Dat, 'SOLICITACAO' AS Gia_Tip
	FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit, dbo.Atz_Pdm
	WHERE	IdSol = Spd_IdSol
	AND		IdBnf = Sol_IdBnf
	AND		IdEsp = Sol_IdEsp
	AND		IdSit = Spd_IdSit
	AND		IdPdm = Spd_IdPdm
	AND		Sit_Ind = 'A'			-- Mostrar solicitações guias autorizadas
	AND		Spd_QtdAtz > Spd_QtdRel -- Somente as que possuem saldo para execução
	AND		Sol_IdBnf = @IdBnf	
	ORDER BY 3 DESC
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_ItnCon]    Script Date: 12/18/2012 09:52:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 07/10/2009
-- Description:	Pesquisa consultas executadas para auditoria de internação
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_ItnCon] 	
	@IdBnf INT
AS
	SELECT	Gpd_DatRel, Esp_Dsc
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
	WHERE	IdGia = Gpd_IdGia
	AND		IdBnf = Gia_IdBnf
	AND		IdEsp = Gia_IdEsp
	AND		IdSit = Gpd_IdSit
	AND		Gia_Tip = 1				-- Guia de Consulta
	AND		Sit_Ind = 'A'			-- Mostrar somente guias autorizadas
	AND		Gpd_DatRel IS NOT NULL	-- Executadas
	AND		Gia_IdBnf = @IdBnf
	ORDER BY Gia_DatEms DESC
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaPdm]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.07.22
-- Description:	Pesquisa os procedimentos da guia
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_GiaPdm] 
	 @IdGia INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdPdm, Pdm_Cod, Pdm_Dsc, Pdm_DscRsm, Gpd_QtdSol, Gpd_QtdAtz, Gpd_DatCnc,
			Sit_Ind
	FROM	dbo.Atz_GiaPdm, dbo.Atz_Pdm, dbo.Atz_Sit
	WHERE	IdPdm = Gpd_IdPdm
	AND		IdSit = Gpd_IdSit
	AND		Gpd_IdGia = @IdGia

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaConExe]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.01.03
-- Description:	Pesquisa Guias de Consulta para Execução
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaConExe] 

	 @IdGia INT

AS
BEGIN
	SET NOCOUNT ON;

	SELECT	IdBnf, Bnf_Mtr, Bnf_Nme, Pdm_dsc
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, 
			dbo.Atz_Bnf, dbo.Atz_Pdm
	WHERE	IdGia = Gpd_IdGia
	AND		IdBnf = Gia_IdBnf
	AND		IdPdm = Gpd_IdPdm
	AND		IdGia = @IdGia
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaConDet]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.01.10
-- Description:	Pesquisa Guias de Consulta - Detalhe
-- =============================================================================
CREATE PROCEDURE [dbo].[ssAtz_GiaConDet] 
	 @IdGia INT,
	 @Out_SldSdt INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	Bnf_Mtr, Bnf_Nme, Prf_Nme, Esp_Dsc, Pdm_Cod, Pdm_Dsc, Gia_DatEms, Gpd_DatRel
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, 
			dbo.Atz_Esp, dbo.Atz_Prf, dbo.Atz_Pdm
	WHERE	IdGia = Gpd_IdGia
	AND		IdBnf = Gia_IdBnf
	AND		IdEsp = Gia_IdEsp
	AND		IdPdm = Gpd_IdPdm
	AND		IdPrf = Gia_IdPrf
	AND		IdGia = @IdGia
	
	-- Retorna o saldo de solicitações de procedimentos ainda não executados 
	-- para informar ao usuário no momento do cancelamento da consulta
	SELECT	@Out_SldSdt = ISNULL(SUM(Spd_QtdAtz - Spd_QtdRel),0)
	FROM	dbo.Atz_Sol, dbo.Atz_SolPdm
	WHERE	IdSol = Spd_IdSol
	AND		Spd_QtdAtz > Spd_QtdRel
	AND		Sol_IdGia = @IdGia

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaConAtd]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2008.06.11
-- Description:	Pesquisa Guias de consultas a serem atendidas
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaConAtd] 

	 @IdCtt BIGINT = NULL
	,@Cte_SeqEnd TINYINT = NULL
	,@IdPrf INT = NULL
	,@Bnf_Mtr VARCHAR(20) = NULL
	,@Bnf_Nme VARCHAR(70) = NULL
	,@Gia_DatEms SMALLDATETIME = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF (@Bnf_Mtr IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd,
				Bnf_Sxo, DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				Gia_DatAtd
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd		
		AND		Gia_IdPrf = @IdPrf
		AND		Bnf_Mtr = @Bnf_Mtr
	END
	ELSE
	IF (@Gia_DatEms IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd,
				Bnf_Sxo, DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				Gia_DatAtd
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Gia_IdPrf = @IdPrf
		AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
		AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
		AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
	END
	ELSE
	IF (@Bnf_Nme IS NOT NULL)
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, dbo.fxAtz_BnfUltAtd(IdBnf) AS Bnf_UltAtd,
				Bnf_Sxo, DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12 AS Bnf_Idd,
				Gia_DatAtd
		FROM	dbo.Atz_Gia, dbo.Atz_Bnf, dbo.Atz_GiaPdm
		WHERE	IdBnf = Gia_IdBnf
		AND		IdGia = Gpd_IdGia
		AND		Gia_Tip = 1 -- Guia de Consulta
		AND		Gpd_Sts > 0 -- Mostrar somente guias autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Gia_IdPrf = @IdPrf
		AND		Bnf_Nme LIKE '%'+ @Bnf_Nme +'%'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaCon]    Script Date: 12/18/2012 09:52:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens F. de Paula Jr
-- Create date: 2009.01.03
-- Description:	Pesquisa Guias de Consulta
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaCon] 

	 @IdCtt BIGINT
	,@Cte_SeqEnd TINYINT
	,@IdPrf INT = NULL
	,@Gia_Sit CHAR(3) -- [ATZ-Autorizadas|PEN-Pendentes|RET-Retorno|EXE-Executadas]	

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Gia_DatEms SMALLDATETIME

	SET @Gia_DatEms = GETDATE()

	IF (@Gia_Sit = 'ATZ')
	BEGIN
		IF (@IdPrf IS NULL)
			SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
					CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc, 
					Gpd_DatRel
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
			WHERE	IdGia = Gpd_IdGia
			AND		IdBnf = Gia_IdBnf
			AND		IdEsp = Gia_IdEsp
			AND		IdSit = Gpd_IdSit
			AND		Gia_Tip = 1			-- Guia de Consulta
			AND		Sit_Ind = 'A'		-- Mostrar somente guias autorizadas
			AND		Gia_DatAtd IS NULL	-- Não executadas
			AND		Gia_IdCtt = @IdCtt
			AND		Gia_SeqEnd = @Cte_SeqEnd
			AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
			AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
			AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
			ORDER BY Gia_DatEms
		ELSE
			SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
					CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc,
					Gpd_DatRel
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
			WHERE	IdGia = Gpd_IdGia
			AND		IdBnf = Gia_IdBnf
			AND		IdEsp = Gia_IdEsp
			AND		IdSit = Gpd_IdSit
			AND		Gia_Tip = 1			-- Guia de Consulta
			AND		Sit_Ind = 'A'		-- Mostrar somente guias autorizadas
			AND		Gia_DatAtd IS NULL	-- Não executadas
			AND		Gia_IdCtt = @IdCtt
			AND		Gia_SeqEnd = @Cte_SeqEnd
			AND		Gia_IdPrf = @IdPrf
			AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
			AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
			AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
			ORDER BY Gia_DatEms
	END
	ELSE
	IF (@Gia_Sit = 'PEN')
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
				CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc, 
				Gpd_DatRel
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdBnf = Gia_IdBnf
		AND		IdEsp = Gia_IdEsp
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1			-- Guia de Consulta
		AND		Sit_Ind = 'N'		-- Mostrar somente guias não autorizadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
		AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
		AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
		ORDER BY Gia_DatEms
	END
	ELSE
	IF (@Gia_Sit = 'RET')
	BEGIN
		IF (@IdPrf IS NULL)
			SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
					CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc, 
					Gpd_DatRel
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
			WHERE	IdGia = Gpd_IdGia
			AND		IdBnf = Gia_IdBnf
			AND		IdEsp = Gia_IdEsp
			AND		IdSit = Gpd_IdSit
			AND		Gia_Tip = 1				-- Guia de Consulta
			AND		Sit_Ind = 'A'			-- Mostrar somente guias autorizadas
			AND		Gia_DatAtd IS NOT NULL	-- Executadas
			AND		Gia_IdCtt = @IdCtt
			AND		Gia_SeqEnd = @Cte_SeqEnd
			AND		Gia_DatVld >= GETDATE()
			ORDER BY Bnf_Nme
		ELSE
			SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
					CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc, 
					Gpd_DatRel
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
			WHERE	IdGia = Gpd_IdGia
			AND		IdBnf = Gia_IdBnf
			AND		IdEsp = Gia_IdEsp
			AND		IdSit = Gpd_IdSit
			AND		Gia_Tip = 1				-- Guia de Consulta
			AND		Sit_Ind = 'A'			-- Mostrar somente guias autorizadas
			AND		Gia_DatAtd IS NOT NULL	-- Executadas
			AND		Gia_IdCtt = @IdCtt
			AND		Gia_SeqEnd = @Cte_SeqEnd
			AND		Gia_IdPrf = @IdPrf
			AND		Gia_DatVld >= GETDATE()
			ORDER BY Bnf_Nme
	END
	ELSE
	IF (@Gia_Sit = 'EXE')
	BEGIN
		SELECT	IdGia, IdBnf, Bnf_Mtr, Bnf_Nme, Esp_Dsc, 
				CASE Gia_Crt WHEN 'U' THEN 'CONSULTA URGENCIA' ELSE 'CONSULTA ELETIVA' END AS Gia_TipDsc, 
				Gpd_DatRel
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Bnf, dbo.Atz_Esp, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdBnf = Gia_IdBnf
		AND		IdEsp = Gia_IdEsp
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1				-- Guia de Consulta
		AND		Sit_Ind = 'A'			-- Mostrar somente guias autorizadas
		AND		Gia_DatAtd IS NOT NULL	-- Executadas
		AND		Gia_IdCtt = @IdCtt
		AND		Gia_SeqEnd = @Cte_SeqEnd
		AND		Gia_IdPrf = @IdPrf
		AND		DATEPART(YEAR,Gia_DatEms) = DATEPART(YEAR,@Gia_DatEms)
		AND		DATEPART(MONTH,Gia_DatEms) = DATEPART(MONTH,@Gia_DatEms)
		AND		DATEPART(DAY,Gia_DatEms) = DATEPART(DAY,@Gia_DatEms)
		ORDER BY Gia_DatEms DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaPdmMsg]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Rubens Jr
-- Create date: 19/11/2008
-- Description:    Pesquisa Mensagens de Negativas
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaPdmMsg]

@IdGia INT = NULL,
@IdPdm INT = NULL,
@IdGiaSdt VARCHAR(100) = NULL

AS
	IF (@IdGiaSdt IS NOT NULL)
	BEGIN
		DECLARE @SQL NVARCHAR(2000)

		SET @SQL = 'SELECT  LTRIM(STR(IdMsg)) +''-''+ Msg_DscAtz AS Msg_DscAtz,
							Msg_Dsc, Pdm_Dsc, Gpm_IdGia
					FROM    dbo.Atz_Msg, dbo.Atz_GiaPdmMsg, dbo.Atz_Pdm
					WHERE   IdMsg	= Gpm_IdMsg
					AND		IdPdm	= Gpm_IdPdm
					AND		Gpm_IdGia    IN ('+ @IdGiaSdt+')'+
				   'ORDER BY Gpm_IdGia, Pdm_Dsc'

		EXEC SP_EXECUTESQL @SQL
	END
	ELSE
    IF (@IdPdm IS NOT NULL)
        -- Mensagens de Negativa por Guia e Procedimento
        SELECT    LTRIM(STR(IdMsg)) +'-'+ Msg_DscAtz AS Msg_DscAtz,
                Msg_Dsc
        FROM    dbo.Atz_Msg, dbo.Atz_GiaPdmMsg
        WHERE    IdMsg        = Gpm_IdMsg
        AND        Gpm_IdGia    = @IdGia
        AND        Gpm_IdPdm    = @IdPdm
        ORDER BY 1
    ELSE
        -- Mensagens de negativa por Guia
        SELECT  LTRIM(STR(IdMsg)) +'-'+ Msg_DscAtz AS Msg_DscAtz,
                Msg_Dsc, Pdm_Dsc, Gpm_IdGia
        FROM    dbo.Atz_Msg, dbo.Atz_GiaPdmMsg, dbo.Atz_Pdm
        WHERE   IdMsg	= Gpm_IdMsg
		AND		IdPdm	= Gpm_IdPdm
        AND		Gpm_IdGia    = @IdGia
        ORDER BY Gpm_IdGia, Pdm_Dsc
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_GiaPdmAud]    Script Date: 12/18/2012 09:52:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Rubens Jr
-- Create date	: 01/03/2009
-- Description	: Pesquisa Log de Auditoria - Solicitações e Guias
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_GiaPdmAud]

@IdSol INT,
@IdPdm INT,
@Sol_Tip INT

AS 
    IF (@Sol_Tip = 0)
		SELECT	IdSit, Sit_Dsc, Usr_Nme, Spa_Dat, Spa_Jst
        FROM    dbo.Atz_Sit, dbo.Atz_SolPdmAud, dbo.Sgn_Usr
        WHERE   IdSit		= Spa_IdSit
		AND		IdUsr		=* Spa_IdUsr
        AND     Spa_IdSol   = @IdSol
        AND     Spa_IdPdm   = @IdPdm
        ORDER BY IdSpa
	ELSE        
        SELECT	IdSit, Sit_Dsc, Usr_Nme, Gpa_Dat AS Spa_Dat, Gpa_Jst AS Spa_Jst
        FROM    dbo.Atz_Sit, dbo.Atz_GiaPdmAud, dbo.Sgn_Usr
        WHERE   IdSit		= Gpa_IdSit
		AND		IdUsr		=* Gpa_IdUsr
        AND     Gpa_IdGia   = @IdSol
        AND     Gpa_IdPdm   = @IdPdm
        ORDER BY IdGpa
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_AudPdmMsg]    Script Date: 12/18/2012 09:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Rubens Jr
-- Create date	: 01/03/2009
-- Description	: Pesquisa Mensagens de Negativas - Solicitações e Guias
-- =============================================
CREATE PROCEDURE [dbo].[ssAtz_AudPdmMsg]

@IdSol INT,
@IdPdm INT,
@Sol_Tip INT

AS
    IF (@Sol_Tip = 0)
		SELECT	IdMsg, Msg_Dsc
        FROM    dbo.Atz_Msg, dbo.Atz_SolPdmMsg
        WHERE   IdMsg		= Spm_IdMsg
        AND     Spm_IdSol   = @IdSol
        AND     Spm_IdPdm   = @IdPdm
        ORDER BY Msg_Dsc
	ELSE        
        SELECT	IdMsg, Msg_Dsc
        FROM    dbo.Atz_Msg, dbo.Atz_GiaPdmMsg
        WHERE   IdMsg		= Gpm_IdMsg
        AND     Gpm_IdGia   = @IdSol
        AND     Gpm_IdPdm   = @IdPdm
        ORDER BY Msg_Dsc
GO
/****** Object:  StoredProcedure [dbo].[smAtz_ConUrgSmn]    Script Date: 12/18/2012 09:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[smAtz_ConUrgSmn]ASBEGIN	DECLARE @email_recipients NVARCHAR(MAX)	DECLARE @tableHTML NVARCHAR(MAX), @email_subject VARCHAR(1000), @sql NVARCHAR(MAX)	DECLARE @RowsToProcess INT	DECLARE @CurrentRow INT	DECLARE @cl_nome VARCHAR(100), @tr_descricao VARCHAR(50)	-- SELECIONANDO OS GRUPOS PARA ENVIO DE EMAIL	SELECT @email_recipients = COALESCE(@email_recipients + loweredemail, loweredemail)+ ';'
	FROM dbo.Eml_GrpUsr, dbo.Sgn_Usr, dbo.aspnet_membership
	WHERE IdUsr = Gpu_IdUsr
	AND Usr_UserId = UserId
	AND Gpu_IdGrp = 1		--PRINT @email_recipients		-- SÓ ENVIA EMAIL PARA OS FLUXOS QUE POSSUEM GRUPOS CADASTRADOS	IF @email_recipients IS NOT NULL	BEGIN		SET @tableHTML =					N'<h1>TotalTISS - Alerta consultas urgência semanal</h1>' +					N'<table border="1">' +					N'<tbody>' +					N'<tr><th>Matrícula</th><th>Beneficiario</th><th>Quantidade</th>' +					N'</tr>' +						CAST ( ( SELECT td = Bnf_Mtr, '',											td = Bnf_Nme, '',											td = Qtd, ''								 FROM dbo.vwAtz_ConUrgSmn								 ORDER BY Qtd DESC, Bnf_Nme							FOR XML PATH('tr'), TYPE 							) AS NVARCHAR(MAX) ) +							N'</tbody></table>';							--PRINT @tableHTML						SET @email_subject = '[TotalTISS] Alerta consultas urgência semanal'				SET @email_recipients = @email_recipients + 'rubensdepaulajr@gmail.com;'						SET @sql =  			'SELECT Bnf_Mtr +'',''+ Bnf_Nme +'',''+ LTRIM(STR(Qtd)) AS [matricula,nome,qtd] '+			'FROM TotalTISS.dbo.vwAtz_ConUrgSmn '+			'ORDER BY Qtd DESC, Bnf_Nme ';
		EXEC msdb.dbo.SP_SEND_DBMAIL 			@recipients = @email_recipients,			@subject = @email_subject,			@profile_name = 'SQLAlerts',			@body = @tableHTML,							@query = @sql,
	@attach_query_result_as_file = 1,	@query_attachment_filename = 'Consulta.txt',									@body_format = 'HTML';	END -- IF @EMAIL_RECIPIENTS IS NOT NULL ...END
GO
/****** Object:  StoredProcedure [dbo].[smAtz_ConUrgMes]    Script Date: 12/18/2012 09:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[smAtz_ConUrgMes]ASBEGIN	DECLARE @email_recipients NVARCHAR(MAX)		DECLARE @tableHTML NVARCHAR(MAX), @email_subject VARCHAR(1000), @sql NVARCHAR(MAX)	DECLARE @RowsToProcess INT	DECLARE @CurrentRow INT	DECLARE @cl_nome VARCHAR(100), @tr_descricao VARCHAR(50)	-- SELECIONANDO OS GRUPOS PARA ENVIO DE EMAIL	SELECT @email_recipients = COALESCE(@email_recipients + loweredemail, loweredemail)+ ';'
	FROM dbo.Eml_GrpUsr, dbo.Sgn_Usr, dbo.aspnet_membership
	WHERE IdUsr = Gpu_IdUsr
	AND Usr_UserId = UserId
	AND Gpu_IdGrp = 2		SET @sql =  			'SELECT Bnf_Mtr +'',''+ Bnf_Nme +'',''+ LTRIM(STR(Qtd)) AS [matricula,nome,qtd] '+			'FROM TotalTISS.dbo.vwAtz_ConUrgMes '+			'ORDER BY Qtd DESC, Bnf_Nme ';		-- SÓ ENVIA EMAIL PARA OS FLUXOS QUE POSSUEM GRUPOS CADASTRADOS	IF @email_recipients IS NOT NULL	BEGIN		SET @tableHTML =					N'<h1>TotalTISS - Alerta consultas urgência mensal</h1>' +					N'<table border="1">' +					N'<tbody>' +					N'<tr><th>Matrícula</th><th>Beneficiario</th><th>Quantidade</th>' +					N'</tr>' +						CAST ( ( SELECT td = Bnf_Mtr, '',											td = Bnf_Nme, '',											td = Qtd, ''								 FROM dbo.vwAtz_ConUrgMes								 ORDER BY Qtd DESC, Bnf_Nme							FOR XML PATH('tr'), TYPE 							) AS NVARCHAR(MAX) ) +							N'</tbody></table>';							--PRINT @tableHTML						SET @email_subject = '[TotalTISS] Alerta consultas urgência mensal'				SET @email_recipients = @email_recipients + ' rubensdepaulajr@gmail.com;'				EXEC msdb.dbo.SP_SEND_DBMAIL 			@recipients = @email_recipients,			@subject = @email_subject,			@profile_name = 'SQLAlerts',			@body = @tableHTML,						@query = @sql,
			@attach_query_result_as_file = 1,			@query_attachment_filename = 'Consulta.txt',						@body_format = 'HTML';	END -- IF @EMAIL_RECIPIENTS IS NOT NULL ...END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_Aud]    Script Date: 12/18/2012 09:52:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 551 END #####################################################################

-- 552 BEGIN ###################################################################

-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 05/09/2008
-- Description:	Auditoria, alterando a situação do procedimento
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_Aud]
	@IdSol  INT, -- Código da solicitação ou guia que esta sendo auditada 
	@Sol_Tip TINYINT, -- [0-Silicitação SP/SADT|1-Guia de Consulta|2-Guia de SP/SADT]
	@Spd_DatVld SMALLDATETIME = NULL,
	@Sol_QtdAtz TINYINT = NULL,
	@Spd_IdSit TINYINT,
	@Spa_Jst VARCHAR(200),
	@IdPdm  INT,
	@IdNovPdm INT = NULL, -- Código do procedimento que irá substituir o procedimento solicitado
	@IdUsr INT,
	@IdNgc INT,
	@Out_Sts TINYINT OUTPUT 
	-- @Out_Sts
	-- Indica o resultado da execução 
	-- 0-Operação realizada
	-- 1-Procedimento solicitado para troca já esta na solicitação
	-- 2-Solicitação de procedimento já executada
	-- 3-Não é permitido prorrogar validade de SP/SADT 
	-- 4-Não é permitido prorrogar a validade de SP/SADT para procedimento sem saldo para execução
	-- 5-Não é permitido alterar o procedimento com validade vencida
	-- 6-Erro na validação da sp que verifica a negociação do profissional
	-- 7-Profissional não possui negociação para realizar a consulta
	-- 8-Não existe saldo na solicitação para autorizar a execução de SP/SADT
AS
	
	-- Tratamento para solicitação de SP/SADT
	IF (@Sol_Tip = 0)
	BEGIN
		-- Se não for prorrogação, é verificado se a data de validade não esta vencida,
		-- pois se estiver a situação do procedimento não pode ser alterada
		IF (@Spd_IdSit NOT IN (3,5)) AND EXISTS 
			(
				SELECT	* 
				FROM	dbo.Atz_SolPdm 
				WHERE	Spd_DatVld < GETDATE()
				AND		Spd_IdSol = @IdSol
				AND		Spd_IdPdm = @IdPdm
			)
		BEGIN
			SET @Out_Sts = 5
		END
		ELSE
		-- Tratamento para não permitir prorrogar a validade de solicitação
		-- que já foi executada e que não possui saldo para execução, quando o
		-- procedimento foi negado (IdSit = 0) esta verificação não e efetuada
		IF (@Spd_IdSit = 5) AND NOT EXISTS
				(	
					SELECT	* 
					FROM	dbo.Atz_SolPdm 
					WHERE	(Spd_QtdAtz > Spd_QtdRel OR Spd_IdSit = 0)
					AND		Spd_IdSol = @IdSol
					AND		Spd_IdPdm = @IdPdm
				)
		BEGIN
			SET @Out_Sts = 4
		END
		ELSE
		-- Trocando o procedimento solicitado
		IF (@Spd_IdSit = 7)
		BEGIN
			-- Só é permitido trocar o procedimento solicitado por um procedimento
			-- que não esteja na relação dos procedimentos já solicitados
			IF EXISTS
				(
					SELECT	* 
					FROM	dbo.Atz_SolPdm 
					WHERE	Spd_IdSol = @IdSol
					AND		Spd_IdPdm = @IdNovPdm
				)
				SET @Out_Sts = 1
			ELSE
			-- Não é permitido trocar o procedimento se o procedimento a ser trocado já foi executado alguma vez
			IF EXISTS
				(
					SELECT	* 
					FROM	dbo.Atz_SolPdm 
					WHERE	Spd_QtdRel > 0
					AND		Spd_IdSol = @IdSol
					AND		Spd_IdPdm = @IdPdm
				)
				SET @Out_Sts = 2
			ELSE			
			BEGIN
				-- Cancelando o procedimento que foi substituido
				UPDATE	dbo.Atz_SolPdm
				SET		Spd_IdSit = 8
				WHERE	Spd_IdSol = @IdSol
				AND		Spd_IdPdm = @IdPdm
				
				-- Inserindo o novo procedimento
				INSERT	dbo.Atz_SolPdm
					(Spd_IdSol,Spd_IdPdm, Spd_IdSit, Spd_QtdSol, Spd_QtdAtz, Spd_QtdRel, Spd_Dat, Spd_DatVld)
					SELECT	@IdSol, @IdNovPdm, @Spd_IdSit, Spd_QtdSol, @Sol_QtdAtz, 0, Spd_Dat, Spd_DatVld
					FROM	dbo.Atz_SolPdm
					WHERE	Spd_IdSol = @IdSol
					AND		Spd_IdPdm = @IdPdm
					
				-- Inserindo o log para o procedimento que foi cancelado na troca
				INSERT dbo.Atz_SolPdmAud
					(Spa_IdSol, Spa_IdPdm, Spa_IdSit, Spa_IdUsr, Spa_Dat, Spa_Jst)
				VALUES
					(@IdSol, @IdPdm, 8, @IdUsr, GETDATE(), UPPER(@Spa_Jst))
					
				-- Inserindo o log para o procedimento que foi inserido na troca
				INSERT dbo.Atz_SolPdmAud
					(Spa_IdSol, Spa_IdPdm, Spa_IdSit, Spa_IdUsr, Spa_Dat, Spa_Jst)
				VALUES
					(@IdSol, @IdNovPdm, 7, @IdUsr, GETDATE(), UPPER(@Spa_Jst))
					
				SET @Out_Sts = 0
			END
		END
		ELSE
		BEGIN
			-- Prorrogando a data de validade
			IF (@Spd_IdSit = 5)
			BEGIN			
				UPDATE	dbo.Atz_SolPdm 
				-- Se o procedimento foi negado, a quantidade autorizada também deve ser autalizada
				SET		Spd_QtdAtz = CASE Spd_IdSit WHEN 0 THEN @Sol_QtdAtz ELSE Spd_QtdAtz END,
						Spd_IdSit = @Spd_IdSit,
						Spd_DatVld = @Spd_DatVld
				WHERE	Spd_IdSol = @IdSol
				AND		Spd_IdPdm = @IdPdm
			END
			ELSE
				-- Autorizando/cancelando o procedimento
				UPDATE	dbo.Atz_SolPdm 
				SET		Spd_IdSit = @Spd_IdSit,
						Spd_QtdAtz = @Sol_QtdAtz
				WHERE	Spd_IdSol = @IdSol
				AND		Spd_IdPdm = @IdPdm

			-- Inserindo o log da mudança do status do procedimento
			INSERT dbo.Atz_SolPdmAud
				(Spa_IdSol, Spa_IdPdm, Spa_IdSit, Spa_IdUsr, Spa_Dat, Spa_Jst)
			VALUES
				(@IdSol, @IdPdm, @Spd_IdSit, @IdUsr, GETDATE(), UPPER(@Spa_Jst))
				
			SET @Out_Sts = 0				
		END
	END
	-- Tratamento para consulta e execução de SP/SADT
	ELSE	
	BEGIN
		-- Na autorização de SP/SADT deve ser verificado se ainda existe
		-- saldo na solicitação para a execução
		IF (@Sol_Tip = 2) AND (@Spd_IdSit = 3) 
		BEGIN
			DECLARE @SolSld INT	
			-- Pode existir mais de uma solicitação por procedimento por isto
			-- devem ser somados todos em busca do saldo para execução
			SELECT	@SolSld = SUM(CONVERT(INT,Spd_QtdAtz) - Spd_QtdRel) - @Sol_QtdAtz
			FROM	dbo.Atz_SolPdm, dbo.Atz_Sol, dbo.Atz_Gia
			WHERE	IdSol = Spd_IdSol				
			AND		Gia_IdGiaPrc = Sol_IdGia
			AND		IdGia = @IdSol
			AND		Spd_IdPdm = @IdPdm
			--AND		CONVERT(INT,Spd_QtdAtz) - Spd_QtdRel - @Sol_QtdAtz < 0
			IF (@SolSld < 0)
			BEGIN
				SET @Out_Sts = 8
				RETURN
			END
		END
		
		-- Se não for prorrogação, é verificado se a data de validade não esta vencida,
		-- pois se estiver a situação do procedimento não pode ser alterada
		IF (@Spd_IdSit NOT IN (3,5)) AND EXISTS 
			(
				SELECT	* 
				FROM	dbo.Atz_GiaPdm 
				WHERE	Gpd_DatVld < GETDATE()
				AND		Gpd_IdGia = @IdSol
				AND		Gpd_IdPdm = @IdPdm
			)
		BEGIN
			SET @Out_Sts = 5
		END
		ELSE
		-- Para guia de SP/SADT não é permitido trocar a data de validade
		IF (@Spd_IdSit = 5) AND (@Sol_Tip = 2)
			SET @Out_Sts = 3
		ELSE
		BEGIN		
			IF (@Spd_IdSit = 3) AND (@Sol_Tip = 1) 
			BEGIN
				DECLARE @IdCtt BIGINT, @Cte_SeqEnd TINYINT, @IdPrf INT, @IdEsp INT,	@IdRde SMALLINT, 
					@Gia_DatEms SMALLDATETIME , @IdPel INT, @Gia_Crt CHAR(1), 
					@Out_IdNgc INT, @Out_Atz BIT, @Out_IdMsg INT, @return_value INT
			
				SELECT @IdCtt = Gia_IdCtt, @Cte_SeqEnd = Gia_SeqEnd, @Gia_Crt = Gia_Crt,
					@IdPrf = Gia_IdPrf, @IdEsp = Gia_IdEsp, @IdPdm = Gpd_IdPdm, 
					@IdRde = dbo.fxAtz_PrdRde(Gia_IdBnf,GETDATE()), @Gia_DatEms = Gia_DatEms
				FROM dbo.Atz_Gia, dbo.Atz_GiaPdm 
				WHERE IdGia = Gpd_IdGia 
				AND IdGia = @IdSol		
			
				-- Validando as regras de profissional
				EXEC	@return_value = [dbo].[ssAtz_VldPrf]
						@IdCtt = @IdCtt,
						@Cte_SeqEnd = @Cte_SeqEnd,
						@IdPrf = @IdPrf,
						@IdEsp = @IdEsp,
						@IdPdm = @IdPdm,
						@IdRde = @IdRde,
						@Gia_DatEms = @Gia_DatEms,
						@Ngc_Crt = @Gia_Crt,
						@Out_IdPel = @IdPel OUTPUT,
						@Out_IdNgc = @Out_IdNgc OUTPUT,
						@Out_Atz = @Out_Atz OUTPUT,
						@Out_IdMsg = @Out_IdMsg OUTPUT
				
				IF (@return_value <> 0)
				BEGIN
					SET @Out_Sts = 6
					RETURN
				END
				ELSE 
				IF (@Out_Atz = 0)
				BEGIN
					SET @Out_Sts = 7
					RETURN
				END			
			END			
			
			-- Prorrogando a data de validade
			IF (@Spd_IdSit = 5)
			BEGIN
				UPDATE	dbo.Atz_GiaPdm 
				SET		Gpd_IdSit = @Spd_IdSit,
						Gpd_DatVld = @Spd_DatVld
				WHERE	Gpd_IdGia = @IdSol
				AND		Gpd_IdPdm = @IdPdm				
			END
			ELSE
			-- O procedimento deve ser executado ao autorizá-lo via auditoria
			-- quando for SP/SADT
			IF (@Sol_Tip = 2) AND (@Spd_IdSit = 3)
			BEGIN
				-- Atualizando a quantidade executada de procedimentos solicitados
				UPDATE	dbo.Atz_SolPdm
				SET		Spd_QtdRel = ISNULL(Spd_QtdRel,0) + @Sol_QtdAtz
				FROM	dbo.Atz_SolPdm, dbo.Atz_Sol, dbo.Atz_Gia
				WHERE	IdSol = Spd_IdSol				
				AND		Gia_IdGiaPrc = Sol_IdGia
				AND		Spd_QtdRel < Spd_QtdAtz
				AND		IdGia = @IdSol
				AND		Spd_IdPdm = @IdPdm
			
				-- Autorizando o procedimento
				UPDATE	dbo.Atz_GiaPdm 
				SET		Gpd_IdSit = @Spd_IdSit,
						Gpd_QtdAtz = @Sol_QtdAtz,
						Gpd_DatRel = GETDATE(),
						Gpd_IdNgc = @IdNgc
				WHERE	Gpd_IdGia = @IdSol
				AND		Gpd_IdPdm = @IdPdm			
			END
			ELSE
				-- Autorizando/cancelando o procedimento
				UPDATE	dbo.Atz_GiaPdm 
				SET		Gpd_IdSit = @Spd_IdSit,
						Gpd_QtdAtz = @Sol_QtdAtz
				WHERE	Gpd_IdGia = @IdSol
				AND		Gpd_IdPdm = @IdPdm

			-- Inserindo o log da mudança do status do procedimento
			INSERT dbo.Atz_GiaPdmAud
				(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, gpa_IdUsr, Gpa_Dat, Gpa_Jst)
			VALUES
				(@IdSol, @IdPdm, @Spd_IdSit, @IdUsr, GETDATE(), UPPER(@Spa_Jst))
				
			SET @Out_Sts = 0
			
		END
	END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldSol]    Script Date: 12/18/2012 09:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldSol]
	@IdCtt BIGINT,					-- Código do contratado
	@Cte_SeqEnd TINYINT,			-- Sequência de endereço do contratado
	@IdBnf BIGINT,					-- Matrícula do beneficiário
	@IdPdm INT,						-- Código do procedimento
	@Gpd_QtdSol TINYINT,			-- Quantidade solicitada
	@Sol_DatEms SMALLDATETIME,		-- Data de emisão da solicitação de SP/SADT
	@IdGia INT,						-- Código da guia de consulta que originará a solicitação
	@Prf_BioVld BIT,				-- Indica se o profissional foi validado via biometria [0-Não|1-Sim]	

	@Out_Err BIT OUTPUT,			-- Indica que houve erro na execução da sp [0-não|1-sim]
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdMsg VARCHAR(200) OUTPUT,	-- Código da mensagem com o motivo da negativa
	@Out_Msg VARCHAR(160) OUTPUT	-- Mensagem com o motivo da negativa
AS
BEGIN
	DECLARE	@return_value INT, @Bnf_Sxo CHAR(1), @Bnf_Idd TINYINT, @IdRde SMALLINT, 
			@Gia_Crt CHAR(1), @Gpd_DatRel SMALLDATETIME
	

	SET @Out_IdMsg = ''
	SET @Out_Err = 0
	SET @Out_Atz = 1
	
	IF (@Prf_BioVld = 0)
	BEGIN
		SET @Out_IdMsg = '1211,' -- ASSINATURA / CARIMBO DO CREDENCIADO INEXISTENTE
		SET @Out_Atz = 0
	END
	
	-- Selecionando o caráter da solicitação (Eletiva ou Urgência)
	-- da guia de consulta que originará a solicitação
	SELECT	@Gia_Crt = Gia_Crt, @Gpd_DatRel = Gpd_DatRel
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm
	WHERE	IdGia = Gpd_IdGia
	AND		IdGia = @IdGia

	-- As solicitações de urgência são válidas somente nas primeiras
	-- 24h após a solicitação de consulta, após este prazo os procedimento
	-- são considerados eletivos mesmo a consulta originária sendo de urgência
	IF ((@Gia_Crt = 'U') AND (DATEDIFF(HOUR,@Gpd_DatRel,@Sol_DatEms) > 24))
		SET @Gia_Crt = 'E'

	IF EXISTS
		(
			-- Verificando se existe solicitação em aberto
			SELECT *
			FROM	dbo.Atz_Sol, dbo.Atz_SolPdm, dbo.Atz_Sit
			WHERE	IdSol = Spd_IdSol
			AND		IdSit = Spd_IdSit
			AND		Sol_DatVld > @Sol_DatEms
			AND		Spd_QtdAtz > Spd_QtdRel
			AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
			AND		Sol_IdCtt = @IdCtt
			AND		Sol_SeqEnd = @Cte_SeqEnd
			AND		Sol_IdBnf = @IdBnf
			AND		Spd_IdPdm = @IdPdm
		)
	BEGIN
		SET @Out_IdMsg = '1419,' -- SERVIÇO SOLICITADO JÁ AUTORIZADO
		SET @Out_Atz = 0
	END

	-- Validando as regras de beneficiário
	EXEC	@return_value = [dbo].[ssAtz_VldBnf]
			@IdBnf = @IdBnf,
			@IdPdm = @IdPdm,
			@Gia_DatEms = @Sol_DatEms,
			@Gia_Crt = @Gia_Crt,
			@Out_Atz = @Out_Atz OUTPUT,
			@Out_IdMsg = @Out_IdMsg OUTPUT,
			@Out_BnfIdd = @Bnf_Idd OUTPUT,
			@Out_BnfSxo = @Bnf_Sxo OUTPUT,
			@Out_IdRde = @IdRde OUTPUT
	
	IF (@return_value <> 0)
	BEGIN
		SET @Out_Msg = 'Erro na validação da solictição de SP/SADT. Tente novamente mais tarde.[ssAtz_VldBnf]'
		GOTO ERRO
	END

	-- Validando de procedimento
	EXEC	@return_value = [dbo].[ssAtz_VldPdm]
			@IdBnf = @IdBnf,
			@IdPdm = @IdPdm,
			@IdPrf = NULL,
			@IdEsp = NULL,
			@Bnf_Sxo = @Bnf_Sxo,
			@Bnf_Idd = @Bnf_Idd,
			@Pdm_Qtd = @Gpd_QtdSol,
			@Gia_DatEms = @Sol_DatEms,
			@Gia_Crt = @Gia_Crt,
			@Gia_Tip = 0,
			@Out_Atz = @Out_Atz OUTPUT,
			@Out_IdMsg = @Out_IdMsg OUTPUT
	
	IF (@return_value <> 0)
	BEGIN
		SET @Out_Msg = 'Erro na validação da solicitação de SP/SADT. Tente novamente mais tarde.[ssAtz_VldPdm]'
		GOTO ERRO
	END

	IF (@Out_IdMsg <> '')
		SET @Out_IdMsg = SUBSTRING(@Out_IdMsg,1,LEN(@Out_IdMsg) -1)
	RETURN 


	ERRO:
		SET @Out_Err = 1
		SET @Out_Atz = 0
		RETURN	
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldCon]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldCon]
	@IdCtt BIGINT,					-- Matrícula do Contratado
	@Cte_SeqEnd TINYINT,			-- Sequência de Endereço do Contratado
	@IdBnf BIGINT,					-- Matrícula do beneficiário
	@IdPdm INT,						-- Código do procedimento(Consulta)
	@IdPrf INT,						-- Código do profissional executante/especialidade/local rede
	@IdEsp SMALLINT,				-- Código da Especialidade
	@Gia_DatEms SMALLDATETIME,		-- Data de emisão da guia
	@Gia_Crt CHAR(10),				-- Caráter da solicitação [E-Eletiva|U-Urgência]
	@Bnf_BioVld BIT,				-- Indica se o beneficiário foi validado via biometria [0-Não|1-Sim]
	
	@Out_IdNgc INT OUTPUT,  		-- Código da negociação que resultou na autorização
	@Out_Err BIT OUTPUT,			-- Indica que houve erro na execução da sp [0-não|1-sim]
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdMsg VARCHAR(200) OUTPUT,	-- Códigos das mensagens com os motivos das negativas
	@Out_Msg VARCHAR(160) OUTPUT	-- Mensagem com o motivo da negativa
AS
BEGIN
	DECLARE	@return_value INT, @Bnf_Sxo CHAR(1), @Bnf_Idd INT, @IdPel INT, @IdRde SMALLINT 

	SET @Out_IdMsg = ''
	SET @Out_Err = 0
	SET @Out_Atz = 1
	
	IF (@Bnf_BioVld = 0)
	BEGIN
		SET @Out_IdMsg = '1011,' -- IDENTIFICAÇÃO DO BENEFICIÁRIO NÃO CONSISTENTE
		SET @Out_Atz = 0
	END

	IF EXISTS
		(
			-- Verificando se existe solicitação de consulta em aberto
			SELECT *
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
			WHERE	IdGia = Gpd_IdGia	
			AND		IdSit = Gpd_IdSit
			AND		Gia_Tip = 1 -- Consulta
			AND		Sit_Ind = 'A' -- Retirando da seleção guias canceladas
			AND		Gia_DatAtd IS NULL
			AND		Gia_IdCtt = @IdCtt
			AND		Gia_SeqEnd = @Cte_SeqEnd
			AND		Gia_IdPrf = @IdPrf
			AND		Gia_IdBnf = @IdBnf
		)
	BEGIN
		SET @Out_IdMsg = @Out_IdMsg + '63,' -- EXISTE PRE-AUTORIZACAO EM ABERTO
		SET @Out_Atz = 0
	END

	-- Validando as regras de beneficiário
	EXEC	@return_value = [dbo].[ssAtz_VldBnf]
			@IdBnf = @IdBnf,
			@IdPdm = @IdPdm,
			@Gia_DatEms = @Gia_DatEms,
			@Gia_Crt = @Gia_Crt,
			@Out_Atz = @Out_Atz OUTPUT,
			@Out_IdMsg = @Out_IdMsg OUTPUT,
			@Out_BnfIdd = @Bnf_Idd OUTPUT,
			@Out_BnfSxo = @Bnf_Sxo OUTPUT,
			@Out_IdRde = @IdRde OUTPUT
	
	IF (@return_value <> 0)
	BEGIN
		SET @Out_Msg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldBnf]'
		GOTO FIM_ERRO
	END

	-- Validando as regras de profissional
	EXEC	@return_value = [dbo].[ssAtz_VldPrf]
			@IdCtt = @IdCtt,
			@Cte_SeqEnd = @Cte_SeqEnd,
			@IdPrf = @IdPrf,
			@IdEsp = @IdEsp,
			@IdPdm = @IdPdm,
			@IdRde = @IdRde,
			@Gia_DatEms = @Gia_DatEms,
			@Ngc_Crt = @Gia_Crt,
			@Out_IdPel = @IdPel OUTPUT,
			@Out_IdNgc = @Out_IdNgc OUTPUT,
			@Out_Atz = @Out_Atz OUTPUT,
			@Out_IdMsg = @Out_IdMsg OUTPUT
	
	IF (@return_value <> 0)
	BEGIN
		SET @Out_Msg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldPrf]'
		GOTO FIM_ERRO
	END

	-- Validando de procedimento
	EXEC	@return_value = [dbo].[ssAtz_VldPdm]
			@IdBnf = @IdBnf,
			@IdPdm = @IdPdm,
			@IdPrf = @IdPrf,
			@IdEsp = @IdEsp,
			@IdCtt = @IdCtt,
			@SeqEnd = @Cte_SeqEnd,
			@Bnf_Sxo = @Bnf_Sxo,
			@Bnf_Idd = @Bnf_Idd,
			@Pdm_Qtd = 1,
			@Gia_Tip = 1,
			@Gia_DatEms = @Gia_DatEms,
			@Gia_Crt = @Gia_Crt,
			@Out_Atz = @Out_Atz OUTPUT,
			@Out_IdMsg = @Out_IdMsg OUTPUT
	
	IF (@return_value <> 0)
	BEGIN
		SET @Out_Msg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldPdm]'
		GOTO FIM_ERRO
	END

	IF (@Out_IdMsg <> '')
		SET @Out_IdMsg = SUBSTRING(@Out_IdMsg,1,LEN(@Out_IdMsg) -1)

	RETURN 

	FIM_ERRO:
		SET @Out_Err = 1
		SET @Out_Atz = 0
		RETURN	
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldExa]    Script Date: 12/18/2012 09:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ssAtz_VldExa]
	@IdBnf BIGINT,					-- Matrícula do beneficiário
	@IdPdm INT,						-- Código do procedimento
	@Gpd_QtdSol TINYINT,			-- Quantidade solicitada
	@Sol_DatEms SMALLDATETIME,		-- Data de emisão da solicitação de SP/SADT
	@Spd_IdSit TINYINT = 1,			-- Indica quando o procedimento foi autorizado pela auditoria (3)
	
	@IdCtt INT,						-- Código do Contratado
	@Cte_SeqEnd TINYINT,			-- Sequência de endereço do Contratado
	@IdEsp SMALLINT,				-- Código da Especialidade

	@IdPrf INT = NULL,				-- Código do Procedimento
	@Gia_Crt CHAR(1),				-- Caráter da Solicitação [E-Eletiva|U-Urgência]
	
	@Bnf_BioVld BIT,				-- Indica se o beneficiário foi validado via biometria [0-Não|1-Sim]

	@Out_Err BIT OUTPUT,			-- Indica que houve erro na execução da sp [0-não|1-sim]
	@Out_Atz BIT OUTPUT,			-- [0-não autorizado|1-autorizado]
	@Out_IdMsg VARCHAR(200) OUTPUT,	-- Códigos das mensagens com os motivos das negativas
	@Out_IdNgc INT OUTPUT,			-- Código da negociação que resultou na autorização
	@Out_Msg VARCHAR(100) OUTPUT	-- Mensagem de erro
AS
BEGIN
	DECLARE	@return_value INT, @Bnf_Sxo CHAR(1), @Bnf_Idd TINYINT, @IdRde SMALLINT, @Pdm_Prf BIT, @IdPel INT

	SET @Out_IdMsg = ''
	SET @Out_Err = 0
	SET @Out_Atz = 1
	
	IF (@Bnf_BioVld = 0)
	BEGIN
		SET @Out_IdMsg = '1011,' -- IDENTIFICAÇÃO DO BENEFICIÁRIO NÃO CONSISTENTE
		SET @Out_Atz = 0
	END

	SELECT	@Bnf_Sxo = Bnf_Sxo, 
			@Bnf_Idd = DATEDIFF(MONTH,Bnf_DatNas,GETDATE())/12,	@IdRde = Prd_IdRde
	FROM	dbo.Atz_Bnf, dbo.Atz_BnfPrd, dbo.Atz_Prd
	WHERE	IdBnf = Bnp_IdBnf
	AND		IdPrd = Bnp_IdPrd
	AND		((Bnp_DatFim IS NULL ) OR (Bnp_DatIni <= @Sol_DatEms AND Bnp_DatFim >= @Sol_DatEms) )
	AND		IdBnf = @IdBnf

	-- Verifica se o procedimento exige profissional para execução
	SELECT	@Pdm_Prf = Pdm_Prf
	FROM	dbo.Atz_Pdm
	WHERE	IdPdm = @IdPdm

	IF	(@Pdm_Prf = 1)
	BEGIN
		-- Validando as regras de profissional
		EXEC	@return_value = [dbo].[ssAtz_VldPrf]
				@IdCtt = @IdCtt,
				@Cte_SeqEnd = @Cte_SeqEnd,
				@IdPrf = @IdPrf,
				@IdEsp = @IdEsp,
				@IdPdm = @IdPdm,
				@IdRde = @IdRde,
				@Gia_DatEms = @Sol_DatEms,
				@Ngc_Crt = @Gia_Crt,
				@Out_IdPel = @IdPel OUTPUT,
				@Out_IdNgc = @Out_IdNgc OUTPUT,
				@Out_Atz = @Out_Atz OUTPUT,
				@Out_IdMsg = @Out_IdMsg OUTPUT
		
		IF (@return_value <> 0)
		BEGIN
			SET @Out_Msg = 'Erro na validação da consulta. Tente novamente mais tarde.[ssAtz_VldPrf]'
			GOTO FIM_ERRO
		END
	END
	ELSE
	BEGIN
		-- Validando as regras de contratado
		EXEC	@return_value = [dbo].[ssAtz_VldCtt]
				@IdCtt = @IdCtt,
				@Cte_SeqEnd = @Cte_SeqEnd,
				@IdEsp = @IdEsp,
				@IdPdm = @IdPdm,
				@IdRde = @IdRde,
				@Gia_DatEms = @Sol_DatEms,
				@Ngc_Crt = @Gia_Crt,
	--			@Out_IdPel = @IdPel OUTPUT,
				@Out_IdNgc = @Out_IdNgc OUTPUT,
				@Out_Atz = @Out_Atz OUTPUT,
				@Out_IdMsg = @Out_IdMsg OUTPUT

		IF (@return_value <> 0)
		BEGIN
			SET @Out_Msg = 'Erro na validação do contratado. Tente novamente mais tarde.[ssAtz_VldCtt]'
			GOTO FIM_ERRO
		END
	END
--
--	IF NOT EXISTS
--		(
--			-- Verificando se o Contratado Local Rede Especialidade pode atender no tipo de atendimento (ELETIVO)
--			SELECT	*
--			FROM	dbo.Atz_LcrEsp, dbo.Atz_Lcr
--			WHERE	IdLcr = Lce_IdLcr
--			AND		Lcr_IdCtt = @IdCtt
--			AND		Lcr_SeqEnd = @Cte_SeqEnd
--			AND		Lce_IdEsp = @IdEsp
--			AND		Lce_TipAtd IN ('A','E')
--		)
--	BEGIN
--		SET @Out_IdMsg = '1602,' -- TIPO DE ATENDIMENTO INVÁLIDO OU NÃO INFORMADO
--		SET @Out_Atz = 0
--	END

	-- Quando um procedimento é autorizado pela auditoria (Gpd_IdSit in 3,5,7),
	-- as regras de procedimentos não devem mais ser verificadas excetuando-se
	-- a quantidade de execuções dia e sexo do beneficiário
	IF (@Spd_IdSit IN (3,5,7)) 
	BEGIN

		DECLARE @Sxo CHAR(1), @QtdDia TINYINT, @Tmp_Qtd TINYINT

		-- Selecionando os dados para validação do procedimento
		SELECT	@Sxo = Pdm_Sxo,  
				@QtdDia = Pdm_QtdDia
		FROM	dbo.Atz_Pdm
		WHERE	IdPdm = @IdPdm
		
		IF (@Sxo <> 'A') AND (@Sxo <> @Bnf_Sxo)
		BEGIN
			SET @Out_IdMsg = @Out_IdMsg + '1802,' -- PROCEDIMENTO INCOMPATÍVEL COM O SEXO DO BENEFICIÁRIO
			SET @Out_Atz = 0
		END
		
		
		IF (@Gia_Crt = 'E' AND @QtdDia IS NOT NULL) 
		BEGIN
			-- Verificando a quantidade de execuções de SP/SADT
			SET @Tmp_Qtd = 
				(
					SELECT	SUM(Gpd_QtdAtz) 
					FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
					WHERE	IdGia = Gpd_IdGia
					AND		IdSit = Gpd_IdSit
					AND		Sit_Ind = 'A' -- Somente procedimentos autorizados
					AND		Gia_IdBnf = @IdBnf 
					AND		Gpd_IdPdm = @IdPdm
					AND		DATEDIFF(DAY, Gpd_DatRel, @Sol_DatEms) < 1
				)
		
			-- Verifica se: a quantidade de procedimento solicitada ou executada no mesmo dia + a 
			-- quantidade solicitadada é maior que a quantidade permitida para o dia
			IF (ISNULL(@Tmp_Qtd,0) + @Gpd_QtdSol > @QtdDia)
			BEGIN
				SET @Out_IdMsg = @Out_IdMsg + '1423,' --  QUANTIDADE SOLICITADA ACIMA DA QUANTIDADE PERMITIDA
				SET @Out_Atz = 0
			END
		END	
	END
	ELSE
	BEGIN
		-- Validando de procedimento
		EXEC	@return_value = [dbo].[ssAtz_VldPdm]
				@IdBnf = @IdBnf,
				@IdPdm = @IdPdm,
				@IdPrf = NULL,
				@IdEsp = NULL,
				@Bnf_Sxo = @Bnf_Sxo,
				@Bnf_Idd = @Bnf_Idd,
				@Pdm_Qtd = @Gpd_QtdSol,
				@Gia_DatEms = @Sol_DatEms,
				@Gia_Crt = @Gia_Crt,
				@Gia_Tip = 2,
				@Out_Atz = @Out_Atz OUTPUT,
				@Out_IdMsg = @Out_IdMsg OUTPUT

		IF (@return_value <> 0)
		BEGIN
			SET @Out_Msg = 'Erro na validação da solicitação de SP/SADT. Tente novamente mais tarde.[ssAtz_VldPdm]'
			GOTO FIM_ERRO
		END	
	END

	IF (@Out_IdMsg <> '')
		SET @Out_IdMsg = SUBSTRING(@Out_IdMsg,1,LEN(@Out_IdMsg) -1)

	RETURN 

	FIM_ERRO:
		SET @Out_Err = 1
		SET @Out_Atz = 0
		RETURN	
END
GO
/****** Object:  StoredProcedure [dbo].[ssAtz_VldAudMsg]    Script Date: 12/18/2012 09:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 566 END #####################################################################

-- 567 BEGIN ###################################################################

-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 20/01/2012
-- Description:	Verifica se o usuário possui autorização para autorizar o
--				procedimento com a negativa gerada
-- =============================================================================

CREATE PROCEDURE [dbo].[ssAtz_VldAudMsg]
	@IdOpe SMALLINT,		-- Código da operadora
	@IdGia INT,				-- Código da guia
	@IdPdm INT,				-- Código do procedimento
	@IdUsr INT,				-- Código do usuário
	
	@OutAtz BIT OUTPUT		-- [0-não autorizado|1-autorizado]
AS
BEGIN
	SET @OutAtz = 1
	
	IF EXISTS 
		(
			SELECT * 
			FROM dbo.aspnet_usersinroles, dbo.Sgn_Usr, dbo.Sgn_GrpMsg,
				dbo.Atz_SolPdmMsg
			WHERE UserId = Usr_UserId
			AND Grm_RoleId = RoleId
			AND Grm_IdMsg = Spm_IdMsg
			AND Grm_IdOpe = @IdOpe
			AND Spm_IdSol = @IdGia
			AND Spm_IdPdm = @IdPdm
			AND IdUsr = @IdUsr
		)
		SET @OutAtz = 0
		
	IF EXISTS 
		(
			SELECT * 
			FROM dbo.aspnet_usersinroles, dbo.Sgn_Usr, dbo.Sgn_GrpMsg,
				dbo.Atz_GiaPdmMsg
			WHERE UserId = Usr_UserId
			AND Grm_RoleId = RoleId
			AND Grm_IdMsg = Gpm_IdMsg
			AND Grm_IdOpe = @IdOpe
			AND Gpm_IdGia = @IdGia
			AND Gpm_IdPdm = @IdPdm
			AND IdUsr = @IdUsr
		)	
		SET @OutAtz = 0
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaPdm]    Script Date: 12/18/2012 09:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rubens Jr
-- Create date: 04/05/2007
-- Description:	Guia Procedimento - Manipulação de Dados
-- =============================================
CREATE PROCEDURE [dbo].[stAtz_GiaPdm]
	 @Gpd_IdGia INT
    ,@Gpd_IdPdm INT
    ,@Gpd_IdSit TINYINT
    ,@Gpd_QtdSol TINYINT
    ,@Gpd_QtdAtz TINYINT
	,@Gpd_DatRel SMALLDATETIME
	,@Gpd_IdNgc	INT
AS
BEGIN
	DECLARE @IdUsr INT
	
	SELECT	@IdUsr = Gia_IdUsr
	FROM	dbo.Atz_Gia
	WHERE	IdGia = @Gpd_IdGia

	INSERT dbo.Atz_GiaPdm
			(Gpd_IdGia
			,Gpd_IdPdm
			,Gpd_IdSit
			,Gpd_Dat
			,Gpd_DatVld
			,Gpd_QtdSol
			,Gpd_QtdAtz
			,Gpd_DatRel
			,Gpd_IdNgc)
	 VALUES
			(@Gpd_IdGia
			,@Gpd_IdPdm
			,@Gpd_IdSit
			,GETDATE()
			,GETDATE() + 30
			,@Gpd_QtdSol
			,@Gpd_QtdAtz
			,@Gpd_DatRel
			,@Gpd_IdNgc)	
	
	-- Se o procedimento foi negado é inserido o log da negativa
	IF (@Gpd_IdSit = 0)
		INSERT dbo.Atz_GiaPdmAud
			(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
		VALUES
			(@Gpd_IdGia, @Gpd_IdPdm, @Gpd_IdSit, @IdUsr, GETDATE(), 'NEGATIVA AUTOMATICA PELAS REGRAS DO SISTEMA')

	
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaCon]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stAtz_GiaCon]
     @Gia_IdCtt BIGINT
	,@Gia_SeqEnd TINYINT
	,@Gia_IdPrf	INT
	,@Gia_IdEsp SMALLINT
	,@Gia_IdBnf BIGINT
	,@Gia_IdUsr INT
	,@Gia_DatEms SMALLDATETIME
    ,@Gia_Snh VARCHAR(20)
	,@Gia_Crt CHAR(1)

	-- Parâmetros do procedimento (consulta)
	,@Gpd_IdPdm INT
	,@Gpd_IdSit TINYINT
	,@Gpm_IdMsg VARCHAR(200) = NULL
	,@Gpd_QtdAtz TINYINT
	,@Gpd_IdNgc INT = NULL
	
	-- Parâmetro para a gravação do documento de identificação do beneficiário
	,@Gid_TipDoc CHAR(3) = NULL
	,@Gid_NumDoc VARCHAR(30) = NULL

	,@Out_IdGia INT OUTPUT
	,@Out_Err BIT OUTPUT--[0-Operação efetuada|1-Erro]
	,@Out_Snh VARCHAR(20) OUTPUT 

AS
BEGIN
	DECLARE @SQL NVARCHAR(2000)
	DECLARE @ErrorLogID INT
	
	--	Tratamento para evitar inserção de guia em duplicidade
	SELECT	@Out_IdGia = IdGia, @Out_Snh = Gia_Snh
	FROM	dbo.Atz_Gia 
	WHERE	Gia_Tip = 1
	AND		Gia_IdCtt = @Gia_IdCtt
	AND		Gia_SeqEnd = @Gia_SeqEnd	
	AND		Gia_IdPrf = @Gia_IdPrf
	AND		Gia_IdEsp = @Gia_IdEsp
	AND		Gia_IdBnf = @Gia_IdBnf
	AND		Gia_IdUsr = @Gia_IdUsr
	AND		Gia_Crt = @Gia_Crt
	AND		Gia_DatEms = @Gia_DatEms	
	
	-- Se encontrar alguma guia já cadastrada em duplicidade,
	-- retorna o código da guia e senha cadastrada anteriormente.
	IF (@@ROWCOUNT > 0)
	BEGIN
		SET @Out_Err = 0
		RETURN
	END 

	BEGIN TRY
	
	-- Insere a guia de consulta
	INSERT dbo.Atz_Gia
       (
			Gia_IdCtt, Gia_SeqEnd, Gia_IdPrf, Gia_IdEsp, Gia_IdBnf,
			Gia_IdUsr, Gia_Tip, Gia_Crt, Gia_DatEms, Gia_DatVld
		)
	VALUES
		(
			@Gia_IdCtt, @Gia_SeqEnd, @Gia_IdPrf, @Gia_IdEsp,
			@Gia_IdBnf, @Gia_IdUsr,
			1, --  [1-guia consulta|2-guia sadt|3-guia internação]
			@Gia_Crt, @Gia_DatEms, GETDATE() + 30 -- Parametrizar
		)

	SET @Out_IdGia = SCOPE_IDENTITY()

	-- A senha de autorização é formada pelo número sequencial
	-- da guia mais a string randômica enviada pelo autorizador
	SET @Out_Snh = LTRIM(STR(@Out_IdGia)) + @Gia_Snh

	UPDATE dbo.Atz_Gia
	SET	Gia_Snh = @Out_Snh
	WHERE IdGia = @Out_IdGia

	-- Insere o procedimento da consulta
	INSERT dbo.Atz_GiaPdm 
		(
			Gpd_IdGia, Gpd_IdPdm, Gpd_IdSit, Gpd_Dat, Gpd_DatVld,
			Gpd_QtdSol, Gpd_QtdAtz, Gpd_DatRel, Gpd_IdNgc
		)
	 VALUES
		(
			@Out_IdGia, @Gpd_IdPdm, @Gpd_IdSit, GETDATE(), GETDATE() + 30,
			1, @Gpd_QtdAtz, NULL, @Gpd_IdNgc
		)
		
	-- Se o procedimento foi negado é inserido o log da negativa
	IF (@Gpd_IdSit = 0)
	BEGIN
		INSERT dbo.Atz_GiaPdmAud
			(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
		VALUES
			(@Out_IdGia, @Gpd_IdPdm, @Gpd_IdSit, @Gia_IdUsr, GETDATE(), 'NEGATIVA AUTOMATICA PELAS REGRAS DO SISTEMA')

		SET @SQL = N'INSERT dbo.Atz_GiaPdmMsg
					(Gpm_IdGia, Gpm_IdPdm, Gpm_IdMsg)
					SELECT	@IdGia, @IdPdm, IdMsg
					FROM	dbo.Atz_Msg
					WHERE	IdMsg IN ('+@Gpm_IdMsg+')'
		
		EXEC SP_EXECUTESQL @SQL, N'@IdGia INT, @IdPdm INT', @Out_IdGia, @Gpd_IdPdm
	END

	-- Os documentos de identificação são requeridos somente no
	-- contratado local que não utiliza biometria para identificação
	IF (@Gid_NumDoc IS NOT NULL AND @Gid_TipDoc IS NOT NULL)
	BEGIN
		INSERT dbo.Log_GiaDoc
		VALUES (@Out_IdGia, @Gid_TipDoc, @Gid_NumDoc)
	END

	SET @Out_Err = 0
	
	END TRY
	
	BEGIN CATCH
		-- Excluindo os registros quando ocorre erro
		DELETE FROM dbo.Atz_GiaPdmAud WHERE Gpa_IdGia = @Out_IdGia
		DELETE FROM dbo.Atz_GiaPdmMsg WHERE Gpm_IdGia = @Out_IdGia
		DELETE FROM dbo.Atz_GiaPdm WHERE Gpd_IdGia = @Out_IdGia
		DELETE FROM dbo.Atz_Gia WHERE IdGia = @Out_IdGia
		
		EXECUTE dbo.Dba_LogError @ErrorLogID = @ErrorLogID OUTPUT
		
		SET @Out_Err = 1
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaCncAut]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 27/04/2009
-- Description:	Cancelamento automático de guias de consulta não executadas
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaCncAut]
AS
BEGIN
	-- Insere na tabela de auditoria o motivo do cancelamento
	INSERT	dbo.Atz_GiaPdmAud
		(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
		SELECT	IdGia, Gpd_IdPdm, 2, 0, GETDATE(), 'CONSULTA NAO EXECUTADA NO PRAZO'
		FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdGia = Gpd_IdGia
		AND		IdSit = Gpd_IdSit
		AND		Gia_Tip = 1
		AND		Sit_Ind = 'A'
		AND		Gpd_IdSit <> 3
		AND		Gpd_DatRel IS NULL
		AND		DAY(Gpd_Dat) <> DAY(GETDATE())


	-- Cancela as consultas que ficaram em aberto no dia anterior
	UPDATE	dbo.Atz_GiaPdm
	SET		Gpd_IdSit = 2 
	FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm, dbo.Atz_Sit
	WHERE	IdGia = Gpd_IdGia
	AND		IdSit = Gpd_IdSit
	AND		Gia_Tip = 1
	AND		Sit_Ind = 'A'
	AND		Gpd_IdSit <> 3
	AND		Gpd_DatRel IS NULL
	AND		DAY(Gpd_Dat) <> DAY(GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaCnc]    Script Date: 12/18/2012 09:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 13/09/2008
-- Description:	Cancelamento de solicitação, de guia completa ou 
--				de procedimento da guia
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaCnc]
@GiaTip TINYINT =NULL, -- [0-solicitação|1-consulta|2-SP/SADT]
@IdGia INT,
@IdPdm  INT = NULL,	-- Quando NULL indica cancelamento de guia de consulta
@IdUsr INT,
@IdSit INT,
@Gpa_Jst VARCHAR(200) = NULL, 
@Out_Err BIT OUTPUT	-- Indica que houve erro na execução da sp [0-Não|1-Sim]

AS
BEGIN
	BEGIN TRAN
	-- Cancelamento de guia de consulta
	IF (@IdPdm IS NULL)
	BEGIN
		UPDATE	dbo.Atz_GiaPdm
		SET		Gpd_IdSit = @IdSit,
				Gpd_DatRel = NULL,
				Gpd_IdNgc = NULL
		FROM	dbo.Atz_GiaPdm, dbo.Atz_Sit
		WHERE	IdSit = Gpd_IdSit
		AND		Gpd_IdGia = @IdGia
		AND		Sit_Ind = 'A' -- Para não "mascarar" procedimento que já estava negado na guia

		IF @@ERROR <> 0
			GOTO FIM_ERRO
			
		-- Cancela as solicitações relacionadas à guia cancelada
		UPDATE	dbo.Atz_SolPdm
		SET		Spd_IdSit = 6
		FROM	dbo.Atz_SolPdm, dbo.Atz_Sol
		WHERE	IdSol = Spd_IdSol
		AND		Sol_IdGia = @IdGia
		AND		Spd_QtdAtz > Spd_QtdRel
		
		IF @@ERROR <> 0
			GOTO FIM_ERRO
	
		INSERT dbo.Atz_GiaPdmAud
			(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
			SELECT	IdGia, Gpd_IdPdm, @IdSit, @IdUsr, GETDATE(), 'CANCELADO PELO CONTRATADO'
			FROM	dbo.Atz_Gia, dbo.Atz_GiaPdm
			WHERE	IdGia = Gpd_IdGia
			AND		IdGia = @IdGia

		IF @@ERROR <> 0
			GOTO FIM_ERRO
	END
	ELSE
	IF @GiaTip = 0
	BEGIN
		-- Cancela a solicitação
		UPDATE	dbo.Atz_SolPdm
		SET		Spd_QtdAtz = 0,
				Spd_IdSit = @IdSit
		FROM	dbo.Atz_SolPdm
		WHERE	Spd_IdSol = @IdGia
		AND		Spd_IdPdm = @IdPdm

		IF @@ERROR <> 0
			GOTO FIM_ERRO			
			
		INSERT dbo.Atz_SolPdmAud
			(Spa_IdSol, Spa_IdPdm, Spa_IdSit, Spa_IdUsr, Spa_Dat, Spa_Jst)
			SELECT	@IdGia, @IdPdm, @IdSit, @IdUsr, GETDATE(), @Gpa_Jst
			FROM	dbo.Atz_Sit
			WHERE	IdSit = @IdSit

		IF @@ERROR <> 0
			GOTO FIM_ERRO				
	END
	ELSE
	BEGIN			
		-- Cancela as solicitações relacionadas à guia cancelada
		UPDATE	dbo.Atz_SolPdm
		SET		Spd_QtdRel = Spd_QtdRel - Gpd_QtdAtz
		FROM	dbo.Atz_Gia e, dbo.Atz_GiaPdm, dbo.Atz_Gia c, 
				dbo.Atz_Sol, dbo.Atz_SolPdm
		WHERE	e.IdGia = Gpd_IdGia
		AND		e.Gia_IdGiaPrc = c.IdGia
		AND		c.IdGia = Sol_IdGia
		AND		IdSol = Spd_IdSol
		AND		Gpd_IdPdm = Spd_IdPdm
		AND		CONVERT(INT,Spd_QtdRel) - Gpd_QtdAtz >= 0
		AND		e.IdGia = @IdGia
		AND		Gpd_IdPdm = @IdPdm

		IF @@ERROR <> 0
			GOTO FIM_ERRO
			
		UPDATE	dbo.Atz_GiaPdm 
		SET		Gpd_IdSit = @IdSit,
				Gpd_DatRel = NULL,
				Gpd_QtdAtz = 0		
		WHERE	Gpd_IdGia = @IdGia 
		AND		Gpd_IdPdm = @IdPdm

		IF @@ERROR <> 0
			GOTO FIM_ERRO			
			
		INSERT dbo.Atz_GiaPdmAud
			(Gpa_IdGia, Gpa_IdPdm, Gpa_IdSit, Gpa_IdUsr, Gpa_Dat, Gpa_Jst)
			SELECT	@IdGia, @IdPdm, @IdSit, @IdUsr, GETDATE(), @Gpa_Jst
			FROM	dbo.Atz_Sit
			WHERE	IdSit = @IdSit

		IF @@ERROR <> 0
			GOTO FIM_ERRO			
	END

	COMMIT TRAN
	SET @Out_Err = 0
	RETURN

	FIM_ERRO:
		ROLLBACK TRAN
		SET @Out_Err = 1
		RETURN	
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaPdmSdt_OLD]    Script Date: 12/18/2012 09:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 04/05/2007
-- Description:	Procedimento Guia SP/SADT - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaPdmSdt_OLD]
	 @Gpd_IdGia INT
    ,@Gpd_IdPdm INT
    ,@Gpd_IdSit TINYINT
    ,@Gpd_QtdSol TINYINT
	,@Gpd_QtdAtz TINYINT
	,@Gpd_DatRel SMALLDATETIME
	,@Gpd_IdNgc	INT = NULL
	,@IdSol INT
	,@Gpm_IdMsg VARCHAR(200) = NULL
AS
BEGIN
	DECLARE	@return_value INT
	
	----	Tratamento para evitar inserção de guia em duplicidade
	--SELECT	*
	--FROM	dbo.Atz_GiaPdm 
	--WHERE	Gpd_IdGia = @Gpd_IdGia
 --   AND		Gpd_IdPdm = @Gpd_IdPdm
	
	---- Se encontrar alguma guia já cadastrada em duplicidade,
	---- retorna o código da guia e senha cadastrada anteriormente.
	--IF (@@ROWCOUNT > 0)
	--BEGIN
	--	RETURN
	--END

	
	BEGIN TRAN

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
	
		IF @@ERROR <> 0
			GOTO FIM_ERRO

		EXEC	@return_value = [dbo].[stAtz_GiaPdm]
				@Gpd_IdGia = @Gpd_IdGia,
				@Gpd_IdPdm = @Gpd_IdPdm,
				@Gpd_IdSit = @Gpd_IdSit,
				@Gpd_QtdSol = @Gpd_QtdSol,
				@Gpd_QtdAtz = @Gpd_QtdAtz,
				@Gpd_DatRel = @Gpd_DatRel,
				@Gpd_IdNgc = @Gpd_IdNgc

		IF (@return_value <> 0)
		BEGIN
--			SET @Out_Msg = 'Erro na inclusão do procedimentos. Tente novamente mais tarde.[stAtz_GiaPdm]'
			GOTO FIM_ERRO
		END

		EXEC	@return_value = dbo.stAtz_GiaPdmMsg
				@IdGia = @Gpd_IdGia,
				@IdPdm = @Gpd_IdPdm,
				@IdMsg = @Gpm_IdMsg

	COMMIT TRAN
	RETURN

	FIM_ERRO:
		ROLLBACK TRAN
		RETURN	
	
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaPdmSdt]    Script Date: 12/18/2012 09:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 04/05/2007
-- Description:	Procedimento Guia SP/SADT - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaPdmSdt]
	 @Gpd_IdGia INT
    ,@Gpd_IdPdm INT
    ,@Gpd_IdSit TINYINT
    ,@Gpd_QtdSol TINYINT
	,@Gpd_QtdAtz TINYINT
	,@Gpd_DatRel SMALLDATETIME
	,@Gpd_IdNgc	INT = NULL
	,@IdSol INT
	,@Gpm_IdMsg VARCHAR(200) = NULL
AS
BEGIN
	DECLARE	@return_value INT
	
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
	
	----	Tratamento para evitar inserção de guia em duplicidade
	--SELECT	*
	--FROM	dbo.Atz_GiaPdm 
	--WHERE	Gpd_IdGia = @Gpd_IdGia
 --   AND		Gpd_IdPdm = @Gpd_IdPdm
	
	---- Se encontrar alguma guia já cadastrada em duplicidade,
	---- retorna o código da guia e senha cadastrada anteriormente.
	--IF (@@ROWCOUNT > 0)
	--BEGIN
	--	RETURN
	--END

	
	BEGIN TRAN

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
	
		IF @@ERROR <> 0
			GOTO FIM_ERRO

		EXEC	@return_value = [dbo].[stAtz_GiaPdm]
				@Gpd_IdGia = @Gpd_IdGia,
				@Gpd_IdPdm = @Gpd_IdPdm,
				@Gpd_IdSit = @Gpd_IdSit,
				@Gpd_QtdSol = @Gpd_QtdSol,
				@Gpd_QtdAtz = @Gpd_QtdAtz,
				@Gpd_DatRel = @Gpd_DatRel,
				@Gpd_IdNgc = @Gpd_IdNgc

		IF (@return_value <> 0)
		BEGIN
--			SET @Out_Msg = 'Erro na inclusão do procedimentos. Tente novamente mais tarde.[stAtz_GiaPdm]'
			GOTO FIM_ERRO
		END

		EXEC	@return_value = dbo.stAtz_GiaPdmMsg
				@IdGia = @Gpd_IdGia,
				@IdPdm = @Gpd_IdPdm,
				@IdMsg = @Gpm_IdMsg

	COMMIT TRAN
	RETURN

	FIM_ERRO:
		ROLLBACK TRAN
		RETURN	
	
END
GO
/****** Object:  StoredProcedure [dbo].[stAtz_GiaPdmItn]    Script Date: 12/18/2012 09:52:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		Rubens Jr
-- Create date: 05/10/2009
-- Description:	Procedimento Guia Internação - Manipulação de Dados
-- =============================================================================
CREATE PROCEDURE [dbo].[stAtz_GiaPdmItn]
	 @Gpd_IdGia INT
    ,@Gpd_IdPdm INT
    ,@Gpd_QtdSol TINYINT
AS
BEGIN
	DECLARE	@return_value INT

	EXEC	@return_value = [dbo].[stAtz_GiaPdm]
		@Gpd_IdGia = @Gpd_IdGia,
		@Gpd_IdPdm = @Gpd_IdPdm,
		@Gpd_IdSit = 0,
		@Gpd_QtdSol = @Gpd_QtdSol,
		@Gpd_QtdAtz = 0,
		@Gpd_DatRel = NULL,
		@Gpd_IdNgc = NULL	
			
	EXEC	@return_value = dbo.stAtz_GiaPdmMsg
		@IdGia = @Gpd_IdGia,
		@IdPdm = @Gpd_IdPdm,
		@IdMsg = 1427 -- NECESSIDADE DE AUDITORIA MÉDICA

END
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__2FCF1A8A]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  CONSTRAINT [DF__aspnet_Ap__Appli__2FCF1A8A]  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__44CA3770]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  CONSTRAINT [DF__aspnet_Me__Passw__44CA3770]  DEFAULT (0) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__756D6ECB]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  CONSTRAINT [DF__aspnet_Pa__PathI__756D6ECB]  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__7D0E9093]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  CONSTRAINT [DF__aspnet_Perso__Id__7D0E9093]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__625A9A57]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__625A9A57]  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__339FAB6E]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__339FAB6E]  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__3493CFA7]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__3493CFA7]  DEFAULT (null) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__3587F3E0]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__3587F3E0]  DEFAULT (0) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_Atz_Pdm_Pdm_IdTab]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Pdm] ADD  CONSTRAINT [DF_Atz_Pdm_Pdm_IdTab]  DEFAULT (1) FOR [Pdm_IdTab]
GO
/****** Object:  Default [DF_ErrorLog_ErrorTime]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Dba_ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_ErrorTime]  DEFAULT (getdate()) FOR [ErrorTime]
GO
/****** Object:  Default [DF_ELMAH_Error_ErrorId]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[ELMAH_Error] ADD  CONSTRAINT [DF_ELMAH_Error_ErrorId]  DEFAULT (newid()) FOR [ErrorId]
GO
/****** Object:  Default [DF_Fat_Fch_Fch_IdOpe]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Fat_Fch] ADD  CONSTRAINT [DF_Fat_Fch_Fch_IdOpe]  DEFAULT ((1)) FOR [Fch_IdOpe]
GO
/****** Object:  Default [DF_Fat_Fch_Fch_Lot]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Fat_Fch] ADD  CONSTRAINT [DF_Fat_Fch_Fch_Lot]  DEFAULT ((1)) FOR [Fch_Lot]
GO
/****** Object:  Default [DF__Log_SolGi__Gpd_D__49CEE3AF]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Log_SolGia] ADD  CONSTRAINT [DF__Log_SolGi__Gpd_D__49CEE3AF]  DEFAULT (getdate()) FOR [Gpd_Dat]
GO
/****** Object:  Default [DF_Sgn_Ppl_Ppl_QtdCh_]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Ppl] ADD  CONSTRAINT [DF_Sgn_Ppl_Ppl_QtdCh_]  DEFAULT ((0)) FOR [Ppl_QtdCh_]
GO
/****** Object:  Default [DF_Sgn_Usr_Usr_AltSnh]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Usr] ADD  CONSTRAINT [DF_Sgn_Usr_Usr_AltSnh]  DEFAULT (0) FOR [Usr_AltSnh]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__42E1EEFE]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Me__Appli__42E1EEFE] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__Appli__42E1EEFE]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__43D61337]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Me__UserI__43D61337] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__UserI__43D61337]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__74794A92]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pa__Appli__74794A92] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Paths] CHECK CONSTRAINT [FK__aspnet_Pa__Appli__74794A92]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__7A3223E8]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__7A3223E8] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__7A3223E8]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__7E02B4CC]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__7E02B4CC] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__7E02B4CC]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__7EF6D905]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__UserI__7EF6D905] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__UserI__7EF6D905]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__57DD0BE4]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pr__UserI__57DD0BE4] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile] CHECK CONSTRAINT [FK__aspnet_Pr__UserI__57DD0BE4]
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__6166761E]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__6166761E] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__6166761E]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__32AB8735]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__32AB8735] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__32AB8735]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__662B2B3B]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__662B2B3B] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__662B2B3B]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__65370702]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FK__aspnet_Us__UserI__65370702] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__UserI__65370702]
GO
/****** Object:  ForeignKey [FK_Atz_Bnf_Atz_Cnt]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Bnf]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Bnf_Atz_Cnt] FOREIGN KEY([Bnf_IdCnt])
REFERENCES [dbo].[Atz_Cnt] ([IdCnt])
GO
ALTER TABLE [dbo].[Atz_Bnf] CHECK CONSTRAINT [FK_Atz_Bnf_Atz_Cnt]
GO
/****** Object:  ForeignKey [FK_Atz_Bnf_Log_Itg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Bnf]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Bnf_Log_Itg] FOREIGN KEY([Bnf_IdItg])
REFERENCES [dbo].[Log_Itg] ([IdItg])
GO
ALTER TABLE [dbo].[Atz_Bnf] CHECK CONSTRAINT [FK_Atz_Bnf_Log_Itg]
GO
/****** Object:  ForeignKey [RefAtz_Bnf581]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Bnf]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Bnf581] FOREIGN KEY([Bnf_IdTit])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_Bnf] CHECK CONSTRAINT [RefAtz_Bnf581]
GO
/****** Object:  ForeignKey [FK_Atz_BnfGrp_Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfCbt]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_BnfGrp_Atz_Bnf] FOREIGN KEY([Bnc_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_BnfCbt] CHECK CONSTRAINT [FK_Atz_BnfGrp_Atz_Bnf]
GO
/****** Object:  ForeignKey [RefAtz_Cbt661]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfCbt]  WITH CHECK ADD  CONSTRAINT [RefAtz_Cbt661] FOREIGN KEY([Bnc_IdCbt])
REFERENCES [dbo].[Atz_Cbt] ([IdCbt])
GO
ALTER TABLE [dbo].[Atz_BnfCbt] CHECK CONSTRAINT [RefAtz_Cbt661]
GO
/****** Object:  ForeignKey [FK_Atz_BnfPdm_Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_BnfPdm_Atz_Bnf] FOREIGN KEY([Bnp_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_BnfPdm] CHECK CONSTRAINT [FK_Atz_BnfPdm_Atz_Bnf]
GO
/****** Object:  ForeignKey [FK_Atz_BnfPdm_Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_BnfPdm_Atz_Pdm] FOREIGN KEY([Bnp_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_BnfPdm] CHECK CONSTRAINT [FK_Atz_BnfPdm_Atz_Pdm]
GO
/****** Object:  ForeignKey [FK_Atz_BnfPrd_Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfPrd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_BnfPrd_Atz_Bnf] FOREIGN KEY([Bnp_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_BnfPrd] CHECK CONSTRAINT [FK_Atz_BnfPrd_Atz_Bnf]
GO
/****** Object:  ForeignKey [FK_Atz_BnfPrd_Atz_Prd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfPrd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_BnfPrd_Atz_Prd] FOREIGN KEY([Bnp_IdPrd])
REFERENCES [dbo].[Atz_Prd] ([IdPrd])
GO
ALTER TABLE [dbo].[Atz_BnfPrd] CHECK CONSTRAINT [FK_Atz_BnfPrd_Atz_Prd]
GO
/****** Object:  ForeignKey [FK_Atz_BnfPrd_Log_Itg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_BnfPrd]  WITH CHECK ADD  CONSTRAINT [FK_Atz_BnfPrd_Log_Itg] FOREIGN KEY([Bnp_IdItg])
REFERENCES [dbo].[Log_Itg] ([IdItg])
GO
ALTER TABLE [dbo].[Atz_BnfPrd] CHECK CONSTRAINT [FK_Atz_BnfPrd_Log_Itg]
GO
/****** Object:  ForeignKey [FK_Atz_Brr_Atz_Mun]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Brr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Brr_Atz_Mun] FOREIGN KEY([Brr_IdMun])
REFERENCES [dbo].[Atz_Mun] ([IdMun])
GO
ALTER TABLE [dbo].[Atz_Brr] CHECK CONSTRAINT [FK_Atz_Brr_Atz_Mun]
GO
/****** Object:  ForeignKey [RefAtz_Cbt641]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CbtPdm]  WITH CHECK ADD  CONSTRAINT [RefAtz_Cbt641] FOREIGN KEY([Cbp_IdCbt])
REFERENCES [dbo].[Atz_Cbt] ([IdCbt])
GO
ALTER TABLE [dbo].[Atz_CbtPdm] CHECK CONSTRAINT [RefAtz_Cbt641]
GO
/****** Object:  ForeignKey [RefAtz_Pdm631]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CbtPdm]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Pdm631] FOREIGN KEY([Cbp_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_CbtPdm] CHECK CONSTRAINT [RefAtz_Pdm631]
GO
/****** Object:  ForeignKey [FK_Atz_Cnt_Atz_Emp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cnt]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Cnt_Atz_Emp] FOREIGN KEY([Cnt_IdEmp])
REFERENCES [dbo].[Atz_Emp] ([IdEmp])
GO
ALTER TABLE [dbo].[Atz_Cnt] CHECK CONSTRAINT [FK_Atz_Cnt_Atz_Emp]
GO
/****** Object:  ForeignKey [FK_Atz_Cnt_Log_Itg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cnt]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Cnt_Log_Itg] FOREIGN KEY([Cnt_IdItg])
REFERENCES [dbo].[Log_Itg] ([IdItg])
GO
ALTER TABLE [dbo].[Atz_Cnt] CHECK CONSTRAINT [FK_Atz_Cnt_Log_Itg]
GO
/****** Object:  ForeignKey [RefAtz_Bnf741]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cpe]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Bnf741] FOREIGN KEY([Cpe_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_Cpe] CHECK CONSTRAINT [RefAtz_Bnf741]
GO
/****** Object:  ForeignKey [RefAtz_Cid751]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cpe]  WITH CHECK ADD  CONSTRAINT [RefAtz_Cid751] FOREIGN KEY([Cpe_IdCid])
REFERENCES [dbo].[Atz_Cid] ([IdCid])
GO
ALTER TABLE [dbo].[Atz_Cpe] CHECK CONSTRAINT [RefAtz_Cid751]
GO
/****** Object:  ForeignKey [RefAtz_Cpe771]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cpi]  WITH CHECK ADD  CONSTRAINT [RefAtz_Cpe771] FOREIGN KEY([Cpi_IdCpe])
REFERENCES [dbo].[Atz_Cpe] ([IdCpe])
GO
ALTER TABLE [dbo].[Atz_Cpi] CHECK CONSTRAINT [RefAtz_Cpe771]
GO
/****** Object:  ForeignKey [RefAtz_Pdm761]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Cpi]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Pdm761] FOREIGN KEY([Cpi_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_Cpi] CHECK CONSTRAINT [RefAtz_Pdm761]
GO
/****** Object:  ForeignKey [FK_Atz_Crd_Atz_Cns]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ctt]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Crd_Atz_Cns] FOREIGN KEY([Ctt_IdCns])
REFERENCES [dbo].[Atz_Cns] ([IdCns])
GO
ALTER TABLE [dbo].[Atz_Ctt] CHECK CONSTRAINT [FK_Atz_Crd_Atz_Cns]
GO
/****** Object:  ForeignKey [FK_Atz_Crd_Atz_Tpd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ctt]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Crd_Atz_Tpd] FOREIGN KEY([Ctt_IdTpd])
REFERENCES [dbo].[Atz_Tpd] ([IdTpd])
GO
ALTER TABLE [dbo].[Atz_Ctt] CHECK CONSTRAINT [FK_Atz_Crd_Atz_Tpd]
GO
/****** Object:  ForeignKey [FK_Atz_CttEnd_Atz_Ctt]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CttEnd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_CttEnd_Atz_Ctt] FOREIGN KEY([Cte_IdCtt])
REFERENCES [dbo].[Atz_Ctt] ([IdCtt])
GO
ALTER TABLE [dbo].[Atz_CttEnd] CHECK CONSTRAINT [FK_Atz_CttEnd_Atz_Ctt]
GO
/****** Object:  ForeignKey [FK_Atz_CttEnd_Atz_Lgr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CttEnd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_CttEnd_Atz_Lgr] FOREIGN KEY([Cte_IdLgr])
REFERENCES [dbo].[Atz_Lgr] ([IdLgr])
GO
ALTER TABLE [dbo].[Atz_CttEnd] CHECK CONSTRAINT [FK_Atz_CttEnd_Atz_Lgr]
GO
/****** Object:  ForeignKey [RefAtz_Crd131]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CttEsp]  WITH CHECK ADD  CONSTRAINT [RefAtz_Crd131] FOREIGN KEY([Ces_IdCtt])
REFERENCES [dbo].[Atz_Ctt] ([IdCtt])
GO
ALTER TABLE [dbo].[Atz_CttEsp] CHECK CONSTRAINT [RefAtz_Crd131]
GO
/****** Object:  ForeignKey [RefAtz_Esp141]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_CttEsp]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Esp141] FOREIGN KEY([Ces_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_CttEsp] CHECK CONSTRAINT [RefAtz_Esp141]
GO
/****** Object:  ForeignKey [FK_Atz_EspPdm_Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_EspCon]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_EspPdm_Atz_Esp] FOREIGN KEY([Epc_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_EspCon] CHECK CONSTRAINT [FK_Atz_EspPdm_Atz_Esp]
GO
/****** Object:  ForeignKey [FK_Atz_EspPdm_Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_EspCon]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_EspPdm_Atz_Pdm] FOREIGN KEY([Epc_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_EspCon] CHECK CONSTRAINT [FK_Atz_EspPdm_Atz_Pdm]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_CttEnd] FOREIGN KEY([Gia_IdCtt], [Gia_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_Esp] FOREIGN KEY([Gia_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_Esp]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_Prf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_Prf] FOREIGN KEY([Gia_IdPrf])
REFERENCES [dbo].[Atz_Prf] ([IdPrf])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_Prf]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_PrfSol]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_PrfSol] FOREIGN KEY([Gia_IdPrfSol])
REFERENCES [dbo].[Atz_Prf] ([IdPrf])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_PrfSol]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_Tpa]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_Tpa] FOREIGN KEY([Gia_IdTpa])
REFERENCES [dbo].[Atz_Tpa] ([IdTpa])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_Tpa]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_Tpc]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_Tpc] FOREIGN KEY([Gia_IdTpc])
REFERENCES [dbo].[Atz_Tpc] ([IdTpc])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_Tpc]
GO
/****** Object:  ForeignKey [FK_Atz_Gia_Atz_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Gia_Atz_Usr] FOREIGN KEY([Gia_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [FK_Atz_Gia_Atz_Usr]
GO
/****** Object:  ForeignKey [RefAtz_Bnf351]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Bnf351] FOREIGN KEY([Gia_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [RefAtz_Bnf351]
GO
/****** Object:  ForeignKey [RefAtz_Gia601]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Gia601] FOREIGN KEY([Gia_IdGiaPrc])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [RefAtz_Gia601]
GO
/****** Object:  ForeignKey [RefAtz_Rgm611]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Rgm611] FOREIGN KEY([Gia_IdRgm])
REFERENCES [dbo].[Atz_Rgm] ([IdRgm])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [RefAtz_Rgm611]
GO
/****** Object:  ForeignKey [RefAtz_Sai431]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Sai431] FOREIGN KEY([Gia_IdSai])
REFERENCES [dbo].[Atz_Sai] ([IdSai])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [RefAtz_Sai431]
GO
/****** Object:  ForeignKey [RefAtz_Tpi421]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Gia]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Tpi421] FOREIGN KEY([Gia_IdTpi])
REFERENCES [dbo].[Atz_Tpi] ([IdTpi])
GO
ALTER TABLE [dbo].[Atz_Gia] CHECK CONSTRAINT [RefAtz_Tpi421]
GO
/****** Object:  ForeignKey [RefAtz_Cid321]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaCid]  WITH CHECK ADD  CONSTRAINT [RefAtz_Cid321] FOREIGN KEY([Gcd_IdCid])
REFERENCES [dbo].[Atz_Cid] ([IdCid])
GO
ALTER TABLE [dbo].[Atz_GiaCid] CHECK CONSTRAINT [RefAtz_Cid321]
GO
/****** Object:  ForeignKey [RefAtz_Gia311]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaCid]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Gia311] FOREIGN KEY([Gcd_IdGia])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO
ALTER TABLE [dbo].[Atz_GiaCid] CHECK CONSTRAINT [RefAtz_Gia311]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdm_Atz_Ngc]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_GiaPdm_Atz_Ngc] FOREIGN KEY([Gpd_IdNgc])
REFERENCES [dbo].[Atz_Ngc] ([IdNgc])
GO
ALTER TABLE [dbo].[Atz_GiaPdm] CHECK CONSTRAINT [FK_Atz_GiaPdm_Atz_Ngc]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdm_Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_GiaPdm_Atz_Pdm] FOREIGN KEY([Gpd_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_GiaPdm] CHECK CONSTRAINT [FK_Atz_GiaPdm_Atz_Pdm]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdm_Atz_Sit]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdm]  WITH CHECK ADD  CONSTRAINT [FK_Atz_GiaPdm_Atz_Sit] FOREIGN KEY([Gpd_IdSit])
REFERENCES [dbo].[Atz_Sit] ([IdSit])
GO
ALTER TABLE [dbo].[Atz_GiaPdm] CHECK CONSTRAINT [FK_Atz_GiaPdm_Atz_Sit]
GO
/****** Object:  ForeignKey [RefAtz_Gia301]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdm]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Gia301] FOREIGN KEY([Gpd_IdGia])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO
ALTER TABLE [dbo].[Atz_GiaPdm] CHECK CONSTRAINT [RefAtz_Gia301]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdmAud_Atz_GiaPdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdmAud]  WITH CHECK ADD  CONSTRAINT [FK_Atz_GiaPdmAud_Atz_GiaPdm] FOREIGN KEY([Gpa_IdGia], [Gpa_IdPdm])
REFERENCES [dbo].[Atz_GiaPdm] ([Gpd_IdGia], [Gpd_IdPdm])
GO
ALTER TABLE [dbo].[Atz_GiaPdmAud] CHECK CONSTRAINT [FK_Atz_GiaPdmAud_Atz_GiaPdm]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdmAud_Atz_Sit]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdmAud]  WITH CHECK ADD  CONSTRAINT [FK_Atz_GiaPdmAud_Atz_Sit] FOREIGN KEY([Gpa_IdSit])
REFERENCES [dbo].[Atz_Sit] ([IdSit])
GO
ALTER TABLE [dbo].[Atz_GiaPdmAud] CHECK CONSTRAINT [FK_Atz_GiaPdmAud_Atz_Sit]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdmAud_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdmAud]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_GiaPdmAud_Sgn_Usr] FOREIGN KEY([Gpa_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_GiaPdmAud] CHECK CONSTRAINT [FK_Atz_GiaPdmAud_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdmMsg_Atz_GiaPdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdmMsg]  WITH CHECK ADD  CONSTRAINT [FK_Atz_GiaPdmMsg_Atz_GiaPdm] FOREIGN KEY([Gpm_IdGia], [Gpm_IdPdm])
REFERENCES [dbo].[Atz_GiaPdm] ([Gpd_IdGia], [Gpd_IdPdm])
GO
ALTER TABLE [dbo].[Atz_GiaPdmMsg] CHECK CONSTRAINT [FK_Atz_GiaPdmMsg_Atz_GiaPdm]
GO
/****** Object:  ForeignKey [FK_Atz_GiaPdmMsg_Atz_Msg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_GiaPdmMsg]  WITH CHECK ADD  CONSTRAINT [FK_Atz_GiaPdmMsg_Atz_Msg] FOREIGN KEY([Gpm_IdMsg])
REFERENCES [dbo].[Atz_Msg___] ([IdMsg])
GO
ALTER TABLE [dbo].[Atz_GiaPdmMsg] CHECK CONSTRAINT [FK_Atz_GiaPdmMsg_Atz_Msg]
GO
/****** Object:  ForeignKey [FK_Atz_Itn_Atz_Acm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Itn]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Itn_Atz_Acm] FOREIGN KEY([Itn_IdAcm])
REFERENCES [dbo].[Atz_Acm] ([IdAcm])
GO
ALTER TABLE [dbo].[Atz_Itn] CHECK CONSTRAINT [FK_Atz_Itn_Atz_Acm]
GO
/****** Object:  ForeignKey [FK_Atz_Itn_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Itn]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Itn_Atz_CttEnd] FOREIGN KEY([Itn_IdCtt], [Itn_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Atz_Itn] CHECK CONSTRAINT [FK_Atz_Itn_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Atz_Itn_Atz_Gia]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Itn]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Itn_Atz_Gia] FOREIGN KEY([Itn_IdGia])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO
ALTER TABLE [dbo].[Atz_Itn] CHECK CONSTRAINT [FK_Atz_Itn_Atz_Gia]
GO
/****** Object:  ForeignKey [FK_Atz_Itn_Atz_Rgm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Itn]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Itn_Atz_Rgm] FOREIGN KEY([Itn_IdRgm])
REFERENCES [dbo].[Atz_Rgm] ([IdRgm])
GO
ALTER TABLE [dbo].[Atz_Itn] CHECK CONSTRAINT [FK_Atz_Itn_Atz_Rgm]
GO
/****** Object:  ForeignKey [FK_Atz_Itn_Atz_Tpi]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Itn]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Itn_Atz_Tpi] FOREIGN KEY([Itn_IdTpi])
REFERENCES [dbo].[Atz_Tpi] ([IdTpi])
GO
ALTER TABLE [dbo].[Atz_Itn] CHECK CONSTRAINT [FK_Atz_Itn_Atz_Tpi]
GO
/****** Object:  ForeignKey [FK_Atz_ItnOpm_Atz_Itn]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_ItnOpm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_ItnOpm_Atz_Itn] FOREIGN KEY([Ito_IdItn])
REFERENCES [dbo].[Atz_Itn] ([IdItn])
GO
ALTER TABLE [dbo].[Atz_ItnOpm] CHECK CONSTRAINT [FK_Atz_ItnOpm_Atz_Itn]
GO
/****** Object:  ForeignKey [FK_Atz_Lcr_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Lcr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Lcr_Atz_CttEnd] FOREIGN KEY([Lcr_IdCtt], [Lcr_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Atz_Lcr] CHECK CONSTRAINT [FK_Atz_Lcr_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Atz_Lcr_Atz_Rde]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Lcr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Lcr_Atz_Rde] FOREIGN KEY([Lcr_IdRde])
REFERENCES [dbo].[Atz_Rde] ([IdRde])
GO
ALTER TABLE [dbo].[Atz_Lcr] CHECK CONSTRAINT [FK_Atz_Lcr_Atz_Rde]
GO
/****** Object:  ForeignKey [FK_Atz_LcrEsp_Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_LcrEsp]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_LcrEsp_Atz_Esp] FOREIGN KEY([Lce_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_LcrEsp] CHECK CONSTRAINT [FK_Atz_LcrEsp_Atz_Esp]
GO
/****** Object:  ForeignKey [FK_Atz_LcrEsp_Atz_Lcr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_LcrEsp]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_LcrEsp_Atz_Lcr] FOREIGN KEY([Lce_IdLcr])
REFERENCES [dbo].[Atz_Lcr] ([IdLcr])
GO
ALTER TABLE [dbo].[Atz_LcrEsp] CHECK CONSTRAINT [FK_Atz_LcrEsp_Atz_Lcr]
GO
/****** Object:  ForeignKey [FK_Atz_Lgr_Atz_Brr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Lgr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Lgr_Atz_Brr] FOREIGN KEY([Lgr_IdBrr])
REFERENCES [dbo].[Atz_Brr] ([IdBrr])
GO
ALTER TABLE [dbo].[Atz_Lgr] CHECK CONSTRAINT [FK_Atz_Lgr_Atz_Brr]
GO
/****** Object:  ForeignKey [FK_Atz_Lgr_Atz_Tpl]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Lgr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Lgr_Atz_Tpl] FOREIGN KEY([Lgr_IdTpl])
REFERENCES [dbo].[Atz_Tpl] ([IdTpl])
GO
ALTER TABLE [dbo].[Atz_Lgr] CHECK CONSTRAINT [FK_Atz_Lgr_Atz_Tpl]
GO
/****** Object:  ForeignKey [FK_Atz_Ngc_Atz_LcrEsp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ngc]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Ngc_Atz_LcrEsp] FOREIGN KEY([Ngc_IdLce])
REFERENCES [dbo].[Atz_LcrEsp] ([IdLce])
GO
ALTER TABLE [dbo].[Atz_Ngc] CHECK CONSTRAINT [FK_Atz_Ngc_Atz_LcrEsp]
GO
/****** Object:  ForeignKey [FK_Atz_Ngc_Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ngc]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Ngc_Atz_Pdm] FOREIGN KEY([Ngc_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_Ngc] CHECK CONSTRAINT [FK_Atz_Ngc_Atz_Pdm]
GO
/****** Object:  ForeignKey [FK_Atz_Ngc_Atz_PrfEspLcr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ngc]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Ngc_Atz_PrfEspLcr] FOREIGN KEY([Ngc_IdPel])
REFERENCES [dbo].[Atz_PrfEspLcr] ([IdPel])
GO
ALTER TABLE [dbo].[Atz_Ngc] CHECK CONSTRAINT [FK_Atz_Ngc_Atz_PrfEspLcr]
GO
/****** Object:  ForeignKey [FK_Atz_Ngc_Sgn_UsrExc]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ngc]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Ngc_Sgn_UsrExc] FOREIGN KEY([Ngc_IdUsrExc])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_Ngc] CHECK CONSTRAINT [FK_Atz_Ngc_Sgn_UsrExc]
GO
/****** Object:  ForeignKey [FK_Atz_Ngc_Sgn_UsrInc]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Ngc]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Ngc_Sgn_UsrInc] FOREIGN KEY([Ngc_IdUsrInc])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_Ngc] CHECK CONSTRAINT [FK_Atz_Ngc_Sgn_UsrInc]
GO
/****** Object:  ForeignKey [FK_Atz_Pdm_Atz_Grp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Pdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Pdm_Atz_Grp] FOREIGN KEY([Pdm_IdGrp])
REFERENCES [dbo].[Atz_Grp] ([IdGrp])
GO
ALTER TABLE [dbo].[Atz_Pdm] CHECK CONSTRAINT [FK_Atz_Pdm_Atz_Grp]
GO
/****** Object:  ForeignKey [RefAtz_Tab621]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Pdm]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Tab621] FOREIGN KEY([Pdm_IdTab])
REFERENCES [dbo].[Atz_Tab] ([IdTab])
GO
ALTER TABLE [dbo].[Atz_Pdm] CHECK CONSTRAINT [RefAtz_Tab621]
GO
/****** Object:  ForeignKey [RefAtz_Tpp21]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Pdm]  WITH NOCHECK ADD  CONSTRAINT [RefAtz_Tpp21] FOREIGN KEY([Pdm_IdTpp])
REFERENCES [dbo].[Atz_Tpp] ([IdTpp])
GO
ALTER TABLE [dbo].[Atz_Pdm] CHECK CONSTRAINT [RefAtz_Tpp21]
GO
/****** Object:  ForeignKey [FK_Atz_Prd_Atz_Rde]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Prd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Prd_Atz_Rde] FOREIGN KEY([Prd_IdRde])
REFERENCES [dbo].[Atz_Rde] ([IdRde])
GO
ALTER TABLE [dbo].[Atz_Prd] CHECK CONSTRAINT [FK_Atz_Prd_Atz_Rde]
GO
/****** Object:  ForeignKey [FK_Atz_Prd_Log_Itg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Prd]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Prd_Log_Itg] FOREIGN KEY([Prd_IdItg])
REFERENCES [dbo].[Log_Itg] ([IdItg])
GO
ALTER TABLE [dbo].[Atz_Prd] CHECK CONSTRAINT [FK_Atz_Prd_Log_Itg]
GO
/****** Object:  ForeignKey [FK_Atz_Med_Atz_Cns]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Prf]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Med_Atz_Cns] FOREIGN KEY([Prf_IdCns])
REFERENCES [dbo].[Atz_Cns] ([IdCns])
GO
ALTER TABLE [dbo].[Atz_Prf] CHECK CONSTRAINT [FK_Atz_Med_Atz_Cns]
GO
/****** Object:  ForeignKey [FK_Atz_Med_Atz_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Prf]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Med_Atz_Usr] FOREIGN KEY([Prf_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_Prf] CHECK CONSTRAINT [FK_Atz_Med_Atz_Usr]
GO
/****** Object:  ForeignKey [FK_Atz_PrfEspLcr_Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_PrfEspLcr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Esp] FOREIGN KEY([Pel_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_PrfEspLcr] CHECK CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Esp]
GO
/****** Object:  ForeignKey [FK_Atz_PrfEspLcr_Atz_Lcr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_PrfEspLcr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Lcr] FOREIGN KEY([Pel_IdLcr])
REFERENCES [dbo].[Atz_Lcr] ([IdLcr])
GO
ALTER TABLE [dbo].[Atz_PrfEspLcr] CHECK CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Lcr]
GO
/****** Object:  ForeignKey [FK_Atz_PrfEspLcr_Atz_Prf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_PrfEspLcr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Prf] FOREIGN KEY([Pel_IdPrf])
REFERENCES [dbo].[Atz_Prf] ([IdPrf])
GO
ALTER TABLE [dbo].[Atz_PrfEspLcr] CHECK CONSTRAINT [FK_Atz_PrfEspLcr_Atz_Prf]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_Bnf] FOREIGN KEY([Sol_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_Bnf]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_CttEnd] FOREIGN KEY([Sol_IdCtt], [Sol_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_Esp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH CHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_Esp] FOREIGN KEY([Sol_IdEsp])
REFERENCES [dbo].[Atz_Esp] ([IdEsp])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_Esp]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_Gia]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_Gia] FOREIGN KEY([Sol_IdGia])
REFERENCES [dbo].[Atz_Gia] ([IdGia])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_Gia]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_PrfSol]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_PrfSol] FOREIGN KEY([Sol_IdPrfSol])
REFERENCES [dbo].[Atz_Prf] ([IdPrf])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_PrfSol]
GO
/****** Object:  ForeignKey [FK_Atz_Sol_Atz_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_Sol]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Sol_Atz_Usr] FOREIGN KEY([Sol_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_Sol] CHECK CONSTRAINT [FK_Atz_Sol_Atz_Usr]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdm_Atz_Msg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_SolPdm_Atz_Msg] FOREIGN KEY([Spd_IdMsg])
REFERENCES [dbo].[Atz_Msg___] ([IdMsg])
GO
ALTER TABLE [dbo].[Atz_SolPdm] CHECK CONSTRAINT [FK_Atz_SolPdm_Atz_Msg]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdm_Atz_Pdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_SolPdm_Atz_Pdm] FOREIGN KEY([Spd_IdPdm])
REFERENCES [dbo].[Atz_Pdm] ([IdPdm])
GO
ALTER TABLE [dbo].[Atz_SolPdm] CHECK CONSTRAINT [FK_Atz_SolPdm_Atz_Pdm]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdm_Atz_Sit]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdm]  WITH CHECK ADD  CONSTRAINT [FK_Atz_SolPdm_Atz_Sit] FOREIGN KEY([Spd_IdSit])
REFERENCES [dbo].[Atz_Sit] ([IdSit])
GO
ALTER TABLE [dbo].[Atz_SolPdm] CHECK CONSTRAINT [FK_Atz_SolPdm_Atz_Sit]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdm_Atz_Sol]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdm]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_SolPdm_Atz_Sol] FOREIGN KEY([Spd_IdSol])
REFERENCES [dbo].[Atz_Sol] ([IdSol])
GO
ALTER TABLE [dbo].[Atz_SolPdm] CHECK CONSTRAINT [FK_Atz_SolPdm_Atz_Sol]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdmAud_Atz_Sit]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdmAud]  WITH CHECK ADD  CONSTRAINT [FK_Atz_SolPdmAud_Atz_Sit] FOREIGN KEY([Spa_IdSit])
REFERENCES [dbo].[Atz_Sit] ([IdSit])
GO
ALTER TABLE [dbo].[Atz_SolPdmAud] CHECK CONSTRAINT [FK_Atz_SolPdmAud_Atz_Sit]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdmAud_Atz_SolPdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdmAud]  WITH CHECK ADD  CONSTRAINT [FK_Atz_SolPdmAud_Atz_SolPdm] FOREIGN KEY([Spa_IdSol], [Spa_IdPdm])
REFERENCES [dbo].[Atz_SolPdm] ([Spd_IdSol], [Spd_IdPdm])
GO
ALTER TABLE [dbo].[Atz_SolPdmAud] CHECK CONSTRAINT [FK_Atz_SolPdmAud_Atz_SolPdm]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdmAud_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdmAud]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_SolPdmAud_Sgn_Usr] FOREIGN KEY([Spa_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_SolPdmAud] CHECK CONSTRAINT [FK_Atz_SolPdmAud_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdmMsg_Atz_Msg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdmMsg]  WITH CHECK ADD  CONSTRAINT [FK_Atz_SolPdmMsg_Atz_Msg] FOREIGN KEY([Spm_IdMsg])
REFERENCES [dbo].[Atz_Msg___] ([IdMsg])
GO
ALTER TABLE [dbo].[Atz_SolPdmMsg] CHECK CONSTRAINT [FK_Atz_SolPdmMsg_Atz_Msg]
GO
/****** Object:  ForeignKey [FK_Atz_SolPdmMsg_Atz_SolPdm]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_SolPdmMsg]  WITH CHECK ADD  CONSTRAINT [FK_Atz_SolPdmMsg_Atz_SolPdm] FOREIGN KEY([Spm_IdSol], [Spm_IdPdm])
REFERENCES [dbo].[Atz_SolPdm] ([Spd_IdSol], [Spd_IdPdm])
GO
ALTER TABLE [dbo].[Atz_SolPdmMsg] CHECK CONSTRAINT [FK_Atz_SolPdmMsg_Atz_SolPdm]
GO
/****** Object:  ForeignKey [FK_Atz_UsrCttEnd_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_UsrCttEnd]  WITH CHECK ADD  CONSTRAINT [FK_Atz_UsrCttEnd_Atz_CttEnd] FOREIGN KEY([Uce_IdCtt], [Uce_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Atz_UsrCttEnd] CHECK CONSTRAINT [FK_Atz_UsrCttEnd_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Atz_UsrCttEnd_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Atz_UsrCttEnd]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_UsrCttEnd_Sgn_Usr] FOREIGN KEY([Uce_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Atz_UsrCttEnd] CHECK CONSTRAINT [FK_Atz_UsrCttEnd_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Eml_GrpUsr_Eml_Grp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Eml_GrpUsr]  WITH CHECK ADD  CONSTRAINT [FK_Eml_GrpUsr_Eml_Grp] FOREIGN KEY([Gpu_IdGrp])
REFERENCES [dbo].[Eml_Grp] ([IdGrp])
GO
ALTER TABLE [dbo].[Eml_GrpUsr] CHECK CONSTRAINT [FK_Eml_GrpUsr_Eml_Grp]
GO
/****** Object:  ForeignKey [FK_Eml_GrpUsr_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Eml_GrpUsr]  WITH CHECK ADD  CONSTRAINT [FK_Eml_GrpUsr_Sgn_Usr] FOREIGN KEY([Gpu_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Eml_GrpUsr] CHECK CONSTRAINT [FK_Eml_GrpUsr_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Fat_Fch_Atz_Ctt]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Fat_Fch]  WITH CHECK ADD  CONSTRAINT [FK_Fat_Fch_Atz_Ctt] FOREIGN KEY([Fch_IdCtt])
REFERENCES [dbo].[Atz_Ctt] ([IdCtt])
GO
ALTER TABLE [dbo].[Fat_Fch] CHECK CONSTRAINT [FK_Fat_Fch_Atz_Ctt]
GO
/****** Object:  ForeignKey [FK_Fat_Fch_Cad_Ope]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Fat_Fch]  WITH CHECK ADD  CONSTRAINT [FK_Fat_Fch_Cad_Ope] FOREIGN KEY([Fch_IdOpe])
REFERENCES [dbo].[Cad_Ope] ([IdOpe])
GO
ALTER TABLE [dbo].[Fat_Fch] CHECK CONSTRAINT [FK_Fat_Fch_Cad_Ope]
GO
/****** Object:  ForeignKey [FK_Sgn_Atr_Sgn_Pag]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Atr]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_Atr_Sgn_Pag] FOREIGN KEY([Atr_IdPag])
REFERENCES [dbo].[Sgn_Pag] ([IdPag])
GO
ALTER TABLE [dbo].[Sgn_Atr] CHECK CONSTRAINT [FK_Sgn_Atr_Sgn_Pag]
GO
/****** Object:  ForeignKey [FK_Sgn_AtrUsr_Sgn_Atr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_AtrUsr]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_AtrUsr_Sgn_Atr] FOREIGN KEY([Atu_IdAtr])
REFERENCES [dbo].[Sgn_Atr] ([IdAtr])
GO
ALTER TABLE [dbo].[Sgn_AtrUsr] CHECK CONSTRAINT [FK_Sgn_AtrUsr_Sgn_Atr]
GO
/****** Object:  ForeignKey [FK_Sgn_AtrUsr_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_AtrUsr]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_AtrUsr_Sgn_Usr] FOREIGN KEY([Atu_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Sgn_AtrUsr] CHECK CONSTRAINT [FK_Sgn_AtrUsr_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Sgn_BioBnf_Atz_Bnf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_BioBnf]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_BioBnf_Atz_Bnf] FOREIGN KEY([Bbf_IdBnf])
REFERENCES [dbo].[Atz_Bnf] ([IdBnf])
GO
ALTER TABLE [dbo].[Sgn_BioBnf] CHECK CONSTRAINT [FK_Sgn_BioBnf_Atz_Bnf]
GO
/****** Object:  ForeignKey [FK_Sgn_BioBnf_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_BioBnf]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_BioBnf_Sgn_Usr] FOREIGN KEY([Bbf_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Sgn_BioBnf] CHECK CONSTRAINT [FK_Sgn_BioBnf_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Sgn_BioPrf_Atz_CttEnd]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_BioPrf]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_BioPrf_Atz_CttEnd] FOREIGN KEY([Bpf_IdCtt], [Bpf_SeqEnd])
REFERENCES [dbo].[Atz_CttEnd] ([Cte_IdCtt], [Cte_SeqEnd])
GO
ALTER TABLE [dbo].[Sgn_BioPrf] CHECK CONSTRAINT [FK_Sgn_BioPrf_Atz_CttEnd]
GO
/****** Object:  ForeignKey [FK_Sgn_BioPrf_Atz_Prf]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_BioPrf]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_BioPrf_Atz_Prf] FOREIGN KEY([Bpf_IdPrf])
REFERENCES [dbo].[Atz_Prf] ([IdPrf])
GO
ALTER TABLE [dbo].[Sgn_BioPrf] CHECK CONSTRAINT [FK_Sgn_BioPrf_Atz_Prf]
GO
/****** Object:  ForeignKey [FK_Sgn_BioPrf_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_BioPrf]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_BioPrf_Sgn_Usr] FOREIGN KEY([Bpf_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Sgn_BioPrf] CHECK CONSTRAINT [FK_Sgn_BioPrf_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpAtr_Sgn_Atr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpAtr]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpAtr_Sgn_Atr] FOREIGN KEY([Gat_IdAtr])
REFERENCES [dbo].[Sgn_Atr] ([IdAtr])
GO
ALTER TABLE [dbo].[Sgn_GrpAtr] CHECK CONSTRAINT [FK_Sgn_GrpAtr_Sgn_Atr]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpAtr_Sgn_Grp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpAtr]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpAtr_Sgn_Grp] FOREIGN KEY([Gat_IdGrp])
REFERENCES [dbo].[Sgn_Grp] ([IdGrp])
GO
ALTER TABLE [dbo].[Sgn_GrpAtr] CHECK CONSTRAINT [FK_Sgn_GrpAtr_Sgn_Grp]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpMsg_Ans_Msg]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpMsg]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpMsg_Ans_Msg] FOREIGN KEY([Grm_IdMsg])
REFERENCES [dbo].[Ans_Msg] ([IdMsg])
GO
ALTER TABLE [dbo].[Sgn_GrpMsg] CHECK CONSTRAINT [FK_Sgn_GrpMsg_Ans_Msg]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpMsg_aspnet_Roles]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpMsg]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpMsg_aspnet_Roles] FOREIGN KEY([Grm_RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Sgn_GrpMsg] CHECK CONSTRAINT [FK_Sgn_GrpMsg_aspnet_Roles]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpMsg_Cad_Ope]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpMsg]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpMsg_Cad_Ope] FOREIGN KEY([Grm_IdOpe])
REFERENCES [dbo].[Cad_Ope] ([IdOpe])
GO
ALTER TABLE [dbo].[Sgn_GrpMsg] CHECK CONSTRAINT [FK_Sgn_GrpMsg_Cad_Ope]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpPagAca_Sgn_Grp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpPagAca]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpPagAca_Sgn_Grp] FOREIGN KEY([Gpa_IdGrp])
REFERENCES [dbo].[Sgn_Grp] ([IdGrp])
GO
ALTER TABLE [dbo].[Sgn_GrpPagAca] CHECK CONSTRAINT [FK_Sgn_GrpPagAca_Sgn_Grp]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpPagAca_Sgn_PagAca]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpPagAca]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_GrpPagAca_Sgn_PagAca] FOREIGN KEY([Gpa_IdPag], [Gpa_IdAca])
REFERENCES [dbo].[Sgn_PagAca] ([Pga_IdPag], [Pga_IdAca])
GO
ALTER TABLE [dbo].[Sgn_GrpPagAca] CHECK CONSTRAINT [FK_Sgn_GrpPagAca_Sgn_PagAca]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpUsr_Sgn_Grp]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpUsr]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_GrpUsr_Sgn_Grp] FOREIGN KEY([Gpu_IdGrp])
REFERENCES [dbo].[Sgn_Grp] ([IdGrp])
GO
ALTER TABLE [dbo].[Sgn_GrpUsr] CHECK CONSTRAINT [FK_Sgn_GrpUsr_Sgn_Grp]
GO
/****** Object:  ForeignKey [FK_Sgn_GrpUsr_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_GrpUsr]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_GrpUsr_Sgn_Usr] FOREIGN KEY([Gpu_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Sgn_GrpUsr] CHECK CONSTRAINT [FK_Sgn_GrpUsr_Sgn_Usr]
GO
/****** Object:  ForeignKey [FK_Sgn_Pag_Sgn_Mod]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Pag]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_Pag_Sgn_Mod] FOREIGN KEY([Pag_IdMod])
REFERENCES [dbo].[Sgn_Mod] ([IdMod])
GO
ALTER TABLE [dbo].[Sgn_Pag] CHECK CONSTRAINT [FK_Sgn_Pag_Sgn_Mod]
GO
/****** Object:  ForeignKey [FK_Sgn_PagAca_Sgn_Aca]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_PagAca]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_PagAca_Sgn_Aca] FOREIGN KEY([Pga_IdAca])
REFERENCES [dbo].[Sgn_Aca] ([IdAca])
GO
ALTER TABLE [dbo].[Sgn_PagAca] CHECK CONSTRAINT [FK_Sgn_PagAca_Sgn_Aca]
GO
/****** Object:  ForeignKey [FK_Sgn_PagAca_Sgn_Pag]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_PagAca]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_PagAca_Sgn_Pag] FOREIGN KEY([Pga_IdPag])
REFERENCES [dbo].[Sgn_Pag] ([IdPag])
GO
ALTER TABLE [dbo].[Sgn_PagAca] CHECK CONSTRAINT [FK_Sgn_PagAca_Sgn_Pag]
GO
/****** Object:  ForeignKey [FK_Atz_Usr_aspnet_Users]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Usr]  WITH NOCHECK ADD  CONSTRAINT [FK_Atz_Usr_aspnet_Users] FOREIGN KEY([Usr_UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Sgn_Usr] CHECK CONSTRAINT [FK_Atz_Usr_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_Sgn_Usr_Sgn_Ppl]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_Usr]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_Usr_Sgn_Ppl] FOREIGN KEY([Usr_IdPpl])
REFERENCES [dbo].[Sgn_Ppl] ([IdPpl])
GO
ALTER TABLE [dbo].[Sgn_Usr] CHECK CONSTRAINT [FK_Sgn_Usr_Sgn_Ppl]
GO
/****** Object:  ForeignKey [FK_Sgn_UsrPagAca_Sgn_PagAca]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_UsrPagAca]  WITH CHECK ADD  CONSTRAINT [FK_Sgn_UsrPagAca_Sgn_PagAca] FOREIGN KEY([Upa_IdPag], [Upa_IdAca])
REFERENCES [dbo].[Sgn_PagAca] ([Pga_IdPag], [Pga_IdAca])
GO
ALTER TABLE [dbo].[Sgn_UsrPagAca] CHECK CONSTRAINT [FK_Sgn_UsrPagAca_Sgn_PagAca]
GO
/****** Object:  ForeignKey [FK_Sgn_UsrPagAca_Sgn_Usr]    Script Date: 12/18/2012 09:48:33 ******/
ALTER TABLE [dbo].[Sgn_UsrPagAca]  WITH NOCHECK ADD  CONSTRAINT [FK_Sgn_UsrPagAca_Sgn_Usr] FOREIGN KEY([Upa_IdUsr])
REFERENCES [dbo].[Sgn_Usr] ([IdUsr])
GO
ALTER TABLE [dbo].[Sgn_UsrPagAca] CHECK CONSTRAINT [FK_Sgn_UsrPagAca_Sgn_Usr]
GO
