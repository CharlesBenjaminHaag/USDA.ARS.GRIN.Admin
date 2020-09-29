-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttach_Select]
	@accession_inv_attach_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		aia.accession_inv_attach_id,        
		virtual_path,        
		thumbnail_virtual_path,        
		title,
		aia.owned_by,
		aia.created_date,
		aiav.image_url_is_valid,
	    aiav.image_thumbnail_url_is_valid,
		aiav.created_date AS validated_date
	FROM 
		accession_inv_attach aia
	LEFT OUTER JOIN
		accession_inv_attach_validation aiav
	ON
		aia.accession_inv_attach_id = aiav.accession_inv_attach_id
	WHERE
		aia.accession_inv_attach_id = @accession_inv_attach_id
END
