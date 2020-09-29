
create view [dbo].[taxgeo_taxonomy_common_name_view] as select
taxonomy_common_name_id,
taxonomy_genus_id,
taxonomy_species_id,
language_description,
name,
simplified_name,
alternate_transcription,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_common_name

