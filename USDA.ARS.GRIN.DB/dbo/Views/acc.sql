

create view [dbo].[acc] as/****** Script for SelectTopNRows command from SSMS  ******/

SELECT  [accession_id] as acid
      ,accession_id
      ,[accession_number_part1] as acp
      ,[accession_number_part2] as acno
      ,[accession_number_part3] as acs
      ,[is_core] as core
      ,[is_backed_up] as is_backed_up
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code] 
      ,[life_form_code] as lifeform
      ,[improvement_status_code] as acimpt
      ,[reproductive_uniformity_code] as uniform
      ,[initial_received_form_code] acform
      ,[initial_received_date] as received
      ,[initial_received_date_code] datefmt
      ,[taxonomy_species_id] as taxno
      ,[note]
      ,[created_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by)  as created_by
      ,[modified_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by
      ,[owned_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
      ,is_web_visible
      ,(select name from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as taxon
      ,(select genus_name from taxonomy_genus where taxonomy_genus_id = (select taxonomy_genus_id from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id)) as genus
      ,(select case when (is_specific_hybrid = 'Y') then 'x ' +  species_name else species_name end
         from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as species
      ,(select case 
         when  (forma_name is not null)  then 'f. ' + forma_name 
         else
           case 
	         when (variety_name is not null) then 'var. ' + variety_name
	         else
	           case 
		         when (subspecies_name is not null) then 
				    case
					   when is_subspecific_hybrid = 'Y' then 'nothosubsp. ' + subspecies_name
					   else 'subsp. ' + subspecies_name
				    end
	           end
	       end
        end from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtax
		-- dbo.get_avstat(accession_id) as availability
		FROM [gringlobal].[dbo].[accession] a





