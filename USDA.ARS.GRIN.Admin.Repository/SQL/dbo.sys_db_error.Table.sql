USE [training]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 8/6/2021 7:07:38 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_db_error]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 8/6/2021 7:07:39 PM ******/
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

