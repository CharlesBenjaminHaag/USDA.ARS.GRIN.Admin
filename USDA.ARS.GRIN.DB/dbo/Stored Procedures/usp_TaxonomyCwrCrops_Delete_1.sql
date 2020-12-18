-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCwrCrops_Delete] 
	@taxonomy_cwr_crop_id_list NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id IN (@taxonomy_cwr_crop_id_list)
END
