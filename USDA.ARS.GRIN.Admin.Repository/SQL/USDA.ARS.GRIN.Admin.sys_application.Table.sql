USE [training]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 8/6/2021 7:07:38 PM ******/
DROP TABLE IF EXISTS [dbo].[sys_application]
GO
/****** Object:  Table [dbo].[sys_application]    Script Date: 8/6/2021 7:07:38 PM ******/
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
SET IDENTITY_INSERT [dbo].[sys_application] ON 

INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (16, N'GGTOOLS_ACCOUNTS', N'GGTools Account Manager', N'Manage GRIN-Global users and roles, reset passwords, and assign and reassign GRIN-Global records', N'accountmanagement', N'purple', NULL, N'fa-users.png', 2948)
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (17, N'GGTOOLS_TAXONOMY', N'GGTools Taxonomy Editor', N'Create and edit taxonomical data, and run diagnostic reports', N'taxonomy', N'green', NULL, N'fa-tree.png', 2947)
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (18, N'GGTOOLS_SITE', N'ARS-GRIN Site Manager', N'Manage ARS-GRIN site content', N'sitemanagement', N'red', NULL, N'fa-television.png', 2949)
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (19, N'GGTOOLS_GRINGLOBAL', N'GGTools GRIN-Global Admin', N'GRINGlobal data-management utilities', N'gringlobal', N'blue', NULL, N'gglogo.gif', 2951)
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (20, N'GGTOOLS_ORDERS', N'GRIN-Global NRR Review Tool', N'Enables curators to review and approve, or reject, web orders that have been flagged as potential Non-Research Requests (NRR)Supports the review and editing of GRIN-Global reference data.', N'weborder', N'black', NULL, N'cog.png', 2952)
SET IDENTITY_INSERT [dbo].[sys_application] OFF
