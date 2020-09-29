-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttachValidation_Insert]
	@accession_inv_attach_id int,
	@image_thumbnail_url_is_valid nvarchar(1),
	@image_url_is_valid nvarchar(1)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO accession_inv_attach_validation
	(
		accession_inv_attach_id,
		image_url_is_valid,
	    image_thumbnail_url_is_valid,
		created_date,
		created_by
	)
	VALUES
	(
		@accession_inv_attach_id,
		@image_url_is_valid,
		@image_thumbnail_url_is_valid,
		GETDATE(),
		48
	)
END
