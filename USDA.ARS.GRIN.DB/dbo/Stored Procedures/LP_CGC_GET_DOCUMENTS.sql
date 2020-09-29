-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[LP_CGC_GET_DOCUMENTS]

	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		crop_germplasm_committee_document_id,
		crop_germplasm_committee_id,
		url,
		created_date,
		created_by,
		modified_date,
		modified_by,
		title
	FROM 
		crop_germplasm_committee_document
	WHERE 
		crop_germplasm_committee_id = @crop_germplasm_committee_id
	ORDER BY
		title DESC
END
