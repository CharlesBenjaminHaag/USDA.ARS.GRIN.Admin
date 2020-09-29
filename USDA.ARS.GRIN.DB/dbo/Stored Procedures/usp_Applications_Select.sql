-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Applications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.group_id = sg.sys_group_id
	JOIN	
		sys_group_user_map sgum
	ON
		sg.sys_group_id = sgum.sys_group_id
	WHERE
		sgum.sys_user_id = @sys_user_id
END
