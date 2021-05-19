USE [gringlobal]

DELETE FROM code_value
WHERE value LIKE 'NRR%'

DECLARE	@return_value int

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_NOTE',
		@title = N'NRR Review Note',
		@description = N'NRR Review Note'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_HISTORY',
		@title = N'Order History Flag',
		@description = N'Order History Flag'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_REJECT',
		@title = N'Order Classified as NRR',
		@description = N'Order Classified as NRR'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_APPROVE',
		@title = N'Determined Not to Be NRR',
		@description = N'Determined Not to Be NRR'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_EMAIL',
		@title = N'Non-Official Email Address',
		@description = N'Non-Official Email Address'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_COOP',
		@title = N'Cooperator Flagged',
		@description = N'Cooperator Flagged'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_GENERA',
		@title = N'Genera Count Flag',
		@description = N'Genera Count Flag'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_SITES',
		@title = N'Site Impact Flag',
		@description = N'Site Impact Flag'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG_USE',
		@title = N'Intended Use Flag',
		@description = N'Intended Use Flag'
SELECT	'Return Value' = @return_value

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




