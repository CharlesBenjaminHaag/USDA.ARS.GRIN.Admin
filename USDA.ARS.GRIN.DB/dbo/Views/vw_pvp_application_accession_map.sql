

CREATE VIEW [dbo].[vw_pvp_application_accession_map]
AS
SELECT  
	pa.pvp_application_number,
	ai.ipr_number,
	ai.accession_ipr_id,
	ai.accession_id
FROM
	pvp_application pa
JOIN
	accession_ipr ai
ON
	pa.pvp_application_number = cast(substring(ipr_number,5,20) as int)
WHERE type_code = 'PVP'  
	and ipr_number not like '%MP'
    and ipr_number not like '%FP'
	and ipr_number not like '%P1'
	and ipr_number not like '%P2'
	and ipr_number not like '%P3'
	and dbo.get_avstat(ai.accession_id) = 'Y'

--,cast(substring(ipr_number,5,20) as int) AS pv_number
--,[accession_ipr_id]
--      ,ai.accession_id
--      ,[type_code]
--      ,[ipr_number]
--      ,[ipr_crop_name]
--      ,[ipr_full_name]
--      ,[issued_date]
--      ,[expired_date]
--      ,[cooperator_id]
--      --,[note]
--      ,[accepted_date]
--      ,[expected_date]
--      --,[created_date]
--      --,[created_by]
--      --,[modified_date]
--      --,[modified_by]
--      --,[owned_date]
--      --,[owned_by]
--  FROM [gringlobal].[dbo].[accession_ipr] ai
--  JOIN
--	accession a
--	ON 
--	ai.accession_id = a.accession_id
--	LEFT JOIN
--	pvp_application pa
--ON
--	pa.pvp_application_number = cast(substring(ipr_number,5,20) as int)
--  WHERE type_code = 'PVP'  
--	and ipr_number not like '%MP'
--    and ipr_number not like '%FP'
--	and ipr_number not like '%P1'
--	and ipr_number not like '%P2'
--	and ipr_number not like '%P3'
