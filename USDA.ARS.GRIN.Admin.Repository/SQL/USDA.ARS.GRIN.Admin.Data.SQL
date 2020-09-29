USE [gringlobal]

INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_TAXONOMY','Y',GETDATE(),48,GETDATE(),48)
INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_ACCOUNTS','Y',GETDATE(),48,GETDATE(),48)
INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_SITE','Y',GETDATE(),48,GETDATE(),48)
INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_GENESYS','Y',GETDATE(),48,GETDATE(),48)
INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_GRINGLOBAL','Y',GETDATE(),48,GETDATE(),48)
INSERT INTO sys_group
	(group_tag,is_enabled,created_date,created_by,owned_date, owned_by)
VALUES
	('GGTOOLS_DATAMANAGER','Y',GETDATE(),48,GETDATE(),48)

GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (10, N'GGTOOLS_ACCOUNTS', N'GGTools Account Manager', N'Manage GRIN-Global users and roles, reset passwords, and assign and reassign GRIN-Global records', N'accountmanagement', N'purple', N'fa-users.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (11, N'GGTOOLS_TAXONOMY', N'GGTools Taxonomy Editor', N'Create and edit taxonomical data, and run diagnostic reports', N'taxonomy', N'green', N'fa-tree.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (12, N'GGTOOLS_SITE', N'ARS-GRIN Site Manager', N'Manage ARS-GRIN site content', N'sitemanagenemt', N'red', N'fa-television.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (13, N'GGTOOLS_GRINGLOBAL', N'GGTools GRIN-Global Admin', N'GRINGlobal data-management utilities', N'gringlobal', N'blue', N'gglogo.gif')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (14, N'GGTOOLS_DATAMANAGER', N'GGTools GRIN-Global Data Manager', N'Supports the review and editing of GRIN-Global reference data.', N'datamanagement', N'black', N'cog.png')
GO

UPDATE sys_application SET sys_group_id = (SELECT sys_group_id FROM sys_group WHERE group_tag = sys_application.code)

-- ===================================================================================================================
-- SET DEFAULT ROLES
-- ===================================================================================================================
	
