
create view  [dbo].[taxgeo_cooperator2_view] as 
SELECT cooperator_id, current_cooperator_id
	, 1 AS site_id
	, last_name, title, first_name, job, organization, organization_abbrev
	, address_line1, address_line2, address_line3, city, postal_index, geography_id
	, null as secondary_organization, null as secondary_organization_abbrev
	, null as secondary_address_line1, null as secondary_address_line2, null as secondary_address_line3
	, null as secondary_city, null as secondary_postal_index, null as secondary_geography_id
	, primary_phone
	, null as secondary_phone, null as fax
	, email
	, null as secondary_email
	, status_code, category_code, organization_region_code, discipline_code,note
	, sys_lang_id
	, null as web_cooperator_id
	, created_date, 1 as created_by
	, modified_date, null as modified_by
	, owned_date, 1 as owned_by  
FROM cooperator WHERE cooperator_id IN (1,4,48,829)
