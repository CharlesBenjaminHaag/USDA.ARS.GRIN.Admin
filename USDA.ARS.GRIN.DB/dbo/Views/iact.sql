
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[iact] as
SELECT 
       inventory_action_id as iactno
      ,a.inventory_id as ivid
      ,[inventory_number_part1] as ivp
      ,[inventory_number_part2] as ivno
      ,[inventory_number_part3] as ivs
      ,[form_type_code] as ivt
	  ,action_name_code as event
	  ,started_date
	  ,completed_date
	  ,quantity as quant
	  ,quantity_unit_code as units
	  ,form_code as iform
	  ,method_id as ename
    ,a.note,
a.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by) as created_by,
a.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by,
a.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by,
a.owned_by as owned_by_id,
      (select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
  FROM [gringlobal].[dbo].[inventory_action] a, inventory i where a.inventory_id=i.inventory_id



