-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFolderCropForCWRItems_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		FROM taxonomy_cwr_map 
		WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, tcc.modified_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name 
	FROM 
		taxonomy_cwr_crop tcc
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
