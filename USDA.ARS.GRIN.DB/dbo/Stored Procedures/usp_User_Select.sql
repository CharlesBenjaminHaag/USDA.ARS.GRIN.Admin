-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_User_Select]
	@user_name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		su.sys_user_id,
		su.user_name,
		su.password,
		co.first_name,
		co.last_name,
		co.email,
		co.organization,
		co.organization_abbrev,
		su.is_enabled,
		su.cooperator_id,
		su.created_date,
		su.created_by,
		COALESCE(su.modified_date,su.created_date) AS modified_date,
		su.modified_by,
		su.owned_date,
		su.owned_by,
		co.sys_lang_id,
		co.site_id,
		s.site_short_name as site,
		sl.script_direction,
		'' as groups,
		'' as login_token,
		'' as warning
	FROM sys_user su
		LEFT JOIN 
			cooperator co 
		ON 
			su.cooperator_id = co.cooperator_id
		LEFT JOIN 
			site s 
		ON 
			co.site_id = s.site_id
		LEFT JOIN 
			sys_lang sl 
		ON 
			sl.sys_lang_id = co.sys_lang_id
	WHERE 
		su.user_name LIKE '%' + @user_name + '%' 
	AND 
		su.is_enabled = 'Y'
END
