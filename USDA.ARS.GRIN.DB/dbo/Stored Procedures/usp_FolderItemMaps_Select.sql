-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FolderItemMaps_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_item_id
      ,taxonomy_folder_id
      ,item_id
      ,created_by
      ,created_date
	FROM 
		taxonomy_folder_item_map
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
