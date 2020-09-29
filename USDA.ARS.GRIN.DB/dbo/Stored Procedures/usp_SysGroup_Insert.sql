-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysGroup_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_group_id INT = 0 OUTPUT,
	@group_tag NVARCHAR(20)
AS
BEGIN

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_IS_ENABLED NVARCHAR(1) = 'Y'

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO 
			sys_group
			(
				group_tag,
				is_enabled,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
		VALUES
		(
			@group_tag,
			@CONST_IS_ENABLED,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @out_group_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
