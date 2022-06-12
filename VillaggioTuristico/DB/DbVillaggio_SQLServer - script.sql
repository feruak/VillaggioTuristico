USE [master]
GO
/****** Object:  Database [DbVillaggio]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[ElencoCamere]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[ElencoPeriodi]    Script Date: 10/06/2022 20:31:42 ******/
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
/****** Object:  Table [dbo].[ElencoPrenotazioni]    Script Date: 10/06/2022 20:31:42 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'b5dad443-fd55-408a-8039-771d684dffd3', N'52ea3c72-81db-43fe-9f18-a2c0fadc22b8', N'Admin', N'ADMIN')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'07ead05e-6ce7-4dd5-adc6-2360392928fe', N'b5dad443-fd55-408a-8039-771d684dffd3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'07ead05e-6ce7-4dd5-adc6-2360392928fe', 0, N'eff9cfdf-253c-4f98-a272-6b5ccc5dcd4a', N'admin@admin.it', 0, 1, NULL, N'ADMIN@ADMIN.IT', N'ADMIN', N'AQAAAAEAACcQAAAAEDJgc519+N8b4EA82qZ8qhSKFnipgc4oz6FJraoBs4PrUPe5BfVHZtOQwtE+9Gjd3g==', NULL, 0, N'AB47ZNRBRBBLEFXJMESBDADC5O4AZF5J', 0, N'Admin', NULL, NULL)
GO
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (1, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (2, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (3, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (4, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (5, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (6, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (7, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (8, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (9, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (10, N'DOPPIA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (11, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (12, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (13, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (14, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (15, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (16, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (17, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (18, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (19, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (20, N'TRIPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (21, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (22, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (23, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (24, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (25, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (26, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (27, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (28, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (29, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (30, N'QUADRLUPLA')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (31, N'SUITE')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (32, N'SUITE')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (33, N'SUITE')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (34, N'SUITE')
INSERT [dbo].[ElencoCamere] ([CAMERA], [TIPOLOGIA]) VALUES (35, N'SUITE')
GO
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (1, CAST(N'2022-06-27' AS Date), CAST(N'2022-07-03' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (2, CAST(N'2022-07-04' AS Date), CAST(N'2022-07-10' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (3, CAST(N'2022-07-11' AS Date), CAST(N'2022-07-17' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (4, CAST(N'2022-07-18' AS Date), CAST(N'2022-07-24' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (5, CAST(N'2022-07-25' AS Date), CAST(N'2022-07-31' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (6, CAST(N'2022-08-01' AS Date), CAST(N'2022-07-07' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (7, CAST(N'2022-08-08' AS Date), CAST(N'2022-07-14' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (8, CAST(N'2022-08-15' AS Date), CAST(N'2022-07-21' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (9, CAST(N'2022-08-22' AS Date), CAST(N'2022-07-28' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (10, CAST(N'2022-08-29' AS Date), CAST(N'2022-09-04' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (11, CAST(N'2022-09-05' AS Date), CAST(N'2022-09-11' AS Date))
INSERT [dbo].[ElencoPeriodi] ([PERIODO], [INIZIO], [FINE]) VALUES (12, CAST(N'2022-09-12' AS Date), CAST(N'2022-09-18' AS Date))
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
