-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_trait
		WHERE
			taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
