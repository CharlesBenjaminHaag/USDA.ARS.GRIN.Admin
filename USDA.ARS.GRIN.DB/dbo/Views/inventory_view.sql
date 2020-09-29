
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[inventory_view] as
SELECT 
        a.accession_number_part1  as accession_prefix 
	   ,a.accession_number_part2  as accession_number
	   ,a.accession_number_part3  as accession_suffix
      ,[inventory_id] 
      ,[inventory_number_part1] as inventory_prefix
      ,[inventory_number_part2] as inventory_number
      ,[inventory_number_part3] as inventory_suffix
      ,[form_type_code]
      ,i.inventory_number_part1 + isnull(rtrim(' ' + CONVERT(NVARCHAR, i.inventory_number_part2)),'') + isnull(RTRIM(' ' + i.inventory_number_part3),'') + ' ' + i.form_type_code AS inventory
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=i.owned_by)) as site_short_name
      ,(select maintenance_name from inventory_maint_policy where i.inventory_maint_policy_id=inventory_maint_policy_id) as maintenance_name
      ,[is_distributable]
      ,[storage_location_part1]
      ,[storage_location_part2]
      ,[storage_location_part3]
      ,[storage_location_part4]
      ,[latitude] 
      ,[longitude]
      ,[is_available]
      ,[web_availability_note] 
      ,[availability_status_code]
      ,[availability_status_note]
      ,[availability_start_date] 
      ,[availability_end_date]
	  ,[quantity_on_hand]
      ,[quantity_on_hand_unit_code]
      ,[is_auto_deducted]
      ,[distribution_default_form_code]
      ,[distribution_default_quantity]
      ,[distribution_unit_code]
      ,[distribution_critical_quantity]
      ,[regeneration_critical_quantity]
      ,[pathogen_status_code]
      ,a.accession_id
	  ,[parent_inventory_id] 
      ,[backup_inventory_id]
      ,[rootstock]
      ,[hundred_seed_weight]
      ,[pollination_method_code]
      ,[pollination_vector_code]
      ,[preservation_method_id]
      ,[regeneration_method_id]
      ,[plant_sex_code]
      ,[propagation_date]
      ,[propagation_date_code]
      ,i.note,
i.created_date,
i.created_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.created_by) as created_by_name,
i.modified_date,
i.modified_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.modified_by) as modified_by_name,
i.owned_date,
i.owned_by as owned_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.owned_by) as owned_by_name
  FROM [gringlobal].[dbo].[inventory] i
  join accession a on a.accession_id=i.accession_id


