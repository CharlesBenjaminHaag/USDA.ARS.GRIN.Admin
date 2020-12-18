
-- drop view order_request_view

CREATE view [order_request_view] as select
order_request_id,
original_order_request_id,
c.site_short_name,
web_order_request_id,
local_number,
order_type_code,
ordered_date,
intended_use_code,
intended_use_note,
completed_date,
requestor_cooperator_id,
ship_to_cooperator_id,
final_recipient_cooperator_id,
c2.name,
c2.city,
c2.state,
c2.country,
c2.category_code
,order_obtained_via
,feedback_id
,special_instruction
,note
,o.created_date
,o.created_by
,o.modified_date
,o.modified_by
,o.owned_date
,o.owned_by from order_request o
join cooperator_view c on c.cooperator_id=o.owned_by
join cooperator_view c2 on c2.cooperator_id=o.final_recipient_cooperator_id

