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
