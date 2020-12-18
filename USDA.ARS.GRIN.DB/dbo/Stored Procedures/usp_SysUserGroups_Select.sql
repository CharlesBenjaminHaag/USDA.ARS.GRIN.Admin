-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_SysUserGroups_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		sys_group_user_map_id,
		sg.sys_group_id,
		sg.group_tag
	FROM 
		sys_group_user_map sgum
	JOIN
		sys_group sg
	ON
		sgum.sys_group_id = sg.sys_group_id
	WHERE
		sys_user_id = @sys_user_id
	ORDER BY 
		group_tag
END
