
CREATE VIEW taxgeo_cwr_validation_genetic_progenitor_tu
AS
SELECT *
FROM 
	taxonomy_use
WHERE
	usage_type LIKE '%progenitor%'
AND
	economic_usage_code = 'GENETIC'

