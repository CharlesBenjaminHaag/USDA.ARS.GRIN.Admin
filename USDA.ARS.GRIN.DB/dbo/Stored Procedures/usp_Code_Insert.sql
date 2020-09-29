-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Code_Insert]
	@group_name NVARCHAR(100),
	@code_value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY
	INSERT INTO
		code_value
		(
			group_name,
			value,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@group_name,
			@code_value,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @new_code_value_id = CAST(SCOPE_IDENTITY() AS INT)

		INSERT INTO 
			code_value_lang
			(
				code_value_id,
				sys_lang_id,
				title,
				description,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
			VALUES
			(
				@new_code_value_id,
				@CONST_SYS_LANG_ID,
				@title,
				@description,
				GETDATE(),
				@CONST_COOPERATOR_ID,
				GETDATE(),
				@CONST_COOPERATOR_ID
			)
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
			END CATCH
END
