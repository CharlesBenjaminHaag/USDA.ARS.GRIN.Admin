
 CREATE PROCEDURE [usp_TaxonomyRegulation_Insert]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation (geography_id,regulation_type_code,regulation_level_code,description,url_1,url_2,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@geography_id,@regulation_type_code,@regulation_level_code,@description,@url_1,@url_2,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
