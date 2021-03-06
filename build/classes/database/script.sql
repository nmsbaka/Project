USE [master]
GO
/****** Object:  Database [ST3_Quiz]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE DATABASE [ST3_Quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ST3_Quiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ST3_Quiz.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ST3_Quiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ST3_Quiz_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ST3_Quiz] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ST3_Quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ST3_Quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ST3_Quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ST3_Quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ST3_Quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ST3_Quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [ST3_Quiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ST3_Quiz] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ST3_Quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ST3_Quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ST3_Quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ST3_Quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ST3_Quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ST3_Quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ST3_Quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ST3_Quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ST3_Quiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ST3_Quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ST3_Quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ST3_Quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ST3_Quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ST3_Quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ST3_Quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ST3_Quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ST3_Quiz] SET RECOVERY FULL 
GO
ALTER DATABASE [ST3_Quiz] SET  MULTI_USER 
GO
ALTER DATABASE [ST3_Quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ST3_Quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ST3_Quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ST3_Quiz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ST3_Quiz', N'ON'
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\ReportServer]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT SERVICE\ReportServer] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NHAT_SANG\nhats]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [NHAT_SANG\nhats] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'?ÖÛGâ]ºN@W¸æz 3&â¤_©õ¥yy{zn', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 7/19/2016 11:02:42 AM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N';cF_|O/õl4aÒW#ðb§mm«l¦«', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NHAT_SANG\nhats]
GO
USE [ST3_Quiz]
GO
/****** Object:  Table [dbo].[tb_Answer]    Script Date: 7/19/2016 11:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Answer](
	[ansID] [int] IDENTITY(1,1) NOT NULL,
	[quesID] [int] NULL,
	[ansContent] [nvarchar](50) NOT NULL,
	[isCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Category]    Script Date: 7/19/2016 11:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Category](
	[catID] [int] IDENTITY(1,1) NOT NULL,
	[catName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Player]    Script Date: 7/19/2016 11:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Player](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[year] [int] NULL,
	[money] [bigint] NULL,
	[totalTime] [int] NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__tb_Playe__CB9A1CDF13D1442D] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_PrizeMoney]    Script Date: 7/19/2016 11:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_PrizeMoney](
	[priID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[priID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_Question]    Script Date: 7/19/2016 11:02:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Question](
	[quesID] [int] IDENTITY(1,1) NOT NULL,
	[catID] [int] NULL,
	[quesContent] [nvarchar](500) NOT NULL,
	[isActive] [bit] NOT NULL,
	[level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tb_Answer] ON 

INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (1, 1, N'Lâm Viên', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (2, 1, N'Nông Viên', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (3, 1, N'Công Viên', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (4, 1, N'Ngư Viên', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (5, 2, N'Kalahari.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (6, 2, N'Sahara.', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (7, 2, N'Syria.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (8, 2, N'Gobi.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (9, 3, N'Canada', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (10, 3, N'Nga ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (11, 3, N'Trung Quốc ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (12, 3, N'Úc ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (13, 4, N'4.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (14, 4, N'5.', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (15, 4, N'6.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (16, 4, N'7.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (17, 5, N'Italia.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (18, 5, N'Pháp.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (19, 5, N'Thổ Nhi Kỳ.', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (20, 5, N'Hy Lạp.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (21, 6, N'Sao Mộc.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (22, 6, N'Sao Kim.', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (23, 6, N'Sao Thổ.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (24, 6, N'Sao Thủy.', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (25, 7, N'Đại Tây Dương', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (26, 7, N'Thái Bình Dương', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (27, 7, N'Ấn Độ Dương', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (28, 7, N'Địa Trung Hải', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (29, 8, N'Canada', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (30, 8, N'Brazil', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (31, 8, N'Trung Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (32, 8, N'Úc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (33, 9, N'2', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (34, 9, N'3 ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (35, 9, N'4', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (36, 9, N'5', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (37, 10, N'Lùng Cúng ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (38, 10, N'Putaleng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (39, 10, N'Bạch Mộc Lương Tử', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (40, 10, N'Fanxipan', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (41, 11, N'Bulgari', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (42, 11, N'Hungari', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (43, 11, N'Cộng Hòa Czech ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (44, 11, N'Ba Lan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (45, 12, N'Panama ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (46, 12, N'Suez', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (47, 12, N'Stockholm', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (48, 12, N'Amsterdam', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (49, 13, N'Campuchia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (50, 13, N'Myanmar', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (51, 13, N'Lào', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (52, 13, N'Brunei', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (53, 14, N'4', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (54, 14, N'5', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (55, 14, N'6', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (56, 14, N'7', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (57, 15, N'Triều Tiên', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (58, 15, N'Mông Cổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (59, 15, N'Buhtan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (60, 15, N'Nepal', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (61, 16, N'Sông Hồng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (62, 16, N'Sông Đà', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (63, 16, N'Sông Mekong', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (64, 16, N'Sông Hàn', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (65, 17, N'Sao Hỏa ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (66, 17, N'Sao Kim ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (67, 17, N'Sao Thủy ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (68, 17, N'Trái Đất', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (69, 18, N'Ai Cập', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (70, 18, N'Mali', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (71, 18, N'Algieria', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (72, 18, N'Bờ Biển Ngà', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (73, 19, N'Dãy Uran', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (74, 19, N'Sông Volga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (75, 19, N'Sông Danube', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (76, 19, N'Núi Anpo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (77, 20, N'Abraj Al Bait', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (78, 20, N'Marina 101', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (79, 20, N'Burj Khalifa', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (80, 20, N'Princess Tower', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (81, 21, N'Triangle II', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (82, 21, N'Milky Way', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (83, 21, N'Tayna', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (84, 21, N'Hercules A ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (85, 22, N'Châu Phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (86, 22, N'Châu Đại Dương', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (87, 22, N'Châu Âu', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (88, 22, N'Châu Nam Cực', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (89, 23, N'Rhine', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (90, 23, N'Danube', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (91, 23, N'Niagara', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (92, 23, N'Elbe', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (93, 24, N'Lào Cai', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (94, 24, N'Bắc Giang', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (95, 24, N'Cao Bằng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (96, 24, N'Hà Giang', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (97, 25, N'Mỹ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (98, 25, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (99, 25, N'Italy', 0)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (100, 25, N'Canada', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (101, 26, N'Phần Lan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (102, 26, N'Thụy Điển', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (103, 26, N'Đan Mạch', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (104, 26, N'Slovakia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (105, 27, N'3', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (106, 27, N'4', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (107, 27, N'5', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (108, 27, N'6', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (109, 28, N'Trung Phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (110, 28, N'Bắc Mỹ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (111, 28, N'Châu Đại Dương', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (112, 28, N'Đông Nam Á', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (113, 29, N'Đà Lạt', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (114, 29, N'Biên Hòa', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (115, 29, N'Hải Phòng', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (116, 29, N'Huế', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (117, 30, N'Nga', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (118, 30, N'Ukcraine', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (119, 30, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (120, 30, N'Tây Ban Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (121, 31, N'Sao Kim', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (122, 31, N'Sao Hỏa', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (123, 31, N'Sao Thổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (124, 31, N'Sao Thiên Vương', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (125, 32, N'Sydney', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (126, 32, N'Adelaide', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (127, 32, N'Melbourne', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (128, 32, N'Canberra', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (129, 33, N'Ottawa', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (130, 33, N'Quebec', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (131, 33, N'Regina', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (132, 33, N'Toronto', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (133, 34, N'Thụy Điển', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (134, 34, N'Pháp', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (135, 34, N'Ba lan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (136, 34, N'Tây Ban Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (137, 35, N'Napoli', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (138, 35, N'Roma', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (139, 35, N'Milan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (140, 35, N'Torino', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (141, 36, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (142, 36, N'Bồ Đào Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (143, 36, N'Tây Ban Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (144, 36, N'Pháp', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (145, 37, N'Italia', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (146, 37, N'Mexico', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (147, 37, N'Chile', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (148, 37, N'Nhật', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (149, 38, N'Nhật Bản', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (150, 38, N'Singapore', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (151, 38, N'Canada', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (152, 38, N'Trung Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (153, 39, N'Thổ Nhĩ Kỳ, Ả- rập Xê- út và Syria', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (154, 39, N'Iran, Iraq và Thổ Nhĩ Kỳ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (155, 39, N'Thổ Nhĩ Kỳ, Syria và Iraq', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (156, 39, N'Ả - rập Xê - út, Syria và Iraq', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (157, 40, N'Lucerne', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (158, 40, N'Lausanne', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (159, 40, N'Bern', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (160, 40, N'Zurich', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (161, 41, N'San Marino', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (162, 41, N'Timor-Leste', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (163, 41, N'Monaco', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (164, 41, N'Vatican', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (165, 42, N'Baikal', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (166, 42, N'Victoria ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (167, 42, N'Michigan ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (168, 42, N'Great Slave', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (169, 43, N'Indonesia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (170, 43, N'Philipine', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (171, 43, N'New Zealand', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (172, 43, N'Malaysia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (173, 44, N'Titan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (174, 44, N'Apatit', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (175, 44, N'Boxit', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (176, 44, N'Thiếc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (177, 45, N'Panama', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (178, 45, N'Honduras', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (179, 45, N'Costa Rica', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (180, 45, N'Belize', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (181, 46, N'Tây Ban Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (182, 46, N'Vương quốc Anh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (183, 46, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (184, 46, N'Bồ Đào Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (185, 47, N'Lithuania', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (186, 47, N'Latvia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (187, 47, N'Ukraina', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (188, 47, N'Estonia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (189, 48, N'Ben Macdui', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (190, 48, N'Ben Nevis', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (191, 48, N'Braeriach', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (192, 48, N'Cairn Toul', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (193, 49, N'Scotland', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (194, 49, N'Iceland', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (195, 49, N'Nireland', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (196, 49, N'Ulster', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (197, 50, N'1984', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (198, 50, N'1985', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (199, 50, N'1986', 1)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (200, 50, N'1987', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (201, 51, N'Cảng Nhà Bè', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (202, 51, N'Bến Nhà Rồng', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (203, 51, N'Cảng Cát Lái', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (204, 51, N'Cảng Đồng Nai', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (205, 52, N'Trung Quốc - Việt Nam', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (206, 52, N'Hàn Quốc - Triều Tiên', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (207, 52, N'Anh - Pháp', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (208, 52, N'Mỹ - Liên Xô', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (209, 53, N'Nguyễn Ánh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (210, 53, N'Nguyễn Huệ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (211, 53, N'Nguyễn Nhạc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (212, 53, N'Nguyễn Quang Toản', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (213, 54, N'Quang Dũng', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (214, 54, N'Tiến Dũng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (215, 54, N'Hùng Dũng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (216, 54, N'Anh Dũng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (217, 55, N'Bắc Phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (218, 55, N'Nam Phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (219, 55, N'Bắc Mĩ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (220, 55, N'Nam Mĩ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (221, 56, N'Phan Đình Giót', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (222, 56, N'Tô Vĩnh Diệm', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (223, 56, N'Lê Quý Đôn', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (224, 57, N'1916', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (225, 57, N'1917', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (226, 57, N'1918', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (227, 57, N'1919', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (228, 58, N'Pháp', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (229, 58, N'Anh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (230, 58, N'Bồ Đào Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (231, 58, N'Ý', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (232, 59, N'Fernão de Magalhães', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (233, 59, N'Francisco de Almeida', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (234, 59, N' Cristoforo Colombo', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (235, 59, N'Afonso de Albuquerque', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (236, 60, N'Lý Thái Tông', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (237, 60, N'Lý Thái Tổ ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (238, 60, N'Lý Nhân Tông', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (239, 60, N'Lý Thần Tông', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (240, 61, N'Nguyễn Tất Thành', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (241, 61, N'Hồ Chí Minh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (242, 61, N'Văn Ba', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (243, 61, N'Nguyễn Sinh Cung', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (244, 62, N'Thời Lý', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (245, 62, N'Thời Trần', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (246, 62, N'Thời Đinh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (247, 62, N'Thời Lê', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (248, 63, N'Đông Á', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (249, 63, N'Trung Đông', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (250, 63, N'Đông Âu', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (251, 64, N'Đế chế Napoleon', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (252, 64, N'Đế chế Ba Tư', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (253, 64, N'Đế chế Mông Cổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (254, 64, N'Đế chế Đông La Mã', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (255, 65, N'IBM', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (256, 65, N'Electronic General', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (257, 65, N'Apple', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (258, 65, N'Microsoft', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (259, 66, N'48 Hàng Ngang', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (260, 66, N'48 Hàng Bông', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (261, 66, N'48 Hàng Mã', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (262, 66, N'48 Hàng Đào', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (263, 67, N'Minh Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (264, 67, N'Nho Giáo', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (265, 67, N'Phật Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (266, 67, N'Đạo Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (267, 68, N'Thomas Edinson', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (268, 68, N'Alexander Graham Bell', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (269, 68, N'Louis Pasteur', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (270, 68, N'Charles Robert Darwin', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (271, 69, N'2 triệu người', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (272, 69, N'3 triệu người', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (273, 69, N'4 triệu người', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (274, 69, N'5 triệu người', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (275, 70, N'Iran', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (276, 70, N'Israel', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (277, 70, N'Syria', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (278, 70, N'Iraq', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (279, 71, N'Thành Thái', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (280, 71, N'Tự Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (281, 71, N'Bảo Đại', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (282, 71, N'Minh Mạng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (283, 72, N'Nhật Bản', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (284, 72, N'Hàn Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (285, 72, N'Singapore', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (286, 72, N'Trung Quốc', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (287, 73, N'Vịt Donald', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (288, 73, N'Tom&Jerry', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (289, 73, N'Chuột Mickey', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (290, 73, N'Thủy thủ popeye', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (291, 74, N'Abraham Lincoln', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (292, 74, N'George Washington', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (293, 74, N'Theodore Roosevelt', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (294, 74, N'Benjamin Harrison', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (295, 75, N'Nhà Tần', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (296, 75, N'Nhà Tống', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (297, 75, N'Nhà Đường', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (298, 75, N'Nhà Tùy', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (299, 76, N'Buhtan', 0)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (300, 76, N'Trung Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (301, 76, N'Ấn Độ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (302, 76, N'Nepal', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (303, 77, N'Hy Lạp', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (304, 77, N'Israel', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (305, 77, N'Ấn Độ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (306, 77, N'Trung Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (307, 78, N'Giao Chỉ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (308, 78, N'Cửu Chân', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (309, 78, N'Nhật Nam', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (310, 78, N'Phong Châu', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (311, 79, N'2004', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (312, 79, N'2005', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (313, 79, N'2006', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (314, 79, N'2007', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (315, 80, N'15 TCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (316, 80, N'10 TCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (317, 80, N'5 TCN', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (318, 80, N'5 SCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (319, 81, N'1888', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (320, 81, N'1889', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (321, 81, N'1890', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (322, 81, N'1891', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (323, 82, N'1969', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (324, 82, N'1979', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (325, 82, N'1980', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (326, 82, N'1981', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (327, 83, N'6', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (328, 83, N'5', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (329, 83, N'4', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (330, 83, N'7', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (331, 84, N'10/11/1989', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (332, 84, N'10/12/1989', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (333, 84, N'10/10/1989', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (334, 84, N'11/11/1989', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (335, 85, N'Samudragupta', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (336, 85, N'Hemu ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (337, 85, N'Yashwantrao Holkar ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (338, 85, N'General Zorawar Singh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (339, 86, N'221 TCN', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (340, 86, N'221 SCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (341, 86, N'220 TCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (342, 86, N'220 SCN', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (343, 87, N'1 loại cafe', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (344, 87, N'1 dòng sông', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (345, 87, N'1 hòn đảo', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (346, 87, N'1 thành phố', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (347, 88, N'Bóng đá', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (348, 88, N'Ném lao', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (349, 88, N'Bắn Cung', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (350, 88, N'Đấu bò', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (351, 89, N'Phật Giáo', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (352, 89, N'Hồi Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (353, 89, N'Thiên Chúa Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (354, 89, N'Ấn Độ Giáo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (355, 90, N'Voi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (356, 90, N'Cá mập búa', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (357, 90, N'Bạch tuộc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (358, 90, N'Cá voi xanh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (359, 91, N'Cá chép', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (360, 91, N'Cá rô phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (361, 91, N'Cá chim', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (362, 91, N'Cá xấu', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (363, 92, N'Doreamon', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (364, 92, N'Chaien', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (365, 92, N'Chaiko', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (366, 92, N'Doreami', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (367, 93, N'Geisha', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (368, 93, N'Kimono', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (369, 93, N'Samurai', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (370, 93, N'Maiko', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (371, 94, N'Thuyền gỗ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (372, 94, N'Thuyền thúng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (373, 94, N'Thuyền độc mộc', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (374, 94, N'Thuyền buồm', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (375, 95, N'Đá Granit', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (376, 95, N'Đá vôi', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (377, 95, N'Than đá', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (378, 95, N'Đá Phấn', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (379, 96, N'Nhật Bản', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (380, 96, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (381, 96, N'Nga', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (382, 96, N'Ukraine', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (383, 97, N'Pokemon', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (384, 97, N'Akido', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (385, 97, N'Karate', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (386, 97, N'Judo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (387, 98, N'Thụy Sĩ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (388, 98, N'Mỹ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (389, 98, N'Quatar', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (390, 98, N'Nhật Bản', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (391, 99, N'Rùa', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (392, 99, N'Cá voi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (393, 99, N'Cá chép koi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (394, 99, N'Nhím biển', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (395, 100, N'Ấn Độ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (396, 100, N'Hy Lạp', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (397, 100, N'Pháp', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (398, 100, N'Italia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (399, 101, N'Anh', 0)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (400, 101, N'Thụy Điển', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (401, 101, N'Canada', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (402, 101, N'Mỹ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (403, 102, N'Trương Nghệ Mưu', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (404, 102, N'Lý An', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (405, 102, N'Ngô Vũ Sâm', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (406, 102, N'Justin Lin', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (407, 103, N'NO', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (408, 103, N'S02', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (409, 103, N'CO2', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (410, 103, N'Chì', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (411, 104, N'C', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (412, 104, N'S', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (413, 104, N'KNO3', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (414, 104, N'P', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (415, 105, N'Venezuela', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (416, 105, N'Aghentina', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (417, 105, N'Bolivia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (418, 105, N'Cuba', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (419, 106, N'Dostoievski', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (420, 106, N'Maksim Gorky', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (421, 106, N'Pushkin', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (422, 106, N'Lev Tonxtoi', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (423, 107, N'Bạc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (424, 107, N'Thủy Ngân', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (425, 107, N'Liti', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (426, 107, N'Heli', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (427, 108, N'Mỹ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (428, 108, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (429, 108, N'Nhật', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (430, 108, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (431, 109, N'Tiếng Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (432, 109, N'Tiếng Trung', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (433, 109, N'Tiếng Malaysia', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (434, 109, N'Tiếng Indonesia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (435, 110, N'Một loài cây', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (436, 110, N'Một giống ngựa', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (437, 110, N'Một nhân vật', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (438, 110, N'Một đôi nam nữ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (439, 111, N'Sự dối trá', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (440, 111, N'Sự ích kỷ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (441, 111, N'Sự kiêu căng', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (442, 111, N'Sự gian ác', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (443, 112, N'Daniel Abraham', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (444, 112, N'Suzanne Collins', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (445, 112, N'J.K Rowling', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (446, 112, N'Paulo Coelho', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (447, 113, N'Giáp Xác', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (448, 113, N'Ngành sứa lược', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (449, 113, N'Thân Mềm', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (450, 113, N'Ruột Khoang', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (451, 114, N'Vàng nguyên chất', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (452, 114, N'Vàng thỏi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (453, 114, N'Độ cứng của vàng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (454, 114, N'Tuổi của vàng', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (455, 115, N'Phục Hưng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (456, 115, N'Gothic', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (457, 115, N'Rococo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (458, 115, N'Tân cổ điển', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (459, 116, N'Saint Peterburg', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (460, 116, N'Bacu', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (461, 116, N'Moskva', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (462, 116, N'Stalingrad', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (463, 117, N'Điếc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (464, 117, N'Câm', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (465, 117, N'Mù', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (466, 117, N'Thần kinh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (467, 118, N'Aikido', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (468, 118, N'Pencak silat', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (469, 118, N'Kendo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (470, 118, N'Judo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (471, 119, N'Vàng', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (472, 119, N'Bạc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (473, 119, N'Đá quý', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (474, 119, N'Thạch cao', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (475, 120, N'Nga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (476, 120, N'Israel', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (477, 120, N'Thổ Nhi Kỳ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (478, 120, N'Tiệp Khắc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (479, 121, N'12', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (480, 121, N'13', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (481, 121, N'15', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (482, 121, N'16', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (483, 122, N'Tiêu Đỉnh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (484, 122, N'Kim Dung', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (485, 122, N'Cổ Long', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (486, 122, N'Long Sinh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (487, 123, N'Giro Italia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (488, 123, N'Vuelta a España', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (489, 123, N'The Deutschland Tour', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (490, 123, N'Tour de France', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (491, 124, N'Anh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (492, 124, N'Brazil', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (493, 124, N'Trung Quốc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (494, 124, N'Uruguay', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (495, 125, N'Thái Lan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (496, 125, N'Lào', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (497, 125, N'Campuchia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (498, 125, N'Indonesia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (499, 126, N'Tiền đạo', 0)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (500, 126, N'Thủ môn', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (501, 126, N'Tiền vệ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (502, 126, N'Hậu vệ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (503, 127, N'Manchester United', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (504, 127, N'Real Madrid', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (505, 127, N'Bayer Munich', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (506, 127, N'Milan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (507, 128, N'Bóng bàn', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (508, 128, N'Bóng chày', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (509, 128, N'Golf', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (510, 128, N'Bóng rổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (511, 129, N'Bóng đá', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (512, 129, N'Bóng rổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (513, 129, N'Bóng chày', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (514, 129, N'Bóng bầu dục', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (515, 130, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (516, 130, N'Tây Ban Nha', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (517, 130, N'Italia', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (518, 130, N'Brazil', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (519, 131, N'10', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (520, 131, N'11', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (521, 131, N'12', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (522, 131, N'13', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (523, 132, N'Gareth Bale', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (524, 132, N'Justin Gatlin', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (525, 132, N'Usain Bolt', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (526, 132, N'Theo Walcott', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (527, 133, N'Premier League', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (528, 133, N'Bundesliga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (529, 133, N'Seria A', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (530, 133, N'La Liga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (531, 134, N'Việt Name', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (532, 134, N'Venezuela', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (533, 134, N'Lào', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (534, 134, N'Thái Lan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (535, 135, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (536, 135, N'Pháp', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (537, 135, N'Mỹ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (538, 135, N'Úc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (539, 136, N'Novak Djokovic', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (540, 136, N'Roger Federer', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (541, 136, N'Andy Murray', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (542, 136, N'Rafael Nadal', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (543, 137, N'3', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (544, 137, N'4', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (545, 137, N'5', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (546, 137, N'6', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (547, 138, N'Cristiano Ronaldo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (548, 138, N'Ronaldo ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (549, 138, N'Ronaldinho', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (550, 138, N'Kaka', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (551, 139, N'Bóng bổ', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (552, 139, N'Bóng đá', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (553, 139, N'Bóng chày', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (554, 139, N'Bơi lội', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (555, 140, N'Bóng rổ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (556, 140, N'Bóng chày', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (557, 140, N'Bóng đá', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (558, 140, N'Bóng bầu dục', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (559, 141, N'21', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (560, 141, N'23', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (561, 141, N'22', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (562, 141, N'24', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (563, 142, N'Serbia', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (564, 142, N'Thụy Điển ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (565, 142, N'Nga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (566, 142, N'Bỉ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (567, 143, N'Pháp', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (568, 143, N'Nhật', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (569, 143, N'Anh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (570, 143, N'Úc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (571, 144, N'Roger Federer', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (572, 144, N'Rafael Nadal', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (573, 144, N'Jo-Wilfried Tsonga', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (574, 144, N'John Isner', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (575, 145, N'Chelsea', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (576, 145, N'Real Madrid', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (577, 145, N'Manchester City', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (578, 145, N'PSG', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (579, 146, N'Lê Quang Liêm', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (580, 146, N'Nguyễn Lê Cẩm Hiền', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (581, 146, N'Nguyễn Ngọc Trường Sơn', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (582, 146, N'Đào Thiên Hải', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (583, 147, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (584, 147, N'Brazil', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (585, 147, N'Tiệp Khắc', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (586, 147, N'Uruguay', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (587, 148, N'Cristiano Ronaldo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (588, 148, N'Zidane', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (589, 148, N'Maradona', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (590, 148, N'Leo Messi', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (591, 149, N'Real Madrid', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (592, 149, N'Barcelona', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (593, 149, N'Ajax Amstesdam', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (594, 149, N'AS Roma', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (595, 150, N'1960', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (596, 150, N'1954', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (597, 150, N'1964', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (598, 150, N'1972', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (599, 151, N'Italia', 1)
GO
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (600, 151, N'Đức', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (601, 151, N'Mỹ', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (602, 151, N'Anh', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (603, 152, N'Quảng Châu', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (604, 152, N'Bắc Kinh', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (605, 152, N'Thượng Hải', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (606, 152, N'Tứ Xuyên', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (607, 153, N'Juventus', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (608, 153, N'Inter Milan', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (609, 153, N'AS Roma', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (610, 153, N'Napoli', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (611, 154, N'Cristiano Ronaldo', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (612, 154, N'Luis Suarez', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (613, 154, N'Neymar', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (614, 154, N'Gareth Bale', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (615, 155, N'6', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (616, 155, N'5', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (617, 155, N'4', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (618, 155, N'7', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (619, 156, N'1900', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (620, 156, N'1902', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (621, 156, N'1896', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (622, 156, N'1898', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (623, 157, N'74.636', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (624, 157, N'80.018', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (625, 157, N'81.632', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (626, 157, N'78.862', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (627, 158, N'2-0', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (628, 158, N'3-0', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (629, 158, N'0-2', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (630, 158, N'1-2', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (631, 159, N'Nam Phi', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (632, 159, N'Senegal', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (633, 159, N'Algieria', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (634, 159, N'Nigieria', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (635, 160, N'1875', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (636, 160, N'1877', 1)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (637, 160, N'1880', 0)
INSERT [dbo].[tb_Answer] ([ansID], [quesID], [ansContent], [isCorrect]) VALUES (638, 160, N'1882', 0)
SET IDENTITY_INSERT [dbo].[tb_Answer] OFF
SET IDENTITY_INSERT [dbo].[tb_Category] ON 

INSERT [dbo].[tb_Category] ([catID], [catName]) VALUES (1, N'History')
INSERT [dbo].[tb_Category] ([catID], [catName]) VALUES (2, N'Geography')
INSERT [dbo].[tb_Category] ([catID], [catName]) VALUES (3, N'Sport')
INSERT [dbo].[tb_Category] ([catID], [catName]) VALUES (4, N'Generality')
SET IDENTITY_INSERT [dbo].[tb_Category] OFF
SET IDENTITY_INSERT [dbo].[tb_Player] ON 

INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (1, N'Lý Bí', N'lybi@gmail.com', N'123456', 1990, 500, NULL, 1)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (2, N'Bao Công', N'daden@gmail.com', N'123456', 1980, 400, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (3, N'H?ng Th?t Công', N'ongiadien@gmail.com', N'123456', 1975, 800, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (4, N'Ðu?ng Tang', N'duongtang@gmail.com', N'123456', 1978, 600, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (5, N'Tr?n H?o Nam', N'giangho@gmail.com', N'123456', 1993, 700, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (6, N'Ngô B?o Châu', N'fiel@gmail.com', N'123456', 1986, 1000, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (7, N'Công Tôn Sách', N'congtong@gmail.com', N'123456', 1988, 800, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (8, N'Gia Cát Lu?ng', N'giacat@gmail.com', N'123456', 1986, 2000, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (9, N'Hao Thiên Khuy?n', N'dog@gmail.com', N'123456', 1996, 1600, NULL, 0)
INSERT [dbo].[tb_Player] ([userID], [userName], [email], [password], [year], [money], [totalTime], [isAdmin]) VALUES (10, N'Duong Quá', N'colong@gmail.com', N'123456', 1995, 800, NULL, 0)
SET IDENTITY_INSERT [dbo].[tb_Player] OFF
SET IDENTITY_INSERT [dbo].[tb_PrizeMoney] ON 

INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (1, 50)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (2, 100)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (3, 200)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (4, 400)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (5, 800)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (6, 1200)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (7, 1800)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (8, 2500)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (9, 3500)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (10, 5000)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (11, 7000)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (12, 10000)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (13, 15000)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (14, 20000)
INSERT [dbo].[tb_PrizeMoney] ([priID], [Money]) VALUES (15, 2500000)
SET IDENTITY_INSERT [dbo].[tb_PrizeMoney] OFF
SET IDENTITY_INSERT [dbo].[tb_Question] ON 

INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (1, 2, N'Đâu là tên 1 cao nguyên của việt nam?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (2, 2, N'Sa mạc cát lớn nhất thế giới là?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (3, 2, N'Quốc gia có diện tích lớn nhất thế giới là?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (4, 2, N'Trái đất có bao nhiêu châu lục có người sinh sống?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (5, 2, N'Nơi ra đời của thế vận hội Olympic?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (6, 2, N'Hành tinh nào trong hệ mặt trời có cấu tạo giống trái đất?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (7, 2, N'Đại dương nào giáp với các châu Á,Mỹ,Đại dương?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (8, 2, N'Quốc gia có diện tích lớn thứ 2 thế giới là?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (9, 2, N'Trái đất nằm ở vị trí thứ mấy trong hệ mặt trời?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (10, 2, N'Tên của đỉnh núi cao nhất Việt Nam?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (11, 2, N'Đất nước nào nổi tiếng với hoa Hồng?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (12, 2, N'Kênh đào nối giữa Đại Tây Dương và Ấn Độ Dương?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (13, 2, N'Quốc gia nào ở Đông Nam Á không giáp biển?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (14, 2, N'Sông MeKong chảy quả bao nhiêu quốc gia?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (15, 2, N'Bình Nhưỡng là thủ đố của nước nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (16, 2, N'Hệ thống sông nào có trữ lượng phù sa lớn nhất nước ta?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (17, 2, N'Hành tinh bé nhất trong hệ mặt trời?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (18, 2, N'Ivory Coast là tên gọi của quốc gia nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (19, 2, N'Ranh giới tự nhiên giữa châu Á và châu Âu là gì?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (20, 2, N'Đâu là tên của tòa nhà thuộc Mumbai?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (21, 2, N'Hệ mặt trời năm trong thiên hà nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (22, 2, N'Châu lục nào là châu lục nhỏ nhất thế giới?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (23, 2, N'Sông nào sau đây không thuộc châu Âu?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (24, 2, N'Điểm cực bắc của Việt Nam thuộc tỉnh nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (25, 2, N'Thung lũng Silicon thuộc quốc gia nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (26, 2, N'Stockholm là thủ đô của nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (27, 2, N'Liên hiệp Anh có bao nhiêu quốc gia?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (28, 2, N'Quần đảo lớn nhất thế giới nằm ở đâu?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (29, 2, N'TPHCM,Hà Nội,Cần Thơ, Hải Phòng. Thành phố nào còn lại thuộc 5 tỉnh trực thuộc trung ương?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (30, 2, N'Quảng Trường Đỏ thuộc quốc gia nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (31, 2, N'Hành tinh nào có nhiệt độ trung bình cao nhất trong hệ mặt trời?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (32, 2, N'Đâu là thủ đô của Úc?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (33, 2, N'Đâu là thủ đô của Canada?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (34, 2, N'Nước nào thuộc liên minh Châu Âu(EU) có diện tích lớn nhất?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (35, 2, N'Đấu trường Colosseum thuộc thành phố nào của Italia?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (36, 2, N'Đại lộ Champs-Élysées thuộc quốc gia nào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (37, 2, N'Quốc gia nào trên thế giới có hình giống chiếc ủng?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (38, 2, N'Đối tác thương mại lớn nhất của Mỹ (tính đến năm 2014) là...?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (39, 2, N'Sông Tigris chảy qua 3 nước nào?Thổ Nhĩ Kỳ, Syria và Iraq', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (40, 2, N'Thủ đô của Thụy Sỹ là...??', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (41, 2, N'Quốc gia nào nhỏ nhất thế giới?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (42, 2, N'Hồ nào sâu nhất thế giới? Hồ Baikan', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (43, 2, N'Nước nào trồng nhiều dừa nhất trên thế giới??', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (44, 2, N'Loại khoáng sản có trữ lượng lớn nhất ở Tây Nguyên là?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (45, 2, N'Quốc gia duy nhất khu vực Trung Mỹ sử dụng tiếng Anh làm ngôn ngữ chính thức là..?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (46, 2, N'Gibraltar là vùng lãnh thổ hải ngoại do nước nào quản lý? Vương quốc Anh', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (47, 2, N'Nước nào dưới đây không thuộc khu vực Baltic?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (48, 2, N'Đỉnh núi cao nhất Vương quốc Anh là...?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (49, 2, N'Tên gọi khác của đất nước Bắc Ailen là gì?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (50, 1, N'Việt Nam bắt đầu thời kì đổi mới năm nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (51, 1, N'Bác Hồ ra đi tìm đường cứu nước ở đâu?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (52, 1, N'Chiến lạnh diễn ra giữa 2 quốc gia nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (53, 1, N'Ai là người lãnh đạo nghĩa quân Tây Sơn?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (54, 1, N'Ai là tác giả của bài thơ tây tiến? ', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (55, 1, N'Kim tự tháp của người Maya đươc xây dụng ở khu vực nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (56, 1, N'Trong chiến dịch Điện Biên Phủ, người anh hùng nào đã lấy thân mình để cứu pháo?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (57, 1, N'Chiến thế giới thứ nhất kết thúc năm nào? ', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (58, 1, N'Ấn Độ trước đây là thuộc địa của nước nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (59, 1, N'Ai là người đầu tiên tìm ra châu Mỹ?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (60, 1, N'Ai lập ra nhà Lý?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (61, 1, N'Lúc Bác Hồ ra đi tìm đường cứu nước, Bác lấy tên là gì?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (62, 1, N'Hoa Lư được chọn làm kinh đô của nước ta từ thời nào? ', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (63, 1, N'Văn minh Lưỡng Hà nằm ở khu vực nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (64, 1, N'Đế chế Byzatinum còn được gọi là ?.', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (65, 1, N'Steve Jobs là nhà đồng sáng lập ra công ty nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (66, 1, N'Bác Hồ viết bản tuyên ngôn độc lập ở đâu?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (67, 1, N'Hệ thống tư tưởng giữ vai trò quan trọng trong xã hội phong kiến Trung Quốc là?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (68, 1, N'Ai là người phát minh ra bóng đèn?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (69, 1, N'Nạn đói năm 1945 đã cướp đi bao nhiêu sinh mạng?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (70, 1, N'Nền văn minh Babylon ngày nay thuộc đất nước nào?Iraq', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (71, 1, N'Vị vua cuối cùng của triều Nguyễn?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (72, 1, N'Cờ tướng được xem là biểu tượng của nước nào? TQ', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (73, 1, N'Năm 1928, nhân vật hoạt hình nào lần đầu tiên xuất hiện?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (74, 1, N'Tổng thống đầu tiên của Hiệp Chủng Quốc Hoa Kỳ?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (75, 1, N'Thuốc súng được phát minh từ triều đại ào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (76, 1, N'Khi nói đến Quê Hương của Đức Phật, ta nói đến quốc gia nào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (77, 1, N'Hệ số thập phân là phát minh của nước nào? Ấn Độ', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (78, 1, N'Nhà nước Văn Lang đóng đô ở đâu?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (79, 1, N'Việt Nam gia nhập WTO vào năm nào?2007', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (80, 1, N'Vạn Lý trường thành được bắt đầu xây dựng từ khi nào? Thế kỷ 5 TCN?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (81, 1, N'Tháp Eiffel được hoàn thành năm bao nhiêu?"?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (82, 1, N'Mạng Intenet bắt đầu có từ năm nào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (83, 1, N'Từ năm 1945 đến nay nước ta đổi tên bao nhiêu lần?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (84, 1, N'Bức tường Berlin sụp đổ vào lúc nào?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (85, 1, N'Người nào được xem như là Napoleon của Ấn Độ?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (86, 1, N'Tần Thủy Hoàng đã thống nhất Trung Quốc và lập ra triều đại phong kiến đầu tiên vào năm bao nhiêu?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (87, 4, N'Java là một ngôn ngữ lập trình. Cái tên đó được bắt đầu từ đâu?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (88, 4, N'Môn thể thao nào là truyền thồng của người Tây Ban Nha ?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (89, 4, N'Tôn giáo chiếm đa số ở Campuchia và Lào là?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (90, 4, N'Động vật nào lớn nhất thế giới hiện nay?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (91, 4, N'Loài vật nào sau đây không cùng nhóm với các loài còn lại??', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (92, 4, N'Trong truyện Doremon, nhân vật nào mập nhất?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (93, 4, N'Con người của nghệ thuật Nhật Bản gọi là gì?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (94, 4, N'Thuyền được làm từ nguyên một cây gỗ thường được gọi là thuyền gì?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (95, 4, N'Loại đá nào được hình thành từ xác động vật?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (96, 4, N'Gấu misa là con vật đồ chơi nổi tiếng bắt nguồn từ nước nào sau đây?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (97, 4, N'Đâu không phải là tên 1 môn võ thuật?.', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (98, 4, N'Nước nào có GDP đầu người cao nhất thế giới?.', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (99, 4, N'Loài vật sống lâu nhất thế giới?', 1, 2)
GO
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (100, 4, N'Victor Hugo là nhà văn nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (101, 4, N'Ban nhạc ABBA là của nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (102, 4, N'Người châu Á nào đoạt giải đạo diễn xuất sắc nhất trong Oscar năm 2005?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (103, 4, N'Khí nào gây ra hiệu ứng nhà kính?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (104, 4, N'Thành phần chủ yếu của thuốc nổ?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (105, 4, N'Fidel Castro là vị lãnh tụ nổi tiếng của quốc gia nào sau đây??', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (106, 4, N'Nhà văn nào được mệnh danh là con sư tử của văn học Nga?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (107, 4, N'Nguyên tố nào sau đây trong tiếng Hy Lạp có nghĩa là Nước bạc?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (108, 4, N'Hãng xe Tesla Motors là 1 công ty của nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (109, 4, N'Quốc ngữ của Singapore?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (110, 4, N'Đỉnh núi Langbiang ở Đà Lạt được đặt tên dựa theo tên gì?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (111, 4, N'Hoa Thủy Tiên ở Hy Lạp tượng trưng cho điều gì?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (112, 4, N'Ai là người đầu tiên trở thành tỷ phú Mỹ nhờ viết sách?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (113, 4, N'Thủy thức thuộc ngành nào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (114, 4, N'Độ tinh khiết của vàng được gọi là gì??', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (115, 4, N'Nhà thờ Đức Bà Paris (Pháp) là sản phẩm tiêu biểu cho nghệ thuật kiến trúc gì?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (116, 4, N'Thành phố nào là trung tâm của cách mạng tháng 10 Nga?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (117, 4, N'Nhà thơ Nguyễn Đình Chiểu bị dị tật gì?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (118, 4, N'Môn võ nào được gọi là Hiệp khí đạo?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (119, 4, N'Vào thế chiến thứ 2, tượng Oscar được làm bằng gì?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (120, 4, N'Hatikva bài ca hy vọng là tên bản quốc ca của nước nào?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (121, 4, N'Khi tan vở, Liên Bang Xô Viết có bao nhiêu nước thành viên?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (122, 4, N'Tác giả của tiểu thuyết Tru Tiên?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (123, 3, N'Giải đua xe đạp nào nổi tiếng nhất thế giới?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (124, 3, N'Quốc gia nào sáng lập ra môn thể thao bóng đá??', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (125, 3, N'Seagame 25 được tổ chức tại đâu?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (126, 3, N'Trong môn bóng đá vị trí nào được phép sử dụng tay khi chơi bóng?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (127, 3, N'Câu lạc bộ nào vô địch  cup C1 Châu Âu UEFA Champions League năm 1999?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (128, 3, N'Môn thể thao nào sau đây ít điểm hơn sẽ thắng?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (129, 3, N'Người ta thường xem môn thể thao nào là môn thể thao vua?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (130, 3, N'Đội tuyển bóng đá nước nào vô địch thế giới nhiều lần nhất?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (131, 3, N'Trong một trận đấu bóng đá, mỗi đội được phép ra sân bao nhiêu cầu thủ?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (132, 3, N'Ai là người giữ kỉ lục nhanh nhất ở đường chạy 100m hiện nay?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (133, 3, N'Giải vô địch quốc gia của Anh Quốc có tên gọi là gì?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (134, 3, N'V-league là giải bóng đá chuyên nghiệp của nước nào?', 1, 1)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (135, 3, N'Giải quần vợt Rolan Garos là của nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (136, 3, N'Tay vợt nam nào đang đứng đầu bảng xếp hạng ATP thế giới?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (137, 3, N'Đội tuyển bóng đá Brazil đã mấy lần dành danh hiệu vô địch World Cup? 5?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (138, 3, N'Cầu thủ nào có biệt danh là người ngoài hành tinh?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (139, 3, N'Michael Jordan là huyền thoại của môn thế thao nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (140, 3, N'Los Angeles Lakers là tên của đội bóng nổi tiếng thuộc môn thể thao nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (141, 3, N'Việt Nam đã đăng cai tổ chức Seagame lần thứ bao nhiêu?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (142, 3, N'Tay vợt Novak Djokovic là người nước nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (143, 3, N'Giải quần vợt Wimbledon được tổ chức hằng năm tại đâu?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (144, 3, N'Tàu tốc hành là biệt danh của vận động viên nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (145, 3, N'Tỷ phú Roman Adramovich là chủ tịch của CLB bóng đá nào?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (146, 3, N'Tên vận động viên cờ vua nổi tiếng nhất của Việt Nam?', 1, 2)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (147, 3, N'Quốc gia nào đăng cai tổ chức giải bóng đá vô địch thế giới lần đầu tiên?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (148, 3, N'Cầu thủ nào dành nhiều quả bóng vàng nhất trong lịch sử bóng đá?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (149, 3, N'Câu lạc bộ bóng đá nào nào được công nhận là CLB xuất sắc nhất thế kỉ 20 ?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (150, 3, N'Thẻ vàng và thẻ đỏ  trong bóng đá lần đầu tiền được áp dụng khi??', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (151, 3, N'Quốc gia nào đăng cai tổ chức World Cup 1990?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (152, 3, N'Sân vận động Tổ chim thuộc thành nào của Trung Quốc?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (153, 3, N'Sân vận động Stadio Olimpico là sân nhà của câu lạc bộ nào?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (154, 3, N'Cầu thủ bóng đá nào đang nắm giữ kỉ lục chuyển nhượng?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (155, 3, N'Trong một trận đấu bóng đá hiện nay. Có tất cả bao nhiêu trọng tài?', 1, 3)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (156, 3, N'Thế vận hội Olympic lần đầu tiên được tổ chức vào năm nào?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (157, 3, N'Sức chứa của sân vận động San Siro?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (158, 3, N'Trận chung kêt Euro năm 1992 giữa Đức và Đan Mạch đã kết thúc với tỉ số bao nhiêu?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (159, 3, N'Chủ nhà vòng chung kết cúp bóng đá Châu Phi lần thứ 18 là quốc gia nào?', 1, 4)
INSERT [dbo].[tb_Question] ([quesID], [catID], [quesContent], [isActive], [level]) VALUES (160, 3, N'Giải quần vợt Wimbledon lần đầu tiên được tổ chức vào năm nào?', 1, 4)
SET IDENTITY_INSERT [dbo].[tb_Question] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tb_Quest__3C76779579F1399B]    Script Date: 7/19/2016 11:02:42 AM ******/
ALTER TABLE [dbo].[tb_Question] ADD UNIQUE NONCLUSTERED 
(
	[quesContent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Player] ADD  CONSTRAINT [DF_tb_Player_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[tb_Answer]  WITH CHECK ADD FOREIGN KEY([quesID])
REFERENCES [dbo].[tb_Question] ([quesID])
GO
ALTER TABLE [dbo].[tb_Question]  WITH CHECK ADD FOREIGN KEY([catID])
REFERENCES [dbo].[tb_Category] ([catID])
GO
USE [master]
GO
ALTER DATABASE [ST3_Quiz] SET  READ_WRITE 
GO
