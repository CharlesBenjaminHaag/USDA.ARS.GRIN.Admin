
create view taxgeo_taxonomy_geography_map_view as
select 
taxonomy_geography_map_id,
taxonomy_species_id,
geography_id,
geography_status_code,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_geography_map
