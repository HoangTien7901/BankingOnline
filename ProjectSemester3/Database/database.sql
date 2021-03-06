USE [master]
GO
/****** Object:  Database [ProjectSemester]    Script Date: 04/06/2021 1:48:00 SA ******/
CREATE DATABASE [ProjectSemester]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectSemester', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectSemester.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProjectSemester_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProjectSemester_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProjectSemester] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectSemester].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectSemester] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectSemester] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectSemester] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectSemester] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectSemester] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectSemester] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectSemester] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectSemester] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectSemester] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectSemester] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectSemester] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectSemester] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectSemester] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectSemester] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectSemester] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectSemester] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectSemester] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectSemester] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectSemester] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectSemester] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectSemester] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectSemester] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectSemester] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProjectSemester] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProjectSemester]
GO
/****** Object:  Table [dbo].[AccountObject]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountObject](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Birthday] [date] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](250) NOT NULL,
	[Job] [varchar](100) NULL,
	[Gender] [varchar](50) NOT NULL,
	[IdNum] [varchar](20) NOT NULL,
	[Staff] [bit] NOT NULL,
	[PositionId] [int] NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Locked] [bit] NOT NULL,
	[isAuthentication] [bit] NOT NULL,
	[WrongPassword] [int] NOT NULL,
 CONSTRAINT [PK_AccountObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[UserAccountId] [uniqueidentifier] NOT NULL,
	[Balance] [money] NOT NULL,
	[BankCode] [varchar](100) NULL,
	[CreatedDate] [date] NOT NULL,
	[ExpiredDate] [date] NOT NULL,
	[BankId] [int] NOT NULL,
	[Locked] [bit] NOT NULL,
	[CurrencyId] [int] NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankOTP]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankOTP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Otp] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[AccountObjectId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BankOTP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Check]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Check](
	[Id] [int] NOT NULL,
	[BankAccountId] [uniqueidentifier] NOT NULL,
	[Bearer] [varchar](250) NOT NULL,
	[Amount] [money] NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Fullname] [varchar](100) NOT NULL,
	[ExchangeRate] [float] NOT NULL,
	[Default] [bit] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FAQ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](250) NOT NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Help]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Help](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactNumber1] [varchar](50) NOT NULL,
	[ContactNumber2] [varchar](50) NULL,
	[Address] [varchar](250) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
	[Subject] [varchar](50) NULL,
 CONSTRAINT [PK_Help] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Problem]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Problem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Sender] [varchar](100) NOT NULL,
	[Question] [varchar](250) NOT NULL,
	[Answer] [varchar](250) NULL,
	[ReceivedDate] [datetime] NOT NULL,
	[AnswerDate] [datetime] NULL,
	[AnswererId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Problem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Success] [bit] NOT NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Setting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[DefaultNumOfShowedTransaction] [int] NOT NULL,
	[DefaultCurrencyId] [int] NOT NULL,
	[WarningMsg1] [varchar](250) NULL,
	[WarningMsg2] [varchar](250) NULL,
	[WarningMsg3] [varchar](250) NULL,
	[SuccessMsg] [varchar](250) NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 04/06/2021 1:48:00 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BankAccountIdFrom] [uniqueidentifier] NOT NULL,
	[BankAccountIdTo] [uniqueidentifier] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[Content] [varchar](250) NULL,
	[ResultId] [int] NOT NULL,
	[BalanceFrom] [money] NOT NULL,
	[BalanceTo] [money] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'50976aa5-249b-4f67-9df7-581a6d14c582', N'James', CAST(N'2001-08-04' AS Date), N'012457899', N'jame1@gmail.com', N'Address 1', N'job 6', N'Male', N'1231231234', 0, 1, N'nanh5605', N'$2b$10$ZTQmSnsmjS/vBEXdrExNiOFxLAI18LHyWmn1/sPWnmWoY9LNx6hSO', CAST(N'2021-06-01' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'ffbdb467-1359-41db-aa7d-ba9694937cfa', N'James', CAST(N'2000-12-28' AS Date), N'0123456789', N'mailJames@gmail.com', N'address 2', N'job 2', N'Male', N'123456789', 0, 1, N'userJame1', N'$2b$10$85rgAnzLQY6rXZfuSllmduzvMUFqdDqZgmEOteWWFCxLEXV.u2m.q', CAST(N'2021-05-06' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', N'Maria', CAST(N'2000-01-01' AS Date), N'0123456781', N'tinhoang7901@gmail.com', N'address 3', N'job 3', N'Female', N'123456789', 0, 1, N'username3', N'$2b$10$7pHaG4q3lOKwbkXkgA0AJ.8MkpDkU0dFnVNZBUEUpqBUktKk1N3xS', CAST(N'2021-05-06' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'ebd92a0b-1198-48e1-b3b2-d12f50cec3ff', N'Master', CAST(N'1999-01-01' AS Date), N'0123456789', N'hoangbichht@gmail.com', N'address x', N'job 6', N'Male', N'123456789', 1, 3, N'superAdmin', N'$2b$10$jA2k24vqxC1HruecVnDeMuMK3QP8ApyLSDuJus/nyn21u1egWJhIK', CAST(N'2021-05-06' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'a90387cd-0aa7-400c-a80c-d216716533d9', N'Sam', CAST(N'1999-10-25' AS Date), N'0123456789', N'tinhoang7901@gmail.com', N'address 5', N'job 5', N'Male', N'123456789', 1, 2, N'admin12', N'$2b$10$IfQdE5C1M4XRHHSjNYu6S.iEEn.tsEhj6IqT0hACUtwFilgwRy4Ua', CAST(N'2021-05-06' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'62bba49b-1b5d-4b03-bd36-d7658698e31f', N'Zelda', CAST(N'2000-12-06' AS Date), N'012346789', N'mail4@gmail.com', N'address 4', N'job 4', N'Female', N'123456789', 1, 2, N'admin2', N'$2b$10$VtuoeUGFoRcgg6980BGvnuhQbx4XR2KtFP.uqt4mtUywpR/8uBfEq', CAST(N'2021-05-06' AS Date), 0, 0, 0)
INSERT [dbo].[AccountObject] ([Id], [Name], [Birthday], [PhoneNumber], [Email], [Address], [Job], [Gender], [IdNum], [Staff], [PositionId], [Username], [Password], [CreatedDate], [Locked], [isAuthentication], [WrongPassword]) VALUES (N'68e3dcca-146e-4131-a7d4-f0701a657400', N'Jack', CAST(N'2000-12-28' AS Date), N'0123456780', N'tinhoang7901@gmail.com', N'address 1', N'job 1', N'Male', N'123456789', 0, 1, N'username1', N'$2b$10$QGwI/sWoHqhKEZ/FHEodOOIocK59zTVRggn2PC8..IVAPooEDsrom', CAST(N'2021-05-06' AS Date), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (1, N'Vietcombank', N'address 1', N'description 1', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (2, N'Agribank', N'address 2', N'description 2', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (3, N'VCB', N'address 3', N'description 3', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (4, N'MB', N'address 4', N'description 4', 1)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (5, N'NetBank', N'address 5', N'description 5', 0)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (6, N'Silver State Bank', N'address 6', N'description 6', 0)
INSERT [dbo].[Bank] ([Id], [Name], [Address], [Description], [Status]) VALUES (8, N'Oceanbank', N'Address o', N'Description o', 1)
SET IDENTITY_INSERT [dbo].[Bank] OFF
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'08661eb7-1ea1-4d6d-b4a5-0f527467e2eb', N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', 1800.0000, N'3d30b5', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 1, 0, 1)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'0ce5696d-94fe-4805-b746-32bd380f9993', N'ffbdb467-1359-41db-aa7d-ba9694937cfa', 1000.0000, NULL, CAST(N'2021-05-22' AS Date), CAST(N'2021-06-04' AS Date), 1, 0, 1)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'10a2a667-d2cc-4b11-98f9-4c5e979e9bbb', N'68e3dcca-146e-4131-a7d4-f0701a657400', 499900.0000, N'199cd7', CAST(N'2021-06-02' AS Date), CAST(N'2026-06-02' AS Date), 1, 0, 1)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'b5065a5a-5779-47f0-8b8e-5fcfb73fb23d', N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb', 24448435.9770, N'3008a2', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 2, 0, 2)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'5b33b459-ec1a-4bb0-843b-cc864f2ad901', N'68e3dcca-146e-4131-a7d4-f0701a657400', 1300.0008, N'5a2fd9', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 3, 0, 3)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'a1b73ac2-7755-4f23-9b2c-d581cf9ba77d', N'ffbdb467-1359-41db-aa7d-ba9694937cfa', 1200.0000, N'17087e', CAST(N'2021-05-06' AS Date), CAST(N'2023-05-06' AS Date), 4, 0, 2)
INSERT [dbo].[BankAccount] ([Id], [UserAccountId], [Balance], [BankCode], [CreatedDate], [ExpiredDate], [BankId], [Locked], [CurrencyId]) VALUES (N'01f2f087-967d-44d3-a979-df16e81fa7d4', N'50976aa5-249b-4f67-9df7-581a6d14c582', 5000000.0000, N'db52a2', CAST(N'2021-06-01' AS Date), CAST(N'2026-06-01' AS Date), 2, 0, 5)
SET IDENTITY_INSERT [dbo].[BankOTP] ON 

INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (1, N'126399', CAST(N'2021-05-31 21:53:56.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (2, N'940396', CAST(N'2021-05-31 22:08:31.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (3, N'550126', CAST(N'2021-05-31 22:11:04.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (4, N'561306', CAST(N'2021-05-31 22:13:40.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (5, N'302162', CAST(N'2021-06-01 01:57:43.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (6, N'555286', CAST(N'2021-06-01 20:11:30.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (7, N'494807', CAST(N'2021-06-01 20:18:56.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (8, N'333153', CAST(N'2021-06-01 20:29:39.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (9, N'014503', CAST(N'2021-06-02 00:38:21.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (10, N'939355', CAST(N'2021-06-02 03:16:43.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (11, N'415598', CAST(N'2021-06-02 08:42:10.000' AS DateTime), 1, N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (12, N'510483', CAST(N'2021-06-02 09:20:46.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (13, N'548225', CAST(N'2021-06-02 09:21:58.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (14, N'338541', CAST(N'2021-06-02 09:29:47.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (15, N'074000', CAST(N'2021-06-03 00:19:10.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (16, N'055832', CAST(N'2021-06-03 00:20:01.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (17, N'055856', CAST(N'2021-06-03 01:02:43.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (18, N'100173', CAST(N'2021-06-03 01:10:49.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (19, N'084255', CAST(N'2021-06-03 02:46:56.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (20, N'426836', CAST(N'2021-06-03 02:58:34.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (21, N'512113', CAST(N'2021-06-03 03:01:28.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (22, N'381350', CAST(N'2021-06-03 03:10:16.000' AS DateTime), 1, N'dda4eeed-5fc2-4320-8564-bcd9c418b2eb')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (23, N'322330', CAST(N'2021-06-03 23:19:50.000' AS DateTime), 0, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (24, N'702716', CAST(N'2021-06-03 23:21:15.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
INSERT [dbo].[BankOTP] ([Id], [Otp], [Date], [Status], [AccountObjectId]) VALUES (25, N'262131', CAST(N'2021-06-04 01:35:50.000' AS DateTime), 1, N'68e3dcca-146e-4131-a7d4-f0701a657400')
SET IDENTITY_INSERT [dbo].[BankOTP] OFF
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (1, N'VND', N'Vienamese dong', 1, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (2, N'USD', N'United States dollar', 230455, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (3, N'EUR', N'	Euro', 28170399744, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (4, N'GBP', N'British pound sterling', 32629891072, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (5, N'AUD', N'Australian dollar', 17899208704, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (6, N'CAD', N'Canadian Dollar', 19113078784, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (7, N'JPY', N'Japanese yen', 210315184, 0)
INSERT [dbo].[Currency] ([Id], [Name], [Fullname], [ExchangeRate], [Default]) VALUES (8, N'CHF', N'Confoederatio Helvetica franc', 25696038912, 0)
SET IDENTITY_INSERT [dbo].[Currency] OFF
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (1, N'subject 1', N'description 1')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (2, N'subject 2', N'description 2')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (3, N'subject 3', N'description 3')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (4, N'subject 4', N'description 4')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (5, N'subject 5', N'description 5')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (6, N'subject 6', N'description 6')
INSERT [dbo].[FAQ] ([Id], [Subject], [Description]) VALUES (7, N'subject 7', N'description 7')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
SET IDENTITY_INSERT [dbo].[Help] ON 

INSERT [dbo].[Help] ([Id], [ContactNumber1], [ContactNumber2], [Address], [Email], [Password], [Subject]) VALUES (1, N'123456789', N'123456789', N'Address 1', N'tinhoang7901@gmail.com', N'0347557353', N'Customer''s service')
SET IDENTITY_INSERT [dbo].[Help] OFF
SET IDENTITY_INSERT [dbo].[Problem] ON 

INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (1, N'abc', N'abc@gmail.com', N'question 1', N'asfdasdfSDfasdf  aasfadas s', CAST(N'2021-05-26 09:47:29.677' AS DateTime), CAST(N'2021-05-26 09:55:47.847' AS DateTime), N'ebd92a0b-1198-48e1-b3b2-d12f50cec3ff')
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (2, N'def', N'hoangbichht@gmail.com', N'question 2', N'asdfdfaefasdfasf', CAST(N'2021-05-26 09:47:29.677' AS DateTime), CAST(N'2021-05-31 20:25:03.873' AS DateTime), N'ebd92a0b-1198-48e1-b3b2-d12f50cec3ff')
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (3, N'asde', N'abc1@gmail.com', N'question 3', N'asdfasdf', CAST(N'2021-05-26 09:47:29.677' AS DateTime), CAST(N'2021-05-31 20:07:54.847' AS DateTime), N'ebd92a0b-1198-48e1-b3b2-d12f50cec3ff')
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (4, N'wefasd', N'abc3@gmail.com', N'question 4', NULL, CAST(N'2021-05-26 09:47:29.677' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (14, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 03:01:57.967' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (15, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 03:14:52.840' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (16, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 03:15:52.320' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (17, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 07:54:03.663' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (18, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 07:55:41.040' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (19, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 07:59:37.300' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (20, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 09:22:59.857' AS DateTime), NULL, NULL)
INSERT [dbo].[Problem] ([Id], [Name], [Sender], [Question], [Answer], [ReceivedDate], [AnswerDate], [AnswererId]) VALUES (21, N'Jack', N'tinhoang7901@gmail.com', N'ok', NULL, CAST(N'2021-06-02 09:23:09.170' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Problem] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([Id], [Description], [Success]) VALUES (1, N'Success for no reason', 1)
INSERT [dbo].[Result] ([Id], [Description], [Success]) VALUES (2, N'Failed for some reasons', 0)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (1, N'Customer', 1)
INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (2, N'Admin', 2)
INSERT [dbo].[Role] ([Id], [Name], [Grade]) VALUES (3, N'SuperAdmin', 3)
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([Id], [Title], [DefaultNumOfShowedTransaction], [DefaultCurrencyId], [WarningMsg1], [WarningMsg2], [WarningMsg3], [SuccessMsg]) VALUES (1, N'Banking Online', 10, 1, N'You have entered the wrong password 1 time.  Your account may be locked if you enter the wrong password 3 times', N'You have entered the wrong password 2 times. Your account may be locked if you enter the wrong password 3 times', N'You have entered the wrong password 3 times. We have locked your account. You need to visit the Forgot Password section to reset your password and unlock your account', N'You have successfully created your account. Now you need to login to your account')
SET IDENTITY_INSERT [dbo].[Setting] OFF
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Id], [BankAccountIdFrom], [BankAccountIdTo], [Time], [Amount], [Content], [ResultId], [BalanceFrom], [BalanceTo]) VALUES (8, N'5b33b459-ec1a-4bb0-843b-cc864f2ad901', N'b5065a5a-5779-47f0-8b8e-5fcfb73fb23d', CAST(N'2021-05-03 01:02:51.000' AS DateTime), 50.0000, N'ok', 1, 1800.0000, 800.0000)
INSERT [dbo].[Transaction] ([Id], [BankAccountIdFrom], [BankAccountIdTo], [Time], [Amount], [Content], [ResultId], [BalanceFrom], [BalanceTo]) VALUES (13, N'b5065a5a-5779-47f0-8b8e-5fcfb73fb23d', N'5b33b459-ec1a-4bb0-843b-cc864f2ad901', CAST(N'2021-06-03 03:10:33.000' AS DateTime), 100.0000, N'ok', 1, 12224617.9887, 1400.0008)
INSERT [dbo].[Transaction] ([Id], [BankAccountIdFrom], [BankAccountIdTo], [Time], [Amount], [Content], [ResultId], [BalanceFrom], [BalanceTo]) VALUES (15, N'10a2a667-d2cc-4b11-98f9-4c5e979e9bbb', N'b5065a5a-5779-47f0-8b8e-5fcfb73fb23d', CAST(N'2021-06-04 01:35:59.000' AS DateTime), 100.0000, N'ok', 1, 499900.0000, 24448435.9770)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
ALTER TABLE [dbo].[AccountObject]  WITH CHECK ADD  CONSTRAINT [FK_Object_Role] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[AccountObject] CHECK CONSTRAINT [FK_Object_Role]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_AccountObject] FOREIGN KEY([UserAccountId])
REFERENCES [dbo].[AccountObject] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_AccountObject]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY([BankId])
REFERENCES [dbo].[Bank] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Bank]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([Id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Currency]
GO
ALTER TABLE [dbo].[BankOTP]  WITH CHECK ADD  CONSTRAINT [FK_BankOTP_AccountObject] FOREIGN KEY([AccountObjectId])
REFERENCES [dbo].[AccountObject] ([Id])
GO
ALTER TABLE [dbo].[BankOTP] CHECK CONSTRAINT [FK_BankOTP_AccountObject]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_BankAccount] FOREIGN KEY([BankAccountId])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_BankAccount]
GO
ALTER TABLE [dbo].[Problem]  WITH CHECK ADD  CONSTRAINT [FK_Problem_AccountObject] FOREIGN KEY([AnswererId])
REFERENCES [dbo].[AccountObject] ([Id])
GO
ALTER TABLE [dbo].[Problem] CHECK CONSTRAINT [FK_Problem_AccountObject]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BankAccount] FOREIGN KEY([BankAccountIdFrom])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BankAccount]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_BankAccount1] FOREIGN KEY([BankAccountIdTo])
REFERENCES [dbo].[BankAccount] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_BankAccount1]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Result] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Result]
GO
USE [master]
GO
ALTER DATABASE [ProjectSemester] SET  READ_WRITE 
GO
