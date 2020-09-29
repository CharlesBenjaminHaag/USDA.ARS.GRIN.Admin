-- drop view taxgeo_literature_view

create view [dbo].[taxgeo_literature_view] as select
literature_id,
abbreviation,
standard_abbreviation,
reference_title,
editor_author_name,
literature_type_code,
publication_year,
publisher_name,
publisher_location,
url,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by 
from literature where literature_id in (select distinct literature_id from taxgeo_citation_view)
