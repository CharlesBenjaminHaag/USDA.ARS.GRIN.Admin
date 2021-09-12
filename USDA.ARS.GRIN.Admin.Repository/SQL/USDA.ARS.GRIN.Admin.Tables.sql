USE gringlobal

--======================================================================================================================
-- ALTER
--======================================================================================================================
ALTER TABLE web_cooperator
ADD [status_code] [nvarchar](20) NULL

ALTER TABLE web_order_request
ADD [is_locked] [bit] NULL

ALTER TABLE web_order_request
ADD [email_sent] [bit] NULL

ALTER TABLE [dbo].[web_order_request] ADD  CONSTRAINT [DF_web_order_request_is_locked]  DEFAULT ((0)) FOR [is_locked]
GO

ALTER TABLE [dbo].[web_order_request] ADD  CONSTRAINT [DF_web_order_request_email_sent]  DEFAULT ((0)) FOR [email_sent]
GO

ALTER TABLE [dbo].[sys_group_user_map]  WITH CHECK ADD  CONSTRAINT [fk_sgum_sg] FOREIGN KEY([sys_group_id])
REFERENCES [dbo].[sys_group] ([sys_group_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[sys_group_user_map] CHECK CONSTRAINT [fk_sgum_sg]
GO

--=================================================================================================================
--CREATE
--=================================================================================================================
USE [gringlobal]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT IF EXISTS [FK_taxonomy_folder_item_taxonomy_folder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT IF EXISTS [FK_taxonomy_folder_item_cooperator]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT IF EXISTS [FK_taxonomy_folder_cooperator]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_owned]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_modified]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email_template]') AND type in (N'U'))
ALTER TABLE [dbo].[email_template] DROP CONSTRAINT IF EXISTS [fk_et_created]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT IF EXISTS [DF_taxonomy_folder_item_created_date]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT IF EXISTS [DF__taxonomy___is_fa__3C4CC5A1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT IF EXISTS [DF_taxonomy_folder_created_date]
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 8/27/2021 4:15:53 PM ******/
DROP TABLE IF EXISTS [dbo].[taxonomy_folder_item_map]
GO
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 8/27/2021 4:15:53 PM ******/
DROP TABLE IF EXISTS [dbo].[taxonomy_folder]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 8/27/2021 4:15:53 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_db_error]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 8/27/2021 4:15:53 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_application]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 8/27/2021 4:15:53 PM ******/
DROP TABLE IF EXISTS [dbo].[email_template]
GO
/****** Object:  Table [dbo].[email_template]    Script Date: 8/27/2021 4:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_template](
	[email_template_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](120) NULL,
	[category_code] [nvarchar](3) NULL,
	[email_from] [nvarchar](200) NULL,
	[email_to] [nvarchar](1000) NULL,
	[email_cc] [nvarchar](1000) NULL,
	[email_bcc] [nvarchar](1000) NULL,
	[email_reply_to] [nvarchar](200) NULL,
	[subject] [nvarchar](500) NULL,
	[body] [nvarchar](max) NULL,
	[is_html] [nvarchar](1) NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_email_template] PRIMARY KEY CLUSTERED 
(
	[email_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 8/27/2021 4:15:53 PM ******/
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
	[application_icon] [nvarchar](50) NULL,
	[image_file_name] [nvarchar](500) NULL,
	[sys_group_id] [int] NULL,
 CONSTRAINT [PK_sys_application] PRIMARY KEY CLUSTERED 
(
	[sys_application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_db_error]    Script Date: 8/27/2021 4:15:53 PM ******/
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
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 8/27/2021 4:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_folder](
	[taxonomy_folder_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[category] [nvarchar](120) NULL,
	[description] [nvarchar](max) NULL,
	[note] [nvarchar](2000) NULL,
	[is_shared] [bit] NULL,
	[data_source_name] [nvarchar](150) NULL,
	[data_source_title] [nvarchar](150) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[modified_by] [int] NULL,
	[modified_date] [datetime] NULL,
	[is_favorite] [bit] NULL,
 CONSTRAINT [PK_taxonomy_folder] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 8/27/2021 4:15:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_folder_item_map](
	[taxonomy_folder_item_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_folder_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[data_source_name] [nvarchar](150) NULL,
 CONSTRAINT [PK_taxonomy_folder_item] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[taxonomy_folder] ADD  CONSTRAINT [DF_taxonomy_folder_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[taxonomy_folder] ADD  DEFAULT ((0)) FOR [is_favorite]
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map] ADD  CONSTRAINT [DF_taxonomy_folder_item_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_created]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_modified]
GO
ALTER TABLE [dbo].[email_template]  WITH CHECK ADD  CONSTRAINT [fk_et_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[email_template] CHECK CONSTRAINT [fk_et_owned]
GO
ALTER TABLE [dbo].[taxonomy_folder]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[taxonomy_folder] CHECK CONSTRAINT [FK_taxonomy_folder_cooperator]
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_cooperator]
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder] FOREIGN KEY([taxonomy_folder_id])
REFERENCES [dbo].[taxonomy_folder] ([taxonomy_folder_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder]
GO

--========================================================================================================
--CONSTRAINTS
--========================================================================================================
ALTER TABLE [dbo].[sys_group_user_map] DROP CONSTRAINT fk_sgum_sg
GO

ALTER TABLE [dbo].[sys_group_user_map]  WITH CHECK ADD  CONSTRAINT [fk_sgum_sg] FOREIGN KEY([sys_group_id])
REFERENCES [dbo].[sys_group] ([sys_group_id]) ON DELETE CASCADE
GO

ALTER TABLE [dbo].[sys_group_user_map] CHECK CONSTRAINT [fk_sgum_sg]
GO


