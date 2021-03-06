USE [master]
GO
/****** Object:  Database [rtm]    Script Date: 24/11/2021 10:00:07 a. m. ******/
CREATE DATABASE [rtm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rtm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\rtm.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rtm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\rtm_log.ldf' , SIZE = 1122304KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [rtm] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rtm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rtm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rtm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rtm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rtm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rtm] SET ARITHABORT OFF 
GO
ALTER DATABASE [rtm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rtm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rtm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rtm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rtm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rtm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rtm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rtm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rtm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rtm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rtm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rtm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rtm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rtm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rtm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rtm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rtm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rtm] SET RECOVERY FULL 
GO
ALTER DATABASE [rtm] SET  MULTI_USER 
GO
ALTER DATABASE [rtm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rtm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rtm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rtm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rtm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [rtm] SET QUERY_STORE = OFF
GO
USE [rtm]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [rtm]
GO
/****** Object:  User [Mawi]    Script Date: 24/11/2021 10:00:07 a. m. ******/
CREATE USER [Mawi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Mawi]
GO
/****** Object:  Table [dbo].[AgenteSupervisor]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgenteSupervisor](
	[AgenteSupervisorId] [int] IDENTITY(1,1) NOT NULL,
	[AgenteId] [int] NOT NULL,
	[SupervisorId] [int] NOT NULL,
 CONSTRAINT [PK_AgenteSupervisor] PRIMARY KEY CLUSTERED 
(
	[AgenteSupervisorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campania]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campania](
	[Campania_intId] [int] IDENTITY(1,1) NOT NULL,
	[Campania_strNombre] [nvarchar](50) NULL,
	[Campania_bitEsActivo] [bit] NULL,
	[Campania_strCreadoPor] [nvarchar](50) NULL,
	[Campania_dateFechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Campania] PRIMARY KEY CLUSTERED 
(
	[Campania_intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ChatId] [int] IDENTITY(1,1) NOT NULL,
	[UserId_1] [int] NOT NULL,
	[UserId_2] [int] NOT NULL,
	[ChatLastMessageId] [int] NULL,
	[ChatVisibleForUser1] [int] NOT NULL,
	[ChatVisibleForUser2] [int] NOT NULL,
	[ChatLastUpdate] [datetime] NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[EstadosId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[EstadosIdCat] [int] NULL,
	[FechaComienzo] [datetime] NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[EstadosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosIdCat]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosIdCat](
	[EstadosIdCat_Id] [int] IDENTITY(1,1) NOT NULL,
	[EstadosIdCat_Name] [nvarchar](50) NULL,
	[EstadosIdCat_EsActivo] [bit] NULL,
	[EstadosIdCat_FechaCreacion] [datetime] NULL,
	[EstadosIdCat_FechaModificacion] [datetime] NULL,
	[EstadosIdCat_CreadoPor] [nvarchar](50) NULL,
	[EstadosIdCat_ModificadoPor] [nvarchar](50) NULL,
 CONSTRAINT [PK_EstadosIdCat] PRIMARY KEY CLUSTERED 
(
	[EstadosIdCat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageContent] [nvarchar](max) NULL,
	[MessageFile] [nvarchar](50) NULL,
	[MessageFecha] [datetime] NOT NULL,
	[MessageUserTo] [int] NOT NULL,
	[MessageUserFrom] [int] NOT NULL,
	[ChatId] [int] NULL,
	[MessageOpened] [bit] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[ComienzoDeSession] [datetime] NULL,
	[FinDeSession] [datetime] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[Supervisor_intId] [int] IDENTITY(1,1) NOT NULL,
	[Supervisor_strNombre] [nvarchar](50) NULL,
	[Supervisor_bitEsActivo] [bit] NULL,
	[Supervisor_strCreadoPor] [nvarchar](50) NULL,
	[Supervisor_strModificadoPor] [nvarchar](50) NULL,
	[Supervisor_strEliminadoPor] [nvarchar](50) NULL,
	[Supervisor_dateCreadoPor] [datetime] NULL,
	[Supervisor_dateModificadoPor] [datetime] NULL,
	[Supervisor_dateEliminadoPor] [datetime] NULL,
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[Supervisor_intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposUsuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario_intId] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_strNombreUsuario] [nvarchar](50) NULL,
	[Usuario_strNombreCompleto] [nvarchar](50) NULL,
	[Usuario_strPassword] [nvarchar](50) NULL,
	[Usuario_bitActivo] [bit] NULL,
	[Usuario_strUsuarioAlta] [nvarchar](50) NULL,
	[Usuario_strUsuarioMod] [nvarchar](50) NULL,
	[Usuario_strUsuarioBaja] [nvarchar](50) NULL,
	[Usuario_dateUsuarioAlta] [datetime] NULL,
	[Usuario_dateUsuarioMod] [datetime] NULL,
	[Usuario_dateUsuarioBaja] [datetime] NULL,
	[Usuario_intVccId] [int] NULL,
	[Usuario_intCampañaId] [int] NULL,
	[Usuario_intSupervisorId] [int] NULL,
	[Usuario_imgFoto] [image] NULL,
	[Usuario_tipoUsuario] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario_intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VCC]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VCC](
	[VccId] [int] IDENTITY(1,1) NOT NULL,
	[VccAcronimo] [nvarchar](50) NOT NULL,
	[VccNombre] [nvarchar](50) NOT NULL,
	[VccRfc] [nchar](13) NULL,
	[VccTelefonos] [nvarchar](max) NULL,
	[VccKam] [int] NULL,
	[VccDireccion] [nvarchar](max) NULL,
	[VccEmails] [varchar](max) NULL,
	[VccIdUsuarioAlta] [int] NULL,
	[VccDateAlta] [datetime] NULL,
	[VccIdUsuarioMod] [int] NULL,
	[VccDateMod] [datetime] NULL,
	[VccIdUsuarioBaja] [int] NULL,
	[VccDateBaja] [datetime] NULL,
	[VccPolizasAgentes] [int] NULL,
	[VccPolizasSupervisores] [int] NULL,
	[VccPolizasAdministradores] [int] NULL,
	[VccIsActive] [bit] NULL,
 CONSTRAINT [PK_VCC] PRIMARY KEY CLUSTERED 
(
	[VccId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_EstadosIdCat]    Script Date: 24/11/2021 10:00:07 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_EstadosIdCat] ON [dbo].[EstadosIdCat]
(
	[EstadosIdCat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VCC] ADD  CONSTRAINT [DF_VCC_VccIsActive]  DEFAULT ((0)) FOR [VccIsActive]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Usuario_intId])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[AsignarSupervisor]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 06/09/2021
-- Description:	SP para asignar un supervisor a un agente
-- =============================================
CREATE PROCEDURE [dbo].[AsignarSupervisor]
	-- Add the parameters for the stored procedure here
	@IdAgente INT, 
	@IdSupervisor INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO AgenteSupervisor (AgenteId, SupervisorId) VALUES (@IdAgente, @IdSupervisor);
END
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstado]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CambiarEstado]
	-- Add the parameters for the stored procedure here
	@IdUsuario int,
	@IdEstado int, 
	@FechaInicio datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Estados
	(UsuarioId, EstadosIdCat,FechaComienzo) 
	values 
	(@IdUsuario, @IdEstado, @FechaInicio)
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarExisteUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados>
-- Create date: 06/09/2021
-- Description:	procedimiento para comprobar la existencia de un usuario
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarExisteUsuario] 
	-- Add the parameters for the stored procedure here
	@nombreUsuario NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuario_strNombreUsuario FROM Usuarios WHERE Usuario_strNombreUsuario = @nombreUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarExisteVCC]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 22-11-2021
-- Description:	Procedimiento que verifica que un VCC no existe
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarExisteVCC]
	@Nombre NVARCHAR(MAX),
	@Acronimo NVARCHAR(MAX) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT VccNombre FROM VCC WHERE VccNombre = @Nombre OR VccAcronimo = @Acronimo;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[ConsultarUsuario]
	-- Add the parameters for the stored procedure here
	@nombreUsuario nvarchar(50),
	@password nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select Usuario_intId,
	Usuario_strNombreUsuario,
	Usuario_strNombreCompleto,
	Usuario_intVccId,
	Usuario_intCampañaId,
	Usuario_intSupervisorId,
	Usuario_imgFoto,
	Usuario_tipoUsuario from Usuarios 
	where Usuario_strNombreUsuario = @nombreUsuario and Usuario_strPassword = @password and Usuario_bitActivo=1
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioPorId]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie
-- Create date: 28/07/2021
-- Description:	Procedimiento para consultar la lista de usuarios en línea
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarUsuarioPorId]
@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP (1) Usuario_strNombreCompleto, Usuario_imgFoto from Usuarios WHERE Usuario_intId = @UserId and Usuario_bitActivo=1
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie
-- Create date: 28/07/2021
-- Description:	Procedimiento para consultar todos los usuarios
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select Usuario_intId,
	Usuario_strNombreUsuario,
	Usuario_strNombreCompleto,
	Usuario_intVccId,
	Usuario_intCampañaId,
	Usuario_intSupervisorId,
	Usuario_imgFoto,
	Usuario_tipoUsuario from Usuarios
	where Usuario_bitActivo= 1;
END
GO
/****** Object:  StoredProcedure [dbo].[CrearEstado]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- =============================================
CREATE PROCEDURE [dbo].[CrearEstado] 
	-- Add the parameters for the stored procedure here
	@UsuarioId int, 
	@EstadosIdCat int,
	@FechaFin datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
If Exists (Select @FechaFin)
begin
update Estados set FechaFin = @FechaFin where UsuarioId = @UsuarioId and EstadosIdCat = @EstadosIdCat
end
else
begin
insert into Estados (UsuarioId,EstadosIdCat,FechaComienzo,FechaFin) values(@UsuarioId,@EstadosIdCat,GETDATE(),null)
end

END
GO
/****** Object:  StoredProcedure [dbo].[CrearSession]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearSession]
@UsuarioId int,
@FechaTermino datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select @FechaTermino) 
BEGIN
update Session set FinDeSession = @FechaTermino where UsuarioId = @UsuarioId
END
ELSE
BEGIN
   insert into Session (UsuarioId,ComienzoDeSession,FinDeSession) values(@UsuarioId,GETDATE(),null)
END 
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados	
-- Create date: 18/11/2021
-- Description:	Procedimiento para eliminar un usuario
-- =============================================
CREATE PROCEDURE [dbo].[EliminarUsuario]
	-- Add the parameters for the stored procedure here
	@IdSupervisor INT , @IdUsuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Usuarios SET Usuario_bitActivo=0, Usuario_strUsuarioBaja=@IdSupervisor WHERE Usuario_intId = @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarVcc]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 19/11/2021
-- Description:	Procedimiento para crear un nuevo vcc
-- =============================================
CREATE PROCEDURE [dbo].[EliminarVcc]
	-- Add the parameters for the stored procedure here
	@IdUsuario INT,
	@IdVcc INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE VCC SET
		VccIdUsuarioBaja = @IdUsuario,
		VccDateBaja = GETDATE(),
		VccIsActive = 0
		WHERE
		VccId = @IdVcc
END
GO
/****** Object:  StoredProcedure [dbo].[GetAgentesPorSupervisor]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgentesPorSupervisor]
	-- Add the parameters for the stored procedure here
	@IdSupervisor INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ag.Usuario_intId, ag.Usuario_strNombreCompleto, ag.Usuario_imgFoto FROM
	AgenteSupervisor AS agsup INNER JOIN Usuarios AS ag 
	ON( agsup.AgenteId = ag.Usuario_intId)
	WHERE agsup.SupervisorId = @IdSupervisor and ag.Usuario_bitActivo=1;

END
GO
/****** Object:  StoredProcedure [dbo].[GetAlltimes]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 14/09/2021
-- Description:	SP para consultar los tiempos de todos los usuarios asignados a un supervisor en un intervalo de tiempo
-- =============================================
CREATE PROCEDURE [dbo].[GetAlltimes]
	-- Add the parameters for the stored procedure here
	@SupervisorId INT, @FechaInicio DATETIME, @FechaFin DATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT us.Usuario_intId, us.Usuario_strNombreUsuario, us.Usuario_strNombreCompleto, id.EstadosIdCat_Id,
id.EstadosIdCat_Name, edo.FechaComienzo
	FROM Estados AS edo
	inner JOIN EstadosIdCat as id ON (edo.EstadosIdCat = id.EstadosIdCat_Id)
	inner JOIN Usuarios as us on (us.Usuario_intId = edo.UsuarioId) 
	inner join AgenteSupervisor as age on (age.AgenteId = us.Usuario_intId)
  WHERE 
  us.Usuario_tipoUsuario = 1 AND
  age.SupervisorId = @SupervisorId AND
  edo.FechaComienzo BETWEEN @FechaInicio AND @FechaFin
  order by us.Usuario_intId, edo.FechaComienzo desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTimesPorUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 14/09/2021
-- Description:	SP para consultar los tiempos de todos los usuarios asignados a un supervisor en un intervalo de tiempo
-- =============================================
CREATE PROCEDURE [dbo].[GetAllTimesPorUsuario]
	-- Add the parameters for the stored procedure here
	@FechaInicio DATETIME, @FechaFin DATETIME, @AgenteId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT edo.EstadosIdCat,edo.FechaComienzo , id.EstadosIdCat_Name
	FROM Estados AS edo
  INNER JOIN estadosidcat as id on(id.EstadosIdCat_Id = edo.EstadosIdCat)
  WHERE 
  edo.FechaComienzo BETWEEN @FechaInicio AND @FechaFin AND
  edo.UsuarioId = @AgenteId 
  order by edo.FechaComienzo asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsuarios]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsuarios]
	@IdVcc INT
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Usuario_intId,Usuario_strNombreUsuario ,Usuario_strNombreCompleto, Usuario_tipoUsuario FROM Usuarios  
	WHERE Usuario_bitActivo = 1 and Usuario_intVccId = @IdVcc;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCampanias]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCampanias]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Campania;
END
GO
/****** Object:  StoredProcedure [dbo].[GetChat]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 29/07/2021
-- Description:	SP para obtener los chats de un usuario con su ID
-- =============================================
CREATE PROCEDURE [dbo].[GetChat]
	@ChatId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM
	dbo.Messages 
	where ChatId = @ChatId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetChatFirts10]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 29/07/2021
-- Description:	SP para obtener los chats de un usuario con su ID
-- =============================================
CREATE PROCEDURE [dbo].[GetChatFirts10]
	@ChatId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(10) *
	FROM
	dbo.Messages 
	where ChatId = @ChatId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetChatsPorUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 29/07/2021
-- Description:	SP para obtener los chats de un usuario con su ID
-- =============================================
CREATE PROCEDURE [dbo].[GetChatsPorUsuario]
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ch.ChatId, mess.MessageContent, mess.MessageFile,
			mess.MessageFecha, mess.MessageUserTo, mess.MessageUserFrom,
			mess.MessageId, mess.MessageOpened, ch.UserId_1,ch.UserId_2
	FROM
	dbo.Chats AS ch INNER JOIN dbo.Messages AS mess ON(ch.ChatLastMessageId = mess.MessageId)
	WHERE ch.UserId_1 = @UserId or ch.UserId_2 = @UserId ORDER BY ch.ChatLastUpdate desc;
END
GO
/****** Object:  StoredProcedure [dbo].[GetEstados]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEstados]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EstadosIdCat_Id, EstadosIdCat_Name, EstadosIdCat_EsActivo from EstadosIdCat;
END
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisores]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSupervisores]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Usuarios WHERE Usuario_tipoUsuario = 2 OR Usuario_tipoUsuario = 3;
END
GO
/****** Object:  StoredProcedure [dbo].[GetSupervisoresPorAgente]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSupervisoresPorAgente]
	-- Add the parameters for the stored procedure here
	@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SupervisorId from AgenteSupervisor where AgenteId= @UserId;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTiempoAcumulado]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTiempoAcumulado]
	-- Add the parameters for the stored procedure here
	@IdUsuario int,
	@Tiempo time, 
	@IdEstado int, 
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AgenteId from AgenteSupervisor where SupervisorId= @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[GetTimes]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTimes] 
	-- Add the parameters for the stored procedure here
	@idUsuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @fechaHoy AS date = getdate()
    -- Insert statements for procedure here
	SELECT e.EstadosIdCat, e.FechaComienzo, ei.EstadosIdCat_Name FROM 
	Estados AS e INNER JOIN EstadosIdCat as ei
	ON(e.EstadosIdCat = ei.EstadosIdCat_Id)
	WHERE e.UsuarioId = @idUsuario
	AND e.FechaComienzo >=@fechaHoy
	ORDER BY FechaComienzo DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetTiposUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 06/09/2021
-- Description:	Procedimiento para obtener los datos del catálogo TiposUsuario
-- =============================================
CREATE PROCEDURE [dbo].[GetTiposUsuario]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TiposUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[GetVCC]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetVCC]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT VccId
	,VccAcronimo
	,VccNombre	
	,VccRfc
	,VccTelefonos
	,VccKam
	,VccDireccion
	,VccEmails
	,VccPolizasAgentes
	,VccPolizasSupervisores
	,VccPolizasAdministradores
	from VCC where VccIsActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModificarUsuario]
	-- Add the parameters for the stored procedure here
	@NombreUsuario nvarchar(50),
	@NombreCompleto nvarchar(50),
	@Password nvarchar(50),
	@IdSupervisor int, 
	@IntVccId int,
	@IntCampañaId int,
	@ImgFoto image =null,
	@TipoUsuario int,
	@Supervisores NVARCHAR(MAX) = NULL,
	@Agentes NVARCHAR(MAX) = NULL,
	@IdUsuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [dbo].[Usuarios]
	SET [Usuario_strNombreUsuario] = @NombreUsuario
      ,[Usuario_strNombreCompleto] = @NombreCompleto
      ,[Usuario_strPassword] = @Password
      ,[Usuario_strUsuarioMod] = @IdSupervisor
      ,[Usuario_dateUsuarioMod] = GETDATE()
      ,[Usuario_intVccId] = @IntVccId
      ,[Usuario_intCampañaId] = @IntCampañaId
      ,[Usuario_imgFoto] = @ImgFoto
      ,[Usuario_tipoUsuario] = @TipoUsuario
	WHERE Usuario_intId = @IdUsuario;
	IF @Supervisores IS NOT NULL
	BEGIN
		DELETE FROM AgenteSupervisor WHERE AgenteId = @IdUsuario;
		DECLARE @Supervisor NVARCHAR(3);
		DECLARE @Posicion INT;
		--SET @Supervisores NVARCHAR(50) = '18|19|23|25|24|26|27|31|';
		WHILE patindex('%|%' , @Supervisores) <> 0
		--patindex busca un patron en una cadena y nos devuelve su posicion
		BEGIN
			SELECT @Posicion =  patindex('%|%' , @Supervisores);
			--Buscamos la posicion de la primera ,
			SELECT @Supervisor = left(@Supervisores, @Posicion - 1);
			--Y cogemos los caracteres hasta esa posicion
			INSERT INTO rtm.dbo.AgenteSupervisor (AgenteId, SupervisorId)values (@IdUsuario, @Supervisor);
			--y ese parámetro lo guardamos en la tabla temporal
			--Reemplazamos lo procesado con nada con la funcion stuff
			SELECT @Supervisores = stuff(@Supervisores, 1, @Posicion, '');
		END
	END
	IF @Agentes IS NOT NULL
	BEGIN
		DELETE FROM AgenteSupervisor WHERE SupervisorId = @IdUsuario;
		DECLARE @Agente NVARCHAR(3);
		DECLARE @PosicionAg INT;
		--SET @Supervisores NVARCHAR(50) = '18|19|23|25|24|26|27|31|';
		WHILE patindex('%|%' , @Agentes) <> 0
		--patindex busca un patron en una cadena y nos devuelve su posicion
		BEGIN
			SELECT @PosicionAg =  patindex('%|%' , @Agentes);
			--Buscamos la posicion de la primera ,
			SELECT @Agente = left(@Agentes, @PosicionAg - 1);
			--Y cogemos los caracteres hasta esa posicion
			INSERT INTO rtm.dbo.AgenteSupervisor (AgenteId, SupervisorId)values (@Agente, @IdUsuario);
			--y ese parámetro lo guardamos en la tabla temporal
			--Reemplazamos lo procesado con nada con la funcion stuff
			SELECT @Supervisores = stuff(@Agentes, 1, @PosicionAg, '');
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarVcc]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 19/11/2021
-- Description:	Procedimiento para crear un nuevo vcc
-- =============================================
CREATE PROCEDURE [dbo].[ModificarVcc]
	-- Add the parameters for the stored procedure here
	@IdUsuario INT,
	@Nombre NVARCHAR(MAX), 
	@Acronimo NVARCHAR(MAX),
	@RFC NVARCHAR(MAX) = NULL,
	@Direccion NVARCHAR(MAX) = NULL,
	@Telefonos NVARCHAR(MAX) = NULL,
	@Emails NVARCHAR(MAX) = NULL,
	@PolizasAgentes NVARCHAR(MAX),
	@PolizasSupervisores NVARCHAR(MAX),
	@PolizasAdministradores NVARCHAR(MAX),
	@Kams NVARCHAR(MAX),
	@IdVcc INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE VCC SET
		VccAcronimo = @Acronimo,
		VccNombre = @Nombre,
		VccRfc = @RFC,
		VccTelefonos = @Telefonos,
		VccKam = @Kams,
		VccDireccion = @Direccion,
		VccEmails = @Emails,
		VccIdUsuarioMod = @IdUsuario,
		VccDateMod = GETDATE(),
		VccPolizasAgentes = @PolizasAgentes,
		VccPolizasSupervisores = @PolizasSupervisores,
		VccPolizasAdministradores = @PolizasAdministradores
		WHERE
		VccId = @IdVcc
		and 
		VccIsActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[OpenChat]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 29/07/2021
-- Description:	SP para crear un nuevo chat
-- =============================================
CREATE PROCEDURE [dbo].[OpenChat]
	@User1 int, @User2 int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM Chats where ChatVisibleForUser1 = @User1 and ChatVisibleForUser2 = @User2)
		BEGIN
			SELECT ChatId FROM Chats where ChatVisibleForUser1 = @User1 and ChatVisibleForUser2 = @User2;
		END
	ELSE IF EXISTS(SELECT * FROM Chats where ChatVisibleForUser1 = @User2 and ChatVisibleForUser2 = @User1)
		BEGIN
			SELECT ChatId FROM Chats where ChatVisibleForUser1 = @User2 and ChatVisibleForUser2 = @User1
		END
	ELSE
		BEGIN
			INSERT INTO dbo.Chats (UserId_1, UserId_2, ChatVisibleForUser1, ChatVisibleForUser2, ChatLastUpdate) 
			VALUES (@User1, @User2, @User1, @User2, GETDATE());
			SELECT ChatId FROM Chats where ChatVisibleForUser1 = @User1 and ChatVisibleForUser2 = @User2;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[RegisterNewMessage]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Amelie Granados
-- Create date: 29/07/2021
-- Description:	SP para crear un nuevo mensaje
-- =============================================
CREATE PROCEDURE [dbo].[RegisterNewMessage]
	@ChatId int, @UserFrom int, @UserTo int, @Content nvarchar(MAX), @File nvarchar(50)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @FECHA datetime = GETDATE();
	INSERT INTO dbo.Messages (ChatId, MessageContent, MessageFile, MessageFecha, MessageUserFrom, MessageUserTo)
	values (@ChatId, @Content, @File,@FECHA , @UserFrom,  @UserTo);
	DECLARE @MessId INT;
	SELECT TOP(1) @MessId=MessageId FROM Messages ORDER BY MessageId DESC;
	UPDATE Chats SET ChatLastMessageId = @MessId WHERE ChatId = @ChatId;
	SELECT TOP(1) MessageId FROM Messages ORDER BY MessageId DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarAgente]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarAgente] 
	-- Add the parameters for the stored procedure here
	@Usuario_strNombreUsuario nvarchar(50),
	@Usuario_strNombreCompleto nvarchar(50),
	@Usuario_strPassword nvarchar(50),
	@Usuario_strUsuarioAlta nvarchar(50) = null,
	@Usuario_strUsuarioMod nvarchar(50) = null,
	@Usuario_strUsuarioBaja nvarchar(50) = null,	
	@Usuario_dateUsuarioMod datetime = null,
	@Usuario_dateUsuarioBaja datetime = null,
	@Usuario_intVccId int,
	@Usuario_intCampañaId int,
	@Usuario_intSupervisorId int,
	@Usuario_imgFoto image =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT Usuario_intId from Usuarios where Usuario_strNombreUsuario =  @Usuario_strNombreUsuario)
	BEGIN 
		SELECT Usuario_intId from Usuarios where Usuario_strNombreUsuario =  @Usuario_strNombreUsuario
	END
	ELSE
	BEGIN
    -- Insert statements for procedure here
		insert into Usuarios (Usuario_strNombreUsuario,
								Usuario_strNombreCompleto,
								Usuario_strPassword,
								Usuario_bitActivo,
								Usuario_strUsuarioAlta,
								Usuario_strUsuarioMod,
								Usuario_strUsuarioBaja,
								Usuario_dateUsuarioAlta,
								Usuario_dateUsuarioMod,
								Usuario_dateUsuarioBaja,
								Usuario_intVccId,
								Usuario_intCampañaId,
								Usuario_imgFoto)
		values(@Usuario_strNombreUsuario,
				@Usuario_strNombreCompleto,
				@Usuario_strPassword,
				1,
				@Usuario_strUsuarioAlta,
				@Usuario_strUsuarioMod,
				@Usuario_strUsuarioBaja,
				GETDATE(),
				@Usuario_dateUsuarioMod,
				@Usuario_dateUsuarioBaja,
				@Usuario_intVccId,
				@Usuario_intCampañaId,
				@Usuario_imgFoto);
		DECLARE @IdUsuario int ;
		SELECT top 1 @IdUsuario=Usuario_intId from Usuarios  order by Usuario_intId desc;
		INSERT INTO AgenteSupervisor
		(SupervisorId, AgenteId)
		VALUES (
			@Usuario_intSupervisorId , @IdUsuario
		)

	END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarEstado]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarEstado] 
	-- Add the parameters for the stored procedure here
	@UsuarioId int,
	@EstadosIdCat int,
	@FechaFin datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select @FechaFin)
	begin
	update Estados set FechaFin= @FechaFin where UsuarioId = @UsuarioId and EstadosIdCat = @EstadosIdCat 
	end
	ELSE
	begin 
	insert into Estados (UsuarioId,EstadosIdCat,FechaComienzo,FechaFin) values(@UsuarioId,@EstadosIdCat,GETDATE(),null);
	end
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarUsuario] 
	-- Add the parameters for the stored procedure here
	@Usuario_strNombreUsuario nvarchar(50),
	@Usuario_strNombreCompleto nvarchar(50),
	@Usuario_strPassword nvarchar(50),
	@Usuario_strUsuarioAlta nvarchar(50) = null,
	@Usuario_strUsuarioMod nvarchar(50) = null,
	@Usuario_strUsuarioBaja nvarchar(50) = null,	
	@Usuario_dateUsuarioMod datetime = null,
	@Usuario_dateUsuarioBaja datetime = null,
	@Usuario_intVccId int,
	@Usuario_intCampañaId int,
	@Usuario_imgFoto image =null,
	@TipoUsuario int,
	@Supervisores NVARCHAR(MAX) = NULL,
	@Agentes NVARCHAR(MAX) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT Usuario_intId from Usuarios where Usuario_strNombreUsuario =  @Usuario_strNombreUsuario)
	BEGIN 
		SELECT Usuario_intId from Usuarios where Usuario_strNombreUsuario =  @Usuario_strNombreUsuario
	END
	ELSE
	BEGIN
    -- Insert statements for procedure here
		insert into Usuarios (Usuario_strNombreUsuario,
								Usuario_strNombreCompleto,
								Usuario_strPassword,
								Usuario_bitActivo,
								Usuario_strUsuarioAlta,
								Usuario_strUsuarioMod,
								Usuario_strUsuarioBaja,
								Usuario_dateUsuarioAlta,
								Usuario_dateUsuarioMod,
								Usuario_dateUsuarioBaja,
								Usuario_intVccId,
								Usuario_intCampañaId,
								Usuario_imgFoto, 
								Usuario_tipoUsuario)
		values(@Usuario_strNombreUsuario,
				@Usuario_strNombreCompleto,
				@Usuario_strPassword,
				1,
				@Usuario_strUsuarioAlta,
				@Usuario_strUsuarioMod,
				@Usuario_strUsuarioBaja,
				GETDATE(),
				@Usuario_dateUsuarioMod,
				@Usuario_dateUsuarioBaja,
				@Usuario_intVccId,
				@Usuario_intCampañaId,
				@Usuario_imgFoto,
				@TipoUsuario);
		DECLARE @Usuario INT; 
		SELECT TOP(1) @Usuario = Usuario_intId from
		Usuarios WHERE 
		Usuario_strNombreUsuario = @Usuario_strNombreUsuario AND 
		Usuario_strPassword = @Usuario_strPassword;

		IF @Supervisores IS NOT NULL
		BEGIN
			DECLARE @Supervisor NVARCHAR(3);
			DECLARE @Posicion INT;
			--SET @Supervisores NVARCHAR(50) = '18|19|23|25|24|26|27|31|';
			WHILE patindex('%|%' , @Supervisores) <> 0
			--patindex busca un patron en una cadena y nos devuelve su posicion
			BEGIN
				SELECT @Posicion =  patindex('%|%' , @Supervisores);
				--Buscamos la posicion de la primera ,
				SELECT @Supervisor = left(@Supervisores, @Posicion - 1);
				--Y cogemos los caracteres hasta esa posicion
				INSERT INTO rtm.dbo.AgenteSupervisor (AgenteId, SupervisorId)values (@Usuario, @Supervisor);
				--y ese parámetro lo guardamos en la tabla temporal
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @Supervisores = stuff(@Supervisores, 1, @Posicion, '');
			END
		END
		IF @Agentes IS NOT NULL
		BEGIN
			DECLARE @Agente NVARCHAR(3);
			DECLARE @PosicionAg INT;
			--SET @Supervisores NVARCHAR(50) = '18|19|23|25|24|26|27|31|';
			WHILE patindex('%|%' , @Agentes) <> 0
			--patindex busca un patron en una cadena y nos devuelve su posicion
			BEGIN
				SELECT @PosicionAg =  patindex('%|%' , @Agentes);
				--Buscamos la posicion de la primera ,
				SELECT @Agente = left(@Agentes, @PosicionAg - 1);
				--Y cogemos los caracteres hasta esa posicion
				INSERT INTO rtm.dbo.AgenteSupervisor (AgenteId, SupervisorId)values (@Agente, @Usuario);
				--y ese parámetro lo guardamos en la tabla temporal
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @Supervisores = stuff(@Agentes, 1, @PosicionAg, '');
			END
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVcc]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarVcc]
	-- Add the parameters for the stored procedure here
	@IdUsuario INT,
	@Nombre NVARCHAR(MAX), 
	@Acronimo NVARCHAR(MAX),
	@RFC NVARCHAR(MAX) = NULL,
	@Direccion NVARCHAR(MAX) = NULL,
	@Telefonos NVARCHAR(MAX) = NULL,
	@Emails NVARCHAR(MAX) = NULL,
	@PolizasAgentes NVARCHAR(MAX),
	@PolizasSupervisores NVARCHAR(MAX),
	@PolizasAdministradores NVARCHAR(MAX),
	@Kams NVARCHAR(MAX) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO VCC (
		VccAcronimo, 
		VccNombre,
		VccRfc,
		VccTelefonos,
		VccKam,
		VccDireccion,
		VccEmails,
		VccIdUsuarioAlta,
		VccDateAlta,
		VccPolizasAgentes,
		VccPolizasSupervisores,
		VccPolizasAdministradores,
		VccIsActive
	) VALUES (
	@Acronimo,
	@Nombre,
	@RFC,
	@Telefonos,
	@Kams,
	@Direccion,
	@Emails,
	@IdUsuario,
	GETDATE(),
	@PolizasAgentes,
	@PolizasSupervisores,
	@PolizasAdministradores,
	1
	);
END
GO
/****** Object:  StoredProcedure [dbo].[SearchUser]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AMELIE GRANADOS	
-- Create date: 30/09/2021
-- Description:	PROCEDURE PARA REALIZAR LA BÚSQUEDA DE UN USUARIO CON CUALQUIER PARÁMETRO DE COINCIDENCIA
-- =============================================
CREATE PROCEDURE [dbo].[SearchUser]
	-- Add the parameters for the stored procedure here
	@SearchParam NVARCHAR(MAX), @IdSupervisor INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT us.Usuario_intId, us.Usuario_strNombreUsuario, 
	us.Usuario_strNombreCompleto, us.Usuario_imgFoto, us.Usuario_tipoUsuario ,
	cam.Campania_intId, cam.Campania_strNombre,
	vcc.VccId, vcc.VccNombre, tu.NombreTipoUser, us.Usuario_strPassword from Usuarios as us 
	INNER JOIN Campania AS cam ON(us.Usuario_intCampañaId = cam.Campania_intId)
	INNER JOIN VCC AS vcc ON(us.Usuario_intVccId = vcc.VccId)
	INNER JOIN TiposUsuario as tu on(tu.id = us.Usuario_tipoUsuario)
	INNER JOIN AgenteSupervisor AS ags ON(ags.AgenteId = us.Usuario_intId)
	WHERE 
		(us.Usuario_strNombreCompleto LIKE CONCAT('%',@SearchParam,'%')
		OR us.Usuario_strNombreUsuario LIKE  CONCAT('%',@SearchParam,'%')
		OR cam.Campania_strNombre LIKE  CONCAT('%',@SearchParam,'%')
		OR vcc.VccNombre LIKE  CONCAT('%',@SearchParam,'%') )
		AND
		ags.SupervisorId = @IdSupervisor
		AND US.Usuario_bitActivo = 1 ORDER BY us.Usuario_strNombreCompleto;

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMessageStat]    Script Date: 24/11/2021 10:00:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMessageStat] 
	-- Add the parameters for the stored procedure here
	@MesageId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Messages SET MessageOpened= 1 WHERE MessageId = @MesageId;
END
GO
USE [master]
GO
ALTER DATABASE [rtm] SET  READ_WRITE 
GO
