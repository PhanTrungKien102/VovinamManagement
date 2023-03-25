USE [master]
GO
/****** Object:  Database [VOVINAM_SCORE_MNG]    Script Date: 3/20/2023 8:05:33 AM ******/
CREATE DATABASE [VOVINAM_SCORE_MNG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VOVINAM_SCORE_MNG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VOVINAM_SCORE_MNG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VOVINAM_SCORE_MNG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\VOVINAM_SCORE_MNG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VOVINAM_SCORE_MNG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ARITHABORT OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET RECOVERY FULL 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET  MULTI_USER 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VOVINAM_SCORE_MNG', N'ON'
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET QUERY_STORE = OFF
GO
USE [VOVINAM_SCORE_MNG]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 3/20/2023 8:05:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [nvarchar](255) NULL,
	[PASSWORD] [nvarchar](255) NULL,
	[ACC_RULE] [int] NOT NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FULL_NAME] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLASS]    Script Date: 3/20/2023 8:05:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[ACCOUNT_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RANK]    Script Date: 3/20/2023 8:05:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RANK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[LIMIT_SCORE] [int] NULL,
	[MAX_SCORE] [int] NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCORE]    Script Date: 3/20/2023 8:05:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCORE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STUDENT_ID] [int] NULL,
	[SCORE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 3/20/2023 8:05:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STUDENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FULL_NAME] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[CLASS_ID] [int] NULL,
	[RANK_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACCOUNT] ON 

INSERT [dbo].[ACCOUNT] ([ID], [USERNAME], [PASSWORD], [ACC_RULE], [ADDRESS], [PHONE], [FULL_NAME]) VALUES (1, N'HUNGNX', N'123', -1, N'Hà Nội', N'0889686712', N'Nguyễn Xuân Hùng')
INSERT [dbo].[ACCOUNT] ([ID], [USERNAME], [PASSWORD], [ACC_RULE], [ADDRESS], [PHONE], [FULL_NAME]) VALUES (2, N'SONVH', N'123', 0, N'Hà Nội', N'0889686713', N'Vũ Hồng Sơn')
INSERT [dbo].[ACCOUNT] ([ID], [USERNAME], [PASSWORD], [ACC_RULE], [ADDRESS], [PHONE], [FULL_NAME]) VALUES (3, N'LINHNVT', N'123', 0, N'Hà Nội', N'0166456572', N'Nguyễn Vũ Tuấn Linh')
INSERT [dbo].[ACCOUNT] ([ID], [USERNAME], [PASSWORD], [ACC_RULE], [ADDRESS], [PHONE], [FULL_NAME]) VALUES (4, N'LONGDH', N'123', 0, N'Hà Nội', N'0166456572', N'Dương Hải Long')
SET IDENTITY_INSERT [dbo].[ACCOUNT] OFF
GO
SET IDENTITY_INSERT [dbo].[CLASS] ON 

INSERT [dbo].[CLASS] ([ID], [NAME], [CODE], [DESCRIPTION], [ACCOUNT_ID]) VALUES (1, N'Lớp võ thầy Sơn', N'FU37994', N'Thầy Sơn dạy võ hay', 2)
INSERT [dbo].[CLASS] ([ID], [NAME], [CODE], [DESCRIPTION], [ACCOUNT_ID]) VALUES (3, N'Lớp võ 1', N'FU18495', N'Lớp võ thầy Linh pro', 3)
INSERT [dbo].[CLASS] ([ID], [NAME], [CODE], [DESCRIPTION], [ACCOUNT_ID]) VALUES (4, N'Lớp võ 2', N'FU19363', N'Lớp võ thầy Long', 4)
INSERT [dbo].[CLASS] ([ID], [NAME], [CODE], [DESCRIPTION], [ACCOUNT_ID]) VALUES (6, N'TEST 123,123,123', N'123', N'HUNGNX', 3)
SET IDENTITY_INSERT [dbo].[CLASS] OFF
GO
SET IDENTITY_INSERT [dbo].[RANK] ON 

