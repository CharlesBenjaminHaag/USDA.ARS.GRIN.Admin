-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_AccessionInvAttachValidationCounts_Select 
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
	'V' AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.image_thumbnail_url_is_valid = 1 
AND
	aiav.image_url_is_valid = 1
UNION
SELECT 
	'E'  AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.image_thumbnail_url_is_valid = 0 
OR
	aiav.image_url_is_valid = 0
	UNION
SELECT 
	'N'  AS category,
	COUNT(aia.accession_inv_attach_id) AS record_count      
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id
WHERE
	aiav.created_date IS NULL
END
