CREATE VIEW vw_accession_ipr
AS
SELECT 
	TRY_PARSE(substring(ipr_number,5,20) AS INT) AS pv_number,
	accession_id
FROM 
	accession_ipr ai
WHERE
	ai.type_code = 'PVP'  
AND 
	ipr_number not like '%MP'
AND 
	ipr_number not like '%FP'
AND 
	ipr_number not like '%P1'
AND 
	ipr_number not like '%P2'
AND 
	ipr_number not like '%P3'
AND 
	dbo.get_avstat(ai.accession_id) = 'Y'
AND
	TRY_PARSE(substring(ipr_number,5,20) AS INT) IS NOT NULL