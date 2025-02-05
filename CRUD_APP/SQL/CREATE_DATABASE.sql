USE [master]
GO
/****** Object:  Database [CRUD-loja]    Script Date: 01/08/2024 16:35:48 ******/
CREATE DATABASE [CRUD-loja]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRUD-loja', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUD-loja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRUD-loja_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CRUD-loja_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CRUD-loja] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRUD-loja].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRUD-loja] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRUD-loja] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRUD-loja] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRUD-loja] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRUD-loja] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRUD-loja] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRUD-loja] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRUD-loja] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRUD-loja] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRUD-loja] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRUD-loja] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRUD-loja] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRUD-loja] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRUD-loja] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRUD-loja] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CRUD-loja] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRUD-loja] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRUD-loja] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRUD-loja] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRUD-loja] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRUD-loja] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRUD-loja] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRUD-loja] SET RECOVERY FULL 
GO
ALTER DATABASE [CRUD-loja] SET  MULTI_USER 
GO
ALTER DATABASE [CRUD-loja] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRUD-loja] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRUD-loja] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRUD-loja] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRUD-loja] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRUD-loja] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRUD-loja', N'ON'
GO
ALTER DATABASE [CRUD-loja] SET QUERY_STORE = ON
GO
ALTER DATABASE [CRUD-loja] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CRUD-loja]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01/08/2024 16:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/08/2024 16:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Marca] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](100) NOT NULL,
	[Preco] [decimal](18, 2) NOT NULL,
	[Descricao] [nvarchar](max) NOT NULL,
	[ImageFileNome] [nvarchar](100) NOT NULL,
	[DataCriacao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CRUD-loja] SET  READ_WRITE 
GO
