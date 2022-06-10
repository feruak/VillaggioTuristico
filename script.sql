USE [master]
GO
/****** Object:  Database [DbVillaggio]    Script Date: 09/06/2022 20:57:44 ******/
CREATE DATABASE [DbVillaggio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbVillaggio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbVillaggio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbVillaggio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DbVillaggio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbVillaggio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbVillaggio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbVillaggio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbVillaggio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbVillaggio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbVillaggio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbVillaggio] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbVillaggio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbVillaggio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbVillaggio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbVillaggio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbVillaggio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbVillaggio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbVillaggio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbVillaggio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbVillaggio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbVillaggio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbVillaggio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbVillaggio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbVillaggio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbVillaggio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbVillaggio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbVillaggio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbVillaggio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbVillaggio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbVillaggio] SET  MULTI_USER 
GO
ALTER DATABASE [DbVillaggio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbVillaggio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbVillaggio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbVillaggio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbVillaggio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbVillaggio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DbVillaggio] SET QUERY_STORE = OFF
GO
USE [DbVillaggio]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElencoCamere]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElencoCamere](
	[CAMERA] [int] NOT NULL,
	[TIPOLOGIA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ElencoCamere] PRIMARY KEY CLUSTERED 
(
	[CAMERA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElencoPeriodi]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElencoPeriodi](
	[PERIODO] [int] NOT NULL,
	[INIZIO] [date] NOT NULL,
	[FINE] [date] NOT NULL,
 CONSTRAINT [PK_ElencoPeriodi] PRIMARY KEY CLUSTERED 
(
	[PERIODO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElencoPrenotazioni]    Script Date: 09/06/2022 20:57:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElencoPrenotazioni](
	[PRENOTAZIONE] [nvarchar](50) NOT NULL,
	[UTENTE] [nvarchar](50) NOT NULL,
	[CAMERA] [int] NOT NULL,
	[PERIODO] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ElencoPrenotazioni]  WITH CHECK ADD  CONSTRAINT [FK_ElencoPrenotazioni_ElencoCamere] FOREIGN KEY([CAMERA])
REFERENCES [dbo].[ElencoCamere] ([CAMERA])
GO
ALTER TABLE [dbo].[ElencoPrenotazioni] CHECK CONSTRAINT [FK_ElencoPrenotazioni_ElencoCamere]
GO
ALTER TABLE [dbo].[ElencoPrenotazioni]  WITH CHECK ADD  CONSTRAINT [FK_ElencoPrenotazioni_ElencoPeriodi] FOREIGN KEY([PERIODO])
REFERENCES [dbo].[ElencoPeriodi] ([PERIODO])
GO
ALTER TABLE [dbo].[ElencoPrenotazioni] CHECK CONSTRAINT [FK_ElencoPrenotazioni_ElencoPeriodi]
GO
USE [master]
GO
ALTER DATABASE [DbVillaggio] SET  READ_WRITE 
GO
