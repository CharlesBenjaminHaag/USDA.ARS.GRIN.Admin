
create view [dbo].[taxgeo_geography_region_map_view] as 
select
geography_region_map_id,
geography_id,
region_id,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from geography_region_map
