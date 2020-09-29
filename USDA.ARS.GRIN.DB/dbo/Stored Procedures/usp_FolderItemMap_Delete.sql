-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FolderItemMap_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_item_map_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_item_id = @taxonomy_folder_item_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
