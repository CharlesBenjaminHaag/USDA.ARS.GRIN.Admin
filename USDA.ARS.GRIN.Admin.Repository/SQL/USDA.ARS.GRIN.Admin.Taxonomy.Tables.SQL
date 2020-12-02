USE [gringlobal]
GO

ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT [FK_taxonomy_folder_cooperator]
GO

ALTER TABLE [dbo].[taxonomy_folder] DROP CONSTRAINT [DF_taxonomy_folder_created_date]
GO

/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 12/1/2020 7:01:17 PM ******/
DROP TABLE [dbo].[taxonomy_folder]
GO

/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 12/1/2020 7:01:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[taxonomy_folder](
	[taxonomy_folder_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NULL,
	[note] [nvarchar](2000) NULL,
	[data_source] [nvarchar](150) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[is_shared] [bit] NULL,
	[modified_by] [int] NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_taxonomy_folder] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[taxonomy_folder] ADD  CONSTRAINT [DF_taxonomy_folder_created_date]  DEFAULT (getdate()) FOR [created_date]
GO

ALTER TABLE [dbo].[taxonomy_folder]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO

ALTER TABLE [dbo].[taxonomy_folder] CHECK CONSTRAINT [FK_taxonomy_folder_cooperator]
GO

ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder]
GO

ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT [FK_taxonomy_folder_item_cooperator]
GO

ALTER TABLE [dbo].[taxonomy_folder_item_map] DROP CONSTRAINT [DF_taxonomy_folder_item_created_date]
GO

/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 12/1/2020 7:04:01 PM ******/
DROP TABLE [dbo].[taxonomy_folder_item_map]
GO

/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 12/1/2020 7:04:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[taxonomy_folder_item_map](
	[taxonomy_folder_item_id] [int] IDENTITY(1,1) NOT NULL,
	[taxonomy_folder_id] [int] NOT NULL,
	[data_source] [nvarchar](150) NULL,
	[item_id] [int] NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	
 CONSTRAINT [PK_taxonomy_folder_item] PRIMARY KEY CLUSTERED 
(
	[taxonomy_folder_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[taxonomy_folder_item_map] ADD  CONSTRAINT [DF_taxonomy_folder_item_created_date]  DEFAULT (getdate()) FOR [created_date]
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
