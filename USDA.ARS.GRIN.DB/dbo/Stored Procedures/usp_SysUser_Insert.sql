-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SysUser_Insert]
	(@user_name nvarchar(50),
	 @password nvarchar(2000),
	 @is_enabled nvarchar(1),
	 @cooperator_id int NULL
	 )
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO sys_user 
	(
	 user_name,
	 password,
	 is_enabled,
	 cooperator_id,
	 created_date,
	 created_by,
	 owned_date,
	 owned_by
	)
	VALUES
	(
	 @user_name,
	 @password,
	 'Y',
	 @cooperator_id,
	 GETDATE(),
	 48,
	 GETDATE(),
	 48
	)
END
