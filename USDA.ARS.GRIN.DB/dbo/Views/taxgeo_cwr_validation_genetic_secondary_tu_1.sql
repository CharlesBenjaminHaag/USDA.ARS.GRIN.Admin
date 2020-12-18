CREATE VIEW [taxgeo_cwr_validation_genetic_secondary_tu]
AS
SELECT 'SECONDARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%SECONDARY%'
AND
	economic_usage_code = 'GENETIC'
