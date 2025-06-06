USE [master]
GO
/****** Object:  Database [DatabaseMasterPol]    Script Date: 05.03.2025 16:06:53 ******/
CREATE DATABASE [DatabaseMasterPol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DatabaseMasterPol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatabaseMasterPol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DatabaseMasterPol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DatabaseMasterPol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DatabaseMasterPol] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DatabaseMasterPol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DatabaseMasterPol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET ARITHABORT OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DatabaseMasterPol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DatabaseMasterPol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DatabaseMasterPol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DatabaseMasterPol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DatabaseMasterPol] SET  MULTI_USER 
GO
ALTER DATABASE [DatabaseMasterPol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DatabaseMasterPol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DatabaseMasterPol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DatabaseMasterPol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DatabaseMasterPol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DatabaseMasterPol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DatabaseMasterPol', N'ON'
GO
ALTER DATABASE [DatabaseMasterPol] SET QUERY_STORE = OFF
GO
USE [DatabaseMasterPol]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdIndex] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
	[Home] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypeImport]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypeImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeMaterial] [nvarchar](50) NOT NULL,
	[PercentOfMaterialDefects] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_MaterialTypeImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameArea]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameCity]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameCity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameCity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameDirector]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameDirector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Director] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameDirector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameStreet]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameStreet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameStreet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberIndex]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameIndex] [int] NOT NULL,
 CONSTRAINT [PK_NumberIndex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerImport]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypePartner] [int] NOT NULL,
	[NamePartner] [nvarchar](50) NOT NULL,
	[IdNameDirector] [int] NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[NumberPhone] [nvarchar](50) NOT NULL,
	[IdAddress] [int] NULL,
	[INN] [nvarchar](50) NULL,
	[Rating] [int] NOT NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_PartnerImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProductImport]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProductImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdNamePartner] [int] NOT NULL,
	[QuantityProduct] [int] NOT NULL,
	[DateSale] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProductImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImport]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeProduct] [int] NOT NULL,
	[NameProduct] [nvarchar](500) NOT NULL,
	[Article] [int] NOT NULL,
	[MinCostForPartner] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypeImport]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypeImport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeProduct] [nvarchar](50) NOT NULL,
	[ProductTypeCoef] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductTypeImport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartner]    Script Date: 05.03.2025 16:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypePartner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (1, 1, 5, 2, 4, 51)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (2, 2, 1, 3, 5, 18)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (3, 3, 4, 1, 2, 21)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (4, 4, 2, 4, 3, 122)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (5, 5, 3, 5, 1, 15)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (6, 6, 6, 6, 6, 6)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (7, 7, 7, 7, 7, 435)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (8, 7, 7, 7, 7, 43)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (9, 8, 7, 7, 7, 43)
INSERT [dbo].[Address] ([Id], [IdIndex], [IdArea], [IdCity], [IdStreet], [Home]) VALUES (10, 9, 7, 7, 7, 43)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialTypeImport] ON 

