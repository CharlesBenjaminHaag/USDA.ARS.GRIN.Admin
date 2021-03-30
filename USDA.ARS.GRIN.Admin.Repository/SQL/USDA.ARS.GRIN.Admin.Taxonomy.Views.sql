USE [gringlobal]
GO
/****** Object:  View [dbo].[web_order_request_item_view]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[web_order_request_item_view]
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_trait_classes]
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genus_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepools]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepool_codes]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_trait_class_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_genepool_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_citations_species]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citations_species]
GO
/****** Object:  View [dbo].[vw_taxonomy_citations_genus]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citations_genus]
GO
/****** Object:  View [dbo].[vw_taxonomy_citations_family]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citations_family]
GO
/****** Object:  View [dbo].[vw_taxonomy_citations_accession]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_citations_accession]
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_breeding_types]
GO
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 3/30/2021 2:51:05 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_application]
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_citations_accession]    Script Date: 3/30/2021 2:51:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW
[dbo].[vw_taxonomy_citations_accession]
AS
SELECT [citation_id]
      ,[literature_id]
      ,[citation_title]
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,[url]
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,[taxonomy_species_id]
      ,[taxonomy_genus_id]
      ,[taxonomy_family_id]
      ,[accession_ipr_id]
      ,[accession_pedigree_id]
      ,[genetic_marker_id]
      ,[type_code]
      ,[unique_key]
      ,[is_accepted_name]
      ,[note]
      ,[created_date]
      ,[created_by]
      ,[modified_date]
      ,[modified_by]
      ,[owned_date]
      ,[owned_by]
  FROM [gringlobal].[dbo].[citation]
  WHERE
	accession_id IS NOT NULL
GO
/****** Object:  View [dbo].[vw_taxonomy_citations_family]    Script Date: 3/30/2021 2:51:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW
[dbo].[vw_taxonomy_citations_family]
AS
SELECT TOP 10 [citation_id]
      ,l.literature_id
	  ,l.reference_title
      ,[citation_title]
	  ,tf.family_name AS taxon_name
     ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,l.url
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,tf.taxonomy_family_id
      ,[accession_ipr_id]
      ,[accession_pedigree_id]
      ,[genetic_marker_id]
      ,[type_code]
      ,[unique_key]
      ,[is_accepted_name]
FROM 
	[gringlobal].[dbo].[citation] c
JOIN
	literature l
ON
	c.literature_id = l.literature_id
JOIN
	taxonomy_family tf
ON
	c.taxonomy_family_id = tf.taxonomy_family_id



GO
/****** Object:  View [dbo].[vw_taxonomy_citations_genus]    Script Date: 3/30/2021 2:51:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW
[dbo].[vw_taxonomy_citations_genus]
AS
SELECT TOP 10 [citation_id]
      ,c.literature_id
	  ,l.reference_title
      ,[citation_title]
	  ,tg.genus_name AS taxon_name
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,c.url
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,tg.taxonomy_genus_id
      ,[accession_ipr_id]
      ,[accession_pedigree_id]
      ,[genetic_marker_id]
      ,[type_code]
      ,[unique_key]
      ,[is_accepted_name]
FROM 
	[gringlobal].[dbo].[citation] c
JOIN
	literature l
ON
	c.literature_id = l.literature_id
JOIN
	taxonomy_genus tg
ON
	c.taxonomy_genus_id = tg.taxonomy_genus_id



GO
/****** Object:  View [dbo].[vw_taxonomy_citations_species]    Script Date: 3/30/2021 2:51:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW
[dbo].[vw_taxonomy_citations_species]
AS
SELECT TOP 10 [citation_id]
      ,c.literature_id
	  ,l.reference_title
      ,[citation_title]
	  ,ts.name AS taxon_name
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,c.url
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,ts.[taxonomy_species_id]
      ,[accession_ipr_id]
      ,[accession_pedigree_id]
      ,[genetic_marker_id]
      ,[type_code]
      ,[unique_key]
      ,[is_accepted_name]
FROM 
	[gringlobal].[dbo].[citation] c
JOIN
	literature l
ON
	c.literature_id = l.literature_id
JOIN
	taxonomy_species ts
ON
	c.taxonomy_species_id = ts.taxonomy_species_id



GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 3/30/2021 2:51:05 AM ******/
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
/****** Object:  View [dbo].[web_order_request_item_view]    Script Date: 3/30/2021 2:51:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[web_order_request_item_view] as
	select
	web_order_request_item_id,
wor.web_cooperator_id,
wor.web_order_request_id,
wori.status_code,
cast (wor.ordered_date as datetime2) as ordered_date,
a.accession_id,
	accession_prefix as prefix,
	accession_number as number,
	accession_suffix as suffix,
	site_short_name as site,

wori.name,
a.name as taxon,
quantity_shipped,
sequence_number,
unit_of_shipped_code,
distribution_form_code,
curator_note,
user_note,
wori.created_date,
wori.created_by,
wori.modified_date,
wori.modified_by,
wori.owned_date,
wori.owned_by
	from web_order_request_item wori
	join accession_view a on a.accession_id=wori.accession_id
	join web_order_request wor on wor.web_order_request_id=wori.web_order_request_id


GO
