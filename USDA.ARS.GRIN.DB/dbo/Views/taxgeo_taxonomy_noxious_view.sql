
create view [dbo].[taxgeo_taxonomy_noxious_view] as select 
taxonomy_noxious_id,
taxonomy_species_id,
geography_id,
noxious_type_code,
noxious_level_code,
url,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_noxious

