CREATE VIEW [taxgeo_cwr_validation_genetic_quaternary_tu]
AS
SELECT 'QUATERNARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%QUATERNARY%'
AND
	economic_usage_code = 'GENETIC'
