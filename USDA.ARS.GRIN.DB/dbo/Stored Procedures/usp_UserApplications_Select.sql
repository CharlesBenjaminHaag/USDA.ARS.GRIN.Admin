-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_UserApplications_Select]
	@sys_user_id INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		sys_application_id,
		sys_group_id,
		group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name,
		(SELECT 
			COUNT(*) 
		 FROM 
			sys_group_user_map 
		 WHERE 
			sys_group_id = vsa.sys_group_id 
		 AND 
			sys_user_id = @sys_user_id) AS is_authorized
	FROM
		vw_sys_application vsa
	ORDER BY
		vsa.title
END
