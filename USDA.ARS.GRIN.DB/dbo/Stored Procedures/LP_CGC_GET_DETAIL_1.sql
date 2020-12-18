-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_CGC_GET_DETAIL] 
	@crop_germplasm_committee_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[crop_germplasm_committee_id], 
		[crop_germplasm_committee_name],
		[roster_url],
		[created_date],
		[created_by],
		[modified_date],
		[modified_by]
	FROM
		crop_germplasm_committee CGC
	WHERE
		CGC.crop_germplasm_committee_id = @crop_germplasm_committee_id
END
