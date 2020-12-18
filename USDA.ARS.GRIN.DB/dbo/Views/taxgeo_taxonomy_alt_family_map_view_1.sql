

create view [taxgeo_taxonomy_alt_family_map_view] as select 
taxonomy_alt_family_map_id,
taxonomy_genus_id,
taxonomy_family_id,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_alt_family_map




