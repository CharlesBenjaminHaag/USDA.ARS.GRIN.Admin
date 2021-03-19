USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebUser_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestsByStatus_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestsByStatus_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequests_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestLock_Update]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestLock_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItems_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestItems_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItem_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestItem_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestActions_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestActions_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAction_Insert]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequestAction_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Update]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequest_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Select]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebOrderRequest_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_WebCooperator_Insert]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_wor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_wc]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_owned]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_modified]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_created]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[web_order_request_item]') AND type in (N'U'))
ALTER TABLE [dbo].[web_order_request_item] DROP CONSTRAINT IF EXISTS [fk_wori_a]
GO
/****** Object:  Table [dbo].[web_order_request_item]    Script Date: 3/18/2021 8:13:25 PM ******/
DROP TABLE IF EXISTS [dbo].[web_order_request_item]
GO
/****** Object:  Table [dbo].[web_order_request_item]    Script Date: 3/18/2021 8:13:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_order_request_item](
	[web_order_request_item_id] [int] IDENTITY(1,1) NOT NULL,
	[web_cooperator_id] [int] NOT NULL,
	[web_order_request_id] [int] NOT NULL,
	[sequence_number] [int] NOT NULL,
	[accession_id] [int] NOT NULL,
	[name] [nvarchar](200) NULL,
	[quantity_shipped] [int] NULL,
	[unit_of_shipped_code] [nvarchar](20) NULL,
	[distribution_form_code] [nvarchar](20) NULL,
	[status_code] [nvarchar](20) NULL,
	[curator_note] [nvarchar](max) NULL,
	[user_note] [nvarchar](max) NULL,
	[created_date] [datetime2](7) NOT NULL,
	[created_by] [int] NOT NULL,
	[modified_date] [datetime2](7) NULL,
	[modified_by] [int] NULL,
	[owned_date] [datetime2](7) NOT NULL,
	[owned_by] [int] NOT NULL,
 CONSTRAINT [PK_web_order_request_item] PRIMARY KEY CLUSTERED 
(
	[web_order_request_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_a] FOREIGN KEY([accession_id])
REFERENCES [dbo].[accession] ([accession_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_a]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_created] FOREIGN KEY([created_by])
REFERENCES [dbo].[web_user] ([web_user_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_created]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_modified] FOREIGN KEY([modified_by])
REFERENCES [dbo].[web_user] ([web_user_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_modified]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_owned] FOREIGN KEY([owned_by])
REFERENCES [dbo].[web_user] ([web_user_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_owned]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_wc] FOREIGN KEY([web_cooperator_id])
REFERENCES [dbo].[web_cooperator] ([web_cooperator_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_wc]
GO
ALTER TABLE [dbo].[web_order_request_item]  WITH CHECK ADD  CONSTRAINT [fk_wori_wor] FOREIGN KEY([web_order_request_id])
REFERENCES [dbo].[web_order_request] ([web_order_request_id])
GO
ALTER TABLE [dbo].[web_order_request_item] CHECK CONSTRAINT [fk_wori_wor]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebCooperator_Insert]    Script Date: 3/18/2021 8:13:26 PM ******/
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
	@out_error_number INT = 0 OUTPUT,
	@out_web_cooperator_id INT = 0 OUTPUT,
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@organization nvarchar(100),
	@organization_code nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@is_active nvarchar(1),
	@category_code nvarchar(20) = NULL,
	@organization_region nvarchar(20) = NULL,
	@discipline nvarchar(20) = NULL,
	@note nvarchar(max) = NULL
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
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
			@organization_code,
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
			@organization_region,
			@discipline,
			@note,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_WEB_COOPERATOR_ID
			)
		SET @out_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequest_Select] 
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		wor.web_order_request_id
		-- WEB COOPERATOR
		,wor.web_cooperator_id
		,wc.title AS web_cooperator_title
		,wc.last_name AS web_cooperator_last_name
		,wc.first_name AS web_cooperator_first_name
		,(wc.first_name + ' ' + wc.last_name) AS web_cooperator_full_name
		,wc.organization AS web_cooperator_organization
		,wc.address_line1 AS web_cooperator_address_line_1
		,wc.address_line2 AS web_cooperator_address_line_2
		,wc.address_line3 AS web_cooperator_address_line_3
		,wc.city AS web_cooperator_address_city
		,wc.postal_index AS web_cooperator_address_postal_index
		,wc.geography_id
		,(SELECT adm1 FROM geography WHERE geography_id = wc.geography_id) AS web_cooperator_address_state
		,wc.primary_phone AS web_cooperator_primary_phone
		,wc.email AS web_cooperator_email
		,wc.created_date AS web_cooperator_created_date
		,wc.modified_date AS web_cooperator_modified_date

		-- COOPERATOR
		,c.cooperator_id
		,c.title AS cooperator_title
		,c.last_name AS cooperator_last_name
		,c.first_name AS cooperator_first_name
		,(c.first_name + ' ' + c.last_name) AS cooperator_full_name
		,c.organization AS cooperator_organization
		,c.address_line1 AS cooperator_address_line_1
		,c.address_line2 AS cooperator_address_line_2
		,c.address_line3 AS cooperator_address_line_3
		,c.city AS cooperator_address_city
		,c.postal_index AS cooperator_address_postal_index
		,c.geography_id
		,(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS cooperator_address_state
		,c.primary_phone AS cooperator_primary_phone
		,c.email AS cooperator_email
		,c.created_date AS cooperator_created_date
		,c.modified_date AS cooperator_modified_date

      ,wora.address_line1 AS web_order_request_address_line_1
      ,wora.address_line2 AS web_order_request_address_line_2
      ,wora.address_line3 AS web_order_request_address_line_3
      ,wora.city AS web_order_request_city
      ,wora.postal_index AS web_order_request_postal_index
      ,wora.geography_id AS web_order_request_geography_id
	  ,(SELECT adm1 FROM geography WHERE geography_id = wora.geography_id) AS web_order_request_state
	 
      ,wor.ordered_date
      ,wor.intended_use_code
      ,wor.intended_use_note
      ,wor.status_code
      ,wor.note
      ,wor.special_instruction
      ,wor.created_date
      ,wor.created_by
      ,wor.modified_date
      ,wor.modified_by
      ,wor.owned_date
      ,wor.owned_by
FROM
    web_order_request wor
LEFT JOIN 
	web_cooperator wc 
ON 
	wc.web_cooperator_id = wor.web_cooperator_id
LEFT JOIN 
	web_order_request_address wora 
ON 
	wora.web_order_request_id = wor.web_order_request_id

LEFT OUTER JOIN
	cooperator c
ON
	c.web_cooperator_id = wc.web_cooperator_id
WHERE
	wor.web_order_request_id = @web_order_request_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequest_Update]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequest_Update] 
	@out_error_number INT = 0 OUTPUT,
	@web_order_request_id INT,
	@web_cooperator_id INT,
	@status_code NVARCHAR(20),
	@note NVARCHAR(2000)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @web_order_request_status_code NVARCHAR(20)
	DECLARE @web_order_request_item_status_code NVARCHAR(20)
	DECLARE @web_order_request_action_id INT
	DECLARE @error_code INT

	BEGIN TRY

		-- If order has been approved following an NRR review, reset the statuses
		-- of the order and its items to their original values, and undo any existing lock.
		IF (@status_code = 'NRR_APPROVE')
			BEGIN
				SET @web_order_request_status_code = 'SUBMITTED'
				SET @web_order_request_item_status_code = 'NEW'
			END

		UPDATE
			web_order_request 
		SET
			status_code = @web_order_request_status_code,
			note = @note,
			modified_by = 1,
			modified_date = GETDATE(),
			is_locked = 0,
			owned_by = 1,
			owned_date = GETDATE()
		WHERE
			web_order_request_id = @web_order_request_id

		UPDATE
			web_order_request_item 
		SET
			status_code = @web_order_request_item_status_code,
			modified_by = 1,
			modified_date = GETDATE()
		WHERE
			web_order_request_id = @web_order_request_id
	
		EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, @status_code, @note, 1

	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestAction_Insert]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestAction_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_web_order_request_action_id INT = 0 OUTPUT,
	@web_order_request_id INT,
	@action_code NVARCHAR(20),
	@note NVARCHAR(MAX) = '',
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF NOT EXISTS (SELECT * 
			 FROM web_order_request_action 
			 WHERE web_order_request_id = @web_order_request_id
			 AND action_code = @action_code)
		INSERT INTO 
			web_order_request_action
			(web_order_request_id,
			action_code,
			acted_date,
			note,
			web_cooperator_id,
			created_date,
			created_by,
			owned_date,
			owned_by)
		VALUES
			(@web_order_request_id,
			@action_code,
			GETDATE(),
			@note,
			@created_by,
			GETDATE(),
			@created_by,
			GETDATE(),
			@created_by)
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestActions_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestActions_Select]
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		web_order_request_action_id,
		web_order_request_id,
		action_code,
		COALESCE(acted_date, created_date, modified_date) AS action_date,
		CONVERT(date, acted_date) AS action_date_converted,
		note,
		COALESCE(web_cooperator_id, created_by, modified_by) AS cooperator_id,
		created_by,
		(SELECT first_name + '  ' + last_name FROM web_cooperator WHERE web_cooperator_id = wora.created_by) AS created_by_name,
		created_date
