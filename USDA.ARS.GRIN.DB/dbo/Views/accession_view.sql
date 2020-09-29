



create view [dbo].[accession_view] as/****** Script for SelectTopNRows command from SSMS  ******/

SELECT  -- include is_avail and origin
      accession_id
      ,[accession_number_part1] as accession_prefix
      ,[accession_number_part2] as accession_number
      ,[accession_number_part3] as accession_suffix
	  ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site_short_name
      ,dbo.get_avstat(accession_id) as is_available
	  ,(select top 1 country from src where src.acid=a.accession_id and is_origin = 'Y') as origin
	  ,(select top 1 srctype from src where src.acid=a.accession_id and is_origin = 'Y') as source_type_code
	  ,(select topname from topname t where a.accession_id=t.accession_id) as topname
      ,is_web_visible
      ,[is_core] 
      ,[is_backed_up] 
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code] 
      ,[life_form_code] 
      ,[improvement_status_code] 
      ,[reproductive_uniformity_code] 
      ,[initial_received_form_code] 
      ,[initial_received_date] 
      ,[initial_received_date_code] 
      ,[taxonomy_species_id] 
      ,[note]
      ,[created_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by)  as created_by
      ,[modified_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by
      ,[owned_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by
      ,(select name from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as name
      ,(select genus_name from taxonomy_genus where taxonomy_genus_id = (select taxonomy_genus_id from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id)) as genus_name
      ,(select case when (is_specific_hybrid = 'Y') then 'x ' +  species_name else species_name end
         from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as species_name
		,(select case 
         when  (forma_name is not null)  then 'f. ' + forma_name 
         else
           case 
	         when (variety_name is not null) then 'var. ' + variety_name 
	         else
	           case 
		         when (subspecies_name is not null) then 'subsp. ' + subspecies_name 
	           end
	       end
        end 
		from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtaxon_name
      ,(select case 
         when  (forma_name is not null)  then  forma_authority
         else
           case 
	         when (variety_name is not null) then variety_authority
	         else
	           case 
		         when (subspecies_name is not null) then  subspecies_authority
	           end
	       end
        end 
		from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtaxon_authority
		FROM [gringlobal].[dbo].[accession] a


