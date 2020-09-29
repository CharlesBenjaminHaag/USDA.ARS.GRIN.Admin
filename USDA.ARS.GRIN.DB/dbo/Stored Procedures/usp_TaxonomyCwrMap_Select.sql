
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT species_name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
