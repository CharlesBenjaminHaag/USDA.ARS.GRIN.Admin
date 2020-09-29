
 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Update]
@out_error_number INT = 0 OUTPUT,
@crop_name nvarchar(150),
@note nvarchar (MAX),
@modified_by int,
@taxonomy_cwr_crop_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_cwr_crop SET crop_name=@crop_name,note=@note,modified_date=GETDATE(),modified_by=@modified_by,owned_date=GETDATE(),owned_by=@modified_by 
	WHERE taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