INSERT [dbo].[RANK] ([ID], [NAME], [LIMIT_SCORE], [MAX_SCORE], [Image]) VALUES (1, N'Bậc 1', 1, 3, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Blue_vovinam_belt.svg/1024px-Blue_vovinam_belt.svg.png')
INSERT [dbo].[RANK] ([ID], [NAME], [LIMIT_SCORE], [MAX_SCORE], [Image]) VALUES (2, N'Bậc 2 ', 3, 5, N'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Blue_vovinam_belt_1stripe.svg/1024px-Blue_vovinam_belt_1stripe.svg.png')
INSERT [dbo].[RANK] ([ID], [NAME], [LIMIT_SCORE], [MAX_SCORE], [Image]) VALUES (4, N'Bậc 3', 5, 7, N'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Blue_vovinam_belt_2stripe.svg/1024px-Blue_vovinam_belt_2stripe.svg.png')
INSERT [dbo].[RANK] ([ID], [NAME], [LIMIT_SCORE], [MAX_SCORE], [Image]) VALUES (5, N'Bậc 4', 7, 9, N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Blue_vovinam_belt_3stripe.svg/1024px-Blue_vovinam_belt_3stripe.svg.png')
INSERT [dbo].[RANK] ([ID], [NAME], [LIMIT_SCORE], [MAX_SCORE], [Image]) VALUES (6, N'Bậc 5', 9, 10, N'https://upload.wikimedia.org/wikipedia/commons/6/60/Vovinam_junior-instructor_belt.jpg')
SET IDENTITY_INSERT [dbo].[RANK] OFF
GO
SET IDENTITY_INSERT [dbo].[SCORE] ON 

INSERT [dbo].[SCORE] ([ID], [STUDENT_ID], [SCORE]) VALUES (2, 2, 5)
INSERT [dbo].[SCORE] ([ID], [STUDENT_ID], [SCORE]) VALUES (3, 3, 8)
INSERT [dbo].[SCORE] ([ID], [STUDENT_ID], [SCORE]) VALUES (4, 1, 9)
SET IDENTITY_INSERT [dbo].[SCORE] OFF
GO
SET IDENTITY_INSERT [dbo].[STUDENT] ON 

INSERT [dbo].[STUDENT] ([ID], [FULL_NAME], [CODE], [ADDRESS], [PHONE], [CLASS_ID], [RANK_ID]) VALUES (1, N'Nguyễn Xuân Hùng', N'HE22233', N'Nam định', N'0889686712', 6, 6)
INSERT [dbo].[STUDENT] ([ID], [FULL_NAME], [CODE], [ADDRESS], [PHONE], [CLASS_ID], [RANK_ID]) VALUES (2, N'Vũ Hồng Sơn ', N'HE76087', N'Hà Nội ', N'0388270671', 1, 4)
INSERT [dbo].[STUDENT] ([ID], [FULL_NAME], [CODE], [ADDRESS], [PHONE], [CLASS_ID], [RANK_ID]) VALUES (3, N'Vũ Văn Hải', N'HE38009', N'Hải Dương', N'01664565737', 4, NULL)
INSERT [dbo].[STUDENT] ([ID], [FULL_NAME], [CODE], [ADDRESS], [PHONE], [CLASS_ID], [RANK_ID]) VALUES (5, N'HUNGNX', NULL, N'123123123', N'123123', NULL, NULL)
SET IDENTITY_INSERT [dbo].[STUDENT] OFF
GO
ALTER TABLE [dbo].[CLASS]  WITH CHECK ADD FOREIGN KEY([ACCOUNT_ID])
REFERENCES [dbo].[ACCOUNT] ([ID])
GO
ALTER TABLE [dbo].[SCORE]  WITH CHECK ADD FOREIGN KEY([STUDENT_ID])
REFERENCES [dbo].[STUDENT] ([ID])
GO
ALTER TABLE [dbo].[STUDENT]  WITH CHECK ADD FOREIGN KEY([CLASS_ID])
REFERENCES [dbo].[CLASS] ([ID])
GO
ALTER TABLE [dbo].[STUDENT]  WITH CHECK ADD FOREIGN KEY([RANK_ID])
REFERENCES [dbo].[RANK] ([ID])
GO
USE [master]
GO
ALTER DATABASE [VOVINAM_SCORE_MNG] SET  READ_WRITE 
GO
