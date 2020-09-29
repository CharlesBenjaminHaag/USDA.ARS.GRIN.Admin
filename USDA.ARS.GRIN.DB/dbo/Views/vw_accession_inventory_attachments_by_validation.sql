CREATE VIEW [dbo].[vw_accession_inventory_attachments_by_validation]
AS
(
SELECT 
		aia.accession_inv_attach_id,        
		REPLACE(virtual_path,'https:/npgsweb.ars-grin.gov/gringlobal/uploads/images/npgs','') AS virtual_path,
		REPLACE(thumbnail_virtual_path,'https:/npgsweb.ars-grin.gov/gringlobal/uploads/images/npgs','') AS thumbnail_virtual_path,
		title,
		aia.owned_by,
		aia.created_date,
		aiav.image_url_is_valid,
	    aiav.image_thumbnail_url_is_valid,
		aiav.created_date AS validated_date,
		CASE
			WHEN aiav.created_date IS NULL THEN 'NV'
			WHEN (aiav.image_url_is_valid = 1) AND (aiav.image_thumbnail_url_is_valid = 1) THEN 'VL'
			WHEN (aiav.image_url_is_valid = 0) OR (aiav.image_thumbnail_url_is_valid = 0) THEN 'ER' 
		END AS status_code,
		
		CASE
			WHEN aiav.created_date IS NULL THEN 'Not Validated'
			WHEN (aiav.image_url_is_valid = 1) AND (aiav.image_thumbnail_url_is_valid = 1) THEN 'Validated' 
			WHEN (aiav.image_url_is_valid = 0) OR (aiav.image_thumbnail_url_is_valid = 0) THEN 'Error' 
		END AS status_code_desc
	FROM 
		accession_inv_attach aia
	LEFT OUTER JOIN
		accession_inv_attach_validation aiav
	ON
		aia.accession_inv_attach_id = aiav.accession_inv_attach_id
)
