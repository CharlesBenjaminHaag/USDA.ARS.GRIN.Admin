

-- drop view taxgeo_species_view

create view [dbo].[taxgeo_species_view] as 
SELECT  [taxonomy_species_id]
      ,[current_taxonomy_species_id]
      ,[nomen_number]
      ,[is_specific_hybrid]
      ,[species_name]
      ,[species_authority]
      ,[is_subspecific_hybrid]
      ,[subspecies_name]
      ,[subspecies_authority]
      ,[is_varietal_hybrid]
      ,[variety_name]
      ,[variety_authority]
      ,[is_subvarietal_hybrid]
      ,[subvariety_name]
      ,[subvariety_authority]
      ,[is_forma_hybrid]
      ,[forma_rank_type]
      ,[forma_name]
      ,[forma_authority]
      ,[taxonomy_genus_id]
      ,null as priority1_site_id
      ,null as priority2_site_id
      ,null as curator1_cooperator_id
      ,null as curator2_cooperator_id
      ,[restriction_code]
      ,[life_form_code]
      ,[common_fertilization_code]
      ,[is_name_pending]
      ,[synonym_code]
      ,case when verifier_cooperator_id is not null then 4 else null end as verifier_cooperator_id
      ,[name_verified_date]
      ,[name]
      ,[name_authority]
      ,[protologue]
      ,[protologue_virtual_path]
      ,[note]
      ,[site_note]
      ,[alternate_name]
      ,[created_date]
      ,4 as created_by
      ,[modified_date]
      ,case when modified_by is not null then 4 else null end as modified_by
	   ,[owned_date]
      ,4 as owned_by
  FROM [gringlobal].[dbo].[taxonomy_species]


