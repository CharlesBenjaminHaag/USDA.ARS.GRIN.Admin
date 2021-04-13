USE [gringlobal]

DELETE FROM code_value
WHERE value LIKE 'NRR%'

INSERT INTO code_value
(group_name, value, created_by, created_date, owned_by, owned_date)
VALUES ('ORDER_REQUEST_ACTION','NRR_REVIEW',48,GETDATE(),48,GETDATE())

INSERT INTO code_value
(group_name, value, created_by, created_date, owned_by, owned_date)
VALUES ('ORDER_REQUEST_ACTION','NRR_APPROVE',48,GETDATE(),48,GETDATE())

INSERT INTO code_value
(group_name, value, created_by, created_date, owned_by, owned_date)
VALUES ('ORDER_REQUEST_ACTION','NRR_REJECT',48,GETDATE(),48,GETDATE())



DELETE FROM 
	sys_group_user_map
WHERE
	sys_group_id IN
	(SELECT sys_group_id FROM sys_group
	 WHERE group_tag LIKE 'GGTOOLS%')
GO

DELETE FROM sys_group
WHERE
	group_tag LIKE 'GGTOOLS%'
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
	('GGTOOLS_ORDERS','Y',GETDATE(),48,GETDATE(),48)
GO

DELETE FROM 
	sys_application
WHERE
	code LIKE 'GGTOOLS%'

INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (N'GGTOOLS_ACCOUNTS', N'GGTools Account Manager', N'Manage GRIN-Global users and roles, reset passwords, and assign and reassign GRIN-Global records', N'accountmanagement', N'purple', N'fa-users.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (N'GGTOOLS_TAXONOMY', N'GGTools Taxonomy Editor', N'Create and edit taxonomical data, and run diagnostic reports', N'taxonomy', N'green', N'fa-tree.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (N'GGTOOLS_SITE', N'ARS-GRIN Site Manager', N'Manage ARS-GRIN site content', N'sitemanagement', N'red', N'fa-television.png')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (N'GGTOOLS_GRINGLOBAL', N'GGTools GRIN-Global Admin', N'GRINGlobal data-management utilities', N'gringlobal', N'blue', N'gglogo.gif')
GO
INSERT [dbo].[sys_application] ([code], [title], [description], [url], [color_code], [image_file_name]) VALUES (N'GGTOOLS_ORDERS', N'GRIN-Global NRR Review Tool', N'Enables curators to review and approve, or reject, web orders that have been flagged as potential Non-Research Requests (NRR)Supports the review and editing of GRIN-Global reference data.', N'weborder', N'black', N'cog.png')
GO

UPDATE sys_application SET sys_group_id = (SELECT sys_group_id FROM sys_group WHERE group_tag = sys_application.code)

-- VERIFY
SELECT * 
FROM 
	sys_group
WHERE 
	group_tag LIKE 'GGTOOLS%'

SELECT *
FROM
	sys_group_user_map
WHERE
	sys_group_id IN
	(SELECT sys_group_id 
	 FROM 
		sys_group
	 WHERE 
		group_tag 
	 LIKE 'GGTOOLS%')

SELECT *
FROM
	sys_application
WHERE
	code LIKE 'GGTOOLS%'



-- ===================================================================================================================
-- SET DEFAULT ROLES
-- ===================================================================================================================
DELETE FROM 
	sys_group_user_map
WHERE
	sys_group_id IN
	(SELECT sys_group_id FROM sys_group
	 WHERE group_tag LIKE 'GGTOOLS%')

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ACCOUNTS'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_TAXONOMY'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)






INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_SITE'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_GRINGLOBAL'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	488,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	204,
	GETDATE(),
	48,
	GETDATE(),
	48
)

INSERT INTO sys_group_user_map
(
	 sys_group_id,
	 sys_user_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
)
VALUES
(
	(SELECT sys_group_id FROM sys_group WHERE group_tag = 'GGTOOLS_ORDERS'),
	44,
	GETDATE(),
	48,
	GETDATE(),
	48
)



