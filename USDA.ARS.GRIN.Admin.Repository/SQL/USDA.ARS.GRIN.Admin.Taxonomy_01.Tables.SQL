USE [gringlobal]
GO
/****** Object:  Table [dbo].[taxonomy_folder]    Script Date: 6/19/2021 2:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[taxonomy_folder_item_map]    Script Date: 6/19/2021 2:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_folder_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_folder] ADD  CONSTRAINT [DF_taxonomy_folder_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__taxonomy___is_fa__4951BB04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_folder] ADD  DEFAULT ((0)) FOR [is_favorite]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_taxonomy_folder_item_created_date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[taxonomy_folder_item_map] ADD  CONSTRAINT [DF_taxonomy_folder_item_created_date]  DEFAULT (getdate()) FOR [created_date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]'))
ALTER TABLE [dbo].[taxonomy_folder]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder]'))
ALTER TABLE [dbo].[taxonomy_folder] CHECK CONSTRAINT [FK_taxonomy_folder_cooperator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_cooperator] FOREIGN KEY([created_by])
REFERENCES [dbo].[cooperator] ([cooperator_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_cooperator]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_cooperator]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_taxonomy_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map]  WITH CHECK ADD  CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder] FOREIGN KEY([taxonomy_folder_id])
REFERENCES [dbo].[taxonomy_folder] ([taxonomy_folder_id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_taxonomy_folder_item_taxonomy_folder]') AND parent_object_id = OBJECT_ID(N'[dbo].[taxonomy_folder_item_map]'))
ALTER TABLE [dbo].[taxonomy_folder_item_map] CHECK CONSTRAINT [FK_taxonomy_folder_item_taxonomy_folder]
GO
