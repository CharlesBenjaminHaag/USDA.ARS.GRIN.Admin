-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_WebUser_Insert]
	(@user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @web_cooperator_id int NULL)
AS
BEGIN
	SET NOCOUNT ON;

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
END
