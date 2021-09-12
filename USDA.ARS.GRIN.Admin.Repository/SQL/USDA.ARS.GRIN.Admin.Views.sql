USE [gringlobal]
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_trait_classes]
GO
/****** Object:  View [dbo].[vw_taxonomy_species]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_species]
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genus_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_genus]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genus]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepools]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepool_codes]
GO
/****** Object:  View [dbo].[vw_taxonomy_family]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_family]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_trait_class_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_genepool_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_species]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citation_species]
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_genus]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citation_genus]
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_family]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citation_family]
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_breeding_types]
GO
/****** Object:  View [dbo].[vw_taxonomy_authority]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_authority]
GO
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_application]
GO
/****** Object:  View [dbo].[vw_pvp_applications_by_expiration]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_pvp_applications_by_expiration]
GO
/****** Object:  View [dbo].[vw_nrr_orders]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_nrr_orders]
GO
/****** Object:  View [dbo].[vw_lookup_site_emails]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_site_emails]
GO
/****** Object:  View [dbo].[vw_lookup_cooperator_category]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_cooperator_category]
GO
/****** Object:  View [dbo].[vw_gringlobal_weborders]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_gringlobal_weborders]
GO
/****** Object:  View [dbo].[vw_gringlobal_organizations]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_gringlobal_organizations]
GO
/****** Object:  View [dbo].[vw_gringlobal_cooperators]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_gringlobal_cooperators]
GO
/****** Object:  View [dbo].[vw_gringlobal_codevalues]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_gringlobal_codevalues]
GO
/****** Object:  View [dbo].[vw_cgc_lookup_document_categories]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_cgc_lookup_document_categories]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysTableFields]
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_AcctMgmtSysApplication]
GO
/****** Object:  View [dbo].[vw_accession_ipr]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_accession_ipr]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recently_available]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_recently_available]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recent_applications]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_recent_applications]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_expired_this_week]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_expired_this_week]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_available]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_available]
GO
/****** Object:  View [dbo].[vw_pvp_application_accession_map]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_pvp_application_accession_map]
GO
/****** Object:  View [dbo].[vw_lookup_geography]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_geography]
GO
/****** Object:  View [dbo].[vw_lookup_code_value]    Script Date: 8/27/2021 3:48:39 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_code_value]
GO
/****** Object:  View [dbo].[vw_lookup_code_value]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW
	[dbo].[vw_lookup_code_value]
AS
SELECT
	cv.code_value_id,
	cv.group_name,
	cv.value,
	cvl.title,
	cvl.description,
	cv.created_date,
	cv.modified_date
FROM
	code_value cv
JOIN
	code_value_lang cvl
ON
	cv.code_value_id = cvl.code_value_id
WHERE
	cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_lookup_geography]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_geography]
AS
SELECT 
	r.continent,
	r.subcontinent,
	(SELECT title FROM vw_lookup_code_value WHERE value = g.country_code AND group_name = 'GEOGRAPHY_COUNTRY_CODE') As country_name,
	g.adm1,
	(SELECT title FROM vw_lookup_code_value WHERE value = g.adm1_type_code AND group_name = 'GEOGRAPHY_ADMIN1_TYPE') AS adm1_type,
	g.adm2,
	g.adm2_type_code
	--geography_id,
	--country_code,
	--adm1,
	--adm1_type_code,
	--adm2,
	--adm2_type_code
  FROM 
	geography g
	LEFT OUTER JOIN
	geography_region_map grm
	ON
		g.geography_id = grm.geography_id
	LEFT OUTER JOIN	
		region r
	ON
		grm.region_id = r.region_id
--ORDER BY
--	continent,
--	subcontinent,
--	country_name, 
--	g.adm1
 
GO
/****** Object:  View [dbo].[vw_pvp_application_accession_map]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






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
	pa.pvp_application_number = dbo.fn_extract_integer(ipr_number)
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
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_available]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ars_grin_pvp_available]
AS
SELECT 
	 pa.pvp_application_number
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
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
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
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE
	vpam.accession_id IS NOT NULL
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_expired_this_week]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ars_grin_pvp_expired_this_week]
AS
SELECT 
	 pa.pvp_application_number
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
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
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
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) >= DATEADD(day, -7, GETDATE())
	AND (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) < GETDATE()
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recent_applications]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ars_grin_pvp_recent_applications]
AS
SELECT 
	 pa.pvp_application_number
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
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
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
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	
	WHERE
	 DATEDIFF(month,cast(application_date as date),GETDATE()) BETWEEN 1 AND 3
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recently_available]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ars_grin_pvp_recently_available]
AS
SELECT 
	 pa.pvp_application_number
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
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
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
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE
		vpam.accession_id IS NOT NULL
	AND
		pas.pvp_application_status_id != 18
	AND
		DATEDIFF(month,status_date,GETDATE()) < 6
	AND 
		status_date < getdate()
GO
/****** Object:  View [dbo].[vw_accession_ipr]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_accession_ipr]
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
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysApplication]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AcctMgmtSysApplication]
AS
SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	
GO
/****** Object:  View [dbo].[vw_AcctMgmtSysTableFields]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AcctMgmtSysTableFields]
AS
SELECT table_name, field_name, field_type, field_purpose FROM sys_table st
JOIN
sys_table_field stf
ON
st.sys_table_id = stf.sys_table_id
WHERE table_name LIKE 'taxonomy%'

GO
/****** Object:  View [dbo].[vw_cgc_lookup_document_categories]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_cgc_lookup_document_categories]
AS
SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date,
		cv.modified_date
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cv.group_name = 'CGC_DOCUMENT_CATEGORY'
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_gringlobal_codevalues]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_gringlobal_codevalues]
AS
SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date AS code_value_created,
		cv.modified_date AS code_value_modified,
		cvl.created_date AS code_value_lang_created,
		cvl.modified_date AS code_value_lang_modified
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_gringlobal_cooperators]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW
	[dbo].[vw_gringlobal_cooperators]
AS
SELECT
	ISNULL(su.sys_user_id, 0) AS sys_user_id,
	su.user_name,
	wc.web_cooperator_id,
	c.cooperator_id,
    c.current_cooperator_id,
    c.site_id,
	s.site_short_name,
    c.last_name,
    c.title,
    c.first_name,
    c.job,
    c.organization,
    c.organization_abbrev,
    c.address_line1,
    c.address_line2,
    c.address_line3,
    c.city,
    c.postal_index,
    c.geography_id,
    c.secondary_organization,
    c.secondary_organization_abbrev,
    c.secondary_address_line1,
    c.secondary_address_line2,
    c.secondary_address_line3,
    c.secondary_city,
    c.secondary_postal_index,
    c.secondary_geography_id,
    c.primary_phone,
    c.secondary_phone,
    c.fax,
    c.email,
    c.secondary_email,
    c.status_code,
    c.category_code,
    c.organization_region_code,
    c.discipline_code,
    c.note,
    c.created_date,
    c.created_by,
    c.modified_date,
    c.modified_by,
    c.owned_date,
    c.owned_by
FROM 
	cooperator C
LEFT OUTER JOIN
	site s
ON
	c.site_id = s.site_id
LEFT OUTER JOIN
	sys_user su
ON
	c.cooperator_id = su.cooperator_id
LEFT JOIN
	web_cooperator wc
ON
	c.web_cooperator_id = c.web_cooperator_id
GO
/****** Object:  View [dbo].[vw_gringlobal_organizations]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_gringlobal_organizations]
AS
SELECT DISTINCT organization
FROM web_cooperator
WHERE
organization IS NOT NULL
AND LEN(LTRIM(RTRIM(organization))) > 4
AND organization NOT LIKE '%N/A%'
GO
/****** Object:  View [dbo].[vw_gringlobal_weborders]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW 
	[dbo].[vw_gringlobal_weborders]
AS
	
SELECT 
		wor.web_order_request_id,
		wor.is_locked,
		wor.web_cooperator_id
		,wc.last_name
		,wc.title
		,wc.first_name
		,(wc.first_name + ' ' + wc.last_name) AS full_name
		,wc.title AS web_cooperator_title
		,wc.last_name AS web_cooperator_last_name
		,wc.first_name AS web_cooperator_first_name
		,(wc.first_name + ' ' + wc.last_name) AS web_cooperator_full_name
		,wc.organization AS web_cooperator_organization
		,wc.address_line1 AS web_cooperator_address_line_1
		,wc.address_line2 AS web_cooperator_address_line_2
		,wc.address_line3 AS web_cooperator_address_line_3
		,wc.city AS web_cooperator_address_city
		,wc.postal_index AS web_cooperator_address_postal_index
		,g.adm1 AS web_cooperator_address_state
		,wc.primary_phone AS web_cooperator_primary_phone
		,wc.email AS web_cooperator_email
		,wc.created_date AS web_cooperator_created_date
		,wc.modified_date AS web_cooperator_modified_date
		,wora.address_line1
		,wora.address_line2
		,wora.address_line3
		,wora.city
		,wora.postal_index
		,wora.geography_id
		,wc.primary_phone
		,wc.email
		,wor.ordered_date
		,wor.intended_use_code
		,wor.intended_use_note
		,wor.status_code
		,wor.note
		,wor.special_instruction
		,wor.created_date,
		wor.created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = wor.created_by) AS created_by_name,
		wor.modified_date,
		wor.modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = wor.modified_by) AS modified_by_name,
		wor.owned_date,
		wor.owned_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = wor.owned_by) AS owned_by_name
	FROM
		web_order_request wor
	JOIN 
		web_cooperator wc 
	ON 
		wc.web_cooperator_id = wor.web_cooperator_id
	JOIN 
		web_order_request_address wora 
	ON 
		wora.web_order_request_id = wor.web_order_request_id
	JOIN
		geography g
	ON
		wc.geography_id = g.geography_id
GO
/****** Object:  View [dbo].[vw_lookup_cooperator_category]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_cooperator_category]
AS
SELECT 
	cv.code_value_id,
	cv.value,
	cvl.title,
	cvl.description
FROM 
	code_value cv
JOIN
	code_value_lang cvl
ON
	cv.code_value_id = cvl.code_value_id
WHERE 
	cv.group_name = 'COOPERATOR_CATEGORY'
AND
	cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_lookup_site_emails]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_site_emails]
AS
SELECT
	s.site_short_name,
 case s.site_short_name 
      when 'BRW' then 'lj.grauke@ars.usda.gov'
     -- when 'CLO' then 'merrelyn.spinks@ars.usda.gov'
      when 'COR' then 'Missy.Fix@ars.usda.gov'
      when 'COT' then 'james.frelichowski@ars.usda.gov;janna.love@ars.usda.gov'  
      when 'DAV' then 'ordersNCGR.davis@ars.usda.gov'
      when 'DBMU' then 'benjamin.haag@usda.gov'
      when 'DLEG' then 'mjohnson@ag.arizona.edu'
     -- when 'FLAX' then 'nc7mb@ars-grin.gov'
     -- when 'FRA' then 'esnake@mis.net'
      when 'GEN' then 'dawn.dellefave@ars.usda.gov;ben.gutierrez@ars.usda.gov'
      --grin:
      --gsho:
      when 'GSOR' then 'lorie.bernhardt@ars.usda.gov'
      when 'GSPI' then 'barbara.hellier@ars.usda.gov;alec.mccall@wsu.edu;stoutd@wsu.edu;lisa.taylor@usda.gov'
      --gstr:
      when 'GSZE' then 'maize@uiuc.edu'
      when 'HILO' then 'Carol.MayoRiley@ars.usda.gov;Tracie.Matsumoto@ars.usda.gov'
      when 'MAY' then 'tomas.ayala-silva@usda.gov;ricardo.goenaga@usda.gov'
      when 'MIA' then 'Mike.Winterstein@usda.gov;Ricardo.Goenaga@usda.gov'
      when 'NA' then 'kevin.conrad@ars.usda.gov'
      when 'NC7' then 'nc7orders@ars.usda.gov;lisa.burke@ars.usda.gov'
      when 'NE9' then 'Joanne.Labate@ARS.USDA.GOV;sherri.tennies@ars.usda.gov'
      when 'NR6' then 'jesse.schartner@ars.usda.gov;mwmarti1@wisc.edu'
      when 'NSGC' then 'harold.bockelman@ars.usda.gov'
      when 'NSSL' then 'renee.white@ars.usda.gov'
      when 'OPGC' then 'stieve.1@osu.edu'
      --orders:
     -- when 'PALM' then 'danny.barney@ars.usda.gov'
      when 'PARL' then 'Claire.Heinitz@ars.usda.gov'
      when 'PEO' then 'karen.williams@ars.usda.gov'
     -- when 'PGQO' then 'steven.a.king@aphis.usda.gov'
      --puborder:
      when 'RIV' then 'Robert.krueger@ars.usda.gov'
      when 'SBML' then 'melanie.schori@ars.usda.gov'
      when 'SOY' then 'Todd.Bedford@ars.usda.gov;esther.peregrine@ars.usda.gov'
      when 'S9' then 'tiffany.fields@ars.usda.gov;ARS-S9Orders@ars.usda.gov'
      when 'TGRC' then 'trchetelat@ucdavis.edu'
      when 'TOB' then 'jessica_nifong@ncsu.edu'
      when 'W6' then 'stoutd@wsu.edu;barbara.hellier@ars.usda.gov;lisa.taylor@usda.gov;david.vanklaveren@wsu.edu;alec.mccall@wsu.edu;'      
      else 'benjamin.haag@usda.gov'
   end as email
	  FROM site s
GO
/****** Object:  View [dbo].[vw_nrr_orders]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_nrr_orders]
AS
SELECT 
	wc.email,
	--COUNT(*)
	worq.created_date,
	(SELECT COUNT (DISTINCT accession_id) FROM web_order_request_item WHERE web_order_request_id = worq.web_order_request_id) AS accessions,
	ora.order_request_action_id,
	ora.action_name_code,
	ora.completed_date,
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


GO
/****** Object:  View [dbo].[vw_pvp_applications_by_expiration]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_sys_application]
AS
SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	
GO
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_sys_table_fields]
AS
SELECT table_name, field_name, field_type, field_purpose FROM sys_table st
JOIN
sys_table_field stf
ON
st.sys_table_id = stf.sys_table_id
WHERE table_name LIKE 'taxonomy%'

GO
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_table_fields]
AS
SELECT 
	st.sys_table_id,
    table_name,
	stf.field_name,
	stfl.title,
	REPLACE(title, ' ', '') AS formatted_title
FROM
	sys_table st
JOIN
	sys_table_field stf
ON
	st.sys_table_id = stf.sys_table_id
JOIN
	sys_table_field_lang stfl
ON
	stf.sys_table_field_id = stfl.sys_table_field_id
WHERE
	table_name LIKE 'taxonomy%'
AND
	stfl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_taxonomy_authority]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_taxonomy_authority]
AS
SELECT 
	DISTINCT 'taxonomy_family' AS table_name,
	'family_authority' AS column_name,
	family_authority AS authority_text
FROM 
	taxonomy_family
UNION
SELECT 
	DISTINCT 'taxonomy_genus' AS table_name,
	'genus_authority' AS column_name,
	genus_authority AS authority_text
FROM 
	taxonomy_genus
UNION
SELECT 
	DISTINCT 'taxonomy_species' AS table_name,
	'species_authority' AS column_name,
	species_authority AS authority_text
FROM 
	taxonomy_species

UNION
SELECT 
	DISTINCT 'taxonomy_species' AS table_name,
	'subspecies_authority' AS column_name,
	subspecies_authority AS authority_text
FROM 
	taxonomy_species
UNION
SELECT 
	DISTINCT 'taxonomy_species' AS table_name,
	'variety_authority' AS column_name,
	variety_authority AS authority_text
FROM 
	taxonomy_species
UNION
SELECT 
	DISTINCT 'taxonomy_species' AS table_name,
	'forma_authority' AS column_name,
	forma_authority AS authority_text
FROM 
	taxonomy_species
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_breeding_types]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_BREEDING_TYPE'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_family]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_citation_family]
AS
SELECT
  cit.citation_id,
  LTRIM(RTRIM(COALESCE(cit.author_name, 'Unrecorded Author') + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_year), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.citation_year)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_title), CONVERT(NVARCHAR, cit.title), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(COALESCE(cit.citation_title, cit.title, ''))) END + 
               CASE COALESCE(CONVERT(NVARCHAR, l.abbreviation), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(l.abbreviation)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.reference), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.reference)) END)) AS display_member
FROM
	citation cit
LEFT JOIN 
	literature l 
ON 
	cit.literature_id = l.literature_id
WHERE
	taxonomy_family_id IS NOT NULL
--WHERE
--  ((cit.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (cit.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--    OR (cit.citation_id IN (:valuemember))
--    OR (cit.citation_id BETWEEN :startpkey AND :stoppkey)
--    OR (l.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (l.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--  )
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_genus]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_citation_genus]
AS
SELECT
  cit.citation_id,
  LTRIM(RTRIM(COALESCE(cit.author_name, 'Unrecorded Author') + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_year), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.citation_year)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_title), CONVERT(NVARCHAR, cit.title), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(COALESCE(cit.citation_title, cit.title, ''))) END + 
               CASE COALESCE(CONVERT(NVARCHAR, l.abbreviation), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(l.abbreviation)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.reference), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.reference)) END)) AS display_member
FROM
	citation cit
LEFT JOIN 
	literature l 
ON 
	cit.literature_id = l.literature_id
WHERE
	taxonomy_genus_id IS NOT NULL
--WHERE
--  ((cit.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (cit.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--    OR (cit.citation_id IN (:valuemember))
--    OR (cit.citation_id BETWEEN :startpkey AND :stoppkey)
--    OR (l.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (l.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--  )
GO
/****** Object:  View [dbo].[vw_taxonomy_citation_species]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_citation_species]
AS
SELECT
  cit.citation_id,
  LTRIM(RTRIM(COALESCE(cit.author_name, 'Unrecorded Author') + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_year), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.citation_year)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.citation_title), CONVERT(NVARCHAR, cit.title), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(COALESCE(cit.citation_title, cit.title, ''))) END + 
               CASE COALESCE(CONVERT(NVARCHAR, l.abbreviation), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(l.abbreviation)) END + 
               CASE COALESCE(CONVERT(NVARCHAR, cit.reference), '') WHEN '' THEN '' ELSE '' + '. ' + LTRIM(RTRIM(cit.reference)) END)) AS display_member
FROM
	citation cit
LEFT JOIN 
	literature l 
ON 
	cit.literature_id = l.literature_id
WHERE
	taxonomy_species_id IS NOT NULL
--WHERE
--  ((cit.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (cit.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--    OR (cit.citation_id IN (:valuemember))
--    OR (cit.citation_id BETWEEN :startpkey AND :stoppkey)
--    OR (l.created_date > COALESCE(:createddate, '1753-01-01'))
--    OR (l.modified_date > COALESCE(:modifieddate, '1753-01-01'))
--  )
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_BREEDING_TYPE'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_genepool_lookup]
AS

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_trait_class_lookup]
AS
SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_TRAIT_CLASS'
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_taxonomy_family]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_taxonomy_family]
AS
SELECT
		tf.taxonomy_family_id,
		current_taxonomy_family_id,
		type_taxonomy_genus_id,
		suprafamily_rank_code,
		suprafamily_rank_name,
		coalesce(tf.family_name,'') + ' ' + 
		coalesce(tf.family_authority,'') + ' ' + 
		coalesce(tf.subfamily_name,'') + ' ' + 
		coalesce(tf.tribe_name,'') + ' ' + 
		coalesce(tf.subtribe_name,'') 
		 AS family_name,
		family_authority,
		alternate_name,
		subfamily_name,
		tribe_name,
		subtribe_name,
		tf.note,
		tf.created_date,
		tf.created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.created_by) AS created_by_name,
		tf.modified_date,
		tf.modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.modified_by) AS modified_by_name
	FROM
		taxonomy_family tf
	
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genepool_codes]
AS

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genepools]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		--group_name LIKE '%CWR%'
	 group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_genus]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genus]
AS
   SELECT
		taxonomy_genus_id,
		current_taxonomy_genus_id,
		taxonomy_family_id,
		qualifying_code,
		hybrid_code,
   CASE tg.hybrid_code WHEN 'X' THEN '×' WHEN '+' THEN '+' ELSE '' END + 
   '<i>' + COALESCE (tg.genus_name, '') + '</i>  ' + COALESCE(tg.genus_authority, '') + 
   case when tg.subgenus_name IS NOT NULL then ' subg. <i>' + tg.subgenus_name + '</i> ' else '' end +
   case when tg.section_name IS NOT NULL then ' sect. <i>' + tg.section_name + '</i> ' else '' end + 
   case when tg.subsection_name IS NOT NULL then ' subs. <i>' + tg.subsection_name + '</i> ' else '' end +
   case when tg.series_name IS NOT NULL then ' ser. <i>' + tg.series_name + '</i> ' else '' end + 
   case when tg.subseries_name IS NOT NULL then ' subser. <i>' + tg.series_name + '</i> ' else '' end 
   as genus_name,
		genus_authority,
		subgenus_name,
		section_name,
		subsection_name,
		series_name,
		subseries_name,
		note,
		created_date,
		created_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.modified_by) AS modified_by_name
	FROM
		taxonomy_genus tg 
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genus_lookup]
AS
SELECT 
	tg.taxonomy_genus_id,
	LTRIM(RTRIM(COALESCE(tg.genus_name, '')))
	+ CASE COALESCE(convert(nvarchar, tg.subgenus_name), '') WHEN '' THEN '' ELSE '' + ' subg. ' + LTRIM(RTRIM(tg.subgenus_name)) END
	+ CASE COALESCE(convert(nvarchar, tg.section_name), '') WHEN '' THEN '' ELSE '' + ' sect. ' + LTRIM(RTRIM(tg.section_name)) END
	+ CASE COALESCE(convert(nvarchar, tg.subsection_name), '') WHEN '' THEN '' ELSE '' + ' subsect. ' + LTRIM(RTRIM(tg.subsection_name)) END
	 + CASE COALESCE(convert(nvarchar, tg.series_name), '') WHEN '' THEN '' ELSE '' + ' ser. ' + LTRIM(RTRIM(tg.series_name)) END
	 + CASE COALESCE(convert(nvarchar, tg.subseries_name), '') WHEN '' THEN '' ELSE '' + ' subser. ' + LTRIM(RTRIM(tg.subseries_name)) END
	 + CASE WHEN EXISTS (SELECT * FROM taxonomy_genus WHERE genus_name = tg.genus_name 
			AND COALESCE(subgenus_name, '') = COALESCE(tg.subgenus_name, '')
			AND COALESCE(section_name, '') = COALESCE(tg.section_name, '')
			AND COALESCE(subsection_name, '') = COALESCE(tg.subsection_name, '')
			AND COALESCE(series_name, '') = COALESCE(tg.series_name, '')
			AND COALESCE(subseries_name, '') = COALESCE(tg.subseries_name, '')
			AND taxonomy_genus_id != tg.taxonomy_genus_id)
		THEN ' ' + genus_authority
		ELSE '' END
	AS genus_name,
	tg.genus_authority,
	CASE 
		WHEN 
			taxonomy_genus_id = current_taxonomy_genus_id OR qualifying_code = '~'
		THEN 'Y' 
		ELSE 'N' 
	END AS is_accepted_genus
FROM
  taxonomy_genus tg

--WHERE
  --((tg.created_date > COALESCE(:createddate, '1753-01-01'))
   --OR (tg.modified_date > COALESCE(:modifieddate, '1753-01-01'))
   --OR (tg.taxonomy_genus_id IN (:valuemember))
   --OR (tg.taxonomy_genus_id BETWEEN :startpkey AND :stoppkey)
 --)
GO
/****** Object:  View [dbo].[vw_taxonomy_species]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_species]
AS
SELECT 
	taxonomy_species_id,
    current_taxonomy_species_id,
    nomen_number,
    is_specific_hybrid,
	tg.genus_name,
	tg.subgenus_name,
	(CASE tg.hybrid_code WHEN 'X' THEN '×' WHEN '+' THEN '+' ELSE '' END) + '<i>' + tg.genus_name + ' ' +
    (CASE ts.is_specific_hybrid WHEN 'Y' THEN '</i>×<i>' ELSE '' END) + ts.species_name + '</i> ' + COALESCE (ts.species_authority, '') + ' ' +
    (CASE ts.is_subspecific_hybrid WHEN 'Y' THEN 'notho' ELSE '' END) +
    (CASE when ts.subspecies_name IS NOT NULL then 'subsp. <i>' + ts.subspecies_name + '</i> ' + COALESCE (ts.subspecies_authority, '') + ' ' else '' end) +
    (CASE ts.is_varietal_hybrid WHEN 'Y' THEN 'notho' ELSE '' END) +
    (CASE when ts.variety_name IS NOT NULL then 'var. <i>' + ts.variety_name + '</i> ' + COALESCE (ts.variety_authority, '') + ' ' else '' end) +
    (CASE ts.is_subvarietal_hybrid WHEN 'Y' THEN 'notho' ELSE '' END) +
    (CASE when ts.subvariety_name IS NOT NULL then 'subvar. <i>' + ts.subvariety_name + '</i> ' + COALESCE (ts.subvariety_authority, '') + ' ' else '' end) +
    (CASE when ts.forma_name IS NOT NULL then ts.forma_rank_type + ' <i>' + ts.forma_name + '</i> ' + COALESCE (ts.forma_authority, '') + ' ' else '' end) as species_name,
	ts.name,
	ts.subspecies_name,
	ts.subspecies_authority,
	CASE
		WHEN 
			taxonomy_species_id = current_taxonomy_species_id 
		THEN
			'Y'
		ELSE 
			'N'
	END AS is_accepted_name,
    species_authority,
    is_subspecific_hybrid,
    is_varietal_hybrid,
    variety_name,
    variety_authority,
    is_subvarietal_hybrid,
    subvariety_name,
    subvariety_authority,
    is_forma_hybrid,
    forma_rank_type,
    forma_name,
    forma_authority,
    tg.taxonomy_genus_id,
    priority1_site_id,
    priority2_site_id,
    curator1_cooperator_id,
    curator2_cooperator_id,
    restriction_code,
    life_form_code,
    common_fertilization_code,
    is_name_pending,
    synonym_code,
    verifier_cooperator_id,
    name_verified_date,
    name_authority,
    protologue,
    protologue_virtual_path,
    ts.note,
    site_note,
    alternate_name,
	(SELECT 
		COUNT(*) 
	 FROM 
		accession
	 WHERE 
		taxonomy_species_id = ts.taxonomy_species_id) AS accession_count,
    ts.created_date,
	ts.created_by,
	(SELECT first_name + '''' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
	ts.modified_date,
	ts.modified_by,
	(SELECT first_name + '''' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
    ts.owned_date,
    ts.owned_by,
	(SELECT first_name + '''' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
    FROM 
		taxonomy_species ts 
	JOIN 
		taxonomy_genus tg
	ON 
		tg.taxonomy_genus_id = ts.taxonomy_genus_id
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 8/27/2021 3:48:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_trait_classes]
AS
SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_TRAIT_CLASS'
	AND
		cvl.sys_lang_id = 1
GO
