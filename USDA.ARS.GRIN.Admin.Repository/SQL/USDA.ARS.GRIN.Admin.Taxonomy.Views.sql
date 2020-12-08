USE [gringlobal]
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 12/7/2020 12:30:29 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_trait_classes]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 12/7/2020 12:30:29 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepools]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 12/7/2020 12:30:29 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepool_codes]
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 12/7/2020 12:30:29 AM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_breeding_types]
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 12/7/2020 12:30:29 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 12/7/2020 12:30:29 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 12/7/2020 12:30:29 AM ******/
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
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 12/7/2020 12:30:29 AM ******/
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
