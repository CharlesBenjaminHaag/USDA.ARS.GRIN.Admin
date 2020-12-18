-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_WebOrderRequest_Update] 
	@out_error_number INT = 0 OUTPUT,
	@web_order_request_id INT,
	@status_code NVARCHAR(20),
	@note NVARCHAR(2000)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE
			web_order_request 
		SET
			status_code = @status_code,
			note = @note,
			modified_by = 48,
			modified_date = GETDATE()
		WHERE
			web_order_request_id = @web_order_request_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
