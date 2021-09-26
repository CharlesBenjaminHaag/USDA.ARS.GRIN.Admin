USE [gringlobal]
GO

--====================================================================================================
-- CODE_VALUE
--====================================================================================================
DELETE FROM code_value
WHERE value LIKE 'NRR%'

DECLARE	@return_value int

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_STATUS',
		@code_value = N'NRR_FLAG',
		@title = N'NRR Flag',
		@description = N'Web order request flagged as potential NRR'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_NOTE',
		@title = N'NRR Review Note',
		@description = N'NRR Review Note'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_INFO',
		@title = N'Request For Additional Information',
		@description = N'The NRR Committee has emailed the web order requestor to ask for additional information.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_HIST',
		@title = N'Order History Flag',
		@description = N'The requestor has a history of cancelled orders.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_REJECT',
		@title = N'Web Order Rejected as NRR',
		@description = N'The web order request was determined to be an NRR, and set to Cancelled status.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_APPROVE',
		@title = N'Web Order Approved',
		@description = N'The web order request was determined not to be an NRR, and was approved and returned to Submitted status.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_EMAIL',
		@title = N'Non-Official Email Address',
		@description = N'The requestor''s email address is neither .gov nor .edu.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_COOP',
		@title = N'Web Cooperator Flag',
		@description = N'The requestor has been flagged due to previous Non-Research Requests (NRR).'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_GEN',
		@title = N'Genera Count Flag',
		@description = N'The request involves germplasm of more than one distinct genus.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_SITE',
		@title = N'Site Impact Flag',
		@description = N'The request would involve more than one site.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_FLAG_USE',
		@title = N'Intended Use Flag',
		@description = N'The stated intented use of the requested germplasm suggests non-research intent.'
SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'WEB_ORDER_REQUEST_ACTION',
		@code_value = N'NRR_REVIEW',
		@title = N'NRR Review Initiated',
		@description = N'A member of the NRR Review committee has begin reviewing the web order request.'
SELECT	'Return Value' = @return_value

--SELECT TOP (1000) [code_value_id]
--      ,[code_value_lang_id]
--      ,[group_name]
--      ,[value]
--      ,[title]
--      ,[description]
--      ,[code_value_created]
--      ,[code_value_modified]
--      ,[code_value_lang_created]
--      ,[code_value_lang_modified]
--  FROM [gringlobal].[dbo].[vw_gringlobal_codevalues]
--  WHERE value LIKE '%AQUA%'

--EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
--		@group_name = N'TAXONOMY_REGULATION_LEVEL',
--		@code_value = N'A',
--		@title = N'A',
--		@description = N'A'

--AQUATIC
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'AQUATIC',
		@title = N'AQUATIC',
		@description = N'AQUATIC'

--CITESI
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'CITESI',
		@title = N'CITESI',
		@description = N'CITESI'

--CITESII
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'CITESII',
		@title = N'CITESII',
		@description = N'CITESII'

--CITESIII
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'CITESIII',
		@title = N'CITESIII',
		@description = N'CITESIII'

--FWE
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'FWE',
		@title = N'FWE',
		@description = N'FWE'

--FWT
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'FWT',
		@title = N'FWT',
		@description = N'FWT'

--NAPPRA
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'NAPPRA',
		@title = N'NAPPRA',
		@description = N'NAPPRA'

--NARCOTIC
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'NARCOTIC',
		@title = N'NARCOTIC',
		@description = N'NARCOTIC'

--PARASITIC
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'PARASITIC',
		@title = N'PARASITIC',
		@description = N'PARASITIC'

--PATH
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'PATH',
		@title = N'PATH',
		@description = N'PATH'

--SEED
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'SEED',
		@title = N'SEED',
		@description = N'SEED'

--TERRESTRIAL
EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_TYPE',
		@code_value = N'TERRESTRIAL',
		@title = N'TERRESTRIAL',
		@description = N'TERRESTRIAL'
--EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
--		@group_name = N'TAXONOMY_REGULATION_LEVEL',
--		@code_value = N'A',
--		@title = N'A',
--		@description = N'A'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'A',
		@title = N'A',
		@description = N'A'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'B',
		@title = N'B',
		@description = N'B'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'C',
		@title = N'C',
		@description = N'C'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'D',
		@title = N'D',
		@description = N'D'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'PROHIBITED',
		@title = N'PROHIBITED',
		@description = N'PROHIBITED'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'REGULATED',
		@title = N'REGULATED',
		@description = N'REGULATED'

