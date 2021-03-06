USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebCooperator_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_User_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_SysGroup_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_SysGroup_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInventoryAttachments_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AccessionInventoryAttachments_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttachValidationCounts_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AccessionInvAttachValidationCounts_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttachValidation_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AccessionInvAttachValidation_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttach_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AccessionInvAttach_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttach_Search]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_AccessionInvAttach_Search]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accession_inv_attach_validation]') AND type in (N'U'))
ALTER TABLE [dbo].[accession_inv_attach_validation] DROP CONSTRAINT IF EXISTS [FK_accession_inv_attach_validation_accession_inv_attach]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accession_inv_attach_validation]') AND type in (N'U'))
ALTER TABLE [dbo].[accession_inv_attach_validation] DROP CONSTRAINT IF EXISTS [DF__accession__image__03E3ACE3]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accession_inv_attach_validation]') AND type in (N'U'))
ALTER TABLE [dbo].[accession_inv_attach_validation] DROP CONSTRAINT IF EXISTS [DF__accession__image__02EF88AA]
GO
/****** Object:  View [dbo].[vw_accession_inventory_attachments_by_validation]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_accession_inventory_attachments_by_validation]
GO
/****** Object:  Table [dbo].[accession_inv_attach_validation]    Script Date: 8/14/2020 4:39:03 PM ******/
DROP TABLE IF EXISTS [dbo].[accession_inv_attach_validation]
GO
/****** Object:  Table [dbo].[accession_inv_attach_validation]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accession_inv_attach_validation](
	[accession_inv_attach_validation_id] [int] IDENTITY(1,1) NOT NULL,
	[accession_inv_attach_id] [int] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[image_url_is_valid] [int] NULL,
	[image_thumbnail_url_is_valid] [int] NULL,
 CONSTRAINT [PK_accession_inv_attach_validation] PRIMARY KEY CLUSTERED 
(
	[accession_inv_attach_validation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_accession_inventory_attachments_by_validation]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_accession_inventory_attachments_by_validation]
AS
(
SELECT 
		aia.accession_inv_attach_id,        
		REPLACE(virtual_path,'https:/npgsweb.ars-grin.gov/gringlobal/uploads/images/npgs','') AS virtual_path,
		REPLACE(thumbnail_virtual_path,'https:/npgsweb.ars-grin.gov/gringlobal/uploads/images/npgs','') AS thumbnail_virtual_path,
		title,
		aia.owned_by,
		aia.created_date,
		aiav.image_url_is_valid,
	    aiav.image_thumbnail_url_is_valid,
		aiav.created_date AS validated_date,
		CASE
			WHEN aiav.created_date IS NULL THEN 'NV'
			WHEN (aiav.image_url_is_valid = 1) AND (aiav.image_thumbnail_url_is_valid = 1) THEN 'VL'
			WHEN (aiav.image_url_is_valid = 0) OR (aiav.image_thumbnail_url_is_valid = 0) THEN 'ER' 
		END AS status_code,
		
		CASE
			WHEN aiav.created_date IS NULL THEN 'Not Validated'
			WHEN (aiav.image_url_is_valid = 1) AND (aiav.image_thumbnail_url_is_valid = 1) THEN 'Validated' 
			WHEN (aiav.image_url_is_valid = 0) OR (aiav.image_thumbnail_url_is_valid = 0) THEN 'Error' 
		END AS status_code_desc
	FROM 
		accession_inv_attach aia
	LEFT OUTER JOIN
		accession_inv_attach_validation aiav
	ON
		aia.accession_inv_attach_id = aiav.accession_inv_attach_id
)
GO
ALTER TABLE [dbo].[accession_inv_attach_validation] ADD  DEFAULT ((-1)) FOR [image_url_is_valid]
GO
ALTER TABLE [dbo].[accession_inv_attach_validation] ADD  DEFAULT ((-1)) FOR [image_thumbnail_url_is_valid]
GO
ALTER TABLE [dbo].[accession_inv_attach_validation]  WITH CHECK ADD  CONSTRAINT [FK_accession_inv_attach_validation_accession_inv_attach] FOREIGN KEY([accession_inv_attach_id])
REFERENCES [dbo].[accession_inv_attach] ([accession_inv_attach_id])
GO
ALTER TABLE [dbo].[accession_inv_attach_validation] CHECK CONSTRAINT [FK_accession_inv_attach_validation_accession_inv_attach]
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttach_Search]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttach_Search] 
	@batch_size INT = 0,	
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	DECLARE @batch_text NVARCHAR(20) = ' '

	IF (@batch_size > 0)
	BEGIN
		SET @batch_text = 'TOP ' + CONVERT(NVARCHAR(5),@batch_size)
	END

	SET @sqlStatement = ' SELECT ' + @batch_text + 
	   'aia.accession_inv_attach_id,        
	virtual_path,        
	thumbnail_virtual_path,        
	title,
	aia.owned_by,
	aia.created_date,
	aiav.image_thumbnail_url_is_valid,
	aiav.image_url_is_valid,
	aiav.created_date AS validated_date
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	--DECLARE @Results TABLE
	--([accession_inv_attach_id] [int] IDENTITY(1,1) NOT NULL,
	-- [virtual_path] [nvarchar](255) NOT NULL,
	-- [thumbnail_virtual_path] [nvarchar](255) NULL,
	--[title] [nvarchar](500) NULL)

	--INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	--SELECT *
	--FROM @Results
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttach_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttach_Select]
	@accession_inv_attach_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		aia.accession_inv_attach_id,        
		virtual_path,        
		thumbnail_virtual_path,        
		title,
		aia.owned_by,
		aia.created_date,
		aiav.image_url_is_valid,
	    aiav.image_thumbnail_url_is_valid,
		aiav.created_date AS validated_date
	FROM 
		accession_inv_attach aia
	LEFT OUTER JOIN
		accession_inv_attach_validation aiav
	ON
		aia.accession_inv_attach_id = aiav.accession_inv_attach_id
	WHERE
		aia.accession_inv_attach_id = @accession_inv_attach_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttachValidation_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttachValidation_Insert]
	@accession_inv_attach_id int,
	@image_thumbnail_url_is_valid nvarchar(1),
	@image_url_is_valid nvarchar(1)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO accession_inv_attach_validation
	(
		accession_inv_attach_id,
		image_url_is_valid,
	    image_thumbnail_url_is_valid,
		created_date,
		created_by
	)
	VALUES
	(
		@accession_inv_attach_id,
		@image_url_is_valid,
		@image_thumbnail_url_is_valid,
		GETDATE(),
		48
	)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInvAttachValidationCounts_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttachValidationCounts_Select] 
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
	'V' AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.image_thumbnail_url_is_valid = 1 
AND
	aiav.image_url_is_valid = 1
UNION
SELECT 
	'E'  AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.image_thumbnail_url_is_valid = 0 
OR
	aiav.image_url_is_valid = 0
	UNION
SELECT 
	'N'  AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.created_date IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AccessionInventoryAttachments_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInventoryAttachments_Select] 
	@batch_size INT,
	@status_code NVARCHAR(2) = ''
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @where_clause NVARCHAR(2000)
	DECLARE @sql_statement NVARCHAR(2000);

	SET @sql_statement = 'SELECT TOP ' + CONVERT(NVARCHAR(4),@batch_size) + 
	' accession_inv_attach_id,
	virtual_path,
	thumbnail_virtual_path,
	title,
	owned_by,
	created_date,
	image_url_is_valid,
	image_thumbnail_url_is_valid,
	validated_date,
	status_code,
	status_code_desc
FROM 
	vw_accession_inventory_attachments_by_validation'

IF (LEN(TRIM(@status_code)) > 0)
	BEGIN
		SET @sql_statement = @sql_statement + ' WHERE status_code =''' + @status_code + ''''
	END;

SET @sql_statement = @sql_statement + ' ORDER BY accession_inv_attach_id ASC';

DECLARE @Results TABLE
(
	[accession_inv_attach_id] [int] NOT NULL,
	virtual_path NVARCHAR(255),
	thumbnail_virtual_path NVARCHAR(255),
	title NVARCHAR(255),
	owned_by INT,
	[created_date] [datetime2](7),
	[image_url_is_valid] [int],
	[image_thumbnail_url_is_valid] [int],
	validated_date [datetime2](7),
	status_code NVARCHAR(4),
	status_code_desc NVARCHAR(20)
)

INSERT INTO @Results
	EXECUTE sp_executesql @sql_statement

SELECT 
	* 
FROM 
	@Results

END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysGroup_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysGroup_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_group_id INT = 0 OUTPUT,
	@group_tag NVARCHAR(20)
AS
BEGIN

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_IS_ENABLED NVARCHAR(1) = 'Y'

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO 
			sys_group
			(
				group_tag,
				is_enabled,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
		VALUES
		(
			@group_tag,
			@CONST_IS_ENABLED,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @out_group_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SysUser_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Insert]
	(@user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @cooperator_id int NULL
	 )
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO sys_user 
	(
	 user_name,
	 password,
	 is_enabled,
	 cooperator_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
	)
	VALUES
	(
	 @user_name,
	 @password,
	 'Y',
	 @cooperator_id,
	 GETDATE(),
	 48,
	 GETDATE(),
	 48
	)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_User_Select]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Select]
	@user_name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name as site,
		sl.script_direction,
		'' as groups,
		'' as login_token,
		'' as warning
	FROM sys_user su
		LEFT JOIN 
			cooperator co 
		ON 
			su.cooperator_id = co.cooperator_id
		LEFT JOIN 
			site s 
		ON 
			co.site_id = s.site_id
		LEFT JOIN 
			sys_lang sl 
		ON 
			sl.sys_lang_id = co.sys_lang_id
	WHERE 
		su.user_name LIKE '%' + @user_name + '%' 
	AND 
		su.is_enabled = 'Y'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebCooperator_Insert] 
	@site_id int,
	@last_name nvarchar(100),
	@title nvarchar(10),
	@first_name nvarchar(100),
	@job nvarchar(100),
	@organization nvarchar(100) = NULL,
	@organization_abbrev nvarchar(10) = NULL,
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30) = NULL,
	@email nvarchar(100) = NULL,
	@status_code nvarchar(20),
	@category_code nvarchar(20) = NULL,
	@organization_region_code nvarchar(20) = NULL,
	@discipline_code nvarchar(20) = NULL,
	@note nvarchar(max) = NULL
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @new_web_cooperator_id INT
	
	-- Web Cooperator
	INSERT INTO web_cooperator
	(
	[last_name]  ,
	[title] ,
	[first_name],
	[job],
	[organization] ,
	[organization_code] ,
	[address_line1] ,
	[address_line2] ,
	[address_line3] ,
	[city] ,
	[postal_index] ,
	[geography_id] ,
	[primary_phone],
	[email],
	[is_active],
	[category_code],
	[organization_region],
	[discipline],
	[note],
	[created_date] ,
	[created_by] ,
	[owned_date] ,
	[owned_by]
	)
	VALUES
	(
	@last_name,
	@title,
	@first_name,
	@job,
	@organization,
	@organization_abbrev,
	@address_line1,
	@address_line2,
	@address_line3,
	@city,
	@postal_index,
	@geography_id,
	@primary_phone,
	@email,
	'Y',
	@category_code,
	@organization_region_code,
	@discipline_code,
	@note,
	GETDATE(),
	1,
	GETDATE(),
	1
	)

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 8/14/2020 4:39:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebUser_Insert]
	(@user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO web_user 
	(
	 user_name,
	 password,
	 is_enabled,
	 web_cooperator_id,
	 sys_lang_id,
	 created_date
	)
	VALUES
	(
	 @user_name,
	 @password,
	 'Y',
	 @web_cooperator_id,
	 1,
	 GETDATE()
	)
END
GO
