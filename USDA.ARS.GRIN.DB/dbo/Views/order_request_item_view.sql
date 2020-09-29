

-- drop view order_request_item_view

create view [dbo].[order_request_item_view] as select 
order_request_item_id ,
order_request_id ,
web_order_request_item_id,
(select order_type_code from order_request ord where oi.order_request_id=ord.order_request_id) as order_type,
sequence_number ,
name,
quantity_shipped ,
quantity_shipped_unit_code ,
distribution_form_code ,
oi.status_code ,
status_date ,
oi.inventory_id,
inventory_number_part1 as inventory_prefix,
inventory_number_part2 as inventory_number,
inventory_number_part3 as inventory_suffix,
form_type_code ,
external_taxonomy as taxon,
source_cooperator_id ,
a.accession_id as acid,
accession_number_part1 as acccession_prefix,
accession_number_part2 as accession_number,
accession_number_part3 as accession_suffix,
oi.note,
web_user_note,
oi.created_date,
oi.created_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.created_by) as created_by_name,
oi.modified_date,
oi.modified_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.modified_by) as modified_by_name,
oi.owned_date,
oi.owned_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.owned_by) as owned_by_name,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=oi.owned_by)) as site
from order_request_item oi
join inventory i on oi.inventory_id=i.inventory_id
join  accession a on i.accession_id=a.accession_id




