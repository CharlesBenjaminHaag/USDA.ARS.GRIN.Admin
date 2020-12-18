-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_SysUser_Select] 
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		user_name,
		password,
		is_enabled,
		cooperator_id,
		created_date,
		created_by,
		owned_date,
		owned_by
	FROM
		sys_user
	WHERE
		sys_user_id = @sys_user_id
END