EXEC	@return_value = [dbo].[usp_DataMgmtCode_Insert]
		@group_name = N'TAXONOMY_REGULATION_LEVEL',
		@code_value = N'RESTRICTED',
		@title = N'RESTRICTED',
		@description = N'RESTRICTED'

--====================================================================================================
-- SYS_GROUP
--====================================================================================================
DELETE FROM sys_group
WHERE
	group_tag LIKE 'GGTOOLS%'
GO

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

--====================================================================================================
-- SYS_GROUP_USER_MAP
--====================================================================================================
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
	246,
	GETDATE(),
	48,
	GETDATE(),
	48
)

--====================================================================================================
-- SYS_APPLICATION
--====================================================================================================
USE [gringlobal]
GO
DELETE FROM [dbo].[sys_application]
GO
SET IDENTITY_INSERT [dbo].[sys_application] ON 
GO
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (16, N'GGTOOLS_ACCOUNTS', N'Access Rights Management Tool', N'Enables the creation and editing of GRIN-Global user accounts, group membership, and password creation and resets.', N'accessrightsmanagement', N'purple', NULL, N'fa-users.png', 2972)
GO
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (17, N'GGTOOLS_TAXONOMY', N'Taxonomy Metadata Tool', N'Enables the editing of all taxonomical data used as a reference within the GRIN-Global system.', N'taxonomy', N'green', NULL, N'fa-tree.png', 2971)
GO
INSERT [dbo].[sys_application] ([sys_application_id], [code], [title], [description], [url], [color_code], [application_icon], [image_file_name], [sys_group_id]) VALUES (20, N'GGTOOLS_ORDERS', N'Order Management Tool', N'Enables curators to research and review orders placed within the GRIN-Global Public Website.', N'weborder', N'black', NULL, N'cog.png', 2976)
GO
SET IDENTITY_INSERT [dbo].[sys_application] OFF
GO

UPDATE 
	sys_application 
SET 
	sys_group_id = 
	(SELECT 
		sys_group_id 
	 FROM 
		sys_group 
	 WHERE 
		group_tag = sys_application.code)

DELETE FROM [dbo].[cooperator_map]
GO
DELETE FROM [dbo].[cooperator_group]
GO

