-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_CGCCommittees_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [crop_germplasm_committee_id]
		,[crop_germplasm_committee_name]
		,[roster_url]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
  FROM 
	crop_germplasm_committee
END
