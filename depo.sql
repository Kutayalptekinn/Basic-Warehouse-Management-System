USE [master]
GO
/****** Object:  Database [DepoYonetimSistemi]    Script Date: 23.05.2022 09:39:17 ******/
CREATE DATABASE [DepoYonetimSistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DepoYonetimSistemi', FILENAME = N'C:\Users\kutay\DepoYonetimSistemi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DepoYonetimSistemi_log', FILENAME = N'C:\Users\kutay\DepoYonetimSistemi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DepoYonetimSistemi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DepoYonetimSistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DepoYonetimSistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DepoYonetimSistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DepoYonetimSistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DepoYonetimSistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DepoYonetimSistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DepoYonetimSistemi] SET  MULTI_USER 
GO
ALTER DATABASE [DepoYonetimSistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DepoYonetimSistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DepoYonetimSistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DepoYonetimSistemi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DepoYonetimSistemi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DepoYonetimSistemi] SET QUERY_STORE = OFF
GO
USE [DepoYonetimSistemi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DepoYonetimSistemi]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 23.05.2022 09:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kategoriler] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 23.05.2022 09:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Rol] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raf]    Script Date: 23.05.2022 09:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raf](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[Kapasite] [int] NULL,
	[AnlıkKapasite] [int] NULL,
 CONSTRAINT [PK_Raf] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 23.05.2022 09:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [nvarchar](50) NULL,
	[UrunAdi] [nvarchar](50) NULL,
	[SonTuketimTarihi] [date] NULL,
	[UrunFiyati] [float] NULL,
	[ToplamUrunSayisi] [int] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunRafBilgisi]    Script Date: 23.05.2022 09:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunRafBilgisi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UrunId] [int] NOT NULL,
	[RafId] [int] NOT NULL,
 CONSTRAINT [PK_UrunRafBilgisi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UrunRafBilgisi]  WITH CHECK ADD  CONSTRAINT [FK_UrunRafBilgisi_Raf1] FOREIGN KEY([RafId])
REFERENCES [dbo].[Raf] ([Id])
GO
ALTER TABLE [dbo].[UrunRafBilgisi] CHECK CONSTRAINT [FK_UrunRafBilgisi_Raf1]
GO
ALTER TABLE [dbo].[UrunRafBilgisi]  WITH CHECK ADD  CONSTRAINT [FK_UrunRafBilgisi_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urun] ([Id])
GO
ALTER TABLE [dbo].[UrunRafBilgisi] CHECK CONSTRAINT [FK_UrunRafBilgisi_Urun]
GO
USE [master]
GO
ALTER DATABASE [DepoYonetimSistemi] SET  READ_WRITE 
GO
