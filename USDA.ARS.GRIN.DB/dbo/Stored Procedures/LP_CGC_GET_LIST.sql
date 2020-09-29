-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_CGC_GET_LIST] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		crop_germplasm_committee_id,
		crop_germplasm_committee_name,
		dbo.crop_germplasm_committee.roster_url
	FROM
		crop_germplasm_committee
	ORDER BY
		crop_germplasm_committee_name ASC
END
