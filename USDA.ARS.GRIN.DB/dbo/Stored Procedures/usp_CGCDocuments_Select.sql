-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [usp_CGCDocuments_Select]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		cgc.crop_germplasm_committee_name,
		crop_germplasm_committee_document_id,
		cgcd.crop_germplasm_committee_id,
		title,
		url,
		cgcd.created_date,
		cgcd.created_by,
		cgcd.modified_date,
		cgcd.modified_by
	FROM 
		crop_germplasm_committee_document cgcd
	JOIN
		crop_germplasm_committee cgc
	ON
		cgcd.crop_germplasm_committee_id = cgc.crop_germplasm_committee_id
	ORDER BY
		created_date DESC
END