--====================================================================================================
-- COOPERATOR GROUP
--====================================================================================================
SET IDENTITY_INSERT [dbo].[cooperator_group] ON 
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (117, N'Seeds of Success Collectors ', N'Y', NULL, N'UFED', NULL, N'Seeds of Success collector address along with a few other addresses associated with the SOS Project. See the Note field in Cooperator to find the Abbreviation used by BLM collectors.', CAST(N'2020-02-24T17:00:28.1958705' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:00:28.1958705' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (118, N'Black Box', N'Y', 42, NULL, NULL, N'NLGRP Black Box Cooperators', CAST(N'2020-05-19T16:15:22.9223631' AS DateTime2), 177589, NULL, NULL, CAST(N'2020-05-19T16:15:22.9223631' AS DateTime2), 177589)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (119, N'BRW Order Processing', N'Y', 2, NULL, N'BRW-ORD', NULL, CAST(N'2021-07-13T17:47:10.4500000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T17:47:10.4500000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (120, N'COT Order Processing', N'Y', 1, NULL, N'COT-ORD', NULL, CAST(N'2021-07-13T18:30:33.6600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:30:33.6600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (121, N'DAV Order Processing', N'Y', 4, NULL, N'DAV-ORD', NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (122, N'DLEG Order Processing', N'Y', 33, NULL, N'DLEG-ORD', NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (123, N'GEN Order Processing', N'Y', 5, NULL, N'GEN-ORD', NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (124, N'GSOR Order Processing', N'Y', 40, NULL, N'GSOR-ORD', NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (125, N'GSPI Order Processing', N'Y', 34, NULL, N'GSPI-ORD', NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (126, N'GSZE Order Processing', N'Y', 31, NULL, N'GSZE-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (127, N'HILO Order Processing', N'Y', 6, NULL, N'HILO-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (128, N'MAY Order Processing', N'Y', 7, NULL, N'MAY-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (129, N'MIA Order Processing', N'Y', 8, NULL, N'MIA-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (130, N'NA Order Processing', N'Y', 15, NULL, N'NA-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (131, N'NC7 Order Processing', N'Y', 16, NULL, N'NC7-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (132, N'NE9 Order Processing', N'Y', 17, NULL, N'NE9-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (133, N'NR6 Order Processing', N'Y', 29, NULL, N'NR6-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (134, N'NSGC Order Processing', N'Y', 19, NULL, N'NSGC-ORD', NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2600000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (135, N'NSSL Order Processing', N'Y', 42, NULL, N'NSSL-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (136, N'OPGC Order Processing', N'Y', 38, NULL, N'OPGC-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (137, N'PARL Order Processing', N'Y', 37, NULL, N'PARL-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (138, N'PEO Order Processing', N'Y', 27, NULL, N'PEO-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (139, N'RIV Order Processing', N'Y', 9, NULL, N'RIV-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (140, N'S9 Order Processing', N'Y', 22, NULL, N'S9-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (141, N'SBML Order Processing', N'Y', 23, NULL, N'SBML-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (142, N'SOY Order Processing', N'Y', 24, NULL, N'SOY-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (143, N'TGRC Order Processing', N'Y', 13, NULL, N'TGRC-ORD', NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2733333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (144, N'TOB Order Processing', N'Y', 25, NULL, N'TOB-ORD', NULL, CAST(N'2021-07-13T18:32:01.2900000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2900000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (145, N'W6 Order Processing', N'Y', 26, NULL, N'W6-ORD', NULL, CAST(N'2021-07-13T18:32:01.2900000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-13T18:32:01.2900000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_group] ([cooperator_group_id], [name], [is_group_active], [site_id], [category_code], [group_tag], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (171, N'COR Order Processing', N'Y', 3, NULL, N'COR-ORD', NULL, CAST(N'2021-07-27T17:50:18.4200000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T17:50:18.4200000' AS DateTime2), 48)
GO
SET IDENTITY_INSERT [dbo].[cooperator_group] OFF
GO

--====================================================================================================
-- COOPERATOR MAP
--====================================================================================================
SET IDENTITY_INSERT [dbo].[cooperator_map] ON 
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15510, 177526, 117, N'WY020 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.4745166' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.4745166' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15511, 177530, 117, N'WY010 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15512, 177531, 117, N'WY030 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15513, 177532, 117, N'WY040 is Seeds of Success colector Abbrev', CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.4901623' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15514, 177533, 117, N'WY090 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15515, 177534, 117, N'WY050 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15516, 177535, 117, N'WY060 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5057901' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15517, 177536, 117, N'WY070 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15518, 177537, 117, N'WY080 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15519, 177538, 117, N'WY100 is Seeds of Success collector Abbrev', CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-24T17:06:07.5213917' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15530, 177552, 117, N'UT080 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7502687' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7502687' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15531, 177553, 117, N'UT060 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7502687' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7502687' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15532, 177554, 117, N'UT040 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15533, 177555, 117, N'OR135 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15534, 177556, 117, N'OR020 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7658743' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15535, 177557, 117, N'OR090 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15536, 177558, 117, N'OR010 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15537, 177559, 117, N'OR110 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15538, 177560, 117, N'OR030 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7814921' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15539, 177561, 117, N'OR050 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15540, 177562, 117, N'OR100 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15541, 177563, 117, N'OR080 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15542, 177567, 117, N'NV052 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.7971658' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15543, 177568, 117, N'NV040 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15544, 177569, 117, N'NV030 is Seeds of Success collector Abbrv', CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15545, 177570, 117, N'NV020 is Seeds of Success collector Abbrev.', CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8127546' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15546, 177571, 117, N'NM080 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15547, 177572, 117, N'MT060 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15548, 177573, 117, N'MT050 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15549, 177574, 117, N'MT020 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8284127' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15550, 177576, 117, N'AK040 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15551, 177577, 117, N'AK930 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15552, 177578, 117, N'AZ010 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15553, 177579, 117, N'AZ040 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8440020' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15554, 177580, 117, N'AZ320 is Seeds of Success collector Abbrev (previously AZ050)', CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15555, 177581, 117, N'AZ930 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15556, 177582, 117, N'AZ932 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15557, 177591, 117, N'CA067 is Seeds of Success collector Abbrev.', CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8596480' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15558, 177592, 117, N'CA690 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15559, 177593, 117, N'CA660 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15560, 177594, 117, N'CA650 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8752995' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15561, 177595, 117, N'CA160 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15562, 177596, 117, N'CA170 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15563, 177597, 117, N'CA180 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15564, 177598, 117, N'CA340 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.8908785' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15565, 177601, 117, N'CA190 and CA190B and CA190B are the Seeds of Success collector Abrev (This Office was in Hollister Field Office)', CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15566, 177602, 117, N'CA190 and CA190B and CA190B are the Seeds of Success collector Abrev (This Office moved to Central Coast Filed Office)', CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15567, 177614, 117, N'CA360 is Seeds of Success collector Abrev', CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9065269' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15568, 177615, 117, N'CA350 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15569, 177616, 117, N'CA330 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15570, 177617, 117, N'CA370 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9221505' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15571, 177618, 117, N'CA930 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15572, 177619, 117, N'CA320 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15573, 177620, 117, N'CA180 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T17:23:27.9377513' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15574, 177621, 117, N'CO932 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T18:10:02.9148283' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9148283' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15575, 177622, 117, N'ID210 is Seeds of Success collecotr Abbrev (was ID097)', CAST(N'2020-02-26T18:10:02.9617209' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9617209' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15576, 177623, 117, N'ID230 is Seeds of Success collector Abbrev (was ID076)', CAST(N'2020-02-26T18:10:02.9773244' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9773244' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15577, 177624, 117, N'ID310 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15578, 177625, 117, N'ID320 is Seeds of Success collector Abbrev (was ID075)', CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398, CAST(N'2020-02-26T18:11:41.0391955' AS DateTime2), 110398, CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15579, 177626, 117, N'OR130 is Seeds of Success collector Abbrev', CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15580, 177627, 117, N'OR090 and OR090C are Seeds of Success collector Abbrev', CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398, NULL, NULL, CAST(N'2020-02-26T18:10:02.9929717' AS DateTime2), 110398)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15581, 171511, 118, NULL, CAST(N'2020-05-19T16:20:20.3772960' AS DateTime2), 177589, NULL, NULL, CAST(N'2020-05-19T16:20:20.3772960' AS DateTime2), 177589)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15598, 74740, 119, NULL, CAST(N'2021-07-27T17:41:41.0933333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T17:41:41.0933333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15600, 115696, 171, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15601, 123814, 120, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15602, 75275, 120, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T18:43:30.9933333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15603, 103541, 123, NULL, CAST(N'2021-07-27T18:54:43.9100000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T18:54:43.9100000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15605, 114458, 124, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15606, 74772, 125, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15607, 179661, 125, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T19:55:15.8300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15608, 120955, 125, NULL, CAST(N'2021-07-27T19:55:15.8433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T19:55:15.8433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15609, 180939, 125, NULL, CAST(N'2021-07-27T19:55:15.8433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T19:55:15.8433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15610, 52749, 126, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15611, 171671, 127, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15612, 115484, 128, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15613, 93851, 128, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15614, 179416, 129, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15615, 93851, 129, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15616, 164800, 130, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.5966667' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15617, 74597, 131, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15618, 110284, 132, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15619, 106140, 132, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15620, 120597, 133, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15621, 74901, 133, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15622, 74568, 134, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15623, 137817, 135, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15624, 109985, 136, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6133333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15625, 161219, 137, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15626, 139000, 138, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15627, 74853, 139, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15628, 165283, 141, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15629, 122145, 142, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15630, 118142, 140, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15631, 15219, 143, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6300000' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15632, 147561, 144, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15633, 74772, 145, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15634, 120955, 145, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15635, 180939, 145, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48)
GO
INSERT [dbo].[cooperator_map] ([cooperator_map_id], [cooperator_id], [cooperator_group_id], [note], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (15636, 179661, 145, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48, NULL, NULL, CAST(N'2021-07-27T21:23:08.6433333' AS DateTime2), 48)
GO
SET IDENTITY_INSERT [dbo].[cooperator_map] OFF
GO

DELETE FROM [dbo].[email_template]
GO
SET IDENTITY_INSERT [dbo].[email_template] ON 
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (3, N'Requestor Rejection Letter', N'RRJ', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'Regarding Your Germplasm Request (Order #[ID_HERE])', N'<p>Germplasm Requestor:</p>

<p>The U.S. National Plant Germplasm System (NPGS) provides plant material in small quantities to research and educational entities for projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available for home, personal, or community gardening.</p>

<p>Your request does not meet the criteria to receive germplasm from the NPGS and has been cancelled.</p>

<p>For more information about the NPGS, please view a 6-minute video that describes our mission and purpose at <a href="https://www.youtube.com/watch?v=uHOclGNELuw">https://www.youtube.com/watch?v=uHOclGNELuw</a>.</p>

<p>If you believe this decision is an error, please provide additional relevant information about your project to justify the need for specific NPGS germplasm, instead of using commercially available plant material. Send your email to <strong>gringlobal.orders@usda.gov</strong>, and include the web order number [ID_HERE].</p>

<p>Thank you.<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-02T16:50:02.5700000' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (4, N'Curator Approval Notification', N'CAP', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Approved', N'<p>Web Order Request [ID_HERE] has been reviewed and <strong>approved</strong> by the NRR Review Committee.</p>

<p>It is now visible in the Order Wizard as a Submitted&nbsp;web order request, and may be viewed in the OW and in the Curator Tool as well.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-02T16:46:51.6633333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (5, N'Curator Cancellation Notiification', N'CCL', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR Review Notification: Order [ID_HERE] Cancelled', N'<p>&nbsp;Web Order Request [ID_HERE] has been reviewed and <strong>cancelled</strong> by the NRR Review Committee.</p>

<p>&nbsp;The requestor has been notified via email. &nbsp;</p>

<p>&nbsp;No further action is needed from your site (or any sites included by the request). &nbsp;If you would like to review the WOR, for future reference, it is now visible in the Order Wizard as a Cancelled web order request and may be viewed in the OW and in the Curator Tool as well.</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-02T16:47:04.7500000' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (6, N'Request For Information', N'RQI', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'Request For Additional Information: Order [ID_HERE]', N'<p>Germplasm Requestor:</p>

<p>The U.S. National Plant Germplasm System (NPGS) provides plant material in small quantities to research and educational entities for projects where genetic diversity is required. Accessions maintained by the NPGS are not intended or available for home, personal, or community gardening.</p>

<p>Your request does not meet the criteria to receive germplasm from the NPGS and has been cancelled.</p>

<p>For more information about the NPGS, please view a 6-minute video that describes our mission and purpose at <a href="https://www.youtube.com/watch?v=uHOclGNELuw">https://www.youtube.com/watch?v=uHOclGNELuw</a>.</p>

<p>If you believe this decision is an error, please provide additional relevant information about your project to justify the need for specific NPGS germplasm, instead of using commercially available plant material. Send your email to&nbsp;<a href="mailto:gringlobal.orders@usda.gov?subject=Request%20For%20Information%20">gringlobal.orders@usda.gov</a>, and include the web order number.</p>

<p>Thank you.<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
', N'0', CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48, CAST(N'2021-08-03T13:42:34.6533333' AS DateTime2), 48, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), 48)
GO
INSERT [dbo].[email_template] ([email_template_id], [title], [category_code], [email_from], [email_to], [email_cc], [email_bcc], [email_reply_to], [subject], [body], [is_html], [created_date], [created_by], [modified_date], [modified_by], [owned_date], [owned_by]) VALUES (8, N'NRR Flag Notification', N'NRR', N'gringlobal.orders@usda.gov', NULL, NULL, NULL, NULL, N'NRR (Potential) -- GRIN-Global Web Order #[ID_HERE]', N'<p>Please Note:</p>

<p>Web Order <strong>[ID_HERE]</strong> has been flagged for review because it meets one or more Non-Research Request (NRR) criteria. &nbsp;This email is simply for your information. You should not proceed to address the request at this time.</p>

<p>The request has been forwarded to, and will be reviewed by, the NRR Review Committee. <strong>Please note that this web order will not appear in the Order Wizard until their review is completed.</strong></p>

<p>Eventually you will receive one more notification, indicating the committee&rsquo;s decision. If the committee&hellip;</p>

<ul>
	<li>denies the request, then no further action is required by you. The web order status will be &ldquo;CANCELLED.&rdquo;</li>
	<li>approves the request, then proceed as usual to process your site&rsquo;s portion of the request. (e.g., use the Order Wizard) &nbsp;</li>
</ul>

<p>In some cases (such as when the request was not an obvious NRR), the committee has requested more details from the requestor.&nbsp; The request will remain &ldquo;NRR_FLAGGED.&rdquo;&nbsp; Any delay in the committee&rsquo;s final &ldquo;accepted&rdquo; or &ldquo;denied&rdquo; designation is dependent on the requestor&rsquo;s responsiveness.</p>

<p>If you have questions, or can provide information regarding this web order, please contact the NRR Review Committee:</p>

<ul>
	<li><a href="mailto:@gary.kinard@usda.gov">Gary Kinard</a></li>
	<li><a href="mailto:@harold.bockleman@usda.gov">Harold Bockleman</a></li>
	<li><a href="mailto:@marty.reisinger@usda.gov">Martin Reisinger</a></li>
</ul>
', N'0', CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48, CAST(N'2021-08-02T17:33:58.3966667' AS DateTime2), 48, CAST(N'2021-08-01T18:03:49.2333333' AS DateTime2), 48)
GO
SET IDENTITY_INSERT [dbo].[email_template] OFF
GO

