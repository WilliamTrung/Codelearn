USE [master]
GO
/****** Object:  Database [Codelearn_Assignment101]    Script Date: 1/5/2022 11:42:00 AM ******/
CREATE DATABASE [Codelearn_Assignment101]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Codelearn_Assignment101', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FPTU\MSSQL\DATA\Codelearn_Assignment101.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Codelearn_Assignment101_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.FPTU\MSSQL\DATA\Codelearn_Assignment101_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Codelearn_Assignment101] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Codelearn_Assignment101].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Codelearn_Assignment101] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ARITHABORT OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Codelearn_Assignment101] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Codelearn_Assignment101] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Codelearn_Assignment101] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Codelearn_Assignment101] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET RECOVERY FULL 
GO
ALTER DATABASE [Codelearn_Assignment101] SET  MULTI_USER 
GO
ALTER DATABASE [Codelearn_Assignment101] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Codelearn_Assignment101] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Codelearn_Assignment101] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Codelearn_Assignment101] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Codelearn_Assignment101] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Codelearn_Assignment101] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Codelearn_Assignment101', N'ON'
GO
ALTER DATABASE [Codelearn_Assignment101] SET QUERY_STORE = OFF
GO
USE [Codelearn_Assignment101]
GO
/****** Object:  Table [dbo].[tbl_childrenOfEmployees]    Script Date: 1/5/2022 11:42:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_childrenOfEmployees](
	[ssn] [nchar](10) NOT NULL,
	[name] [nchar](10) NOT NULL,
	[age] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departments]    Script Date: 1/5/2022 11:42:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departments](
	[dno] [nchar](10) NOT NULL,
	[ssn] [nchar](10) NOT NULL,
	[dname] [nchar](10) NOT NULL,
	[budget] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_departments] PRIMARY KEY CLUSTERED 
(
	[dno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_employees]    Script Date: 1/5/2022 11:42:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_employees](
	[ssn] [nchar](10) NOT NULL,
	[dno] [nchar](10) NOT NULL,
	[salary] [nchar](10) NOT NULL,
	[phone] [nchar](10) NOT NULL,
 CONSTRAINT [PK_table_employees] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_working]    Script Date: 1/5/2022 11:42:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_working](
	[ssn] [nchar](10) NOT NULL,
	[dno] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_childrenOfEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_childrenOfEmployees_tbl_employees] FOREIGN KEY([ssn])
REFERENCES [dbo].[tbl_employees] ([ssn])
GO
ALTER TABLE [dbo].[tbl_childrenOfEmployees] CHECK CONSTRAINT [FK_tbl_childrenOfEmployees_tbl_employees]
GO
ALTER TABLE [dbo].[tbl_departments]  WITH CHECK ADD  CONSTRAINT [FK_tbl_departments_tbl_employees] FOREIGN KEY([ssn])
REFERENCES [dbo].[tbl_employees] ([ssn])
GO
ALTER TABLE [dbo].[tbl_departments] CHECK CONSTRAINT [FK_tbl_departments_tbl_employees]
GO
ALTER TABLE [dbo].[tbl_employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_employees_tbl_departments] FOREIGN KEY([dno])
REFERENCES [dbo].[tbl_departments] ([dno])
GO
ALTER TABLE [dbo].[tbl_employees] CHECK CONSTRAINT [FK_tbl_employees_tbl_departments]
GO
ALTER TABLE [dbo].[tbl_working]  WITH CHECK ADD  CONSTRAINT [FK_tbl_working_tbl_departments] FOREIGN KEY([dno])
REFERENCES [dbo].[tbl_departments] ([dno])
GO
ALTER TABLE [dbo].[tbl_working] CHECK CONSTRAINT [FK_tbl_working_tbl_departments]
GO
ALTER TABLE [dbo].[tbl_working]  WITH CHECK ADD  CONSTRAINT [FK_tbl_working_tbl_employees] FOREIGN KEY([ssn])
REFERENCES [dbo].[tbl_employees] ([ssn])
GO
ALTER TABLE [dbo].[tbl_working] CHECK CONSTRAINT [FK_tbl_working_tbl_employees]
GO
USE [master]
GO
ALTER DATABASE [Codelearn_Assignment101] SET  READ_WRITE 
GO
