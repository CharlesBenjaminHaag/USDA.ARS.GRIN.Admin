
create view [dbo].[taxgeo_site_qs_view] as select
 1 as site_id,
'SYS' as site_short_name,
'SYSTEM' as site_long_name,
null as provider_identifier,
null as organization_abbrev,
'N' is_internal,
'N' as is_distribution_site,
null as type_code,
null as fao_institute_number,
null as note,
getutcdate() as created_date,
1 as created_by,
null as modified_date,
null as modified_by,
getutcdate() as owned_date,
1 as owned_by

