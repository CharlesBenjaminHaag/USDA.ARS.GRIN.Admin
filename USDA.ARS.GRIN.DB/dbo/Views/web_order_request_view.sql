create view web_order_request_view as select last_name,first_name,organization, r.* from web_order_request r, web_cooperator c 
where r.web_cooperator_id=c.web_cooperator_id