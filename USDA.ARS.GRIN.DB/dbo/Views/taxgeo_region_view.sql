
create view [dbo].[taxgeo_region_view] as select
region_id,
continent,
subcontinent,
sequence_number,
continent_abbreviation,
subcontinent_abbreviation,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from region
