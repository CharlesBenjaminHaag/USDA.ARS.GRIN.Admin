
-- drop view taxgeo_taxonomy_genus_view

create view [taxgeo_taxonomy_genus_view] as select 
taxonomy_genus_id,
current_taxonomy_genus_id,
taxonomy_family_id,
qualifying_code,
hybrid_code,
genus_name,
genus_authority,
subgenus_name,
section_name,
subsection_name,
series_name,
subseries_name,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_genus


