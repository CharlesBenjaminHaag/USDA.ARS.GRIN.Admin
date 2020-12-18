-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_WebUser_Insert]
	 @out_error_number INT = 0 OUTPUT,
	 @out_web_user_id INT = 0 OUTPUT,
	 @user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		INSERT INTO web_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 web_cooperator_id,
		 sys_lang_id,
		 created_date
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @web_cooperator_id,
		 1,
		 GETDATE()
		)
		SET @out_web_user_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
