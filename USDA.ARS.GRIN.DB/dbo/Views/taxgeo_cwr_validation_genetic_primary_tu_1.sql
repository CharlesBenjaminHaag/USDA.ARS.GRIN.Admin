CREATE VIEW [taxgeo_cwr_validation_genetic_primary_tu]
AS
SELECT 'PRIMARY' AS USAGE, * 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%PRIMARY%'
AND
	economic_usage_code = 'GENETIC'
