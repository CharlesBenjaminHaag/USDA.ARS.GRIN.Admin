-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id_list INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id IN (@taxonomy_cwr_map_id_list)	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