FROM 
	web_order_request_action wora
WHERE
	web_order_request_id = @web_order_request_id
ORDER BY
	acted_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItem_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestItem_Select] 
	@web_order_request_item_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	web_cooperator_id,
	web_order_request_id,
	sequence_number,
	accession_id,
	status_code,
	(SELECT c.site_id FROM cooperator c JOIN accession a ON a.owned_by = c.cooperator_id AND a.accession_id = wori.accession_id) AS site_id,
	name,
	quantity_shipped,
	unit_of_shipped_code,
	distribution_form_code,
	curator_note,
	user_note,
	(SELECT taxonomy_species_id FROM accession WHERE accession_id = wori.accession_id) AS taxonomy_species_id,
	created_date,
	created_by,
	modified_date,
	modified_by,
	owned_date,
	owned_by
FROM
    web_order_request_item wori
WHERE
	web_order_request_item_id = @web_order_request_item_id
  

END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestItems_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestItems_Select] 
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	wori.web_cooperator_id,
	web_order_request_id,
	sequence_number,
	a.accession_id,
	LTRIM(RTRIM(LTRIM(COALESCE(accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, accession_number_part2), '') + ' ') + COALESCE(accession_number_part3, ''))) AS accession_text,
	wori.status_code,
	c.site_id,
	s.site_long_name,
	wori.name,
	ISNULL(quantity_shipped,0) AS quantity_shipped,
	unit_of_shipped_code,
	(SELECT TOP 1
		title 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = unit_of_shipped_code 
	 AND 
		cvl.sys_lang_id = 1 
	 AND 
		group_name = 'UNIT_OF_QUANTITY') AS unit_of_shipped,
	distribution_form_code,
	(SELECT TOP 1
		description 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = distribution_form_code 
	 AND cvl.sys_lang_id = 1) AS distribution_form,
	curator_note,
	user_note,
	ts.taxonomy_species_id,
	ts.name AS species_name
