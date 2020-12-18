CREATE VIEW [taxgeo_cwr_validation_crop_cwr]
AS
SELECT * 
FROM 
	taxonomy_cwr
WHERE
	is_crop = 'Y'
