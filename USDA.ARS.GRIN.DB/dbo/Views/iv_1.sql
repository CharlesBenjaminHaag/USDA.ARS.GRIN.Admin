
--drop view iv
/****** Script for SelectTopNRows command from SSMS  ******/
create view [iv] as
SELECT 
       (select accession_number_part1 from accession a where a.accession_id=i.accession_id) as acp, 
	   (select accession_number_part2 from accession a where a.accession_id=i.accession_id) as acno,
	   (select accession_number_part3 from accession a where a.accession_id=i.accession_id) as acs
      ,[inventory_id] as ivid
      ,[inventory_number_part1] as ivp
      ,[inventory_number_part2] as ivno
      ,[inventory_number_part3] as ivs
      ,[form_type_code] as ivt
      ,i.inventory_number_part1 + isnull(rtrim(' ' + CONVERT(NVARCHAR, i.inventory_number_part2)),'') + isnull(RTRIM(' ' + i.inventory_number_part3),'') + ' ' + i.form_type_code AS inventory
      ,(select maintenance_name from inventory_maint_policy where i.inventory_maint_policy_id=inventory_maint_policy_id) as imname
      ,[is_distributable] as distribute
      ,[storage_location_part1] as loc1
      ,[storage_location_part2] as loc2
      ,[storage_location_part3] as loc3
      ,[storage_location_part4] as loc4
      ,[latitude] 
      ,[longitude]
      ,[is_available] as avail
      ,[web_availability_note] 
      ,[availability_status_code] as status
      ,[availability_status_note] as status_note
      ,[availability_start_date] 
      ,[availability_end_date]
	  ,[quantity_on_hand] as onhand
      ,[quantity_on_hand] as quant
      ,[quantity_on_hand_unit_code] as unit
      ,[is_auto_deducted] as debit
      ,[distribution_default_form_code] as dform
      ,[distribution_default_quantity] as dquant
      ,[distribution_unit_code] as dunit
      ,[distribution_critical_quantity] as dcrit
      ,[regeneration_critical_quantity] as rquant
      ,[pathogen_status_code] as pstat
      ,[accession_id] as acid
      ,[parent_inventory_id] 
      ,[backup_inventory_id]
      ,[rootstock]
      ,[hundred_seed_weight] as ivhswt
      ,[pollination_method_code]
      ,[pollination_vector_code]
      ,[preservation_method_id]
      ,[regeneration_method_id]
      ,[plant_sex_code]
      ,[propagation_date]
      ,[propagation_date_code]
      ,[note],
i.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.created_by) as created_by,
i.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.modified_by) as modified_by,
i.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.owned_by) as owned_by,
i.owned_by as owned_by_id,
      (select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=i.owned_by)) as site
  FROM [$(DatabaseName)].[inventory] i


