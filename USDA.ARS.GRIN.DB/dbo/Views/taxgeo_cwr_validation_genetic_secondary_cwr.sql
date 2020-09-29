CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_secondary_cwr]
AS
SELECT 
	CWR.*, 
	CM.is_secondary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Secondary'
AND
	CM.is_secondary_genepool = 'Y'
