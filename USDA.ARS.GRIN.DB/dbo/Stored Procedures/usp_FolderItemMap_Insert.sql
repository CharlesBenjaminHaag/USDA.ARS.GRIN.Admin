-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FolderItemMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_item_map_id INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@item_id INT,
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	
			taxonomy_folder_item_map
			(taxonomy_folder_id,
			 item_id,
			 created_by,
			 created_date)
		VALUES 
			(@taxonomy_folder_id,
			 @item_id,
			 @created_by,
			 GETDATE())
		SELECT @out_taxonomy_folder_item_map_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
