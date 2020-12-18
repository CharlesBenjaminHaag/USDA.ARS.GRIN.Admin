-- drop view oact;
create view [oact] as select
order_request_action_id as oactno,
action_name_code as action,
started_date as acted,
completed_date as completed,
action_information as actid,
order_request_id as orno,
(select site_short_name from site s, cooperator c where s.site_id=c.site_id and c.cooperator_id=o.owned_by) as site,
note as cmt,
created_date as created,
created_by as create_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.created_by) as created_user,
modified_date as modified,
modified_by as modify_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.modified_by) as modified_user, 
owned_date as owned,
owned_by as owner_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.created_by) as owned_user
from order_request_action o