FROM
    web_order_request_item wori
JOIN
	accession a
ON
	wori.accession_id = a.accession_id
JOIN
	cooperator c
ON
	a.owned_by = c.cooperator_id
JOIN
	site s
ON
	c.site_id = s.site_id
JOIN
	taxonomy_species ts
ON
	a.taxonomy_species_id = ts.taxonomy_species_id
WHERE
	web_order_request_id = @web_order_request_id
  

END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestLock_Update]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestLock_Update] 
	@out_error_number INT = 0 OUTPUT,
	@web_order_request_id INT,
	@web_cooperator_id INT,
	@is_locked BIT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		DECLARE @owned_by INT
		DECLARE @owned_date DATETIME2(7)

		IF (@is_locked = 0)
		BEGIN
			SET @owned_by = 1
			SET @owned_date = GETDATE()
		END
		ELSE
			BEGIN
				SET @owned_by = @web_cooperator_id
				SET @owned_date = GETDATE()
			END

		UPDATE
			web_order_request 
		SET
			is_locked = @is_locked,
			owned_by = @owned_by,
			owned_date = @owned_date
		WHERE
			web_order_request_id = @web_order_request_id
	
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequests_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequests_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT wor.web_order_request_id
      ,wor.web_cooperator_id
      ,wc.last_name
      ,wc.title
      ,wc.first_name
	  ,(wc.first_name + ' ' + wc.last_name) AS full_name
      ,wc.organization
      ,wora.address_line1
      ,wora.address_line2
      ,wora.address_line3
      ,wora.city
      ,wora.postal_index
      ,wora.geography_id
      ,wc.primary_phone
      ,wc.email
      ,wor.ordered_date
      ,wor.intended_use_code
      ,wor.intended_use_note
      ,wor.status_code
      ,wor.note
      ,wor.special_instruction
      ,wor.created_date
      ,wor.created_by
      ,wor.modified_date
      ,wor.modified_by
      ,wor.owned_date
      ,wor.owned_by
