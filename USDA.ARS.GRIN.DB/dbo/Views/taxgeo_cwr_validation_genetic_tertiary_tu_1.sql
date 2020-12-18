CREATE VIEW [taxgeo_cwr_validation_genetic_tertiary_tu]
AS
SELECT 'TERTIARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%TERTIARY%'
AND
	economic_usage_code = 'GENETIC'
