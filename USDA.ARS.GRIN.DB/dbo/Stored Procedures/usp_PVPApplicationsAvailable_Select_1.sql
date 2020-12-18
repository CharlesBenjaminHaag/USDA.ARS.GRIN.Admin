CREATE PROCEDURE [usp_PVPApplicationsAvailable_Select]
AS
BEGIN

--SELECT
--pvnumber, status, statusdate,
--       applicantowner, isnull(variety,EXPERMENTALNAMESYNONYMS) variety,accession_id
--FROM pvpo_catalog c,accession_ipr i where  i.type_code = 'PVP'  
--		and ipr_number not like '%MP'
--    	and ipr_number not like '%FP'
--and ipr_number not like '%P1'
--and ipr_number not like '%P2'
--and ipr_number not like '%P3'
--and	cast(substring(ipr_number,5,20) as int) = c.pvnumber
--and dbo.get_avstat(accession_id) = 'Y'
--              --and c.crop = '$crop'   
--ORDER BY cast(statusdate as date) desc

SELECT 
	 [pvp_application_number]
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	FROM 
		[$(DatabaseName)].[pvp_application] pa
	JOIN
		accession_ipr ai
	ON
		pa.pvp_application_number = CAST(SUBSTRING(ipr_number,5,20) AS INT)
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
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
		dbo.get_avstat(accession_id) = 'Y'


	--	certificate_issued_date IS NOT NULL
	--AND
	--	DATEADD(year, Years_Protected, certificate_issued_date)
	--BETWEEN
	--	CAST(DATEADD(month,-1,GETDATE()) AS DATE)
	--AND
	--	CAST(DATEADD(month,6,GETDATE()) AS DATE)
END
