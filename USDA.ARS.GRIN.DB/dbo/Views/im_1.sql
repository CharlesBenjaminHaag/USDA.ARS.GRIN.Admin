

create view [im] as select
inventory_maint_policy_id as imno,
maintenance_name as imname,
form_type_code as ivt,
quantity_on_hand_unit_code as munits,
web_availability_note,
is_auto_deducted as debit,
distribution_default_form_code as dform,
distribution_default_quantity as dquant,
distribution_unit_code as dunits,
distribution_critical_quantity as dcritical,
regeneration_critical_quantity as rcritical,
regeneration_method_code as regen,
curator_cooperator_id as cno,
(select coop from coop where cno=curator_cooperator_id) as curator,
note as cmt, created_date,
created_by, modified_date, modified_by, owned_date, owned_by
,(select coop from coop where cno=im.owned_by) as owner
 ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=im.owned_by)) as site 
from inventory_maint_policy im;