INSERT [dbo].[MaterialTypeImport] ([Id], [TypeMaterial], [PercentOfMaterialDefects]) VALUES (1, N'Тип материала 1', CAST(0.10 AS Decimal(10, 2)))
INSERT [dbo].[MaterialTypeImport] ([Id], [TypeMaterial], [PercentOfMaterialDefects]) VALUES (2, N'Тип материала 2', CAST(0.95 AS Decimal(10, 2)))
INSERT [dbo].[MaterialTypeImport] ([Id], [TypeMaterial], [PercentOfMaterialDefects]) VALUES (3, N'Тип материала 3', CAST(0.28 AS Decimal(10, 2)))
INSERT [dbo].[MaterialTypeImport] ([Id], [TypeMaterial], [PercentOfMaterialDefects]) VALUES (4, N'Тип материала 4', CAST(0.55 AS Decimal(10, 2)))
INSERT [dbo].[MaterialTypeImport] ([Id], [TypeMaterial], [PercentOfMaterialDefects]) VALUES (5, N'Тип материала 5', CAST(0.34 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[MaterialTypeImport] OFF
GO
SET IDENTITY_INSERT [dbo].[NameArea] ON 

INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (1, N'Архангельская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (2, N'Белгородская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (3, N'Кемеровская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (4, N'Ленинградская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (5, N'Московская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (6, N'Дмитриевская')
INSERT [dbo].[NameArea] ([Id], [Area]) VALUES (7, N'Кировская')
SET IDENTITY_INSERT [dbo].[NameArea] OFF
GO
SET IDENTITY_INSERT [dbo].[NameCity] ON 

INSERT [dbo].[NameCity] ([Id], [City]) VALUES (1, N'Приморск')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (2, N'Реутов')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (3, N'Северодвинск')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (4, N'Старый Оскол')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (5, N'Юрга')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (6, N'Казань')
INSERT [dbo].[NameCity] ([Id], [City]) VALUES (7, N'Нижний')
SET IDENTITY_INSERT [dbo].[NameCity] OFF
GO
SET IDENTITY_INSERT [dbo].[NameDirector] ON 

INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (1, N'Воробьева Екатерина Валерьевна')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (2, N'Иванова Александра Ивановна')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (3, N'Петров Василий Петрович')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (4, N'Соловьев Андрей Николаевич')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (5, N'Степанов Степан Сергеевич')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (6, N'Храмцов Дмитрий Александрович')
INSERT [dbo].[NameDirector] ([Id], [Director]) VALUES (7, N'Петров Дмитрий Андреевич')
SET IDENTITY_INSERT [dbo].[NameDirector] OFF
GO
SET IDENTITY_INSERT [dbo].[NameStreet] ON 

INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (1, N'Лесная')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (2, N'Парковая')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (3, N'Рабочая')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (4, N'Свободы')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (5, N'Строителей')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (6, N'Пушкинская')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (7, N'Петровская')
INSERT [dbo].[NameStreet] ([Id], [Street]) VALUES (8, N'Петровский')
SET IDENTITY_INSERT [dbo].[NameStreet] OFF
GO
SET IDENTITY_INSERT [dbo].[NumberIndex] ON 

INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (1, 143960)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (2, 164500)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (3, 188910)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (4, 309500)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (5, 652050)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (6, 455476)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (7, 342334)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (8, 342355)
INSERT [dbo].[NumberIndex] ([Id], [NameIndex]) VALUES (9, 342380)
SET IDENTITY_INSERT [dbo].[NumberIndex] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerImport] ON 

INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (1, 1, N'База Строитель', 2, N'aleksandraivanova@ml.ru', N'+7(493) - 123-45-67', 5, N'2222455179', 7, 10)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (2, 1, N'МонтажПро', 5, N'stepanov@stepan.ru', N'+7(912) - 888-33-33', 4, N'5552431140', 10, 15)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (3, 3, N'Паркет 29', 3, N'vppetrov@vl.ru', N'+7(987) - 123-56-78', 2, N'3333888520', 7, 5)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (4, 2, N'Ремонт и отделка', 1, N'ekaterina.vorobeva@ml.ru', N'+7(444) - 222-33-11', 1, N'1111520857', 5, 10)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (5, 4, N'Стройсервис', 4, N'ansolovev@st.ru', N'+7(812) - 223-32-00', 3, N'4440391035', 7, 0)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (6, 2, N'СтопСпам', 6, N'hohlomeshkin@mail.ru', N'+7(545) - 656-56-86', 6, NULL, 1, 0)
INSERT [dbo].[PartnerImport] ([Id], [IdTypePartner], [NamePartner], [IdNameDirector], [Email], [NumberPhone], [IdAddress], [INN], [Rating], [Discount]) VALUES (7, 4, N'ШагаемВперед', 7, N'pochka@mail.ru', N'+7(343) - 343-34-23', 10, NULL, 12, 0)
SET IDENTITY_INSERT [dbo].[PartnerImport] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProductImport] ON 

INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (1, 4, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (2, 2, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (3, 3, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (4, 1, 3, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (5, 5, 3, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (6, 2, 3, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (7, 4, 3, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (8, 4, 5, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (9, 1, 5, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (10, 3, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (11, 2, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (13, 2, 2, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (14, 3, 2, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (15, 4, 2, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProductImport] ([Id], [IdProduct], [IdNamePartner], [QuantityProduct], [DateSale]) VALUES (16, 1, 2, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProductImport] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImport] ON 

INSERT [dbo].[ProductImport] ([Id], [IdTypeProduct], [NameProduct], [Article], [MinCostForPartner]) VALUES (1, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[ProductImport] ([Id], [IdTypeProduct], [NameProduct], [Article], [MinCostForPartner]) VALUES (2, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[ProductImport] ([Id], [IdTypeProduct], [NameProduct], [Article], [MinCostForPartner]) VALUES (3, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[ProductImport] ([Id], [IdTypeProduct], [NameProduct], [Article], [MinCostForPartner]) VALUES (4, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[ProductImport] ([Id], [IdTypeProduct], [NameProduct], [Article], [MinCostForPartner]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, CAST(5450.59 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ProductImport] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypeImport] ON 

INSERT [dbo].[ProductTypeImport] ([Id], [TypeProduct], [ProductTypeCoef]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypeImport] ([Id], [TypeProduct], [ProductTypeCoef]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypeImport] ([Id], [TypeProduct], [ProductTypeCoef]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(10, 2)))
INSERT [dbo].[ProductTypeImport] ([Id], [TypeProduct], [ProductTypeCoef]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[ProductTypeImport] OFF
GO
SET IDENTITY_INSERT [dbo].[TypePartner] ON 

INSERT [dbo].[TypePartner] ([Id], [Type]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartner] ([Id], [Type]) VALUES (2, N'ОАО')
INSERT [dbo].[TypePartner] ([Id], [Type]) VALUES (3, N'ООО')
INSERT [dbo].[TypePartner] ([Id], [Type]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[TypePartner] OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_NameArea] FOREIGN KEY([IdArea])
REFERENCES [dbo].[NameArea] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_NameArea]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_NameCity] FOREIGN KEY([IdCity])
REFERENCES [dbo].[NameCity] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_NameCity]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_NameStreet] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[NameStreet] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_NameStreet]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_NumberIndex] FOREIGN KEY([IdIndex])
REFERENCES [dbo].[NumberIndex] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_NumberIndex]
GO
ALTER TABLE [dbo].[PartnerImport]  WITH CHECK ADD  CONSTRAINT [FK_PartnerImport_Address] FOREIGN KEY([IdAddress])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[PartnerImport] CHECK CONSTRAINT [FK_PartnerImport_Address]
GO
ALTER TABLE [dbo].[PartnerImport]  WITH CHECK ADD  CONSTRAINT [FK_PartnerImport_NameDirector] FOREIGN KEY([IdNameDirector])
REFERENCES [dbo].[NameDirector] ([Id])
GO
ALTER TABLE [dbo].[PartnerImport] CHECK CONSTRAINT [FK_PartnerImport_NameDirector]
GO
ALTER TABLE [dbo].[PartnerImport]  WITH CHECK ADD  CONSTRAINT [FK_PartnerImport_TypePartner] FOREIGN KEY([IdTypePartner])
REFERENCES [dbo].[TypePartner] ([Id])
GO
ALTER TABLE [dbo].[PartnerImport] CHECK CONSTRAINT [FK_PartnerImport_TypePartner]
GO
ALTER TABLE [dbo].[PartnerProductImport]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProductImport_ProductImport] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[ProductImport] ([Id])
GO
ALTER TABLE [dbo].[PartnerProductImport] CHECK CONSTRAINT [FK_PartnerProductImport_ProductImport]
GO
ALTER TABLE [dbo].[ProductImport]  WITH CHECK ADD  CONSTRAINT [FK_ProductImport_ProductTypeImport] FOREIGN KEY([IdTypeProduct])
REFERENCES [dbo].[ProductTypeImport] ([Id])
GO
ALTER TABLE [dbo].[ProductImport] CHECK CONSTRAINT [FK_ProductImport_ProductTypeImport]
GO
USE [master]
GO
ALTER DATABASE [DatabaseMasterPol] SET  READ_WRITE 
GO
