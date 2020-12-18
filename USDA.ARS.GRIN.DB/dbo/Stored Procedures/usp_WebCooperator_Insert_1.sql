-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_WebCooperator_Insert] 
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
