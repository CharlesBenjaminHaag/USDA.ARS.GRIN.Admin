
 CREATE PROCEDURE [usp_TaxonomyRegulation_Update]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation SET geography_id=@geography_id,regulation_type_code=@regulation_type_code,regulation_level_code=@regulation_level_code,description=@description,url_1=@url_1,url_2=@url_2,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_id=@taxonomy_regulation_id AND geography_id=@geography_id AND regulation_type_code=@regulation_type_code AND regulation_level_code=@regulation_level_code AND description=@description AND url_1=@url_1 AND url_2=@url_2 AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
