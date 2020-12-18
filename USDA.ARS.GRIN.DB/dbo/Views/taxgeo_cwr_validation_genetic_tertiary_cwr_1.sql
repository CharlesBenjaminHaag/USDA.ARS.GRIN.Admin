CREATE VIEW [taxgeo_cwr_validation_genetic_tertiary_cwr]
AS
SELECT CWR.*, CM.is_tertiary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Tertiary'
AND
	CM.is_tertiary_genepool = 'Y'
