
create view [dbo].[taxgeo_taxonomy_author_view] as select 
taxonomy_author_id,
short_name,
full_name,
short_name_expanded_diacritic,
full_name_expanded_diacritic,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_author


