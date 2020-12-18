CREATE VIEW [vw_nrr_orders]
AS
SELECT 
	wc.email,
	--COUNT(*)
	worq.created_date,
	(SELECT COUNT (DISTINCT accession_id) FROM web_order_request_item WHERE web_order_request_id = worq.web_order_request_id) AS accessions,
	orq.order_request_id,
	orq.web_order_request_id,
	worq.status_code,
	worq.intended_use_note,
	worq.intended_use_code,
	worq.special_instruction,
	worq.web_cooperator_id
FROM
	order_request_action ora
JOIN
	order_request orq
ON
	ora.order_request_id = orq.order_request_id
JOIN
	web_order_request worq
ON
	orq.web_order_request_id = worq.web_order_request_id
JOIN
	web_cooperator wc
ON
	worq.web_cooperator_id = wc.web_cooperator_id
WHERE
	ora.action_information LIKE '%NRR%' AND ora.action_name_code = 'CANCEL'
--ORDER BY created_date DESC

--GROUP BY email ORDER BY COUNT(*) DESC

--SELECT * FROM order_request WHERE requestor_cooperator_id IN
--(SELECT cooperator_id FROM cooperator WHERE email = 'kuchipudipavani999@gmail.com'
--)

--SELECT * FROM web_order_request WHERE web_cooperator_id IN
--(SELECT web_cooperator_id FROM web_cooperator WHERE email = 'kuchipudipavani999@gmail.com')


