



create view [ord] as select
order_request_id as orno,
original_order_request_id as origno,
web_order_request_id,
local_number as localno,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=o.owned_by)) as site,
order_type_code as ortype,
(select count(*) from order_request_item oi where oi.order_request_id=o.order_request_id) as items,
ordered_date as ordered,
intended_use_code,
intended_use_note,
completed_date,
requestor_cooperator_id as orderer,
ship_to_cooperator_id as shipto,
final_recipient_cooperator_id as final,
(select fname + ' ' + lname + ', ' + org + ' - ' + isnull(city,' ') from coop where cno=final_recipient_cooperator_id) as recipient,
(select country from coop where cno=final_recipient_cooperator_id) as country,
order_obtained_via as reqref,
feedback_id,
special_instruction,
note as cmt,
created_date,
created_by,
modified_date,
modified_by,
owned_date,
owned_by
from order_request o;




