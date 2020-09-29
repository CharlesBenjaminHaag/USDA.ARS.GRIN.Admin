
create view [dbo].[taxgeo_taxonomy_use_view] as select 
taxonomy_use_id,
taxonomy_species_id,
economic_usage_code,
usage_type,
plant_part_code,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_use

