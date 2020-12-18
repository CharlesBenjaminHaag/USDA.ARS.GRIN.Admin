CREATE VIEW [taxgeo_cwr_validation_genetic_progenitor_cwr]
AS
SELECT 
	taxonomy_cwr_id,
	taxonomy_species_id,
	crop_name,
	is_crop,
	genepool_code,
	modified_date
FROM 
	taxonomy_cwr
WHERE
	genepool_code = 'Progenitor'

