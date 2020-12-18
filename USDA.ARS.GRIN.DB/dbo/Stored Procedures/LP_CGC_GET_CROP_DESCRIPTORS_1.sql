-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_CGC_GET_CROP_DESCRIPTORS] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		CD.crop_germplasm_committee_id,
		C.crop_id,
		C.name
	FROM
		dbo.crop_germplasm_committee_crop_descriptor CD
	JOIN
		dbo.crop C
	ON
		CD.crop_id = C.crop_id
	WHERE
		crop_germplasm_committee_id = @crop_germplasm_committee_id
END
