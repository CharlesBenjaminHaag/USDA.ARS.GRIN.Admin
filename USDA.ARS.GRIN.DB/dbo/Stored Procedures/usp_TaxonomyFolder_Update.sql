-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFolder_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(2000),
	@is_shared BIT,
	@modified_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		UPDATE
			taxonomy_folder
		SET 
			title = @title, 
			description = @description, 
			note = @note,
			is_shared = @is_shared,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END


UPDATE taxonomy_folder SET modified_by = 48, modified_date = GETDATE()