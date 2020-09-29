CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_primary_cwr]
AS
SELECT CWR.*, CM.is_primary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Primary'
AND
	CM.is_primary_genepool = 'Y'
