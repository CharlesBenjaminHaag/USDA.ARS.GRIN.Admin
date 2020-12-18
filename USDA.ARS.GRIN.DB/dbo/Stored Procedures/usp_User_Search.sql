-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_User_Search]
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
		co.address_line1,
		co.address_line2,
		co.address_line3,
		co.city,
		co.geography_id,
		co.primary_phone,
		co.title,
		co.job,
		g.adm1 AS state,
		co.postal_index,
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
		s.site_short_name,
		s.site_long_name
	FROM 
		sys_user su
	LEFT JOIN 
		cooperator co 
	ON 
		su.cooperator_id = co.cooperator_id
	LEFT JOIN 
		site s 
	ON 
		co.site_id = s.site_id
	LEFT JOIN
		geography g
    ON
		co.geography_id = g.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1

	WHERE 
		su.user_name LIKE '%' + @user_name + '%' 
	AND 
		su.is_enabled = 'Y'
END
