
 CREATE PROCEDURE [usp_TaxonomyCwrCrop_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_crop_id INT = 0 OUTPUT,
	@crop_name nvarchar(150),
	@note nvarchar(max),
	@created_by int
AS
	BEGIN
	BEGIN TRY
		Insert into taxonomy_cwr_crop (crop_name,note,created_date,created_by,owned_date,owned_by)
		values(@crop_name,@note, GETDATE(),@created_by, GETDATE(),@created_by)
		SET @out_taxonomy_cwr_crop_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
