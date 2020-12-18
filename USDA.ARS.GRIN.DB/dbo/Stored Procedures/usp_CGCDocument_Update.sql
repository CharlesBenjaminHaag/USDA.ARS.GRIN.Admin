-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_CGCDocument_Update]
	@out_error_number INT = 0 OUTPUT,
	@crop_germplasm_committee_document_id INT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		UPDATE
			crop_germplasm_committee_document
		SET
			crop_germplasm_committee_id = @crop_germplasm_committee_id, 
			title = @title,
			url = @url,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE
			crop_germplasm_committee_document_id = @crop_germplasm_committee_document_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
