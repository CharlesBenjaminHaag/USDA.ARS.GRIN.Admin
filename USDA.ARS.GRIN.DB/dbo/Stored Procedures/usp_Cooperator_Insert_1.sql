-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_Cooperator_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_cooperator_id INT = 0 OUTPUT,
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
	@note nvarchar(max) = NULL,
	@web_cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48
    DECLARE @ADMIN_WEB_COOPERATOR_ID INT = 1
	
	BEGIN TRY
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
			@web_cooperator_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
		SET @out_cooperator_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
