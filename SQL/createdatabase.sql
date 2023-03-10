USE [master]
GO

/****** Object:  Database [BSAPI]    Script Date: 2/22/2023 7:27:37 PM ******/
CREATE DATABASE [BSAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BSAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BSAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BSAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BSAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BSAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BSAPI] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BSAPI] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BSAPI] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BSAPI] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BSAPI] SET ARITHABORT OFF 
GO

ALTER DATABASE [BSAPI] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [BSAPI] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BSAPI] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BSAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BSAPI] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BSAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BSAPI] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BSAPI] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BSAPI] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BSAPI] SET  ENABLE_BROKER 
GO

ALTER DATABASE [BSAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BSAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BSAPI] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BSAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BSAPI] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BSAPI] SET READ_COMMITTED_SNAPSHOT ON 
GO

ALTER DATABASE [BSAPI] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BSAPI] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BSAPI] SET  MULTI_USER 
GO

ALTER DATABASE [BSAPI] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BSAPI] SET DB_CHAINING OFF 
GO

ALTER DATABASE [BSAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [BSAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [BSAPI] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [BSAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [BSAPI] SET QUERY_STORE = OFF
GO

ALTER DATABASE [BSAPI] SET  READ_WRITE 
GO


