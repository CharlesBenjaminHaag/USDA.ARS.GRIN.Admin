
CREATE VIEW [dbo].[vw_pvp_applications_by_expiration]
AS
	SELECT 
		1 AS sort_order,
	'Expiring Within 6 Months' AS category
	,[pvp_application_number]
    ,[cultivar_name]
    ,[experimental_name]
    ,pa.pvp_common_name_id
	,pc.name AS common_name
   ,scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101))  AS months_remaining
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
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
	  certificate_issued_date IS NOT NULL
	AND
		pa.pvp_application_status_id = 18
	AND		
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) >= GETDATE()
	AND
		DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) <=6

		UNION

		SELECT 
		2 AS sort_order,
	'Expiring Within 1 Year' AS category
	,[pvp_application_number]
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
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) AS months_remaining
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
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
	  certificate_issued_date IS NOT NULL
	AND
		pa.pvp_application_status_id = 18
	AND		
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) >= GETDATE()
	AND
		DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) <=12
