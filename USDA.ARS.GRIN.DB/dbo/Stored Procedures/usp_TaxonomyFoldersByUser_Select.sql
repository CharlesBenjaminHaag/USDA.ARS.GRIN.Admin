-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFoldersByUser_Select] 
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		data_source,
		note,
		is_shared,
		created_date,
		modified_date,
		(SELECT 
			COUNT(*) 
		FROM 
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_id = tf.taxonomy_folder_id) AS item_count
	FROM 
		taxonomy_folder tf
	WHERE
		created_by = @cooperator_id
END
