-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActiveUsers_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	sys_user_id,
	user_name,
	c.first_name,
	c.last_name,
	c.email,
	c.primary_phone,
	is_enabled,
	c.created_date,
	c.modified_date
FROM
	sys_user su
JOIN
	cooperator c
ON
	su.cooperator_id = c.cooperator_id
WHERE 
	c.status_code = 'ACTIVE'
AND
	su.is_enabled = 'Y'
ORDER BY
	first_name,
	last_name
END
