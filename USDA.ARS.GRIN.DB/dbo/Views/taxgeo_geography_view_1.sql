

-- drop view taxgeo_geography_view
create view [taxgeo_geography_view] as 
select 
geography_id,
current_geography_id,
country_code,
adm1,
adm1_type_code,
adm1_abbrev,
adm2,
adm2_type_code,
adm2_abbrev,
adm3,
adm3_type_code,
adm3_abbrev,
adm4,
adm4_type_code,
adm4_abbrev,
changed_date,
is_valid,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
 from geography where geography_id in (select geography_id from taxonomy_geography_map union 
select geography_id from geography_region_map) or is_valid = 'Y'

