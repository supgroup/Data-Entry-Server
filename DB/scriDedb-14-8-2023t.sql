USE [dedb]
GO
ALTER TABLE [dbo].[usersLogs] DROP CONSTRAINT [FK_usersLogs_users]
GO
ALTER TABLE [dbo].[userSetValues] DROP CONSTRAINT [FK_userSetValues_setValues]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [FK_users_countriesCodes]
GO
ALTER TABLE [dbo].[setValues] DROP CONSTRAINT [FK_setValues_setting]
GO
ALTER TABLE [dbo].[nationalities] DROP CONSTRAINT [FK_nationalities_users1]
GO
ALTER TABLE [dbo].[nationalities] DROP CONSTRAINT [FK_nationalities_users]
GO
ALTER TABLE [dbo].[error] DROP CONSTRAINT [FK_error_users]
GO
ALTER TABLE [dbo].[customersLogs] DROP CONSTRAINT [FK_customersLogs_customers]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_users1]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_users]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_nationalities]
GO
ALTER TABLE [dbo].[customers] DROP CONSTRAINT [FK_customers_departments]
GO
ALTER TABLE [dbo].[cities] DROP CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[users] DROP CONSTRAINT [DF_users_balance]
GO
ALTER TABLE [dbo].[countriesCodes] DROP CONSTRAINT [DF_countriesCodes_isDefault]
GO
/****** Object:  Table [dbo].[usersLogs]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usersLogs]') AND type in (N'U'))
DROP TABLE [dbo].[usersLogs]
GO
/****** Object:  Table [dbo].[userSetValues]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[userSetValues]') AND type in (N'U'))
DROP TABLE [dbo].[userSetValues]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[TokensTable]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TokensTable]') AND type in (N'U'))
DROP TABLE [dbo].[TokensTable]
GO
/****** Object:  Table [dbo].[setValues]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setValues]') AND type in (N'U'))
DROP TABLE [dbo].[setValues]
GO
/****** Object:  Table [dbo].[setting]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[setting]') AND type in (N'U'))
DROP TABLE [dbo].[setting]
GO
/****** Object:  Table [dbo].[nationalities]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[nationalities]') AND type in (N'U'))
DROP TABLE [dbo].[nationalities]
GO
/****** Object:  Table [dbo].[error]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[error]') AND type in (N'U'))
DROP TABLE [dbo].[error]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[departments]') AND type in (N'U'))
DROP TABLE [dbo].[departments]
GO
/****** Object:  Table [dbo].[customersLogs]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customersLogs]') AND type in (N'U'))
DROP TABLE [dbo].[customersLogs]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
DROP TABLE [dbo].[customers]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[countriesCodes]') AND type in (N'U'))
DROP TABLE [dbo].[countriesCodes]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 14/8/2023 1:33:26 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cities]') AND type in (N'U'))
DROP TABLE [dbo].[cities]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 14/8/2023 1:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[cityCode] [nvarchar](50) NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countriesCodes]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countriesCodes](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[currency] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[isDefault] [tinyint] NOT NULL,
	[timeZoneName] [nvarchar](100) NULL,
	[timeZoneOffset] [nvarchar](100) NULL,
 CONSTRAINT [PK_countriesCodes] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[custId] [bigint] IDENTITY(1,1) NOT NULL,
	[custname] [nvarchar](500) NULL,
	[lastName] [nvarchar](500) NULL,
	[mobile] [nvarchar](500) NULL,
	[department] [nvarchar](500) NULL,
	[barcode] [nvarchar](500) NULL,
	[printDate] [datetime2](7) NULL,
	[image] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[createUserId] [bigint] NULL,
	[updateUserId] [bigint] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[isActive] [bit] NULL,
	[nationalityId] [bigint] NULL,
	[departmentId] [bigint] NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[custId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customersLogs]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customersLogs](
	[logId] [bigint] IDENTITY(1,1) NOT NULL,
	[sInDate] [datetime2](7) NULL,
	[sOutDate] [datetime2](7) NULL,
	[posId] [bigint] NULL,
	[custId] [bigint] NULL,
 CONSTRAINT [PK_customersLogs] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[departmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_departments] PRIMARY KEY CLUSTERED 
(
	[departmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error](
	[errorId] [int] IDENTITY(1,1) NOT NULL,
	[num] [nvarchar](200) NULL,
	[msg] [ntext] NULL,
	[stackTrace] [ntext] NULL,
	[targetSite] [ntext] NULL,
	[createDate] [datetime2](7) NULL,
	[createUserId] [bigint] NULL,
 CONSTRAINT [PK_error] PRIMARY KEY CLUSTERED 
(
	[errorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nationalities]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nationalities](
	[nationalityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[notes] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[createUserId] [bigint] NULL,
	[updateUserId] [bigint] NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_nationalities] PRIMARY KEY CLUSTERED 
(
	[nationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setting]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setting](
	[settingId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[notes] [ntext] NULL,
 CONSTRAINT [PK_setting] PRIMARY KEY CLUSTERED 
(
	[settingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setValues]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setValues](
	[valId] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](max) NULL,
	[isDefault] [int] NOT NULL,
	[isSystem] [int] NOT NULL,
	[notes] [nvarchar](max) NULL,
	[settingId] [int] NULL,
 CONSTRAINT [PK_setValues] PRIMARY KEY CLUSTERED 
(
	[valId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokensTable]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokensTable](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[token] [nvarchar](100) NOT NULL,
	[createDate] [datetime2](7) NULL,
 CONSTRAINT [PK_TokensTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NOT NULL,
	[AccountName] [nvarchar](500) NOT NULL,
	[lastName] [nvarchar](500) NULL,
	[company] [nvarchar](500) NULL,
	[email] [nvarchar](500) NULL,
	[phone] [nvarchar](500) NULL,
	[mobile] [nvarchar](500) NULL,
	[fax] [nvarchar](500) NULL,
	[address] [nvarchar](500) NULL,
	[agentLevel] [nvarchar](500) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[password] [nvarchar](500) NULL,
	[type] [nvarchar](10) NULL,
	[image] [ntext] NULL,
	[notes] [nvarchar](500) NULL,
	[balance] [decimal](20, 3) NOT NULL,
	[createUserId] [bigint] NULL,
	[updateUserId] [bigint] NULL,
	[isActive] [int] NULL,
	[code] [nvarchar](500) NULL,
	[isAdmin] [bit] NULL,
	[groupId] [int] NULL,
	[balanceType] [tinyint] NULL,
	[job] [nvarchar](100) NULL,
	[isOnline] [tinyint] NULL,
	[countryId] [int] NULL,
 CONSTRAINT [PK_agents] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userSetValues]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userSetValues](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[valId] [int] NULL,
	[note] [nvarchar](max) NULL,
	[createDate] [datetime2](7) NULL,
	[updateDate] [datetime2](7) NULL,
	[createUserId] [bigint] NULL,
	[updateUserId] [bigint] NULL,
 CONSTRAINT [PK_userSetValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usersLogs]    Script Date: 14/8/2023 1:33:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usersLogs](
	[logId] [bigint] IDENTITY(1,1) NOT NULL,
	[sInDate] [datetime2](7) NULL,
	[sOutDate] [datetime2](7) NULL,
	[posId] [bigint] NULL,
	[userId] [bigint] NULL,
 CONSTRAINT [PK_usersLogs] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cities] ON 

INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (1, N'1', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (2, N'2', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (3, N'3', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (4, N'4', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (5, N'6', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (6, N'7', 2)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (7, N'2', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (8, N'3', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (9, N'4', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (10, N'6', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (11, N'7', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (12, N'9', 4)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (13, N'1', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (14, N'21', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (15, N'23', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (16, N'24', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (17, N'25', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (18, N'30', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (19, N'32', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (20, N'33', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (21, N'36', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (22, N'37', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (23, N'40', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (24, N'42', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (25, N'50', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (26, N'53', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (27, N'60', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (28, N'62', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (29, N'66', 7)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (30, N'1', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (31, N'4', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (32, N'5', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (33, N'6', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (34, N'7', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (35, N'8', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (36, N'9', 8)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (37, N'11', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (38, N'21', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (39, N'22', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (40, N'23', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (41, N'31', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (42, N'33', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (43, N'34', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (44, N'41', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (45, N'43', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (46, N'51', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (47, N'52', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (48, N'14', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (49, N'15', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (50, N'16', 9)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (51, N'1', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (52, N'2', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (53, N'3', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (54, N'4', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (55, N'5', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (56, N'6', 10)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (57, N'2', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (58, N'5', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (59, N'6', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (60, N'8', 11)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (61, N'21', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (62, N'24', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (63, N'25', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (64, N'26', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (65, N'27', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (66, N'29', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (67, N'31', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (68, N'32', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (69, N'33', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (70, N'34', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (71, N'35', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (72, N'36', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (73, N'37', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (74, N'38', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (75, N'41', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (76, N'43', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (77, N'45', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (78, N'46', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (79, N'48', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (80, N'49', 12)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (81, N'2', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (82, N'3', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (83, N'40', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (84, N'45', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (85, N'48', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (86, N'50', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (87, N'55', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (88, N'62', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (89, N'64', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (90, N'66', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (91, N'68', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (92, N'82', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (93, N'84', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (94, N'86', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (95, N'88', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (96, N'93', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (97, N'95', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (98, N'96', 13)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (99, N'97', 13)
GO
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (100, N'71', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (101, N'72', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (103, N'73', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (104, N'74', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (105, N'75', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (106, N'77', 14)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (107, N'21', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (108, N'51', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (109, N'57', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (110, N'61', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (111, N'87', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (112, N'521', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (113, N'652', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (114, N'727', 17)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (115, N'212', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (116, N'216', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (117, N'222', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (118, N'224', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (119, N'232', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (120, N'236', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (121, N'242', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (122, N'246', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (123, N'256', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (124, N'258', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (125, N'266', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (126, N'272', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (127, N'274', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (128, N'276', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (129, N'284', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (130, N'312', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (131, N'322', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (132, N'332', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (134, N'338', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (135, N'342', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (136, N'346', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (137, N'352', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (138, N'358', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (139, N'362', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (140, N'364', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (141, N'366', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (142, N'382', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (143, N'412', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (144, N'414', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (145, N'416', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (146, N'422', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (147, N'424', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (148, N'432', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (149, N'442', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (150, N'452', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (151, N'462', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (152, N'472', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (153, N'482', 19)
INSERT [dbo].[cities] ([cityId], [cityCode], [countryId]) VALUES (154, N'488', 19)
SET IDENTITY_INSERT [dbo].[cities] OFF
GO
SET IDENTITY_INSERT [dbo].[countriesCodes] ON 

INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (1, N'+965', N'KWD', N'Kuwait', 1, N'Arab Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (2, N'+966', N'SAR', N'Saudi Arabia', 0, N'Arab Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (3, N'+968', N'OMR', N'Oman', 0, N'Arabian Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (4, N'+971', N'AED', N'United Arab Emirates', 0, N'Arabian Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (5, N'+974', N'QAR', N'Qatar', 0, N'Arabian Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (6, N'+973', N'BHD', N'Bahrain', 0, N'Arabian Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (7, N'+964', N'IQD', N'Iraq', 0, N'Arabic Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (8, N'+961', N'LBP', N'Lebanon', 0, N'Middle East Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (9, N'+963', N'SYP', N'Syria', 0, N'Syria Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (10, N'+967', N'YER', N'Yemen', 0, N'Arab Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (11, N'+962', N'JOD', N'Jordan', 0, N'Jordan Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (12, N'+213', N'DZD', N'Algeria', 0, N'W. Central Africa Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (13, N'+20', N'EGP', N'Egypt', 0, N'Egypt Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (14, N'+216', N'TND', N'Tunisia', 0, N'W. Central Africa Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (15, N'+249', N'SDG', N'Sudan', 0, N'Sudan Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (16, N'+212', N'MAD', N'Morocco', 0, N'Morocco Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (17, N'+218', N'LYD', N'Libya', 0, N'Libya Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (18, N'+252', N'SOS', N'Somalia', 0, N'Libya Standard Time', NULL)
INSERT [dbo].[countriesCodes] ([countryId], [code], [currency], [name], [isDefault], [timeZoneName], [timeZoneOffset]) VALUES (19, N'+90', N'TRY', N'Turkey', 0, N'Turkey Standard Time', NULL)
SET IDENTITY_INSERT [dbo].[countriesCodes] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (17, N'احمد', NULL, N'9635959595', N'هندسة', N'17-10-6', NULL, NULL, NULL, 2, 2, CAST(N'2023-08-12T03:03:56.8524875' AS DateTime2), CAST(N'2023-08-13T21:48:08.4007830' AS DateTime2), 1, 10, 6)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (18, N'محمد1', NULL, N'05165165665', N'مدني', N'18-13-10', NULL, NULL, NULL, 2, 2, CAST(N'2023-08-12T22:11:02.3856884' AS DateTime2), CAST(N'2023-08-13T18:55:38.0437231' AS DateTime2), 1, 13, 10)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (19, N'سامي', NULL, N'84849', N'هندسة', NULL, NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T00:11:59.2318411' AS DateTime2), CAST(N'2023-08-13T02:16:06.4092556' AS DateTime2), 1, 9, 6)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (23, N'محمود', NULL, N'84849', N'طب', NULL, NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T02:16:23.3559008' AS DateTime2), CAST(N'2023-08-13T02:16:23.3559008' AS DateTime2), 1, 9, 5)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (24, N'345345', NULL, N'9635959595', N'طب', NULL, NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T02:21:24.2414854' AS DateTime2), CAST(N'2023-08-13T02:21:24.2414854' AS DateTime2), 1, 8, 5)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (25, N'34فق34فق1', NULL, N'05165165665', N'هندسة', N'25-10-6', NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T02:21:29.3538118' AS DateTime2), CAST(N'2023-08-13T18:31:34.7294607' AS DateTime2), 1, 10, 6)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (27, N'ماهر احمد', NULL, N'06295959959', N'مدني', N'27-8-10', NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T18:17:44.8100239' AS DateTime2), CAST(N'2023-08-13T19:30:48.0211895' AS DateTime2), 1, 8, 10)
INSERT [dbo].[customers] ([custId], [custname], [lastName], [mobile], [department], [barcode], [printDate], [image], [notes], [createUserId], [updateUserId], [createDate], [updateDate], [isActive], [nationalityId], [departmentId]) VALUES (29, N'احمد محمد علي', NULL, N'935365959', N'صناعة بتروكيماويات', N'29-9-11', NULL, NULL, NULL, 2, 2, CAST(N'2023-08-13T21:49:20.6531557' AS DateTime2), CAST(N'2023-08-13T21:49:20.6531557' AS DateTime2), 1, 9, 11)
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[departments] ON 

INSERT [dbo].[departments] ([departmentId], [name]) VALUES (5, N'طب')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (6, N'هندسة')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (7, N'')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (8, N'jkjk')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (9, N'wefew')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (10, N'مدني')
INSERT [dbo].[departments] ([departmentId], [name]) VALUES (11, N'صناعة بتروكيماويات')
SET IDENTITY_INSERT [dbo].[departments] OFF
GO
SET IDENTITY_INSERT [dbo].[error] ON 

INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)
   at BookAccountApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\applications\us_programs.xaml.cs:line 425
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\applications\us_programs.xaml.cs:line 181', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2023-07-10T13:17:24.0868739' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.Where[TSource](IEnumerable`1 source, Func`2 predicate)
   at BookAccountApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\applications\us_programs.xaml.cs:line 425
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.applications.uc_programs.<UserControl_Loaded>d__10.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\applications\us_programs.xaml.cs:line 83', N'System.Collections.Generic.IEnumerable`1[TSource] Where[TSource](System.Collections.Generic.IEnumerable`1[TSource], System.Func`2[TSource,System.Boolean])', CAST(N'2023-07-10T13:17:24.3945897' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (3, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T13:38:27.2398677' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (4, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at BookAccountApp.Classes.FillCombo.<fillCountries>d__37.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\Classes\FillCombo.cs:line 232
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 82', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2023-07-10T13:38:27.7021291' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (5, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T13:43:15.1861230' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (6, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at BookAccountApp.Classes.FillCombo.<fillCountries>d__37.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\Classes\FillCombo.cs:line 232
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 82', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2023-07-10T13:43:15.6539315' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (7, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at BookAccountApp.Classes.FillCombo.<fillCountries>d__37.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\Classes\FillCombo.cs:line 232
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 82', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2023-07-10T13:43:22.0033953' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (8, N'-2147467261', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at BookAccountApp.Classes.FillCombo.<fillCountries>d__37.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\Classes\FillCombo.cs:line 232
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<UserControl_Loaded>d__10.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 82', N'System.Collections.Generic.List`1[TSource] ToList[TSource](System.Collections.Generic.IEnumerable`1[TSource])', CAST(N'2023-07-10T13:43:29.8860350' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (9, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T13:59:46.2070414' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (10, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T14:07:40.0723543' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (11, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:06:01.3457669' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (12, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:11:24.6605400' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (13, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:20:58.6021936' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (14, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 512
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:22:48.1548919' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (15, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 502
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void MoveNext()', CAST(N'2023-07-10T15:28:21.8662478' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (16, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 514
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 503
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:30:32.0778769' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (17, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 514
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 503
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:33:02.6654975' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (18, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 514
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 503
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-10T15:36:36.9455168' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (19, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 513
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 503
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-11T15:41:38.1758300' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (20, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at BookAccountApp.View.sectionData.uc_users.RefreshUsersView() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 513
   at BookAccountApp.View.sectionData.uc_users.<Search>d__22.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 503
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at BookAccountApp.View.sectionData.uc_users.<Tgl_isActive_Checked>d__17.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\sectionData\uc_users.xaml.cs:line 384', N'Void RefreshUsersView()', CAST(N'2023-07-11T16:51:13.4263341' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (21, N'-2147024809', N'The path is not of a legal form.', N'   at System.IO.Path.NewNormalizePath(String path, Int32 maxPathLength, Boolean expandShortPaths)
   at System.IO.Path.NormalizePath(String path, Boolean fullCheck, Int32 maxPathLength, Boolean expandShortPaths)
   at System.IO.Path.GetFullPathInternal(String path)
   at System.IO.Path.GetFullPath(String path)
   at System.Drawing.IntSecurity.UnsafeGetFullPath(String fileName)
   at System.Drawing.IntSecurity.DemandReadFileIO(String fileName)
   at System.Drawing.Image.FromFile(String filename, Boolean useEmbeddedColorManagement)
   at System.Drawing.Image.FromFile(String filename)
   at BookAccountApp.Classes.SetValues.<saveImage>d__35.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\Classes\ApiClasses\setValues.cs:line 456
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter`1.GetResult()
   at BookAccountApp.View.windows.wd_companyInfo.<Btn_save_Click>d__45.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\windows\wd_companyInfo.xaml.cs:line 434', N'System.String NewNormalizePath(System.String, Int32, Boolean)', CAST(N'2023-07-11T17:23:31.9971618' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (1019, N'-2146232062', N'The entry ''bookdbEntities'' has already been added.', N'   at System.Configuration.ConfigurationElementCollection.BaseAdd(ConfigurationElement element, Boolean throwIfExists, Boolean ignoreLocks)
   at System.Configuration.ConfigurationElementCollection.BaseAdd(ConfigurationElement element)
   at System.Configuration.ConnectionStringSettingsCollection.Add(ConnectionStringSettings settings)
   at BookAccountApp.View.windows.wd_logIn.AddNewConnectionString() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\windows\wd_logIn.xaml.cs:line 157
   at BookAccountApp.View.windows.wd_logIn.<btnLogIn_Click>d__9.MoveNext() in D:\Github\book-account\BookAccountApp\BookAccountApp\View\windows\wd_logIn.xaml.cs:line 175', N'Void BaseAdd(System.Configuration.ConfigurationElement, Boolean, Boolean)', CAST(N'2023-07-29T19:27:01.4929051' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2019, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "DataEntryApp.ar_file.resources" was correctly embedded or linked into assembly "BookAccountApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.windows.wd_logIn.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\windows\wd_logIn.xaml.cs:line 325
   at DataEntryApp.View.windows.wd_logIn.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\windows\wd_logIn.xaml.cs:line 90', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-08T15:27:16.8257470' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2020, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "DataEntryApp.ar_file.resources" was correctly embedded or linked into assembly "BookAccountApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.windows.wd_logIn.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\windows\wd_logIn.xaml.cs:line 325
   at DataEntryApp.View.windows.wd_logIn.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\windows\wd_logIn.xaml.cs:line 90', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-08T15:28:33.6359289' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2021, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "DataEntryApp.ar_file.resources" was correctly embedded or linked into assembly "BookAccountApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.Classes.HelpClass.SetValidate(Path p_error, String tr) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\Classes\HelpClass.cs:line 122
   at DataEntryApp.View.windows.wd_logIn.validateEmpty(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\windows\wd_logIn.xaml.cs:line 276', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-08T15:28:40.5477243' AS DateTime2), NULL)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2022, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T00:20:57.5441920' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2023, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T00:21:48.5783339' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2024, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T00:24:11.9657561' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2025, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T14:35:17.5402703' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2026, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T15:06:34.9325645' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2027, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T15:07:51.6049314' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2028, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T15:09:39.2456933' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2029, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.badge.uc_customers.RefreshCustomersView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 472
   at DataEntryApp.View.badge.uc_customers.<Search>d__23.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 463
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.badge.uc_customers.<Tgl_isActive_Checked>d__18.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\uc_customers.xaml.cs:line 347', N'Void RefreshCustomersView()', CAST(N'2023-08-09T15:17:30.9753353' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2030, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T14:38:08.0057723' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2031, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 99
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__7.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T14:49:22.2078695' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2032, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 99
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__7.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T14:50:50.1142965' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2033, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 99
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__7.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T14:55:03.3196926' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2034, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 99
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__7.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T14:55:54.5478392' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2035, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 99
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__7.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:02:01.7251972' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2036, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:07:15.4183731' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2037, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:07:46.2927688' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2038, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:14.2380439' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2039, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:20.2386907' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2040, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:25.1215578' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2041, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:30.6703448' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2042, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:34.7045067' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2043, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:38.6215737' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2044, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:52.1360409' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2045, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:09:59.4848659' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2046, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:10:00.6190466' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2047, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:10:01.8842674' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2048, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:10:18.3338474' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2049, N'-2146233038', N'Could not find any resources appropriate for the specified culture or the neutral culture.  Make sure "BookAccountApp.ar_file.resources" was correctly embedded or linked into assembly "DataEntryApp" at compile time, or that all the satellite assemblies required are loadable and fully signed.', N'   at System.Resources.ManifestBasedResourceGroveler.HandleResourceStreamMissing(String fileName)
   at System.Resources.ManifestBasedResourceGroveler.GrovelForResourceSet(CultureInfo culture, Dictionary`2 localResourceSets, Boolean tryParents, Boolean createIfNotExists, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo requestedCulture, Boolean createIfNotExists, Boolean tryParents, StackCrawlMark& stackMark)
   at System.Resources.ResourceManager.InternalGetResourceSet(CultureInfo culture, Boolean createIfNotExists, Boolean tryParents)
   at System.Resources.ResourceManager.GetString(String name, CultureInfo culture)
   at System.Resources.ResourceManager.GetString(String name)
   at DataEntryApp.View.settings.uc_settings.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 77
   at DataEntryApp.View.settings.uc_settings.Window_Loaded(Object sender, RoutedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\settings\uc_settings.xaml.cs:line 56', N'Void HandleResourceStreamMissing(System.String)', CAST(N'2023-08-10T15:10:19.9681675' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2050, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshProgramsView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 458
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshProgramsView()', CAST(N'2023-08-11T01:40:39.8545538' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2051, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshProgramsView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 458
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshProgramsView()', CAST(N'2023-08-11T01:41:08.5692848' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2052, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshProgramsView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 458
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshProgramsView()', CAST(N'2023-08-11T01:44:05.1804171' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2053, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 458
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T01:51:24.5286626' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2054, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 458
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T01:52:47.7278493' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2055, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T01:54:00.2389634' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2056, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T01:59:17.0804649' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2057, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T02:00:56.2407055' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2058, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T14:08:50.1973958' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2059, N'-2146233086', N'Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index', N'   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at System.Collections.Generic.List`1.get_Item(Int32 index)
   at System.Collections.ObjectModel.Collection`1.get_Item(Int32 index)
   at DataEntryApp.View.applications.uc_programs.translate() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 113
   at DataEntryApp.View.applications.uc_programs.<UserControl_Loaded>d__10.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 81', N'Void ThrowArgumentOutOfRangeException(System.ExceptionArgument, System.ExceptionResource)', CAST(N'2023-08-11T14:08:50.5793318' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2060, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T14:10:35.3726142' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2061, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 468
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 459
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tgl_isActive_Checked>d__14.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 201', N'Void RefreshCustomerView()', CAST(N'2023-08-11T14:11:29.8657137' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2062, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_0(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 455
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 469
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_0(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:39:47.0715998' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2063, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_0(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 455
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 469
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_0(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:39:51.6882933' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2064, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_0(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 455
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 469
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_0(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:39:53.5550805' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2065, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_1(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 476
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_1(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:48:20.4265656' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2066, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_1(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 476
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_1(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:48:34.4636510' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2067, N'-2147467261', N'Object reference not set to an instance of an object.', N'   at DataEntryApp.View.applications.uc_programs.<Search>b__22_1(Customers s) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 460
   at System.Linq.Enumerable.WhereListIterator`1.MoveNext()
   at MS.Internal.Data.EnumerableCollectionView.LoadSnapshotCore(IEnumerable source)
   at MS.Internal.Data.EnumerableCollectionView..ctor(IEnumerable source)
   at MS.Internal.Data.ViewManager.GetViewRecord(Object collection, CollectionViewSource cvs, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at MS.Internal.Data.DataBindEngine.GetViewRecord(Object collection, CollectionViewSource key, Type collectionViewType, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, Boolean createView, Func`2 GetSourceItem)
   at System.Windows.Data.CollectionViewSource.GetDefaultCollectionView(Object source, DependencyObject d, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemCollection.SetItemsSource(IEnumerable value, Func`2 GetSourceItem)
   at System.Windows.Controls.ItemsControl.OnItemsSourceChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.Controls.ItemsControl.set_ItemsSource(IEnumerable value)
   at DataEntryApp.View.applications.uc_programs.RefreshCustomerView() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 476
   at DataEntryApp.View.applications.uc_programs.<Search>d__22.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 467
--- End of stack trace from previous location where exception was thrown ---
   at System.Runtime.CompilerServices.TaskAwaiter.ThrowForNonSuccess(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)
   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()
   at DataEntryApp.View.applications.uc_programs.<Tb_search_TextChanged>d__13.MoveNext() in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 185', N'Boolean <Search>b__22_1(DataEntryApp.ApiClasses.Customers)', CAST(N'2023-08-11T14:50:23.4250701' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2068, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt64(String value, NumberStyles options, NumberFormatInfo numfmt)
   at System.String.System.IConvertible.ToInt64(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)
   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)
   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)
   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)
   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)
   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)
   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)
   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.Activate(Object item)
   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)
   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.FrameworkElement.set_DataContext(Object value)
   at DataEntryApp.View.applications.uc_programs.Dg_customer_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 787', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2023-08-12T02:14:46.1224293' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2069, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt64(String value, NumberStyles options, NumberFormatInfo numfmt)
   at System.String.System.IConvertible.ToInt64(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)
   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)
   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)
   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)
   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)
   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)
   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)
   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.Activate(Object item)
   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)
   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.FrameworkElement.set_DataContext(Object value)
   at DataEntryApp.View.applications.uc_programs.Dg_customer_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 787', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2023-08-12T02:14:51.1752255' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2070, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt64(String value, NumberStyles options, NumberFormatInfo numfmt)
   at System.String.System.IConvertible.ToInt64(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)
   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)
   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)
   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)
   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)
   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)
   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)
   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.Activate(Object item)
   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)
   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.FrameworkElement.set_DataContext(Object value)
   at DataEntryApp.View.applications.uc_programs.Dg_customer_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 787', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2023-08-12T02:14:53.2584967' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2071, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt64(String value, NumberStyles options, NumberFormatInfo numfmt)
   at System.String.System.IConvertible.ToInt64(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)
   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)
   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)
   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)
   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)
   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)
   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)
   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.Activate(Object item)
   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)
   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.FrameworkElement.set_DataContext(Object value)
   at DataEntryApp.View.applications.uc_programs.Dg_customer_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 787', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2023-08-12T02:14:54.2923949' AS DateTime2), 2)
INSERT [dbo].[error] ([errorId], [num], [msg], [stackTrace], [targetSite], [createDate], [createUserId]) VALUES (2072, N'-2146233033', N'Input string was not in a correct format.', N'   at System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt64(String value, NumberStyles options, NumberFormatInfo numfmt)
   at System.String.System.IConvertible.ToInt64(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at MS.Internal.Data.SystemConvertConverter.Convert(Object o, Type type, Object parameter, CultureInfo culture)
   at MS.Internal.Data.DynamicValueConverter.Convert(Object value, Type targetType, Object parameter, CultureInfo culture)
   at System.Windows.Controls.Primitives.Selector.VerifyEqual(Object knownValue, Type knownType, Object itemValue, DynamicValueConverter converter)
   at System.Windows.Controls.Primitives.Selector.FindItemWithValue(Object value, Int32& index)
   at System.Windows.Controls.Primitives.Selector.SelectItemWithValue(Object value, Boolean selectNow)
   at System.Windows.Controls.Primitives.Selector.CoerceSelectedValue(DependencyObject d, Object value)
   at System.Windows.DependencyObject.ProcessCoerceValue(DependencyProperty dp, PropertyMetadata metadata, EntryIndex& entryIndex, Int32& targetIndex, EffectiveValueEntry& newEntry, EffectiveValueEntry& oldEntry, Object& oldValue, Object baseValue, Object controlValue, CoerceValueCallback coerceValueCallback, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, Boolean skipBaseValueChecks)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.InvalidateProperty(DependencyProperty dp, Boolean preserveCurrentValue)
   at System.Windows.Data.BindingExpressionBase.Invalidate(Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.TransferValue(Object newValue, Boolean isASubPropertyChange)
   at System.Windows.Data.BindingExpression.Activate(Object item)
   at System.Windows.Data.BindingExpression.OnDataContextChanged(DependencyObject contextElement)
   at System.Windows.Data.BindingExpression.HandlePropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpressionBase.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.Data.BindingExpression.OnPropertyInvalidation(DependencyObject d, DependencyPropertyChangedEventArgs args)
   at System.Windows.DependentList.InvalidateDependents(DependencyObject source, DependencyPropertyChangedEventArgs sourceArgs)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.TreeWalkHelper.OnInheritablePropertyChanged(DependencyObject d, InheritablePropertyChangeInfo info, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1._VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(FrameworkElement fe, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.VisitNode(DependencyObject d, Boolean visitedViaVisualTree)
   at System.Windows.DescendentsWalker`1.WalkLogicalChildren(FrameworkElement feParent, FrameworkContentElement fceParent, IEnumerator logicalChildren)
   at System.Windows.DescendentsWalker`1.WalkFrameworkElementLogicalThenVisualChildren(FrameworkElement feParent, Boolean hasLogicalChildren)
   at System.Windows.DescendentsWalker`1.IterateChildren(DependencyObject d)
   at System.Windows.DescendentsWalker`1.StartWalk(DependencyObject startNode, Boolean skipStartNode)
   at System.Windows.FrameworkElement.OnPropertyChanged(DependencyPropertyChangedEventArgs e)
   at System.Windows.DependencyObject.NotifyPropertyChange(DependencyPropertyChangedEventArgs args)
   at System.Windows.DependencyObject.UpdateEffectiveValue(EntryIndex entryIndex, DependencyProperty dp, PropertyMetadata metadata, EffectiveValueEntry oldEntry, EffectiveValueEntry& newEntry, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType)
   at System.Windows.DependencyObject.SetValueCommon(DependencyProperty dp, Object value, PropertyMetadata metadata, Boolean coerceWithDeferredReference, Boolean coerceWithCurrentValue, OperationType operationType, Boolean isInternal)
   at System.Windows.FrameworkElement.set_DataContext(Object value)
   at DataEntryApp.View.applications.uc_programs.Dg_customer_SelectionChanged(Object sender, SelectionChangedEventArgs e) in D:\Github\Data-Entry-App\DataEntryApp\DataEntryApp\View\badge\us_programs.xaml.cs:line 787', N'Void StringToNumber(System.String, System.Globalization.NumberStyles, NumberBuffer ByRef, System.Globalization.NumberFormatInfo, Boolean)', CAST(N'2023-08-12T02:14:55.0758014' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[error] OFF
GO
SET IDENTITY_INSERT [dbo].[nationalities] ON 

INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (8, N'سوري', NULL, 1, 2, 2, CAST(N'2023-08-12T03:03:56.8919916' AS DateTime2), CAST(N'2023-08-12T03:03:56.8919916' AS DateTime2))
INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (9, N'مصري', NULL, 1, 2, 2, CAST(N'2023-08-12T03:05:34.3523331' AS DateTime2), CAST(N'2023-08-12T03:05:34.3523331' AS DateTime2))
INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (10, N'سعودي', NULL, 1, 2, 2, CAST(N'2023-08-12T22:11:02.4908780' AS DateTime2), CAST(N'2023-08-12T22:11:02.4908780' AS DateTime2))
INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (11, N'', NULL, 1, 2, 2, CAST(N'2023-08-13T00:11:59.3215440' AS DateTime2), CAST(N'2023-08-13T00:11:59.3215440' AS DateTime2))
INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (12, N'wef', NULL, 1, 2, 2, CAST(N'2023-08-13T01:35:03.6686326' AS DateTime2), CAST(N'2023-08-13T01:35:03.6686326' AS DateTime2))
INSERT [dbo].[nationalities] ([nationalityId], [name], [notes], [isActive], [createUserId], [updateUserId], [createDate], [updateDate]) VALUES (13, N'اردني', NULL, 1, 2, 2, CAST(N'2023-08-13T18:17:44.8948498' AS DateTime2), CAST(N'2023-08-13T18:17:44.8948498' AS DateTime2))
SET IDENTITY_INSERT [dbo].[nationalities] OFF
GO
SET IDENTITY_INSERT [dbo].[setting] ON 

INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (1, N'com_name', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (2, N'com_address', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (3, N'com_email', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (4, N'com_mobile', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (5, N'com_phone', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (6, N'com_fax', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (7, N'com_logo', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (8, N'region', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (9, N'language', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (10, N'currency', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (11, N'tax', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (12, N'storage_cost', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (13, N'pur_order_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (14, N'dateForm', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (15, N'sale_email_temp', N'emailtemp')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (16, N'sale_order_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (17, N'quotation_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (18, N'required_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (19, N'sale_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (20, N'pur_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (21, N'print_on_save_sale', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (22, N'print_on_save_pur', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (23, N'email_on_save_sale', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (24, N'email_on_save_pur', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (25, N'menuIsOpen', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (26, N'report_lang', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (27, N'rep_copy_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (28, N'user_path', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (29, N'accuracy', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (30, N'pur_email_temp', N'emailtemp-no')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (31, N'Pur_inv_avg_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (32, N'Allow_print_inv_count', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (33, N'item_cost', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (34, N'sale_note', NULL)
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (35, N'upgrade_email_temp', N'emailtemp')
INSERT [dbo].[setting] ([settingId], [name], [notes]) VALUES (36, N'', N'')
SET IDENTITY_INSERT [dbo].[setting] OFF
GO
SET IDENTITY_INSERT [dbo].[setValues] ON 

INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (1, N'en', 0, 0, NULL, 9)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (2, N'ar', 0, 0, NULL, 9)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (12, N'0', 1, 1, NULL, 11)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (13, N'0', 1, 1, NULL, 12)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (14, N'3204215c19f25609034d24451f7e03d7.png', 1, 1, N'', 7)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (15, N'purchase order', 0, 1, N'title', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (16, N'this is ', 0, 1, N'text1', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (17, N'', 0, 1, N'text2', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (18, N'', 0, 1, N'link1text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (19, N'', 0, 1, N'link2text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (20, N'', 0, 0, N'link3text', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (22, N'', 0, 1, N'link1url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (23, N'', 0, 1, N'link2url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (24, N'', 0, 1, N'link3url', 13)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (25, N'LongDatePattern', 1, 1, NULL, 14)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (26, N'Sales email', 0, 1, N'title', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (27, N'', 0, 1, N'text1', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (28, N'', 0, 1, N'text2', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (29, N'', 0, 1, N'link1text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (30, N'', 0, 1, N'link2text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (31, N'', 0, 0, N'link3text', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (32, N'', 0, 1, N'link1url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (33, N'', 0, 1, N'link2url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (34, N'', 0, 1, N'link3url', 15)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (39, N'Sales Order', 0, 1, N'title', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (40, N'', 0, 0, N'text1', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (41, N'', 0, 1, N'text2', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (42, N'', 0, 1, N'link1text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (43, N'', 0, 1, N'link2text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (44, N'', 0, 1, N'link3text', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (45, N'', 0, 1, N'link1url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (46, N'', 0, 1, N'link2url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (47, N'', 0, 1, N'link3url', 16)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (48, N'Quotaion', 0, 1, N'title', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (49, N'', 0, 0, N'text1', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (50, N'', 0, 1, N'text2', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (51, N'', 0, 1, N'link1text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (52, N'', 0, 1, N'link2text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (53, N'', 0, 0, N'link3text', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (54, N'', 0, 1, N'link1url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (55, N'', 0, 1, N'link2url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (56, N'', 0, 1, N'link3url', 17)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (58, N'SupClouds', 1, 1, NULL, 1)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (59, N'Kuwait', 1, 1, NULL, 2)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (60, N'admin@SupClouds.com', 1, 1, NULL, 3)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (61, N'+965-998484189', 1, 1, NULL, 4)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (62, N'+965--', 1, 1, NULL, 5)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (63, N'+965--', 1, 1, NULL, 6)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (64, N'Req', 0, 1, N'title', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (65, N'', 0, 0, N'text1', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (66, N'', 0, 1, N'text2', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (67, N'', 0, 1, N'link1text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (68, N'', 0, 1, N'link2text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (69, N'', 0, 0, N'link3text', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (70, N'', 0, 1, N'link1url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (71, N'', 0, 1, N'link2url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (72, N'', 0, 1, N'link3url', 18)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (73, N'1', 0, 1, N'print', 19)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (74, N'1', 0, 1, N'print', 20)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (75, N'0', 0, 1, N'print', 21)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (76, N'0', 0, 1, N'print', 22)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (77, N'0', 0, 1, N'print', 23)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (78, N'0', 0, 1, N'print', 24)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (79, N'open', 0, 0, NULL, 25)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (80, N'close', 0, 0, NULL, 25)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (81, N'en', 1, 1, NULL, 26)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (82, N'ar', 0, 1, NULL, 26)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (83, N'2', 1, 1, N'print', 27)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (84, N'first', 0, 0, N'0', 28)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (85, N'second', 0, 0, N'0', 28)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (87, N'1', 1, 1, N'0', 29)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (88, N'Purchase', 0, 1, N'title', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (89, N'', 0, 0, N'text1', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (90, N'', 0, 1, N'text2', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (91, N'', 0, 1, N'link1text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (92, N'', 0, 1, N'link2text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (93, N'', 0, 1, N'link3text', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (94, N'', 0, 1, N'link1url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (95, N'', 0, 1, N'link2url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (96, N'', 0, 1, N'link3url', 30)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (109, N'5', 1, 1, N'0', 31)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (110, N'5', 1, 1, N'print', 32)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (111, N'0', 1, 1, N'0', 33)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (112, N'', 1, 1, N'sale_note', 34)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (113, N'Booking email', 0, 1, N'title', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (114, N'', 0, 1, N'text1', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (115, N'', 0, 1, N'text2', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (116, N'', 0, 1, N'link1text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (117, N'', 0, 1, N'link2text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (118, N'', 0, 1, N'link3text', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (119, N'', 0, 1, N'link1url', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (120, N'', 0, 1, N'link2url', 35)
INSERT [dbo].[setValues] ([valId], [value], [isDefault], [isSystem], [notes], [settingId]) VALUES (121, N'', 0, 1, N'link3url', 35)
SET IDENTITY_INSERT [dbo].[setValues] OFF
GO
SET IDENTITY_INSERT [dbo].[TokensTable] ON 

INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (1, N'133363409620363989', CAST(N'2023-08-12T22:08:55.8509637' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (2, N'133363409911228255', CAST(N'2023-08-12T22:09:13.5055137' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (3, N'133363410269384107', CAST(N'2023-08-12T22:09:16.9501759' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (4, N'133363410843923542', CAST(N'2023-08-12T22:09:17.0953878' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (5, N'133363411029202107', CAST(N'2023-08-12T22:09:17.1828110' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (6, N'133363411382006280', CAST(N'2023-08-12T22:09:17.6429220' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (7, N'133363409884884115', CAST(N'2023-08-12T22:09:17.7017627' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (8, N'133363410436101737', CAST(N'2023-08-12T22:09:17.7447045' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (9, N'133363410002464824', CAST(N'2023-08-12T22:09:46.6783814' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (10, N'133363411118347934', CAST(N'2023-08-12T22:09:58.8329811' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (11, N'133363411469339022', CAST(N'2023-08-12T22:09:59.1012654' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (12, N'133363411631403032', CAST(N'2023-08-12T22:10:04.5566383' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (13, N'133363411720697577', CAST(N'2023-08-12T22:10:04.6143297' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (14, N'133363411229669961', CAST(N'2023-08-12T22:10:09.7829766' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (15, N'133363412001347324', CAST(N'2023-08-12T22:10:09.8150252' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (16, N'133363411613494269', CAST(N'2023-08-12T22:10:09.8349710' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (17, N'133363410854781959', CAST(N'2023-08-12T22:11:02.3348251' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (18, N'133363411250478186', CAST(N'2023-08-12T22:11:02.7687431' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (19, N'133363410712479449', CAST(N'2023-08-12T22:11:02.8106299' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (20, N'133363412246364576', CAST(N'2023-08-12T22:11:02.9053780' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (21, N'133363438945661322', CAST(N'2023-08-12T22:55:36.2533974' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (22, N'133363438471947143', CAST(N'2023-08-12T22:55:46.1905317' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (23, N'133363439062815388', CAST(N'2023-08-12T22:55:46.2733117' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (24, N'133363438754642374', CAST(N'2023-08-12T22:55:47.1544094' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (25, N'133363437854690619', CAST(N'2023-08-12T22:55:47.4544696' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (26, N'133363438280429590', CAST(N'2023-08-12T22:55:47.5492099' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (27, N'133363439348842053', CAST(N'2023-08-12T22:55:48.1581736' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (28, N'133363439560864942', CAST(N'2023-08-12T22:55:48.2434062' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (29, N'133363438708930076', CAST(N'2023-08-12T22:55:48.3102859' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (30, N'133363463606535610', CAST(N'2023-08-12T23:36:23.4665541' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (31, N'133363462059387787', CAST(N'2023-08-12T23:36:24.2823747' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (32, N'133363462130003840', CAST(N'2023-08-12T23:36:24.6523835' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (33, N'133363462947792502', CAST(N'2023-08-12T23:36:24.7940056' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (34, N'133363461908529562', CAST(N'2023-08-12T23:36:24.8708000' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (35, N'133363463455090402', CAST(N'2023-08-12T23:36:25.2308470' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (36, N'133363463872443871', CAST(N'2023-08-12T23:36:25.2946658' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (37, N'133363462006270315', CAST(N'2023-08-12T23:36:25.3395579' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (38, N'133363461911065140', CAST(N'2023-08-12T23:36:30.7263236' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (39, N'133363461996002044', CAST(N'2023-08-12T23:36:31.4882988' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (40, N'133363462054787946', CAST(N'2023-08-12T23:36:32.0386258' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (41, N'133363476138422726', CAST(N'2023-08-12T23:58:29.3699974' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (42, N'133363475224295333', CAST(N'2023-08-12T23:58:30.1768411' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (43, N'133363477076895143', CAST(N'2023-08-12T23:58:30.5428613' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (44, N'133363476721021817', CAST(N'2023-08-12T23:58:30.6226487' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (45, N'133363476281388164', CAST(N'2023-08-12T23:58:30.7523021' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (46, N'133363476523331003', CAST(N'2023-08-12T23:58:31.2649312' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (47, N'133363477063246393', CAST(N'2023-08-12T23:58:31.3297587' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (48, N'133363475981932333', CAST(N'2023-08-12T23:58:31.3696510' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (49, N'133363476571293469', CAST(N'2023-08-12T23:59:13.7303198' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (50, N'133363477583716880', CAST(N'2023-08-12T23:59:14.4235837' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (51, N'133363476658225313', CAST(N'2023-08-12T23:59:16.0405337' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (52, N'133363476723298504', CAST(N'2023-08-12T23:59:16.4145336' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (53, N'133363475641685257', CAST(N'2023-08-12T23:59:19.2649133' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (54, N'133363476292958840', CAST(N'2023-08-12T23:59:19.3257951' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (55, N'133363476491207944', CAST(N'2023-08-12T23:59:19.3417515' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (56, N'133363482178045923', CAST(N'2023-08-13T00:08:54.8693012' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (57, N'133363482459177133', CAST(N'2023-08-13T00:08:55.1924374' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (58, N'133363482349354668', CAST(N'2023-08-13T00:08:55.3363174' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (59, N'133363481732558617', CAST(N'2023-08-13T00:08:55.4797767' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (60, N'133363482294491916', CAST(N'2023-08-13T00:08:55.5654398' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (61, N'133363482870640704', CAST(N'2023-08-13T00:08:55.9768167' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (62, N'133363483391816676', CAST(N'2023-08-13T00:08:56.0222180' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (63, N'133363482208953260', CAST(N'2023-08-13T00:08:56.0491458' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (64, N'133363484621308158', CAST(N'2023-08-13T00:11:59.1549889' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (65, N'133363483710724020', CAST(N'2023-08-13T00:11:59.5978041' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (66, N'133363485217290949', CAST(N'2023-08-13T00:11:59.6357025' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (67, N'133363484988862615', CAST(N'2023-08-13T00:11:59.7075103' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (68, N'133363515646642191', CAST(N'2023-08-13T01:03:50.1096170' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (69, N'133363514516699567', CAST(N'2023-08-13T01:03:56.6415691' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (70, N'133363516431763040', CAST(N'2023-08-13T01:03:56.7113812' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (71, N'133363514544078932', CAST(N'2023-08-13T01:03:57.0258212' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (72, N'133363516419117609', CAST(N'2023-08-13T01:03:57.1534791' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (73, N'133363516027545211', CAST(N'2023-08-13T01:03:57.2322677' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (74, N'133363514773805594', CAST(N'2023-08-13T01:03:57.8996763' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (75, N'133363515227977948', CAST(N'2023-08-13T01:03:57.9814634' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (76, N'133363515112241563', CAST(N'2023-08-13T01:03:58.0083876' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (77, N'133363518412843684', CAST(N'2023-08-13T01:09:19.6094899' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (78, N'133363517708714448', CAST(N'2023-08-13T01:09:19.9216557' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (79, N'133363519033277641', CAST(N'2023-08-13T01:09:20.0672664' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (80, N'133363518976852225', CAST(N'2023-08-13T01:09:20.1739811' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (81, N'133363517913218195', CAST(N'2023-08-13T01:09:20.2547643' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (82, N'133363519510489809', CAST(N'2023-08-13T01:09:20.6157995' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (83, N'133363517996418328', CAST(N'2023-08-13T01:09:20.6716499' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (84, N'133363518593669866', CAST(N'2023-08-13T01:09:20.6985768' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (85, N'133363519616302407', CAST(N'2023-08-13T01:10:26.0238912' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (86, N'133363518933431992', CAST(N'2023-08-13T01:10:26.2881830' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (87, N'133363520353216427', CAST(N'2023-08-13T01:10:26.3320655' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (88, N'133363518758462064', CAST(N'2023-08-13T01:10:26.4038735' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (89, N'133363520866889472', CAST(N'2023-08-13T01:11:28.0199687' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (90, N'133363520520220797', CAST(N'2023-08-13T01:11:28.3859901' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (91, N'133363520858913315', CAST(N'2023-08-13T01:11:28.6442993' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (92, N'133363521020805010', CAST(N'2023-08-13T01:11:28.7500163' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (93, N'133363520225251721', CAST(N'2023-08-13T01:11:28.8417715' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (94, N'133363520198894389', CAST(N'2023-08-13T01:11:29.2067949' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (95, N'133363519643762462', CAST(N'2023-08-13T01:11:29.2676329' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (96, N'133363520496906221', CAST(N'2023-08-13T01:11:29.2985488' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (97, N'133363525332547298', CAST(N'2023-08-13T01:20:27.2835400' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (98, N'133363524578872068', CAST(N'2023-08-13T01:20:27.6186430' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (99, N'133363525481146067', CAST(N'2023-08-13T01:20:27.7602651' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (100, N'133363526262457975', CAST(N'2023-08-13T01:20:27.8500252' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (101, N'133363525901548269', CAST(N'2023-08-13T01:20:27.9716994' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (102, N'133363526356520500', CAST(N'2023-08-13T01:20:28.3048093' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (103, N'133363524845859856', CAST(N'2023-08-13T01:20:28.3915763' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (104, N'133363524531221111', CAST(N'2023-08-13T01:20:28.4254856' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (105, N'133363526823986570', CAST(N'2023-08-13T01:21:53.2294405' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (106, N'133363527270849559', CAST(N'2023-08-13T01:21:53.3880146' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (107, N'133363525362017875', CAST(N'2023-08-13T01:21:53.4578280' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (108, N'133363527061149307', CAST(N'2023-08-13T01:21:53.5545699' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (109, N'133363528655700208', CAST(N'2023-08-13T01:25:33.8929038' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (110, N'133363527741573481', CAST(N'2023-08-13T01:25:34.2319960' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (111, N'133363529213942946', CAST(N'2023-08-13T01:25:35.6705286' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (112, N'133363529428145582', CAST(N'2023-08-13T01:25:35.6775088' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (113, N'133363530447842350', CAST(N'2023-08-13T01:28:37.1619204' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (114, N'133363530433803325', CAST(N'2023-08-13T01:28:37.4900428' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (115, N'133363529825545135', CAST(N'2023-08-13T01:28:37.6306664' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (116, N'133363529777397569', CAST(N'2023-08-13T01:28:37.7294038' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (117, N'133363529891128348', CAST(N'2023-08-13T01:28:37.8032048' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (118, N'133363530585323971', CAST(N'2023-08-13T01:28:38.1742163' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (119, N'133363529260752800', CAST(N'2023-08-13T01:28:38.2360470' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (120, N'133363530818790242', CAST(N'2023-08-13T01:28:38.2739461' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (121, N'133363533202262137', CAST(N'2023-08-13T01:34:31.8427162' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (122, N'133363534770512541', CAST(N'2023-08-13T01:34:32.1469034' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (123, N'133363534378405629', CAST(N'2023-08-13T01:34:32.3004921' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (124, N'133363533820668130', CAST(N'2023-08-13T01:34:32.4271518' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (125, N'133363534190346607', CAST(N'2023-08-13T01:34:32.4999579' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (126, N'133363534310160747', CAST(N'2023-08-13T01:34:32.8579992' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (127, N'133363533162076461', CAST(N'2023-08-13T01:34:32.9308056' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (128, N'133363533099769006', CAST(N'2023-08-13T01:34:32.9657116' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (129, N'133363533801022099', CAST(N'2023-08-13T01:35:03.6586583' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (130, N'133363534387497333', CAST(N'2023-08-13T01:35:03.8055238' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (131, N'133363534462461546', CAST(N'2023-08-13T01:35:03.8434192' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (132, N'133363535056244690', CAST(N'2023-08-13T01:35:03.9301856' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (133, N'133363534246409623', CAST(N'2023-08-13T01:35:51.0625115' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (134, N'133363533969383402', CAST(N'2023-08-13T01:35:51.2410345' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (135, N'133363533522065237', CAST(N'2023-08-13T01:35:51.3198251' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (136, N'133363533973270089', CAST(N'2023-08-13T01:35:51.3756741' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (137, N'133363533916983955', CAST(N'2023-08-13T01:35:57.3138357' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (138, N'133363534548703890', CAST(N'2023-08-13T01:35:57.4315209' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (139, N'133363534924839116', CAST(N'2023-08-13T01:35:57.5003374' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (140, N'133363535462351420', CAST(N'2023-08-13T01:35:57.5621718' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (141, N'133363534140057563', CAST(N'2023-08-13T01:36:18.0123204' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (142, N'133363535446074110', CAST(N'2023-08-13T01:36:18.1459623' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (143, N'133363535155168622', CAST(N'2023-08-13T01:36:18.2257491' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (144, N'133363534485116993', CAST(N'2023-08-13T01:36:18.2806022' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (145, N'133363543734485726', CAST(N'2023-08-13T01:50:26.8783320' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (146, N'133363543011938099', CAST(N'2023-08-13T01:50:27.1964812' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (147, N'133363544279538048', CAST(N'2023-08-13T01:50:27.3424017' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (148, N'133363543732714871', CAST(N'2023-08-13T01:50:27.4371554' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (149, N'133363542525044915', CAST(N'2023-08-13T01:50:27.5328918' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (150, N'133363542659498720', CAST(N'2023-08-13T01:50:27.9188599' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (151, N'133363542301100148', CAST(N'2023-08-13T01:50:27.9916669' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (152, N'133363543833234266', CAST(N'2023-08-13T01:50:28.0365457' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (153, N'133363544169309275', CAST(N'2023-08-13T01:50:35.2670246' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (154, N'133363542625829982', CAST(N'2023-08-13T01:50:35.4106409' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (155, N'133363543947690137', CAST(N'2023-08-13T01:50:35.4445487' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (156, N'133363542895477647', CAST(N'2023-08-13T01:50:35.5293218' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (157, N'133363542758882541', CAST(N'2023-08-13T01:50:53.2533736' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (158, N'133363543278510404', CAST(N'2023-08-13T01:50:53.3850204' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (159, N'133363544116802812', CAST(N'2023-08-13T01:50:53.4558316' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (160, N'133363544006621381', CAST(N'2023-08-13T01:50:53.5086895' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (161, N'133363544487376533', CAST(N'2023-08-13T01:51:38.7203649' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (162, N'133363543271939254', CAST(N'2023-08-13T01:51:39.1970899' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (163, N'133363543686160778', CAST(N'2023-08-13T01:51:39.3776067' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (164, N'133363543445963998', CAST(N'2023-08-13T01:51:39.6369135' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (165, N'133363543465417717', CAST(N'2023-08-13T01:51:39.7047322' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (166, N'133363543741697337', CAST(N'2023-08-13T01:51:40.1335853' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (167, N'133363543169417812', CAST(N'2023-08-13T01:51:40.1954200' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (168, N'133363544245733889', CAST(N'2023-08-13T01:51:40.2213504' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (169, N'133363544163857193', CAST(N'2023-08-13T01:51:44.8918601' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (170, N'133363543088581934', CAST(N'2023-08-13T01:51:45.0693855' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (171, N'133363543389682949', CAST(N'2023-08-13T01:51:45.1900627' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (172, N'133363544154155015', CAST(N'2023-08-13T01:51:45.2548888' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (173, N'133363544840065839', CAST(N'2023-08-13T01:53:35.7321087' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (174, N'133363545398927223', CAST(N'2023-08-13T01:53:36.0622249' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (175, N'133363544469787136', CAST(N'2023-08-13T01:53:36.2567047' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (176, N'133363545762725919', CAST(N'2023-08-13T01:53:36.4232649' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (177, N'133363545679329981', CAST(N'2023-08-13T01:53:36.4930713' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (178, N'133363545669170889', CAST(N'2023-08-13T01:53:36.8999845' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (179, N'133363545838877314', CAST(N'2023-08-13T01:53:36.9678028' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (180, N'133363546196959897', CAST(N'2023-08-13T01:53:36.9977219' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (181, N'133363545666135219', CAST(N'2023-08-13T01:53:46.5076973' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (182, N'133363544956716956', CAST(N'2023-08-13T01:53:46.6745256' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (183, N'133363545011752642', CAST(N'2023-08-13T01:53:46.7154186' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (184, N'133363545096824433', CAST(N'2023-08-13T01:53:46.8001998' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (185, N'133363545921672306', CAST(N'2023-08-13T01:53:54.4623867' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (186, N'133363544373275980', CAST(N'2023-08-13T01:53:54.5980236' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (187, N'133363546111044123', CAST(N'2023-08-13T01:53:54.6608551' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (188, N'133363545253588030', CAST(N'2023-08-13T01:53:54.7306693' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (189, N'133363546053680167', CAST(N'2023-08-13T01:54:15.7151921' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (190, N'133363545597772769', CAST(N'2023-08-13T01:54:15.8388609' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (191, N'133363544930273936', CAST(N'2023-08-13T01:54:15.9236349' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (192, N'133363546002060372', CAST(N'2023-08-13T01:54:16.0024703' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (193, N'133363557802159087', CAST(N'2023-08-13T02:13:48.2040757' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (194, N'133363558375774037', CAST(N'2023-08-13T02:13:48.5950290' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (195, N'133363557808467056', CAST(N'2023-08-13T02:13:48.8014769' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (196, N'133363557615156255', CAST(N'2023-08-13T02:13:48.9261432' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (197, N'133363557855377582', CAST(N'2023-08-13T02:13:48.9989487' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (198, N'133363557479119353', CAST(N'2023-08-13T02:13:49.3829228' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (199, N'133363557402752248', CAST(N'2023-08-13T02:13:49.4447587' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (200, N'133363557522570760', CAST(N'2023-08-13T02:13:49.4736807' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (201, N'133363557907742271', CAST(N'2023-08-13T02:14:03.2461954' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (202, N'133363558439165639', CAST(N'2023-08-13T02:14:03.4566321' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (203, N'133363556686569171', CAST(N'2023-08-13T02:14:24.2701155' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (204, N'133363556782276202', CAST(N'2023-08-13T02:14:25.0346788' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (205, N'133363557110575157', CAST(N'2023-08-13T02:14:25.5626375' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (206, N'133363557739983321', CAST(N'2023-08-13T02:14:27.7443817' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (207, N'133363557202601758', CAST(N'2023-08-13T02:14:34.6665396' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (208, N'133363558774265306', CAST(N'2023-08-13T02:14:34.7722548' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (209, N'133363557963295374', CAST(N'2023-08-13T02:14:43.6824871' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (210, N'133363557198826767', CAST(N'2023-08-13T02:14:43.7782299' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (211, N'133363558373338837', CAST(N'2023-08-13T02:15:01.5263531' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (212, N'133363557425959670', CAST(N'2023-08-13T02:15:01.6250879' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (213, N'133363557803872051', CAST(N'2023-08-13T02:15:01.7048751' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (214, N'133363557122527993', CAST(N'2023-08-13T02:15:01.7437721' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (215, N'133363557996747056', CAST(N'2023-08-13T02:15:50.2765434' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (216, N'133363559371979525', CAST(N'2023-08-13T02:16:06.3972887' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (217, N'133363558258899818', CAST(N'2023-08-13T02:16:06.5259427' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (218, N'133363558397312423', CAST(N'2023-08-13T02:16:06.6176974' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (219, N'133363558645575962', CAST(N'2023-08-13T02:16:06.6795316' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (220, N'133363558551858413', CAST(N'2023-08-13T02:16:23.3479214' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (221, N'133363558636786161', CAST(N'2023-08-13T02:16:23.5254479' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (222, N'133363559821445054', CAST(N'2023-08-13T02:16:23.6102217' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (223, N'133363559214470845', CAST(N'2023-08-13T02:16:23.6770461' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (224, N'133363562117499084', CAST(N'2023-08-13T02:21:08.8602756' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (225, N'133363561183272127', CAST(N'2023-08-13T02:21:09.1844080' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (226, N'133363562121396506', CAST(N'2023-08-13T02:21:09.3230384' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (227, N'133363561960180754', CAST(N'2023-08-13T02:21:09.5115336' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (228, N'133363560843785336', CAST(N'2023-08-13T02:21:09.6142581' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (229, N'133363560721312332', CAST(N'2023-08-13T02:21:09.9324103' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (230, N'133363561785467547', CAST(N'2023-08-13T02:21:09.9822748' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (231, N'133363562788110454', CAST(N'2023-08-13T02:21:10.0171813' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (232, N'133363562609164688', CAST(N'2023-08-13T02:21:24.2305138' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (233, N'133363562948007928', CAST(N'2023-08-13T02:21:24.4020556' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (234, N'133363560845995603', CAST(N'2023-08-13T02:21:24.4519220' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (235, N'133363562892225668', CAST(N'2023-08-13T02:21:24.5606310' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (236, N'133363561464778492', CAST(N'2023-08-13T02:21:29.3458349' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (237, N'133363560905456984', CAST(N'2023-08-13T02:21:29.5283459' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (238, N'133363562640045851', CAST(N'2023-08-13T02:21:29.6011509' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (239, N'133363562031995844', CAST(N'2023-08-13T02:21:29.6579983' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (240, N'133363562659533579', CAST(N'2023-08-13T02:21:37.4351998' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (241, N'133363562847849527', CAST(N'2023-08-13T02:21:37.6236952' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (242, N'133363562920966627', CAST(N'2023-08-13T02:21:37.7034819' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (243, N'133363562572609651', CAST(N'2023-08-13T02:21:37.7832684' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (244, N'133363561162675632', CAST(N'2023-08-13T02:21:44.2310245' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (245, N'133363561469210298', CAST(N'2023-08-13T02:21:44.3187907' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (246, N'133363573751431584', CAST(N'2023-08-13T02:40:22.4824443' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (247, N'133363574010795878', CAST(N'2023-08-13T02:40:26.3741731' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (248, N'133363573251679904', CAST(N'2023-08-13T02:40:26.4549664' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (249, N'133363574365749706', CAST(N'2023-08-13T02:40:26.6155114' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (250, N'133363573662291482', CAST(N'2023-08-13T02:40:26.7042741' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (251, N'133363572390854344', CAST(N'2023-08-13T02:40:26.8349250' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (252, N'133363574091841831', CAST(N'2023-08-13T02:40:27.1700298' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (253, N'133363573027631090', CAST(N'2023-08-13T02:40:27.2398417' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (254, N'133363572749600264', CAST(N'2023-08-13T02:40:27.2787380' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (255, N'133363572644081249', CAST(N'2023-08-13T02:40:55.9155814' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (256, N'133363574015129110', CAST(N'2023-08-13T02:42:14.5775149' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (257, N'133363574955528168', CAST(N'2023-08-13T02:42:14.9016474' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (258, N'133363573447944375', CAST(N'2023-08-13T02:42:15.1848902' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (259, N'133363574129608056', CAST(N'2023-08-13T02:42:15.2766447' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (260, N'133363573670926150', CAST(N'2023-08-13T02:42:15.3604202' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (261, N'133363573501552058', CAST(N'2023-08-13T02:42:15.5050341' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (262, N'133363574175065017', CAST(N'2023-08-13T02:42:15.7344229' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (263, N'133363574330837407', CAST(N'2023-08-13T02:42:15.8152065' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (264, N'133363574220572222', CAST(N'2023-08-13T02:42:15.9149377' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (265, N'133364123206430456', CAST(N'2023-08-13T17:57:33.0879745' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (266, N'133364122932554986', CAST(N'2023-08-13T17:57:34.0783257' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (267, N'133364122732959154', CAST(N'2023-08-13T17:57:34.5999304' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (268, N'133364123959345402', CAST(N'2023-08-13T17:57:34.7356211' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (269, N'133364124247695607', CAST(N'2023-08-13T17:57:34.8116386' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (270, N'133364123608453607', CAST(N'2023-08-13T17:57:35.5127227' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (271, N'133364124198135640', CAST(N'2023-08-13T17:57:35.7801515' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (272, N'133364122979612393', CAST(N'2023-08-13T17:57:35.8488732' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (273, N'133364123033704020', CAST(N'2023-08-13T17:57:35.9416418' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (274, N'133364126144365957', CAST(N'2023-08-13T18:00:48.7568959' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (275, N'133364125150552514', CAST(N'2023-08-13T18:00:49.0836526' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (276, N'133364126346381355', CAST(N'2023-08-13T18:00:49.2503617' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (277, N'133364126538183783', CAST(N'2023-08-13T18:00:49.4141378' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (278, N'133364125862972541', CAST(N'2023-08-13T18:00:49.4949336' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (279, N'133364124935520327', CAST(N'2023-08-13T18:00:49.6153682' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (280, N'133364126642343771', CAST(N'2023-08-13T18:00:49.9055940' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (281, N'133364125455299247', CAST(N'2023-08-13T18:00:50.0396254' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (282, N'133364126138850334', CAST(N'2023-08-13T18:00:50.0838818' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (283, N'133364126218272701', CAST(N'2023-08-13T18:02:14.3169403' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (284, N'133364127019356653', CAST(N'2023-08-13T18:02:14.6252456' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (285, N'133364126542774620', CAST(N'2023-08-13T18:02:14.7588399' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (286, N'133364125744744816', CAST(N'2023-08-13T18:02:14.8724539' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (287, N'133364126069350411', CAST(N'2023-08-13T18:02:14.9522620' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (288, N'133364126435353075', CAST(N'2023-08-13T18:02:15.0840086' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (289, N'133364125873483849', CAST(N'2023-08-13T18:02:15.2953228' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (290, N'133364125555873485', CAST(N'2023-08-13T18:02:15.3641395' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (291, N'133364126029354824', CAST(N'2023-08-13T18:02:15.4524018' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (292, N'133364135697491438', CAST(N'2023-08-13T18:17:05.7528109' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (293, N'133364136360719308', CAST(N'2023-08-13T18:17:07.0043824' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (294, N'133364134924989584', CAST(N'2023-08-13T18:17:07.8620206' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (295, N'133364135595758913', CAST(N'2023-08-13T18:17:08.1073648' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (296, N'133364135538863464', CAST(N'2023-08-13T18:17:08.2180693' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (297, N'133364136136778544', CAST(N'2023-08-13T18:17:08.4764140' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (298, N'133364135234222908', CAST(N'2023-08-13T18:17:08.7626488' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (299, N'133364136149307982', CAST(N'2023-08-13T18:17:08.9234796' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (300, N'133364135478931312', CAST(N'2023-08-13T18:17:08.9870496' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (301, N'133364134841679176', CAST(N'2023-08-13T18:17:44.7575180' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (302, N'133364136796879957', CAST(N'2023-08-13T18:17:45.1657752' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (303, N'133364135466523699', CAST(N'2023-08-13T18:17:45.2050404' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (304, N'133364136519047477', CAST(N'2023-08-13T18:17:45.2716110' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (305, N'133364137221869820', CAST(N'2023-08-13T18:18:57.0442052' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (306, N'133364135527918376', CAST(N'2023-08-13T18:18:57.2895464' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (307, N'133364136612828947', CAST(N'2023-08-13T18:18:57.3563677' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (308, N'133364135570226826', CAST(N'2023-08-13T18:18:57.4341600' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (309, N'133364141337262047', CAST(N'2023-08-13T18:27:16.6042286' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (310, N'133364140704887675', CAST(N'2023-08-13T18:27:18.2491429' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (311, N'133364142181025485', CAST(N'2023-08-13T18:27:19.1016595' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (312, N'133364141375498509', CAST(N'2023-08-13T18:27:19.2961378' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (313, N'133364142531205001', CAST(N'2023-08-13T18:27:19.3829073' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (314, N'133364141729040376', CAST(N'2023-08-13T18:27:19.9654675' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (315, N'133364140729077902', CAST(N'2023-08-13T18:27:20.2513504' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (316, N'133364140933992989', CAST(N'2023-08-13T18:27:20.3421036' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (317, N'133364140416293247', CAST(N'2023-08-13T18:27:20.4368514' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (318, N'133364141387680650', CAST(N'2023-08-13T18:27:39.3685498' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (319, N'133364141389905012', CAST(N'2023-08-13T18:27:39.7828273' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (320, N'133364142357501235', CAST(N'2023-08-13T18:27:39.8237168' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (321, N'133364142576203135', CAST(N'2023-08-13T18:27:39.8971557' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (322, N'133364144050381934', CAST(N'2023-08-13T18:30:35.6705238' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (323, N'133364143657920476', CAST(N'2023-08-13T18:30:36.8762726' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (324, N'133364143959379742', CAST(N'2023-08-13T18:30:37.9507813' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (325, N'133364143454411967', CAST(N'2023-08-13T18:30:38.1030440' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (326, N'133364143829738221', CAST(N'2023-08-13T18:30:38.1938008' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (327, N'133364144262724333', CAST(N'2023-08-13T18:30:38.4715169' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (328, N'133364143851450811', CAST(N'2023-08-13T18:30:38.7374797' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (329, N'133364143003625400', CAST(N'2023-08-13T18:30:38.9058965' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (330, N'133364143933559312', CAST(N'2023-08-13T18:30:38.9807228' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (331, N'133364144246887366', CAST(N'2023-08-13T18:30:59.1328225' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (332, N'133364143746869840', CAST(N'2023-08-13T18:30:59.6153968' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (333, N'133364144674734120', CAST(N'2023-08-13T18:30:59.6827700' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (334, N'133364144585724442', CAST(N'2023-08-13T18:30:59.7844972' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (335, N'133364143865652307', CAST(N'2023-08-13T18:31:34.7184875' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (336, N'133364145058208645', CAST(N'2023-08-13T18:31:34.8666024' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (337, N'133364143016535331', CAST(N'2023-08-13T18:31:34.9626819' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (338, N'133364144471800655', CAST(N'2023-08-13T18:31:35.0116154' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (339, N'133364146048859013', CAST(N'2023-08-13T18:34:23.3281168' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (340, N'133364145939068300', CAST(N'2023-08-13T18:34:23.5026138' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (341, N'133364145180034694', CAST(N'2023-08-13T18:34:23.5794153' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (342, N'133364145994817073', CAST(N'2023-08-13T18:34:23.6442389' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (343, N'133364147941686107', CAST(N'2023-08-13T18:38:32.7186508' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (344, N'133364147946894049', CAST(N'2023-08-13T18:38:33.0628013' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (345, N'133364147776921397', CAST(N'2023-08-13T18:38:33.2102988' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (346, N'133364147275391400', CAST(N'2023-08-13T18:38:33.3299779' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (347, N'133364149101508586', CAST(N'2023-08-13T18:38:33.4017855' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (348, N'133364148427701375', CAST(N'2023-08-13T18:38:33.5573694' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (349, N'133364147899370495', CAST(N'2023-08-13T18:38:33.8052293' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (350, N'133364147615635358', CAST(N'2023-08-13T18:38:33.8710546' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (351, N'133364149089760908', CAST(N'2023-08-13T18:38:34.0106804' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (352, N'133364148536737903', CAST(N'2023-08-13T18:38:46.2470124' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (353, N'133364148847260038', CAST(N'2023-08-13T18:38:46.3876359' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (354, N'133364149196601076', CAST(N'2023-08-13T18:38:46.4325158' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (355, N'133364148574185293', CAST(N'2023-08-13T18:38:46.4979725' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (356, N'133364148769290660', CAST(N'2023-08-13T18:40:20.1224779' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (357, N'133364149235684766', CAST(N'2023-08-13T18:40:20.4400429' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (358, N'133364148258175111', CAST(N'2023-08-13T18:40:20.5746060' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (359, N'133364150310523145', CAST(N'2023-08-13T18:40:20.6763670' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (360, N'133364150056329095', CAST(N'2023-08-13T18:40:20.7520011' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (361, N'133364149298647693', CAST(N'2023-08-13T18:40:20.8937543' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (362, N'133364149776279062', CAST(N'2023-08-13T18:40:21.1503624' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (363, N'133364149866141309', CAST(N'2023-08-13T18:40:21.2318504' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (364, N'133364149496400348', CAST(N'2023-08-13T18:40:21.3465420' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (365, N'133364153173968907', CAST(N'2023-08-13T18:47:59.3501349' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (366, N'133364153859540684', CAST(N'2023-08-13T18:47:59.6632505' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (367, N'133364153276443066', CAST(N'2023-08-13T18:47:59.8460901' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (368, N'133364153225971087', CAST(N'2023-08-13T18:47:59.9375172' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (369, N'133364153322793989', CAST(N'2023-08-13T18:48:00.0711830' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (370, N'133364152844761905', CAST(N'2023-08-13T18:48:00.2716228' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (371, N'133364153964422439', CAST(N'2023-08-13T18:48:00.5948572' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (372, N'133364154367686308', CAST(N'2023-08-13T18:48:00.8710188' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (373, N'133364154307904558', CAST(N'2023-08-13T18:48:00.9338515' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (374, N'133364153960871011', CAST(N'2023-08-13T18:48:05.4050645' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (375, N'133364153497153254', CAST(N'2023-08-13T18:48:05.5057684' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (376, N'133364154822211795', CAST(N'2023-08-13T18:48:05.5386817' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (377, N'133364154737335217', CAST(N'2023-08-13T18:48:05.6000776' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (378, N'133364157621905750', CAST(N'2023-08-13T18:54:19.9898611' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (379, N'133364157795146950', CAST(N'2023-08-13T18:54:20.3268506' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (380, N'133364156694444030', CAST(N'2023-08-13T18:54:20.4594703' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (381, N'133364158135546211', CAST(N'2023-08-13T18:54:20.5611995' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (382, N'133364157102118054', CAST(N'2023-08-13T18:54:20.6649195' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (383, N'133364157174858872', CAST(N'2023-08-13T18:54:20.8324721' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (384, N'133364157467864864', CAST(N'2023-08-13T18:54:21.0748247' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (385, N'133364158386642791', CAST(N'2023-08-13T18:54:21.1706498' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (386, N'133364157710822839', CAST(N'2023-08-13T18:54:21.2782804' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (387, N'133364159250019774', CAST(N'2023-08-13T18:55:38.0344965' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (388, N'133364158037156875', CAST(N'2023-08-13T18:55:38.1551719' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (389, N'133364158758044622', CAST(N'2023-08-13T18:55:38.1840953' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (390, N'133364158721578534', CAST(N'2023-08-13T18:55:38.2486688' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (391, N'133364166534523654', CAST(N'2023-08-13T19:07:24.1345621' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (392, N'133364165121524343', CAST(N'2023-08-13T19:07:24.4669423' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (393, N'133364165564835766', CAST(N'2023-08-13T19:07:24.6434403' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (394, N'133364165089894521', CAST(N'2023-08-13T19:07:24.7810106' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (395, N'133364165956809840', CAST(N'2023-08-13T19:07:24.8847340' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (396, N'133364165621790917', CAST(N'2023-08-13T19:07:25.0552760' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (397, N'133364166182821151', CAST(N'2023-08-13T19:07:25.2926436' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (398, N'133364164969639158', CAST(N'2023-08-13T19:07:25.3634536' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (399, N'133364165569181263', CAST(N'2023-08-13T19:07:25.4981611' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (400, N'133364165982274968', CAST(N'2023-08-13T19:08:49.2066943' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (401, N'133364167430011845', CAST(N'2023-08-13T19:08:49.6109178' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (402, N'133364165659979466', CAST(N'2023-08-13T19:08:49.7552272' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (403, N'133364166511421126', CAST(N'2023-08-13T19:08:49.8569578' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (404, N'133364167417314155', CAST(N'2023-08-13T19:08:49.9397344' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (405, N'133364167341052284', CAST(N'2023-08-13T19:08:50.1140831' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (406, N'133364166408775867', CAST(N'2023-08-13T19:08:50.3695853' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (407, N'133364167380620035', CAST(N'2023-08-13T19:08:50.4533611' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (408, N'133364165893394482', CAST(N'2023-08-13T19:08:50.5700477' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (409, N'133364166819399092', CAST(N'2023-08-13T19:10:01.9261200' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (410, N'133364166036191283', CAST(N'2023-08-13T19:10:02.3041891' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (411, N'133364166470726666', CAST(N'2023-08-13T19:10:02.4684009' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (412, N'133364166680253827', CAST(N'2023-08-13T19:10:02.6259794' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (413, N'133364167276391554', CAST(N'2023-08-13T19:10:02.7348572' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (414, N'133364167818995494', CAST(N'2023-08-13T19:10:02.8763083' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (415, N'133364167878269982', CAST(N'2023-08-13T19:10:03.1844840' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (416, N'133364166897219586', CAST(N'2023-08-13T19:10:03.2692581' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (417, N'133364168166979501', CAST(N'2023-08-13T19:10:03.4241354' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (418, N'133364166817897381', CAST(N'2023-08-13T19:11:05.2846077' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (419, N'133364167539721811', CAST(N'2023-08-13T19:11:05.7025542' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (420, N'133364167886262581', CAST(N'2023-08-13T19:11:05.8471037' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (421, N'133364167196859558', CAST(N'2023-08-13T19:11:05.9488315' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (422, N'133364167713538705', CAST(N'2023-08-13T19:11:06.0323764' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (423, N'133364166891874468', CAST(N'2023-08-13T19:11:06.1911822' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (424, N'133364167637254972', CAST(N'2023-08-13T19:11:06.4365280' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (425, N'133364168064508567', CAST(N'2023-08-13T19:11:06.5123261' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (426, N'133364167823850205', CAST(N'2023-08-13T19:11:06.6339985' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (427, N'133364169053512280', CAST(N'2023-08-13T19:12:15.8802995' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (428, N'133364167886217831', CAST(N'2023-08-13T19:12:16.3393714' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (429, N'133364167376079543', CAST(N'2023-08-13T19:12:16.7219825' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (430, N'133364167614890707', CAST(N'2023-08-13T19:12:16.8257053' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (431, N'133364168588414633', CAST(N'2023-08-13T19:12:16.9374071' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (432, N'133364169227880970', CAST(N'2023-08-13T19:12:17.1171005' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (433, N'133364167490130865', CAST(N'2023-08-13T19:12:17.4779611' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (434, N'133364169027107450', CAST(N'2023-08-13T19:12:17.5766962' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (435, N'133364169079832456', CAST(N'2023-08-13T19:12:17.7322812' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (436, N'133364169843778119', CAST(N'2023-08-13T19:13:39.6065826' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (437, N'133364169317372207', CAST(N'2023-08-13T19:13:39.9137615' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (438, N'133364169220879265', CAST(N'2023-08-13T19:13:40.0593720' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (439, N'133364169645665901', CAST(N'2023-08-13T19:13:40.1571113' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (440, N'133364168533103196', CAST(N'2023-08-13T19:13:40.2458739' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (441, N'133364168453764069', CAST(N'2023-08-13T19:13:40.3895134' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (442, N'133364170070246795', CAST(N'2023-08-13T19:13:40.6428116' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (443, N'133364168480964565', CAST(N'2023-08-13T19:13:40.7313665' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (444, N'133364168950815079', CAST(N'2023-08-13T19:13:40.8293137' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (445, N'133364170308210786', CAST(N'2023-08-13T19:14:45.2577382' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (446, N'133364168864701270', CAST(N'2023-08-13T19:14:45.5789414' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (447, N'133364169035525887', CAST(N'2023-08-13T19:14:45.7115779' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (448, N'133364169960524422', CAST(N'2023-08-13T19:14:45.8351932' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (449, N'133364169120189322', CAST(N'2023-08-13T19:14:45.9189693' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (450, N'133364170629958475', CAST(N'2023-08-13T19:14:46.0536108' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (451, N'133364170016673509', CAST(N'2023-08-13T19:14:46.3233726' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (452, N'133364169503440983', CAST(N'2023-08-13T19:14:46.4076617' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (453, N'133364170806806835', CAST(N'2023-08-13T19:14:46.5253812' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (454, N'133364175533881769', CAST(N'2023-08-13T19:22:53.5695740' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (455, N'133364175122091809', CAST(N'2023-08-13T19:22:53.8747588' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (456, N'133364175821936924', CAST(N'2023-08-13T19:22:54.0113936' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (457, N'133364173793059514', CAST(N'2023-08-13T19:22:54.1091322' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (458, N'133364173815015753', CAST(N'2023-08-13T19:22:54.2068702' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (459, N'133364174662596357', CAST(N'2023-08-13T19:22:54.3375229' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (460, N'133364174217596865', CAST(N'2023-08-13T19:22:54.5738893' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (461, N'133364175265700066', CAST(N'2023-08-13T19:22:54.6516801' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (462, N'133364174999716090', CAST(N'2023-08-13T19:22:54.7583981' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (463, N'133364174384025632', CAST(N'2023-08-13T19:23:21.8295088' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (464, N'133364175267001545', CAST(N'2023-08-13T19:23:21.9880443' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (465, N'133364174984602176', CAST(N'2023-08-13T19:23:22.0189613' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (466, N'133364176052129259', CAST(N'2023-08-13T19:23:22.0887796' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (467, N'133364176408990165', CAST(N'2023-08-13T19:27:16.8179688' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (468, N'133364177412040652', CAST(N'2023-08-13T19:27:17.1237340' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (469, N'133364178360204822', CAST(N'2023-08-13T19:27:17.2657161' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (470, N'133364177889505650', CAST(N'2023-08-13T19:27:17.3594659' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (471, N'133364176594810724', CAST(N'2023-08-13T19:27:17.4662281' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (472, N'133364178502693854', CAST(N'2023-08-13T19:27:17.5858953' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (473, N'133364177415904286', CAST(N'2023-08-13T19:27:17.8335512' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (474, N'133364176766544296', CAST(N'2023-08-13T19:27:17.9229588' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (475, N'133364178449435703', CAST(N'2023-08-13T19:27:18.0456480' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (476, N'133364178988958019', CAST(N'2023-08-13T19:30:18.6339066' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (477, N'133364178423842726', CAST(N'2023-08-13T19:30:18.9550789' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (478, N'133364180006012012', CAST(N'2023-08-13T19:30:19.1016551' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (479, N'133364180318670401', CAST(N'2023-08-13T19:30:19.1993939' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (480, N'133364180030254422', CAST(N'2023-08-13T19:30:19.2971312' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (481, N'133364180320340604', CAST(N'2023-08-13T19:30:19.4428453' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (482, N'133364180015159269', CAST(N'2023-08-13T19:30:19.7040439' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (483, N'133364180130006662', CAST(N'2023-08-13T19:30:19.7824239' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (484, N'133364178818152110', CAST(N'2023-08-13T19:30:19.8865560' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (485, N'133364179639905668', CAST(N'2023-08-13T19:30:48.0122167' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (486, N'133364180344350712', CAST(N'2023-08-13T19:30:48.1493209' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (487, N'133364178597244063', CAST(N'2023-08-13T19:30:48.2171404' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (488, N'133364180577936686', CAST(N'2023-08-13T19:30:48.2739871' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (489, N'133364179740238167', CAST(N'2023-08-13T19:32:33.7446961' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (490, N'133364180184428800', CAST(N'2023-08-13T19:32:34.0607671' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (491, N'133364180825080938', CAST(N'2023-08-13T19:32:34.2402870' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (492, N'133364180545273974', CAST(N'2023-08-13T19:32:34.4109074' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (493, N'133364181404932100', CAST(N'2023-08-13T19:32:34.4946076' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (494, N'133364180472137760', CAST(N'2023-08-13T19:32:34.6442066' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (495, N'133364180639917797', CAST(N'2023-08-13T19:32:34.9264524' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (496, N'133364179561114576', CAST(N'2023-08-13T19:32:35.1109589' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (497, N'133364180641482161', CAST(N'2023-08-13T19:32:35.1459045' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (498, N'133364180089299286', CAST(N'2023-08-13T19:33:22.0239949' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (499, N'133364181267400956', CAST(N'2023-08-13T19:33:22.1765799' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (500, N'133364180222416702', CAST(N'2023-08-13T19:33:22.2613521' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (501, N'133364181741244761', CAST(N'2023-08-13T19:33:22.3331606' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (502, N'133364181174327427', CAST(N'2023-08-13T19:33:28.5317895' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (503, N'133364181646434219', CAST(N'2023-08-13T19:33:28.6832210' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (504, N'133364181725847541', CAST(N'2023-08-13T19:33:28.7520387' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (505, N'133364182214608721', CAST(N'2023-08-13T19:33:28.8031139' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (506, N'133364182719484259', CAST(N'2023-08-13T19:34:52.2222206' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (507, N'133364181310980971', CAST(N'2023-08-13T19:34:52.5284042' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (508, N'133364182900095664', CAST(N'2023-08-13T19:34:52.6653516' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (509, N'133364182031092797', CAST(N'2023-08-13T19:34:52.7697570' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (510, N'133364181816226147', CAST(N'2023-08-13T19:34:52.8495433' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (511, N'133364181758429283', CAST(N'2023-08-13T19:34:52.9994204' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (512, N'133364181107303886', CAST(N'2023-08-13T19:34:53.2614430' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (513, N'133364182693832275', CAST(N'2023-08-13T19:34:53.3462169' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (514, N'133364181205811140', CAST(N'2023-08-13T19:34:53.4549336' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (515, N'133364182781111680', CAST(N'2023-08-13T19:35:51.3393405' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (516, N'133364183253761695', CAST(N'2023-08-13T19:35:51.6105864' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (517, N'133364212192374977', CAST(N'2023-08-13T20:26:20.4938772' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (518, N'133364212139124970', CAST(N'2023-08-13T20:26:21.7704595' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (519, N'133364213453432147', CAST(N'2023-08-13T20:26:22.5618741' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (520, N'133364213240391985', CAST(N'2023-08-13T20:26:22.7982431' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (521, N'133364213295952007', CAST(N'2023-08-13T20:26:22.8919920' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (522, N'133364212903399802', CAST(N'2023-08-13T20:26:23.1453154' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (523, N'133364213728050941', CAST(N'2023-08-13T20:26:23.4040914' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (524, N'133364213399943519', CAST(N'2023-08-13T20:26:23.5811648' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (525, N'133364213579378120', CAST(N'2023-08-13T20:26:23.6300195' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (526, N'133364214684100285', CAST(N'2023-08-13T20:28:34.9171576' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (527, N'133364213908824080', CAST(N'2023-08-13T20:28:35.2642293' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (528, N'133364213351102935', CAST(N'2023-08-13T20:28:35.4068825' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (529, N'133364213236710704', CAST(N'2023-08-13T20:28:35.5055829' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (530, N'133364214542098474', CAST(N'2023-08-13T20:28:35.5963402' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (531, N'133364213812340825', CAST(N'2023-08-13T20:28:35.7269910' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (532, N'133364214870793153', CAST(N'2023-08-13T20:28:36.0488799' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (533, N'133364214274433822', CAST(N'2023-08-13T20:28:36.1289149' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (534, N'133364214575386522', CAST(N'2023-08-13T20:28:36.2376252' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (535, N'133364249649421447', CAST(N'2023-08-13T21:27:50.8182472' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (536, N'133364248898639504', CAST(N'2023-08-13T21:27:51.1792799' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (537, N'133364250163230712', CAST(N'2023-08-13T21:27:51.3358607' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (538, N'133364249112377953', CAST(N'2023-08-13T21:27:51.4505540' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (539, N'133364249806804721', CAST(N'2023-08-13T21:27:51.5333325' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (540, N'133364249763167843', CAST(N'2023-08-13T21:27:51.7936382' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (541, N'133364250066145487', CAST(N'2023-08-13T21:27:52.0938334' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (542, N'133364249666275230', CAST(N'2023-08-13T21:27:52.1845902' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (543, N'133364248958507307', CAST(N'2023-08-13T21:27:52.3202272' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (544, N'133364250065320864', CAST(N'2023-08-13T21:29:57.2476419' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (545, N'133364262311672287', CAST(N'2023-08-13T21:47:03.8182907' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (546, N'133364262027455711', CAST(N'2023-08-13T21:47:04.1454715' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (547, N'133364261717083328', CAST(N'2023-08-13T21:47:04.3378844' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (548, N'133364261890731192', CAST(N'2023-08-13T21:47:04.5004488' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (549, N'133364261908234216', CAST(N'2023-08-13T21:47:04.5622846' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (550, N'133364260254951101', CAST(N'2023-08-13T21:47:04.7391307' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (551, N'133364261810558691', CAST(N'2023-08-13T21:47:05.0011100' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (552, N'133364261951685541', CAST(N'2023-08-13T21:47:05.0808967' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (553, N'133364261939270665', CAST(N'2023-08-13T21:47:05.2275041' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (554, N'133364262054124149', CAST(N'2023-08-13T21:47:38.5321753' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (555, N'133364261575302736', CAST(N'2023-08-13T21:47:39.4929210' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (556, N'133364261467036206', CAST(N'2023-08-13T21:48:08.2800392' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (557, N'133364262557060324', CAST(N'2023-08-13T21:48:08.6750197' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (558, N'133364262849858312', CAST(N'2023-08-13T21:48:08.7505183' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (559, N'133364262563381902', CAST(N'2023-08-13T21:48:08.8097286' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (560, N'133364262629482643', CAST(N'2023-08-13T21:49:20.6431754' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (561, N'133364263283508685', CAST(N'2023-08-13T21:49:20.9207672' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (562, N'133364263017761662', CAST(N'2023-08-13T21:49:20.9717526' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (563, N'133364262705352202', CAST(N'2023-08-13T21:49:21.0405478' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (564, N'133364291661054516', CAST(N'2023-08-13T22:37:08.5462107' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (565, N'133364291139353656', CAST(N'2023-08-13T22:37:09.3829741' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (566, N'133364292111766953', CAST(N'2023-08-13T22:37:09.7619590' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (567, N'133364291986727658', CAST(N'2023-08-13T22:37:09.8547124' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (568, N'133364291720704620', CAST(N'2023-08-13T22:37:09.9504533' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (569, N'133364291198682776', CAST(N'2023-08-13T22:37:10.3893236' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (570, N'133364290353451360', CAST(N'2023-08-13T22:37:10.6536182' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (571, N'133364291779251740', CAST(N'2023-08-13T22:37:10.7353974' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (572, N'133364290504434804', CAST(N'2023-08-13T22:37:10.8590678' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (573, N'133364292117443822', CAST(N'2023-08-13T22:37:27.2268326' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (574, N'133364294225977966', CAST(N'2023-08-13T22:40:17.3733117' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (575, N'133364292377892091', CAST(N'2023-08-13T22:40:21.9802078' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (576, N'133364292983211680', CAST(N'2023-08-13T22:40:22.0490507' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (577, N'133364293110532299', CAST(N'2023-08-13T22:40:22.2035973' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (578, N'133364293726153485', CAST(N'2023-08-13T22:40:22.2963486' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (579, N'133364293970206475', CAST(N'2023-08-13T22:40:22.3890999' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (580, N'133364293811842430', CAST(N'2023-08-13T22:40:22.5137654' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (581, N'133364292364471891', CAST(N'2023-08-13T22:40:22.7411612' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (582, N'133364293770582083', CAST(N'2023-08-13T22:40:22.8169551' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (583, N'133364292394524783', CAST(N'2023-08-13T22:40:22.9366357' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (584, N'133364294256655909', CAST(N'2023-08-13T22:40:40.4634655' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (585, N'133364294779510356', CAST(N'2023-08-13T22:44:35.6659455' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (586, N'133364296522737207', CAST(N'2023-08-13T22:44:35.9632712' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (587, N'133364295558262163', CAST(N'2023-08-13T22:44:36.1074066' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (588, N'133364296653207802', CAST(N'2023-08-13T22:44:36.1931773' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (589, N'133364295492517744', CAST(N'2023-08-13T22:44:36.2629910' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (590, N'133364296667654501', CAST(N'2023-08-13T22:44:36.3906501' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (591, N'133364296309873964', CAST(N'2023-08-13T22:44:36.6170769' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (592, N'133364295013325550', CAST(N'2023-08-13T22:44:36.6968326' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (593, N'133364295874014731', CAST(N'2023-08-13T22:44:36.7955679' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (594, N'133364296626124646', CAST(N'2023-08-13T22:44:40.5283604' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (595, N'133364398677599579', CAST(N'2023-08-14T01:37:26.5444858' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (596, N'133364400383712559', CAST(N'2023-08-14T01:37:27.6255662' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (597, N'133364399026423435', CAST(N'2023-08-14T01:37:28.2209765' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (598, N'133364400587065800', CAST(N'2023-08-14T01:37:28.4254281' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (599, N'133364400533955284', CAST(N'2023-08-14T01:37:28.5431131' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (600, N'133364400180149141', CAST(N'2023-08-14T01:37:28.8622601' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (601, N'133364399465056777', CAST(N'2023-08-14T01:37:29.2362594' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (602, N'133364399234784803', CAST(N'2023-08-14T01:37:29.4357267' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (603, N'133364399130767819', CAST(N'2023-08-14T01:37:29.4895830' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (604, N'133364400286909623', CAST(N'2023-08-14T01:37:32.6108004' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (605, N'133364400467133481', CAST(N'2023-08-14T01:37:46.2030342' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (606, N'133364400491471587', CAST(N'2023-08-14T01:39:46.9927355' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (607, N'133364400689309457', CAST(N'2023-08-14T01:39:51.3818579' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (608, N'133364401106282241', CAST(N'2023-08-14T01:39:51.4776078' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (609, N'133364400993422818', CAST(N'2023-08-14T01:39:51.6632012' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (610, N'133364401674831593', CAST(N'2023-08-14T01:39:51.8136709' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (611, N'133364400558381359', CAST(N'2023-08-14T01:39:51.8885848' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (612, N'133364401146617323', CAST(N'2023-08-14T01:39:52.0186795' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (613, N'133364401739935716', CAST(N'2023-08-14T01:39:52.3153282' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (614, N'133364401036567381', CAST(N'2023-08-14T01:39:52.5257659' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (615, N'133364400471759588', CAST(N'2023-08-14T01:39:52.5706461' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (616, N'133364401442037256', CAST(N'2023-08-14T01:39:54.4918589' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (617, N'133364400272158353', CAST(N'2023-08-14T01:39:54.8209766' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (618, N'133364402175945350', CAST(N'2023-08-14T01:40:36.5143445' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (619, N'133364401642166569', CAST(N'2023-08-14T01:40:36.5552046' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (620, N'133364401734198132', CAST(N'2023-08-14T01:40:36.5741546' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (621, N'133364403952357264', CAST(N'2023-08-14T01:43:02.8056262' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (622, N'133364401913032902', CAST(N'2023-08-14T01:43:03.1128040' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (623, N'133364403214645507', CAST(N'2023-08-14T01:43:03.2454486' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (624, N'133364402306940533', CAST(N'2023-08-14T01:43:03.3451819' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (625, N'133364402615073004', CAST(N'2023-08-14T01:43:03.4329453' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (626, N'133364401939665568', CAST(N'2023-08-14T01:43:03.5875322' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (627, N'133364402928910211', CAST(N'2023-08-14T01:43:03.8308824' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (628, N'133364402379284783', CAST(N'2023-08-14T01:43:03.9186472' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (629, N'133364403013598467', CAST(N'2023-08-14T01:43:03.9567705' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (630, N'133364403923185015', CAST(N'2023-08-14T01:45:50.5537442' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (631, N'133364405024498565', CAST(N'2023-08-14T01:45:50.8526886' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (632, N'133364403644870730', CAST(N'2023-08-14T01:45:50.9845909' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (633, N'133364404986491042', CAST(N'2023-08-14T01:45:51.0793397' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (634, N'133364404199203081', CAST(N'2023-08-14T01:45:51.1633311' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (635, N'133364404345531319', CAST(N'2023-08-14T01:45:51.2791719' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (636, N'133364403918791428', CAST(N'2023-08-14T01:45:51.5543044' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (637, N'133364405313966253', CAST(N'2023-08-14T01:45:51.6488163' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (638, N'133364403523371225', CAST(N'2023-08-14T01:45:51.7585217' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (639, N'133364405228810560', CAST(N'2023-08-14T01:48:37.8608475' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (640, N'133364405322893594', CAST(N'2023-08-14T01:48:38.1793810' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (641, N'133364406198854392', CAST(N'2023-08-14T01:48:38.4632720' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (642, N'133364406547563370', CAST(N'2023-08-14T01:48:38.5869056' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (643, N'133364405844364533', CAST(N'2023-08-14T01:48:38.7006013' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (644, N'133364407092689281', CAST(N'2023-08-14T01:48:38.8402530' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (645, N'133364406394420817', CAST(N'2023-08-14T01:48:39.1505115' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (646, N'133364405418993339', CAST(N'2023-08-14T01:48:39.2190437' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (647, N'133364406172769771', CAST(N'2023-08-14T01:48:39.3438804' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (648, N'133364409961502044', CAST(N'2023-08-14T01:54:12.8831178' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (649, N'133364410468330434', CAST(N'2023-08-14T01:54:13.2761837' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (650, N'133364410606146461', CAST(N'2023-08-14T01:54:13.4018658' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (651, N'133364410283724757', CAST(N'2023-08-14T01:54:13.5323814' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (652, N'133364409087574955', CAST(N'2023-08-14T01:54:13.6192076' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (653, N'133364409704877110', CAST(N'2023-08-14T01:54:13.7627658' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (654, N'133364410328881034', CAST(N'2023-08-14T01:54:13.9922071' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (655, N'133364410378586517', CAST(N'2023-08-14T01:54:14.1956067' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (656, N'133364410034680481', CAST(N'2023-08-14T01:54:14.2285203' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (657, N'133364414793201495', CAST(N'2023-08-14T02:02:20.6268411' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (658, N'133364414116422721', CAST(N'2023-08-14T02:02:20.9223805' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (659, N'133364414507428418', CAST(N'2023-08-14T02:02:21.0729761' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (660, N'133364414317766059', CAST(N'2023-08-14T02:02:21.1806876' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (661, N'133364413830720541', CAST(N'2023-08-14T02:02:21.2684527' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (662, N'133364414268700211', CAST(N'2023-08-14T02:02:21.3951149' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (663, N'133364413627184842', CAST(N'2023-08-14T02:02:21.6923214' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (664, N'133364414492896599', CAST(N'2023-08-14T02:02:21.8688476' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (665, N'133364413862481759', CAST(N'2023-08-14T02:02:21.8917870' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (666, N'133364415109225262', CAST(N'2023-08-14T02:03:25.0465528' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (667, N'133364415217912242', CAST(N'2023-08-14T02:03:25.3497376' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (668, N'133364414549139710', CAST(N'2023-08-14T02:03:25.4774518' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (669, N'133364415431765084', CAST(N'2023-08-14T02:03:25.5831691' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (670, N'133364414135431420', CAST(N'2023-08-14T02:03:25.6649501' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (671, N'133364415205107305', CAST(N'2023-08-14T02:03:25.8155484' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (672, N'133364414244662410', CAST(N'2023-08-14T02:03:26.0778480' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (673, N'133364415108580348', CAST(N'2023-08-14T02:03:26.1526462' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (674, N'133364414981925616', CAST(N'2023-08-14T02:03:26.2683370' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (675, N'133364418790828657', CAST(N'2023-08-14T02:10:03.1519680' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (676, N'133364418979338966', CAST(N'2023-08-14T02:10:03.4571958' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (677, N'133364419015875125', CAST(N'2023-08-14T02:10:03.5988183' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (678, N'133364419706201156', CAST(N'2023-08-14T02:10:03.6905719' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (679, N'133364418787909535', CAST(N'2023-08-14T02:10:03.7843229' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (680, N'133364418326153959', CAST(N'2023-08-14T02:10:03.9189621' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (681, N'133364418730417862', CAST(N'2023-08-14T02:10:04.2081883' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (682, N'133364419196342146', CAST(N'2023-08-14T02:10:04.4206200' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (683, N'133364418432099141', CAST(N'2023-08-14T02:10:04.4824542' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (684, N'133364419449067603', CAST(N'2023-08-14T02:12:00.1193907' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (685, N'133364420102371779', CAST(N'2023-08-14T02:12:00.4285636' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (686, N'133364419315479199', CAST(N'2023-08-14T02:12:00.5538570' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (687, N'133364420495755028', CAST(N'2023-08-14T02:12:00.6845076' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (688, N'133364419595881373', CAST(N'2023-08-14T02:12:00.7483383' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (689, N'133364419589564291', CAST(N'2023-08-14T02:12:00.9388281' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (690, N'133364421261320441', CAST(N'2023-08-14T02:12:01.2360323' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (691, N'133364420526702986', CAST(N'2023-08-14T02:12:01.3158204' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (692, N'133364419288154101', CAST(N'2023-08-14T02:12:01.4343307' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (693, N'133364423176162067', CAST(N'2023-08-14T02:15:37.8643886' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (694, N'133364421661850981', CAST(N'2023-08-14T02:15:38.2194390' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (695, N'133364422132954587', CAST(N'2023-08-14T02:15:38.4368564' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (696, N'133364422599040632', CAST(N'2023-08-14T02:15:38.5944360' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (697, N'133364421834534641', CAST(N'2023-08-14T02:15:38.6622550' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (698, N'133364421909711906', CAST(N'2023-08-14T02:15:38.8427715' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (699, N'133364422509736450', CAST(N'2023-08-14T02:15:39.1898436' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (700, N'133364422006732752', CAST(N'2023-08-14T02:15:39.2646456' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (701, N'133364422844362295', CAST(N'2023-08-14T02:15:39.3833269' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (702, N'133364422991687506', CAST(N'2023-08-14T02:17:21.5299988' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (703, N'133364422881948018', CAST(N'2023-08-14T02:17:21.8461522' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (704, N'133364423889264617', CAST(N'2023-08-14T02:17:21.9880331' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (705, N'133364423821765313', CAST(N'2023-08-14T02:17:22.1146928' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (706, N'133364424264591771', CAST(N'2023-08-14T02:17:22.2014993' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (707, N'133364422529612862', CAST(N'2023-08-14T02:17:22.3567866' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (708, N'133364423528304538', CAST(N'2023-08-14T02:17:22.6310532' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (709, N'133364423480726823', CAST(N'2023-08-14T02:17:22.7318066' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (710, N'133364423390305112', CAST(N'2023-08-14T02:17:22.8325159' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (711, N'133364432918522745', CAST(N'2023-08-14T02:32:53.7631285' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (712, N'133364432455049024', CAST(N'2023-08-14T02:32:54.0615009' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (713, N'133364433611913908', CAST(N'2023-08-14T02:32:54.2016197' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (714, N'133364433878369288', CAST(N'2023-08-14T02:32:54.3552081' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (715, N'133364433873372185', CAST(N'2023-08-14T02:32:54.4489576' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (716, N'133364432422115367', CAST(N'2023-08-14T02:32:54.5806062' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (717, N'133364431816795054', CAST(N'2023-08-14T02:32:54.8788085' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (718, N'133364433298324549', CAST(N'2023-08-14T02:32:54.9645803' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (719, N'133364432572355121', CAST(N'2023-08-14T02:32:54.9875190' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (720, N'133364436445324859', CAST(N'2023-08-14T02:40:43.4919028' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (721, N'133364437140248907', CAST(N'2023-08-14T02:40:43.7983922' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (722, N'133364438574846835', CAST(N'2023-08-14T02:40:44.0197963' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (723, N'133364437749288036', CAST(N'2023-08-14T02:40:44.1295022' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (724, N'133364437827878991', CAST(N'2023-08-14T02:40:44.2292373' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (725, N'133364437949184025', CAST(N'2023-08-14T02:40:44.3509217' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (726, N'133364438474740919', CAST(N'2023-08-14T02:40:44.6401371' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (727, N'133364437401846011', CAST(N'2023-08-14T02:40:44.8144061' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (728, N'133364437408919876', CAST(N'2023-08-14T02:40:44.8483181' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (729, N'133364793594689830', CAST(N'2023-08-14T12:33:10.1283146' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (730, N'133364793455651880', CAST(N'2023-08-14T12:33:10.9461281' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (731, N'133364792698791078', CAST(N'2023-08-14T12:33:11.3571456' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (732, N'133364792780272351', CAST(N'2023-08-14T12:33:11.4648590' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (733, N'133364794878537926', CAST(N'2023-08-14T12:34:43.9940594' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (734, N'133364794466868431', CAST(N'2023-08-14T12:34:44.6633420' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (735, N'133364793305886467', CAST(N'2023-08-14T12:34:44.9288537' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (736, N'133364793846366808', CAST(N'2023-08-14T12:34:45.2240648' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (737, N'133364793731953425', CAST(N'2023-08-14T12:34:45.2918828' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (738, N'133364795132559610', CAST(N'2023-08-14T12:35:42.6401439' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (739, N'133364794137445424', CAST(N'2023-08-14T12:35:42.9493401' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (740, N'133364794093581163', CAST(N'2023-08-14T12:35:43.0819601' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (741, N'133364793615230847', CAST(N'2023-08-14T12:35:43.2345511' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (742, N'133364794892301877', CAST(N'2023-08-14T12:36:21.6538729' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (743, N'133364795600048929', CAST(N'2023-08-14T12:36:21.7697127' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (744, N'133364795728417991', CAST(N'2023-08-14T12:36:22.0250300' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (745, N'133364794256978479', CAST(N'2023-08-14T12:36:22.1127938' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (746, N'133364794327262082', CAST(N'2023-08-14T12:36:22.2304831' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (747, N'133364801964431439', CAST(N'2023-08-14T12:49:32.5256348' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (748, N'133364803688966549', CAST(N'2023-08-14T12:49:32.8368035' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (749, N'133364803082527114', CAST(N'2023-08-14T12:49:32.9638620' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (750, N'133364803456463056', CAST(N'2023-08-14T12:49:33.0785551' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (751, N'133364802356101414', CAST(N'2023-08-14T12:49:44.6774957' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (752, N'133364803116178697', CAST(N'2023-08-14T12:49:44.7792806' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (753, N'133364802196156797', CAST(N'2023-08-14T12:49:45.0496910' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (754, N'133364802802249109', CAST(N'2023-08-14T12:49:45.2411756' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (755, N'133364803917450010', CAST(N'2023-08-14T12:49:45.2700994' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (756, N'133364802718702523', CAST(N'2023-08-14T12:49:48.4230207' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (757, N'133364802133103212', CAST(N'2023-08-14T12:49:48.5137759' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (758, N'133364804125129293', CAST(N'2023-08-14T12:50:02.2897498' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (759, N'133364802824540355', CAST(N'2023-08-14T12:50:03.4246964' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (760, N'133364802123418670', CAST(N'2023-08-14T12:50:03.4586035' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (761, N'133364802613762525', CAST(N'2023-08-14T12:50:08.3815134' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (762, N'133364802684164312', CAST(N'2023-08-14T12:50:08.4642913' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (763, N'133364804188309382', CAST(N'2023-08-14T12:50:28.6620678' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (764, N'133364803482486422', CAST(N'2023-08-14T12:50:28.7375252' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (765, N'133364803599847497', CAST(N'2023-08-14T12:50:36.4847316' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (766, N'133364803360714672', CAST(N'2023-08-14T12:50:37.5807167' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (767, N'133364803475859974', CAST(N'2023-08-14T12:50:37.6096397' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (768, N'133364802497758163', CAST(N'2023-08-14T12:50:43.3403785' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (769, N'133364802609115765', CAST(N'2023-08-14T12:50:43.3842616' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (770, N'133364804054824928', CAST(N'2023-08-14T12:50:43.4062065' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (771, N'133364802751792472', CAST(N'2023-08-14T12:50:45.6451206' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (772, N'133364804049687863', CAST(N'2023-08-14T12:50:45.7129373' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (773, N'133364809860489885', CAST(N'2023-08-14T13:02:55.9925918' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (774, N'133364811627382346', CAST(N'2023-08-14T13:02:56.2957782' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (775, N'133364810084132649', CAST(N'2023-08-14T13:02:56.4393945' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (776, N'133364811516418874', CAST(N'2023-08-14T13:02:56.5810290' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (777, N'133364809820481177', CAST(N'2023-08-14T13:02:56.6667867' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (778, N'133364810989883322', CAST(N'2023-08-14T13:02:56.7685147' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (779, N'133364811073946472', CAST(N'2023-08-14T13:02:56.9899220' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (780, N'133364810655838590', CAST(N'2023-08-14T13:02:57.0717039' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (781, N'133364810127107241', CAST(N'2023-08-14T13:02:57.1963721' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (782, N'133364810731078960', CAST(N'2023-08-14T13:03:22.9295999' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (783, N'133364812034303287', CAST(N'2023-08-14T13:03:23.0014093' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (784, N'133364810569309493', CAST(N'2023-08-14T13:03:25.8396729' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (785, N'133364811367989252', CAST(N'2023-08-14T13:03:26.9152589' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (786, N'133364810666729556', CAST(N'2023-08-14T13:03:26.9421991' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (787, N'133364811116581564', CAST(N'2023-08-14T13:03:58.6450634' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (788, N'133364810772369017', CAST(N'2023-08-14T13:03:58.6939330' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (789, N'133364811310004425', CAST(N'2023-08-14T13:03:58.7238530' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (790, N'133364810906596555', CAST(N'2023-08-14T13:04:00.0223858' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (791, N'133364811411539017', CAST(N'2023-08-14T13:04:00.2856823' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (792, N'133364812184208330', CAST(N'2023-08-14T13:04:52.8059903' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (793, N'133364811161641261', CAST(N'2023-08-14T13:04:52.8458808' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (794, N'133364812371684851', CAST(N'2023-08-14T13:04:52.8847776' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (795, N'133364819881294536', CAST(N'2023-08-14T13:17:27.3500868' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (796, N'133364819829163675', CAST(N'2023-08-14T13:17:27.7629812' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (797, N'133364819165292674', CAST(N'2023-08-14T13:17:34.6565476' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (798, N'133364818547966822', CAST(N'2023-08-14T13:17:34.7453087' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (799, N'133364818968505652', CAST(N'2023-08-14T13:17:34.8161190' AS DateTime2))
GO
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (800, N'133364818778058599', CAST(N'2023-08-14T13:17:34.9587399' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (801, N'133364818689098260', CAST(N'2023-08-14T13:17:35.2349993' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (802, N'133364819685626103', CAST(N'2023-08-14T13:17:35.3267539' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (803, N'133364818888291759', CAST(N'2023-08-14T13:17:35.4593985' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (804, N'133364818818863178', CAST(N'2023-08-14T13:17:50.7485103' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (805, N'133364818777098591', CAST(N'2023-08-14T13:17:50.8143340' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (806, N'133364819570587379', CAST(N'2023-08-14T13:17:52.9077348' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (807, N'133364820135815499', CAST(N'2023-08-14T13:17:53.9848543' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (808, N'133364819026750276', CAST(N'2023-08-14T13:17:54.0117833' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (809, N'133364820319037149', CAST(N'2023-08-14T13:17:55.8408904' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (810, N'133364819540262121', CAST(N'2023-08-14T13:17:56.0992002' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (811, N'133364818927725917', CAST(N'2023-08-14T13:18:07.1267086' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (812, N'133364820567412894', CAST(N'2023-08-14T13:18:07.2503772' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (813, N'133364820625582540', CAST(N'2023-08-14T13:18:07.3501098' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (814, N'133364819193250574', CAST(N'2023-08-14T13:18:31.3342852' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (815, N'133364820853172793', CAST(N'2023-08-14T13:18:31.3861459' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (816, N'133364820930811208', CAST(N'2023-08-14T13:18:41.1890113' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (817, N'133364820082258896', CAST(N'2023-08-14T13:18:41.2309001' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (818, N'133364819244950207', CAST(N'2023-08-14T13:18:41.2488862' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (819, N'133364822283437799', CAST(N'2023-08-14T13:20:45.6792035' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (820, N'133364821867290029', CAST(N'2023-08-14T13:20:45.7141094' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (821, N'133364820577761798', CAST(N'2023-08-14T13:20:45.7470215' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (822, N'133364823273634174', CAST(N'2023-08-14T13:22:17.1497289' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (823, N'133364822324781322', CAST(N'2023-08-14T13:22:17.2374935' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (824, N'133364822493633714', CAST(N'2023-08-14T13:22:19.4908653' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (825, N'133364822304560005', CAST(N'2023-08-14T13:22:20.5745800' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (826, N'133364822233300235', CAST(N'2023-08-14T13:22:20.5975171' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (827, N'133364822893548739', CAST(N'2023-08-14T13:22:24.6138654' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (828, N'133364823412230658', CAST(N'2023-08-14T13:22:24.6368039' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (829, N'133364821859067223', CAST(N'2023-08-14T13:22:24.6607400' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (830, N'133364823297172718', CAST(N'2023-08-14T13:23:56.5149318' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (831, N'133364824229418954', CAST(N'2023-08-14T13:23:56.5698097' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (832, N'133364824212334673', CAST(N'2023-08-14T13:24:05.3576063' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (833, N'133364824351023223', CAST(N'2023-08-14T13:24:05.3915124' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (834, N'133364823046354363', CAST(N'2023-08-14T13:24:05.4154492' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (835, N'133364824045891979', CAST(N'2023-08-14T13:24:08.0541391' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (836, N'133364823155901226', CAST(N'2023-08-14T13:24:08.0950326' AS DateTime2))
INSERT [dbo].[TokensTable] ([id], [token], [createDate]) VALUES (837, N'133364823207893007', CAST(N'2023-08-14T13:24:08.1169709' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TokensTable] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (1, N'administrator', N'administrator', N'Support', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2023-07-28T15:51:31.4860429' AS DateTime2), N'8ea60f80800198548a9a81aa2e4a6115', N'ad', N'57440ff6b80f068efd50410ea24fd593.png', N'', CAST(0.000 AS Decimal(20, 3)), 1, 2, 1, N'Us-Admin', NULL, NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (2, N'admin', N'admin', N'admin', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2023-08-14T13:17:27.7769457' AS DateTime2), N'9b43a5e653134fc8350ca9944eadaf2f', N'ad', N'c37858823db0093766eee74d8ee1f1e5.png', N'', CAST(0.000 AS Decimal(20, 3)), 1, 2, 1, N'Us-adminuser', NULL, NULL, NULL, NULL, 1, 9)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (3, N'sysagent', N'sysagent', N'sysagent', NULL, N'', NULL, N'+966-095550226', NULL, N'', NULL, NULL, CAST(N'2021-12-08T12:25:13.5504988' AS DateTime2), N'e4959b2ae3b5256076a7b5e99f88b8ba', N'ag', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 1, 1, 1, N'aaa', NULL, NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (4, N'ahmad', N'ahmad', N'ahmad', NULL, N'', NULL, N'+963-944444444', NULL, N'', NULL, CAST(N'2023-07-10T14:01:50.3551343' AS DateTime2), CAST(N'2023-07-28T15:50:36.0939643' AS DateTime2), N'9b43a5e653134fc8350ca9944eadaf2f', N'us', N'd2ec5f1ed83abfca0dfec76506b696b3.png', N'', CAST(0.000 AS Decimal(20, 3)), 2, 2, 1, N'gbm', NULL, NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[users] ([userId], [name], [AccountName], [lastName], [company], [email], [phone], [mobile], [fax], [address], [agentLevel], [createDate], [updateDate], [password], [type], [image], [notes], [balance], [createUserId], [updateUserId], [isActive], [code], [isAdmin], [groupId], [balanceType], [job], [isOnline], [countryId]) VALUES (6, N'test', N'test', N'test', NULL, N'', NULL, N'+963-599994949', NULL, N'', NULL, CAST(N'2023-07-28T16:19:02.6861123' AS DateTime2), CAST(N'2023-07-28T16:19:29.0893130' AS DateTime2), N'9b43a5e653134fc8350ca9944eadaf2f', N'us', NULL, N'', CAST(0.000 AS Decimal(20, 3)), 2, 2, 1, N'jnm', NULL, NULL, NULL, NULL, 1, 9)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[countriesCodes] ADD  CONSTRAINT [DF_countriesCodes_isDefault]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[cities]  WITH CHECK ADD  CONSTRAINT [FK_cities_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[cities] CHECK CONSTRAINT [FK_cities_countriesCodes]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_departments] FOREIGN KEY([departmentId])
REFERENCES [dbo].[departments] ([departmentId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_departments]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_nationalities] FOREIGN KEY([nationalityId])
REFERENCES [dbo].[nationalities] ([nationalityId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_nationalities]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_users]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_users1]
GO
ALTER TABLE [dbo].[customersLogs]  WITH CHECK ADD  CONSTRAINT [FK_customersLogs_customers] FOREIGN KEY([custId])
REFERENCES [dbo].[customers] ([custId])
GO
ALTER TABLE [dbo].[customersLogs] CHECK CONSTRAINT [FK_customersLogs_customers]
GO
ALTER TABLE [dbo].[error]  WITH CHECK ADD  CONSTRAINT [FK_error_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[error] CHECK CONSTRAINT [FK_error_users]
GO
ALTER TABLE [dbo].[nationalities]  WITH CHECK ADD  CONSTRAINT [FK_nationalities_users] FOREIGN KEY([createUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[nationalities] CHECK CONSTRAINT [FK_nationalities_users]
GO
ALTER TABLE [dbo].[nationalities]  WITH CHECK ADD  CONSTRAINT [FK_nationalities_users1] FOREIGN KEY([updateUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[nationalities] CHECK CONSTRAINT [FK_nationalities_users1]
GO
ALTER TABLE [dbo].[setValues]  WITH CHECK ADD  CONSTRAINT [FK_setValues_setting] FOREIGN KEY([settingId])
REFERENCES [dbo].[setting] ([settingId])
GO
ALTER TABLE [dbo].[setValues] CHECK CONSTRAINT [FK_setValues_setting]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_countriesCodes] FOREIGN KEY([countryId])
REFERENCES [dbo].[countriesCodes] ([countryId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_countriesCodes]
GO
ALTER TABLE [dbo].[userSetValues]  WITH CHECK ADD  CONSTRAINT [FK_userSetValues_setValues] FOREIGN KEY([valId])
REFERENCES [dbo].[setValues] ([valId])
GO
ALTER TABLE [dbo].[userSetValues] CHECK CONSTRAINT [FK_userSetValues_setValues]
GO
ALTER TABLE [dbo].[usersLogs]  WITH CHECK ADD  CONSTRAINT [FK_usersLogs_users] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[usersLogs] CHECK CONSTRAINT [FK_usersLogs_users]
GO
