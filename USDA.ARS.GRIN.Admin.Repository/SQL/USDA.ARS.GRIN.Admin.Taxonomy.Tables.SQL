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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT IF EXISTS [DF_taxonomy_folder_item_created_date]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT IF EXISTS [DF_taxonomy_folder_created_date]
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 12/7/2020 1:31:04 AM ******/
DROP TABLE IF EXISTS [dbo].[taxonomy_folder_item_map]
GO
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 12/7/2020 1:31:04 AM ******/
DROP TABLE IF EXISTS [dbo].[taxonomy_folder]
GO
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 12/7/2020 1:31:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxonomy_folder](
	[taxonomy_folder_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NULL,
	[note] [nvarchar](2000) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[is_shared] [bit] NULL,
	[modified_by] [int] NULL,
	[modified_date] [datetime] NULL,
	[data_source] [nvarchar](150) NULL,
 CONSTRAINT [PK_taxonomy_folder] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 12/7/2020 1:31:04 AM ******/
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
	[data_source] [nvarchar](150) NULL,
 CONSTRAINT [PK_taxonomy_folder_item] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[taxonomy_folder] ADD  CONSTRAINT [DF_taxonomy_folder_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[taxonomy_folder_item_map] ADD  CONSTRAINT [DF_taxonomy_folder_item_created_date]  DEFAULT (getdate()) FOR [created_date]
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
