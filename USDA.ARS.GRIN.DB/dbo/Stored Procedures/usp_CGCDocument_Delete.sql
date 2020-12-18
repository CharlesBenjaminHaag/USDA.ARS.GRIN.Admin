-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_CGCDocument_Delete]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT
AS
BEGIN
	BEGIN TRY
		DELETE FROM
			crop_germplasm_committee_document
		WHERE
			@crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
