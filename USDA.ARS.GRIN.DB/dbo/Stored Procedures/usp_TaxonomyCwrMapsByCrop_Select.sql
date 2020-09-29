
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
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
		modified_date,
		modified_by
	FROM
		taxonomy_cwr_map
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	ORDER BY
		crop_common_name ASC
END
