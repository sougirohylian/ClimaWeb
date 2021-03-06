USE [master]
GO
/****** Object:  Database [ClimaWebApp]    Script Date: 24/04/2021 16:54:00 ******/
CREATE DATABASE [ClimaWebApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClimaWebApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DBRISK\MSSQL\DATA\ClimaWebApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClimaWebApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DBRISK\MSSQL\DATA\ClimaWebApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClimaWebApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClimaWebApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClimaWebApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClimaWebApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClimaWebApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClimaWebApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClimaWebApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClimaWebApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClimaWebApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClimaWebApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClimaWebApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClimaWebApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClimaWebApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClimaWebApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClimaWebApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClimaWebApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClimaWebApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClimaWebApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClimaWebApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClimaWebApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClimaWebApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClimaWebApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClimaWebApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClimaWebApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClimaWebApp] SET RECOVERY FULL 
GO
ALTER DATABASE [ClimaWebApp] SET  MULTI_USER 
GO
ALTER DATABASE [ClimaWebApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClimaWebApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClimaWebApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClimaWebApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClimaWebApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClimaWebApp', N'ON'
GO
ALTER DATABASE [ClimaWebApp] SET QUERY_STORE = OFF
GO
USE [ClimaWebApp]
GO
/****** Object:  Schema [auditoria]    Script Date: 24/04/2021 16:54:00 ******/
CREATE SCHEMA [auditoria]
GO
/****** Object:  Schema [clima]    Script Date: 24/04/2021 16:54:00 ******/
CREATE SCHEMA [clima]
GO
/****** Object:  Schema [seguridad]    Script Date: 24/04/2021 16:54:00 ******/
CREATE SCHEMA [seguridad]
GO
/****** Object:  Schema [ubicacion]    Script Date: 24/04/2021 16:54:00 ******/
CREATE SCHEMA [ubicacion]
GO
/****** Object:  Table [clima].[Clima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clima].[Clima](
	[IdClima] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[grados] [nchar](10) NULL,
	[IdCiudad] [numeric](18, 0) NULL,
	[IdEstado] [numeric](18, 0) NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
 CONSTRAINT [PK_Clima] PRIMARY KEY CLUSTERED 
(
	[IdClima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clima].[EstadoClima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clima].[EstadoClima](
	[IdEstado] [numeric](18, 0) NOT NULL,
	[Nombre] [nvarchar](400) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
 CONSTRAINT [PK_EstadoClima] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Roles]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Roles](
	[IdRol] [numeric](18, 0) NOT NULL,
	[Nombre] [nvarchar](400) NULL,
	[Descripcion] [nvarchar](800) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [seguridad].[Usuarios]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [seguridad].[Usuarios](
	[IdUsuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Usuario] [nvarchar](400) NULL,
	[Password] [nvarchar](max) NULL,
	[IdRol] [numeric](18, 0) NULL,
	[FechaCreacion] [datetime] NULL,
	[Estado] [bit] NULL,
	[Login] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [ubicacion].[Ciudades]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ubicacion].[Ciudades](
	[IdPais] [numeric](18, 0) NOT NULL,
	[IdDepartamento] [numeric](18, 0) NULL,
	[Nombre] [nvarchar](500) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ubicacion].[Departamentos]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ubicacion].[Departamentos](
	[IdDepartamento] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IdPais] [numeric](18, 0) NULL,
	[Nombre] [nvarchar](500) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[IdDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ubicacion].[Pais]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ubicacion].[Pais](
	[IdPais] [numeric](18, 0) NOT NULL,
	[Nombre] [nvarchar](500) NULL,
	[UsuarioCreacion] [nvarchar](400) NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [clima].[Clima] ON 

INSERT [clima].[Clima] ([IdClima], [grados], [IdCiudad], [IdEstado], [FechaCreacion], [UsuarioCreacion]) VALUES (CAST(1 AS Numeric(18, 0)), N'15        ', CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(N'2021-04-24T09:50:43.510' AS DateTime), N'Admin')
INSERT [clima].[Clima] ([IdClima], [grados], [IdCiudad], [IdEstado], [FechaCreacion], [UsuarioCreacion]) VALUES (CAST(3 AS Numeric(18, 0)), N'20        ', CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(N'2021-04-24T15:01:38.200' AS DateTime), N'Admin')
SET IDENTITY_INSERT [clima].[Clima] OFF
INSERT [seguridad].[Roles] ([IdRol], [Nombre], [Descripcion], [FechaCreacion], [UsuarioCreacion]) VALUES (CAST(1 AS Numeric(18, 0)), N'Administrador', N'Administra el sistema', CAST(N'2021-04-24T12:17:32.767' AS DateTime), N'Admin')
SET IDENTITY_INSERT [seguridad].[Usuarios] ON 

INSERT [seguridad].[Usuarios] ([IdUsuario], [Usuario], [Password], [IdRol], [FechaCreacion], [Estado], [Login]) VALUES (CAST(1 AS Numeric(18, 0)), N'Admin', N'abc123', CAST(1 AS Numeric(18, 0)), CAST(N'2021-04-24T12:17:49.660' AS DateTime), 1, 0)
SET IDENTITY_INSERT [seguridad].[Usuarios] OFF
/****** Object:  StoredProcedure [clima].[DelClima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Restrepo
-- Create date: 24-04-2021
-- Description:	Eliminacion de Clima
-- =============================================
CREATE PROCEDURE [clima].[DelClima] 
	@IdClima numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

DELETE FROM [clima].[Clima]
      WHERE IdClima = @IdClima



END
GO
/****** Object:  StoredProcedure [clima].[InsClima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Restrepo
-- Create date: 23-04-2021
-- Description:	Insercion de Clima
-- =============================================
CREATE PROCEDURE [clima].[InsClima] 
	-- Add the parameters for the stored procedure here
	@grados nchar(10), 
	@IdCiudad numeric(18,0),
	@IdEstado numeric(18,0),
	@User nvarchar(400)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
INSERT INTO [clima].[Clima]
           ([grados]
           ,[IdCiudad]
           ,[IdEstado]
           ,[FechaCreacion]
           ,[UsuarioCreacion])
     VALUES
           (@grados
           ,@IdCiudad
           ,@IdEstado
           ,GETDATE()
           ,@User)


END
GO
/****** Object:  StoredProcedure [clima].[SelClima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Restrepo
-- Create date: 24-04-2021
-- Description:	Consulta de Clima
-- =============================================
CREATE PROCEDURE [clima].[SelClima] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

SELECT [IdClima]
      ,[grados]
      ,[IdCiudad]
      ,[IdEstado]
      ,[FechaCreacion]
      ,[UsuarioCreacion]
  FROM [clima].[Clima]


END
GO
/****** Object:  StoredProcedure [clima].[UpsClima]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Restrepo
-- Create date: 24-04-2021
-- Description:	Actualización de Clima
-- =============================================
CREATE PROCEDURE [clima].[UpsClima] 
	-- Add the parameters for the stored procedure here
	@grados nchar(10), 
	@IdCiudad numeric(18,0),
	@IdEstado numeric(18,0),
	@IdClima numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
UPDATE [clima].[Clima]
   SET [grados] = @grados
      ,[IdCiudad] = @IdCiudad
      ,[IdEstado] = @IdEstado
 WHERE IdClima = @IdClima



END
GO
/****** Object:  StoredProcedure [seguridad].[SelLogin]    Script Date: 24/04/2021 16:54:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Restrepo
-- Create date: 24-04-2021
-- Description:	Consulta Usuarios para Login
-- =============================================
CREATE PROCEDURE [seguridad].[SelLogin] 
	@User nvarchar(400),
	@Pass nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here

SELECT [IdUsuario]
      ,[Usuario]
      ,[Password]
      ,[IdRol]
      ,[FechaCreacion]
      ,[Estado]
      ,[Login]
  FROM [seguridad].[Usuarios]
where Usuario =  @User and Password = @Pass



END
GO
USE [master]
GO
ALTER DATABASE [ClimaWebApp] SET  READ_WRITE 
GO