FROM
    web_order_request wor
LEFT JOIN 
	web_cooperator wc 
ON 
	wc.web_cooperator_id = wor.web_cooperator_id
LEFT JOIN 
	web_order_request_address wora 
ON 
	wora.web_order_request_id = wor.web_order_request_id
WHERE
	wor.status_code = 'CANCELED'
AND 
	wor.ordered_date > '8/1/2020'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebOrderRequestsByStatus_Select]    Script Date: 3/18/2021 8:13:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebOrderRequestsByStatus_Select]
	@status_code NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	
SELECT 
		wor.web_order_request_id,
		wor.is_locked,
		wor.web_cooperator_id
		,wc.last_name
		,wc.title
		,wc.first_name
		,(wc.first_name + ' ' + wc.last_name) AS full_name
		,wc.title AS web_cooperator_title
		,wc.last_name AS web_cooperator_last_name
		,wc.first_name AS web_cooperator_first_name
		,(wc.first_name + ' ' + wc.last_name) AS web_cooperator_full_name
		,wc.organization AS web_cooperator_organization
		,wc.address_line1 AS web_cooperator_address_line_1
		,wc.address_line2 AS web_cooperator_address_line_2
		,wc.address_line3 AS web_cooperator_address_line_3
		,wc.city AS web_cooperator_address_city
		,wc.postal_index AS web_cooperator_address_postal_index
		,wc.geography_id
		,(SELECT adm1 FROM geography WHERE geography_id = wc.geography_id) AS web_cooperator_address_state
		,wc.primary_phone AS web_cooperator_primary_phone
		,wc.email AS web_cooperator_email
		,wc.created_date AS web_cooperator_created_date
		,wc.modified_date AS web_cooperator_modified_date
		,wora.address_line1
		,wora.address_line2
		,wora.address_line3
		,wora.city
		,wora.postal_index
		,wora.geography_id
		,wc.primary_phone
		,wc.email
		,wor.ordered_date
		,wor.intended_use_code
		,wor.intended_use_note
		,wor.status_code
		,wor.note
		,wor.special_instruction
		,wor.created_date
		,wor.created_by
		,ISNULL((SELECT first_name + ' ' + last_name FROM web_cooperator WHERE web_cooperator_id = wor.created_by),'') AS created_by_name
		,wor.modified_date
		,wor.modified_by
		,(SELECT first_name + ' ' + last_name FROM web_cooperator WHERE web_cooperator_id = wor.modified_by) AS modified_by_name
		,wor.owned_date
		,(SELECT first_name + ' ' + last_name FROM web_cooperator WHERE web_cooperator_id = wor.owned_by) AS owned_by_name
FROM
    web_order_request wor
LEFT JOIN 
	web_cooperator wc 
ON 
	wc.web_cooperator_id = wor.web_cooperator_id
LEFT JOIN 
	web_order_request_address wora 
ON 
	wora.web_order_request_id = wor.web_order_request_id
WHERE
	wor.status_code = @status_code
ORDER BY
	wor.ordered_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_WebUser_Insert]    Script Date: 3/18/2021 8:13:26 PM ******/
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
	 @out_error_number INT = 0 OUTPUT,
	 @out_web_user_id INT = 0 OUTPUT,
	 @user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
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
		SET @out_web_user_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
