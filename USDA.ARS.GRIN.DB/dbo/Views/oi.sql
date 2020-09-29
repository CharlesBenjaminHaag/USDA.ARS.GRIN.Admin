



create view [dbo].[oi] as select 
order_request_item_id as itno,
order_request_id as orno,
web_order_request_item_id,
(select order_type_code from order_request ord where oi.order_request_id=ord.order_request_id) as ortype,
sequence_number as oino,
name as item,
quantity_shipped as quant,
quantity_shipped_unit_code as units,
distribution_form_code as dform,
oi.status_code as status,
status_date as acted,
oi.inventory_id as ivid,
inventory_number_part1 as ivp,
inventory_number_part2 as ivno,
inventory_number_part3 as ivs,
form_type_code as ivt,
external_taxonomy as taxon,
source_cooperator_id as cno,
a.accession_id as acid,
accession_number_part1 as acp,
accession_number_part2 as acno,
accession_number_part3 as acs,
oi.note as cmt,
web_user_note,
oi.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.created_by) as created_by,
oi.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.modified_by) as modified_by,
oi.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.owned_by) as owned_by,
oi.owned_by as owned_by_id,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=oi.owned_by)) as site
from order_request_item oi, inventory i, accession a
where oi.inventory_id=i.inventory_id and i.accession_id=a.accession_id


