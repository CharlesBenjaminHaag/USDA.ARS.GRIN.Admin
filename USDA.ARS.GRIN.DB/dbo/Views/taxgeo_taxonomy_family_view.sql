
create view [dbo].[taxgeo_taxonomy_family_view] as select
taxonomy_family_id,
current_taxonomy_family_id,
type_taxonomy_genus_id,
suprafamily_rank_code,
suprafamily_rank_name,
family_name,
family_authority,
alternate_name,
subfamily_name,
tribe_name,
subtribe_name,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_family

