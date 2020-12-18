CREATE VIEW [taxgeo_cwr_validation_crop_cm] AS
SELECT *
FROM 
	taxonomy_crop_map CM
WHERE 
	common_crop_name IS NOT NULL
AND
	LEN(LTRIM(RTRIM(common_crop_name))) > 0
