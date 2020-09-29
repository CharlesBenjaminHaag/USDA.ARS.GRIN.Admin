-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CropGermplasmCommitteeDocument_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_crop_germplasm_committee_document_id INT = 0 OUTPUT,
	@crop_germplasm_committee_id INT,
	@title NVARCHAR(250),
	@url NVARCHAR(120)
AS
BEGIN
	BEGIN TRY
		INSERT INTO
			crop_germplasm_committee_document
			(crop_germplasm_committee_id,
			 title,
			 url,
			 created_by,
			 created_date)
		VALUES
			(
			@crop_germplasm_committee_id,
			@title,
			@url,
			48,
			GETDATE()
			)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH	
END
