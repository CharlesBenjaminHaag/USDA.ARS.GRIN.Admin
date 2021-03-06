USE [training]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 4/8/2021 1:21:15 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_db_error]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 4/8/2021 1:21:15 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_application]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 4/8/2021 1:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_application](
	[sys_application_id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
	[title] [nvarchar](120) NOT NULL,
	[description] [nvarchar](500) NULL,
	[url] [nvarchar](2000) NULL,
	[color_code] [nvarchar](20) NULL,
	[application_icon] nvarchar(50) NULL,
	[image_file_name] [nvarchar](500) NULL,
	[sys_group_id] [int] NULL,
 CONSTRAINT [PK_sys_application] PRIMARY KEY CLUSTERED 
(
	[sys_application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 4/8/2021 1:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_db_error](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[ErrorNumber] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorProcedure] [varchar](max) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
