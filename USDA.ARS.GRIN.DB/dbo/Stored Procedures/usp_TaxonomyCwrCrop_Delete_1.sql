-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCwrCrop_Delete] 
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
END
