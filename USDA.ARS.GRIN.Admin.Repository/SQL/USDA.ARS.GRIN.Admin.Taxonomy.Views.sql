USE [gringlobal]
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genus_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_trait_class_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_genepool_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 2/22/2021 1:24:46 PM ******/
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
