-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Cooperator_Insert] 
	@title nvarchar(10),
	@last_name nvarchar(100),
	@first_name nvarchar(100),
	@password nvarchar(20),
	@job nvarchar(100),
	@site_id int,
	@organization nvarchar(100),
	@organization_abbrev nvarchar(10),
	@address_line1 nvarchar(100) = NULL,
	@address_line2 nvarchar(100) = NULL,
	@address_line3 nvarchar(100) = NULL,
	@city nvarchar(100),
	@postal_index nvarchar(100),
	@geography_id int,
	@primary_phone nvarchar(30),
	@email nvarchar(100),
	@status_code nvarchar(20),
	@category_code nvarchar(20) = NULL,
	@organization_region_code nvarchar(20) = NULL,
	@discipline_code nvarchar(20) = NULL,
	@note nvarchar(max) = NULL
	AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1

	DECLARE @new_web_cooperator_id INT
	DECLARE @new_cooperator_id INT
	DECLARE @new_sys_user_id INT
	
	-- ========================================================================
	-- WEB COOPERATOR
	-- ========================================================================
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
	@ADMIN_WEB_COOPERATOR_ID,
	GETDATE(),
	@ADMIN_WEB_COOPERATOR_ID
	)

	SET @new_web_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	-- ========================================================================
	-- COOPERATOR
	-- ========================================================================
    INSERT INTO cooperator
	(
	 site_id
	 ,last_name
	 ,title
	,first_name
	,job
	,organization
	,organization_abbrev
	,address_line1
	,address_line2
	,address_line3
	,city
	,postal_index
	,geography_id
	,primary_phone
	,email
	,status_code
	,category_code
	,organization_region_code
	,discipline_code
	,note
	,sys_lang_id
	,web_cooperator_id
	,created_date
	,created_by
	,owned_date
	,owned_by
	  )
	  VALUES
	  (
		@site_id,
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
		'ACTIVE',
		@category_code,
		@organization_region_code,
		@discipline_code,
		@note,
		1,
		@new_web_cooperator_id,
		GETDATE(),
		@ADMIN_COOPERATOR_ID,
		GETDATE(),
		@ADMIN_COOPERATOR_ID
	)
	SET @new_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)

	-- ========================================================================
	-- USER
	-- ========================================================================
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
	 @email,
	 @password,
	 'Y',
	 @new_cooperator_id,
	 GETDATE(),
	 @ADMIN_COOPERATOR_ID,
	 GETDATE(),
	 @ADMIN_COOPERATOR_ID
	)
	SET @new_sys_user_id = CAST(SCOPE_IDENTITY() AS INT)

	-- ========================================================================
	-- DEFAULT GROUPS
	-- ========================================================================
	INSERT INTO 
		sys_group_user_map
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
			2,
			@new_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)

		INSERT INTO 
		sys_group_user_map
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
			3,
			@new_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)




	--DEBUG
	SELECT @new_web_cooperator_id AS WEB_COOP
	SELECT @new_cooperator_id AS COOP
	SELECT @new_sys_user_id AS SYS_USER

END
