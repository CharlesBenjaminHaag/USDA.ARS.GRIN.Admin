USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesByName_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesByName_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulations_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenii_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenii_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFoldersByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemCropMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemCropMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFiscalYearTotals_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamilies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamilies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTraits_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCommonNames_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxnonomyGeniiSelect]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxnonomyGeniiSelect]
	@taxonomy_family_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		*
	FROM
		taxonomy_genus tg
	WHERE
		tg.taxonomy_family_id = @taxonomy_family_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCommonNames_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_common_name_id]
		,[taxonomy_genus_id]
		,[taxonomy_species_id]
		,[language_description]
		,[name]
		,[simplified_name]
		,[alternate_transcription]
		,[citation_id]
		,[note]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
		,[owned_date]
		,[owned_by]
	FROM [gringlobal].[dbo].[taxonomy_common_name]
	WHERE taxonomy_species_id = @taxonomy_species_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Delete] 
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_crop_id INT = 0 OUTPUT,
	@crop_name nvarchar(150),
	@note nvarchar(max),
	@created_by int
AS
	BEGIN
	BEGIN TRY
		Insert into taxonomy_cwr_crop (crop_name,note,created_date,created_by,owned_date,owned_by)
		values(@crop_name,@note, GETDATE(),@created_by, GETDATE(),@created_by)
		SET @out_taxonomy_cwr_crop_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_cwr_crop_id,
		crop_name,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_crop tcc
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Update]
@out_error_number INT = 0 OUTPUT,
@crop_name nvarchar(150),
@note nvarchar (MAX),
@modified_by int,
@taxonomy_cwr_crop_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_cwr_crop SET crop_name=@crop_name,note=@note,modified_date=GETDATE(),modified_by=@modified_by,owned_date=GETDATE(),owned_by=@modified_by 
	WHERE taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Delete] 
	@taxonomy_cwr_crop_id_list NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id IN (@taxonomy_cwr_crop_id_list)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
	taxonomy_cwr_crop_id, 
	crop_name, 
	note, 
	(SELECT COUNT(taxonomy_cwr_map_id) 
	FROM taxonomy_cwr_map 
	WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
	tcc.created_date, 
	tcc.created_by, 
	(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name, 
	tcc.modified_date, tcc.modified_by, 
	(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name FROM taxonomy_cwr_crop tcc'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	--SELECT *
	--FROM @Results
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(MONTH, -1, GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByUser_Select]
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		owned_by = @cooperator_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(DAY, -7, GETDATE()) 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id = @taxonomy_cwr_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_map_id INT = 0 OUTPUT,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@created_by int
AS
BEGIN
--BEGIN TRY
	Insert into taxonomy_cwr_map 
		(taxonomy_species_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		owned_date,
		owned_by)
	VALUES
		(
		 @taxonomy_species_id,
		 @taxonomy_cwr_crop_id,
		 @crop_common_name,
		 @is_crop,
		 @genepool_code,
		 @is_graftstock,
		 @is_potential,
		 @citation_id,
		 @note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_map_id = CAST(SCOPE_IDENTITY() AS INT)
--END TRY
--BEGIN CATCH
--	SELECT @out_error_number=ERROR_NUMBER()
--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT species_name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id int,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
BEGIN TRY
	UPDATE 
		[dbo].taxonomy_cwr_map 
	SET 
		taxonomy_species_id=@taxonomy_species_id,
		taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id,
		crop_common_name=@crop_common_name,
		is_crop=@is_crop,
		genepool_code=@genepool_code,
		is_graftstock=@is_graftstock,
		is_potential=@is_potential,
		citation_id=@citation_id,
		note=@note,
		modified_date= GETDATE(),
		modified_by=@modified_by,
		owned_date=GETDATE(),
		owned_by=@modified_by 
	WHERE 
		taxonomy_cwr_map_id=@taxonomy_cwr_map_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id_list INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id IN (@taxonomy_cwr_map_id_list)	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT
		taxonomy_species_id,
		(SELECT species_name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm '

	SET @sql_statement = @sql_statement + @sql_where_clause

   EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT 
			name
		 FROM
			taxonomy_species
		 WHERE
			taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_crop_id,
		taxonomy_cwr_map_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	ORDER BY
		crop_common_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_trait
		WHERE
			taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Insert]
@out_error_number INT = 0 OUTPUT,
@out_taxonomy_cwr_trait_id INT = 0 OUTPUT,
@taxonomy_cwr_map_id int,
@trait_class_code nvarchar(20),
@is_potential nvarchar(1),
@breeding_type_code nvarchar(20),
@breeding_usage_note nvarchar(1000),
@ontology_trait_identifier nvarchar(20),
@citation_id int,
@note nvarchar(MAX),
@created_by int
AS
BEGIN
BEGIN TRY
	Insert into 
		taxonomy_cwr_trait 
		(taxonomy_cwr_map_id,
		 trait_class_code,
		 is_potential,
		 breeding_type_code,
		 breeding_usage_note,
		 ontology_trait_identifier,
		 citation_id,note,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by)
	values
		(@taxonomy_cwr_map_id,
		 @trait_class_code,
		 @is_potential, 
		 @breeding_type_code,
		 @breeding_usage_note,
		 @ontology_trait_identifier,
		 @citation_id,@note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_trait_id = CAST(SCOPE_IDENTITY() AS INT)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Select]
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,tct.is_potential
		,[breeding_type_code]
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,tct.modified_date
		,tct.modified_by
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	WHERE
		tct.taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id int,
	@taxonomy_cwr_map_id int,
	@trait_class_code nvarchar(20),
	@is_potential nvarchar(1),
	@breeding_type_code nvarchar(20),
	@breeding_usage_note nvarchar(1000),
	@ontology_trait_identifier nvarchar(20),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
	BEGIN TRY
		UPDATE 
			[dbo].taxonomy_cwr_trait 
		SET 
			taxonomy_cwr_map_id=@taxonomy_cwr_map_id,
			trait_class_code=@trait_class_code,
			is_potential=@is_potential,
			breeding_type_code=@breeding_type_code,
			breeding_usage_note=@breeding_usage_note,
			ontology_trait_identifier=@ontology_trait_identifier,
			citation_id=@citation_id,
			note=@note,
			modified_date=GETDATE(),
			modified_by=@modified_by,
			owned_date=GETDATE(),
			owned_by=@modified_by 
		WHERE 
			taxonomy_cwr_trait_id=@taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTraits_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,vtc.title AS trait_class_title
		,tct.is_potential
		,[breeding_type_code]
		,vbt.title AS breeding_type_title
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name
		,tct.modified_date
		,tct.modified_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	JOIN
		vw_taxonomy_breeding_types vbt
	ON
		tct.breeding_type_code = vbt.value
	JOIN
		vw_taxonomy_trait_classes vtc
	ON
		tct.trait_class_code = vtc.value
	WHERE
		tct.taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFamilies_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT
		taxonomy_family_id,
      current_taxonomy_family_id,
      type_taxonomy_genus_id,
      suprafamily_rank_code,
      suprafamily_rank_name,
      family_name,
      family_authority,
      alternate_name,
      subfamily_name,
      tribe_name,
      subtribe_name,
    note
FROM
	taxonomy_family tf WHERE family_name LIKE ''A%'''

	SET @sql_statement = @sql_statement + @sql_where_clause

   EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFamilies_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *
	FROM 
		taxonomy_family tf
	ORDER BY 
		tf.family_name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFiscalYearTotals_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @cooperator_id INT
DECLARE @start_date DATETIME2(7)
DECLARE @end_date DATETIME2(7)

SET @cooperator_id = 165283
SET @start_date = '9/30/2019'
SET @end_date = '10/1/2020'

select
	'Species Added' AS category,
	count(*) AS fiscal_year_total
from 
	taxonomy_species t
join 
	cooperator c 
on 
	t.created_by = c.cooperator_id
where 
	t.created_date > @start_date
and 
	t.created_date < @end_date
and 
	t.created_by = @cooperator_id
UNION
select 
	'Species Modified',
	count(*) modspcnt 
from 
	taxonomy_species t
join 
	cooperator c on t.modified_by = c.cooperator_id
where 
	t.modified_date > @start_date
and 
	t.modified_date < @end_date
and 
	t.modified_by = @cooperator_id
UNION
select
	'Species Verified',
	count(*) verspcnt from taxonomy_species t
join cooperator c on t.verifier_cooperator_id = c.cooperator_id
where t.name_verified_date > @start_date
and t.name_verified_date < @end_date
and t.verifier_cooperator_id = @cooperator_id
UNION 
select
	'Species Citations Added',
	count(*) newspcitcnt 
	from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_species_id is not null
UNION
select
	'Species Citations Edited',
	count(*) AS	modspcitcnt 
from citation ct
join cooperator c 
on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_species_id is not null

UNION
select 'Genus Citations Added', 
count(*) newgncitcnt from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION
select
	'Genus Citations Edited',
	count(*) modgncitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION

select
	'Families Added',
	count(*) newfamcitcnt 
	from citation ct
join 
	cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select 'Families Edited', count(*) modfamcitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select
	'Common Names Added',
	count(*) newcncnt 
from taxonomy_common_name cn
join cooperator c on cn.created_by = c.cooperator_id
where cn.created_date > @start_date
and cn.created_date < @end_date
and cn.created_by = @cooperator_id

UNION

select 
	'Common Names Edited', 
	count(*) modcncnt 
from taxonomy_common_name t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
	'Genii Added',
	count(*) newgncnt 
	from taxonomy_genus t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Genii Edited',
count(*) modgncnt 
from taxonomy_genus t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
'Distributions Added',
	count(*) newdistcnt 
	from taxonomy_geography_map t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Distributions Edited',
count(*) moddistcnt 
from taxonomy_geography_map t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select
	'Uses Added',
	count(*) newusecnt from taxonomy_use t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Uses Modified', count(*) 
modusecnt from taxonomy_use t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

--select created_by, count(*) newspcnt from taxonomy_species
--where created_date > '2016-09-30'
--and created_date < '2017-10-01'
--group by created_by





END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_id INT = 0 OUTPUT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(500),
	@is_shared BIT,
    @data_source NVARCHAR(150),
	@created_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	taxonomy_folder
			(
				title, 
				description, 
				note,
				is_shared,
				data_source,
				created_by, 
				created_date
			)
		VALUES 
			(
				@title, 
				@description, 
				@note,
				@is_shared,
				@data_source,
				@created_by, 
				GETDATE()
			)
		SELECT @out_taxonomy_folder_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		note,
		is_shared,
		data_source,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.modified_by) AS modified_by_name
	FROM 
		taxonomy_folder tf
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(2000),
	@is_shared BIT,
	@modified_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		UPDATE
			taxonomy_folder
		SET 
			title = @title, 
			description = @description, 
			note = @note,
			is_shared = @is_shared
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		FROM taxonomy_cwr_map 
		WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, tcc.modified_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name 
	FROM 
		taxonomy_cwr_crop tcc
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemCropMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemCropMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		taxonomy_folder_item_id
		,taxonomy_folder_id
		,item_id
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		 FROM taxonomy_cwr_map 
		 WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT 
		 first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, 
		tcc.modified_by, 
		(SELECT first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.modified_by) AS modified_by_name 
	  FROM 
		taxonomy_folder_item_map tfim
	  JOIN
		taxonomy_cwr_crop tcc
ON
	tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_item_map_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_item_id = @taxonomy_folder_item_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_item_map_id INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@data_source NVARCHAR(150),
	@item_id INT,
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	
			taxonomy_folder_item_map
			(taxonomy_folder_id,
			 data_source,
			 item_id,
			 created_by,
			 created_date)
		VALUES 
			(@taxonomy_folder_id,
			 @data_source,
			 @item_id,
			 @created_by,
			 GETDATE())
		SELECT @out_taxonomy_folder_item_map_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMaps_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_item_id
      ,taxonomy_folder_id
      ,item_id
      ,created_by
      ,created_date
	FROM 
		taxonomy_folder_item_map
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFoldersByUser_Select] 
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		data_source,
		note,
		is_shared,
		created_date,
		modified_date,
		(SELECT 
			COUNT(*) 
		FROM 
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_id = tf.taxonomy_folder_id) AS item_count
	FROM 
		taxonomy_folder tf
	WHERE
		created_by = @cooperator_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyGenii_Search] 
	@search_string NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		taxonomy_genus_id,
		current_taxonomy_genus_id,
		taxonomy_family_id,
		qualifying_code,
		hybrid_code,
		genus_name,
		genus_authority,
		subgenus_name,
		section_name,
		subsection_name,
		series_name,
		subseries_name,
		note,
		created_date,
		created_by,
		modified_date,
		modified_by,
		owned_date,
		owned_by,
		note,
		created_date,
		created_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.modified_by) AS modified_by_name
	FROM
		taxonomy_genus tg 
	WHERE 
		genus_name LIKE '%' + @search_string + '%'
	OR
		subgenus_name LIKE '%' + @search_string + '%'
	OR
		section_name LIKE '%' + @search_string + '%'
	OR
		subsection_name LIKE '%' + @search_string + '%'
	OR
		series_name LIKE '%' + @search_string + '%'
	OR
		subseries_name LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyGenii_Select]
	@taxonomy_family_id INT
AS
BEGIN
	SELECT
	   taxonomy_genus_id,
      current_taxonomy_genus_id,
      taxonomy_family_id,
      qualifying_code,
      hybrid_code,
      genus_name,
      genus_authority,
      subgenus_name,
      section_name,
      subsection_name,
      series_name,
      subseries_name,
      note,
      created_date,
      created_by,
      modified_date,
      modified_by,
      owned_date,
      owned_by,
      note,
	  created_date,
	  created_by,
      (SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.created_by) AS created_by_name,
	  modified_date,
	  modified_by,
	  (SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.modified_by) AS modified_by_name
	FROM
		taxonomy_genus tg
	WHERE
		taxonomy_family_id = @taxonomy_family_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Insert]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation (geography_id,regulation_type_code,regulation_level_code,description,url_1,url_2,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@geography_id,@regulation_type_code,@regulation_level_code,@description,@url_1,@url_2,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Select] 
	@taxonomy_regulation_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		taxonomy_regulation_id = @taxonomy_regulation_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Update]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation SET geography_id=@geography_id,regulation_type_code=@regulation_type_code,regulation_level_code=@regulation_level_code,description=@description,url_1=@url_1,url_2=@url_2,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_id=@taxonomy_regulation_id AND geography_id=@geography_id AND regulation_type_code=@regulation_type_code AND regulation_level_code=@regulation_level_code AND description=@description AND url_1=@url_1 AND url_2=@url_2 AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Insert]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation_map (taxonomy_family_id,taxonomy_genus_id,taxonomy_species_id,taxonomy_regulation_id,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@taxonomy_family_id,@taxonomy_genus_id,@taxonomy_species_id,@taxonomy_regulation_id,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Update]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_map_id int

AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation_map SET taxonomy_family_id=@taxonomy_family_id,taxonomy_genus_id=@taxonomy_genus_id,taxonomy_species_id=@taxonomy_species_id,taxonomy_regulation_id=@taxonomy_regulation_id,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_map_id=@taxonomy_regulation_map_id AND taxonomy_family_id=@taxonomy_family_id AND taxonomy_genus_id=@taxonomy_genus_id AND taxonomy_species_id=@taxonomy_species_id AND taxonomy_regulation_id=@taxonomy_regulation_id AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulations_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_species_id INT = 0 OUTPUT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	--BEGIN TRY
		INSERT INTO	
			taxonomy_species
			(
				current_taxonomy_species_id,
				is_specific_hybrid,
				species_name,
				species_authority,
				is_subspecific_hybrid,
				is_varietal_hybrid,
				variety_name,
				variety_authority,
				is_subvarietal_hybrid,
				subvariety_name,
				subvariety_authority,
				is_forma_hybrid,
				taxonomy_genus_id,
				life_form_code,
				is_name_pending,
				synonym_code,
				name_verified_date,
				name,
				name_authority,
				protologue,
				protologue_virtual_path,
				note,
				created_by,
				created_date,
				owned_by,
				owned_date
			)
			VALUES
			(
				@current_taxonomy_species_id,
				@is_specific_hybrid,
				@species_name,
				@species_authority,
				@is_subspecific_hybrid,
				@is_varietal_hybrid,
				@variety_name,
				@variety_authority,
				@is_subvarietal_hybrid,
				@subvariety_name,
				@subvariety_authority,
				@is_forma_hybrid,
				@taxonomy_genus_id,
				@life_form_code,
				@is_name_pending,
				@synonym_code,
				@name_verified_date,
				@name,
				@name_authority,
				@protologue,
				@protologue_virtual_path,
				@note,
				@created_by,
				GETDATE(),
				@created_by,
				GETDATE()
			)
		SET @out_taxonomy_species_id = CAST(SCOPE_IDENTITY() AS INT)
	--END TRY
	--BEGIN CATCH
	--	SELECT @out_error_number=ERROR_NUMBER()
	--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Search] 
	@search_string NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	SELECT 
	taxonomy_species_id,
    current_taxonomy_species_id,
    nomen_number,
    is_specific_hybrid,
   CASE
		WHEN
			EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
		THEN 
			CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
		ELSE 
			ts.name
	END AS species_name,
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
    subspecies_name,
    subspecies_authority,
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
    taxonomy_genus_id,
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
    name,
    name_authority,
    protologue,
    protologue_virtual_path,
    note,
    site_note,
    alternate_name,
	(SELECT 
		COUNT(*) 
	 FROM 
		accession
	 WHERE 
		taxonomy_species_id = ts.taxonomy_species_id) AS accession_count,
    created_date,
	created_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
	modified_date,
	modified_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
    owned_date,
    owned_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
FROM 
	taxonomy_species ts
WHERE
	name LIKE '%' + @search_string + '%'
OR
	species_name LIKE '%' + @search_string + '%'
OR
	alternate_name LIKE '%' + @search_string + '%' 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	
	SELECT 
		taxonomy_species_id,
		current_taxonomy_species_id,
		nomen_number,
		is_specific_hybrid,
		CASE
			WHEN
				EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN 
				CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
			ELSE 
				ts.name
		END AS name,
		ts.species_name,
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
		subspecies_name,
		subspecies_authority,
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
		ts.taxonomy_genus_id,
		tg.genus_name,
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
		name,
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
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
		ts.modified_date,
		ts.modified_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
		ts.owned_date,
		ts.owned_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
	FROM 
		taxonomy_species ts
	JOIN
		taxonomy_genus tg
	ON
		ts.taxonomy_genus_id = tg.taxonomy_genus_id
	WHERE
		taxonomy_species_id = @taxonomy_species_id 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_species_id INT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@modified_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE	
			taxonomy_species
		SET
			current_taxonomy_species_id = @current_taxonomy_species_id,
			is_specific_hybrid = @is_specific_hybrid,
			species_name = @species_name,
			species_authority = @species_authority,
			is_subspecific_hybrid = @is_subspecific_hybrid,
			is_varietal_hybrid = @is_varietal_hybrid,
			variety_name = @variety_name,
			variety_authority = @variety_authority,
			is_subvarietal_hybrid = @is_subvarietal_hybrid,
			subvariety_name = @subvariety_name,
			subvariety_authority = @subvariety_authority,
			is_forma_hybrid = @is_forma_hybrid,
			taxonomy_genus_id = @taxonomy_genus_id,
			life_form_code = @life_form_code,
			is_name_pending = @is_name_pending,
			synonym_code = @synonym_code,
			name_verified_date = @name_verified_date,
			name = @name,
			name_authority = @name_authority,
			protologue = @protologue,
			protologue_virtual_path = @protologue_virtual_path,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_species_id = @taxonomy_species_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesByName_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesByName_Search] 
	@search_string NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		ts.taxonomy_species_id,
		CASE
			WHEN EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
			ELSE ts.name
		END AS species_text,
		CASE
			WHEN taxonomy_species_id = current_taxonomy_species_id THEN 'Y'
			ELSE 'N'
		END AS is_accepted_name
	FROM
		taxonomy_species ts
	WHERE
		name LIKE '%' + @search_string + '%'
	OR
		species_name LIKE '%' + @search_string + '%'
	OR
		alternate_name LIKE '%' + @search_string + '%' 
END
GO

 
--=====================================================================================
-- TO RENAME (CBH, 12/7/2020
--=====================================================================================
USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesByName_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpeciesByName_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomySpecies_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulations_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulationMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyRegulation_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenii_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyGenii_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFoldersByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemCropMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderItemCropMaps_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFolder_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFiscalYearTotals_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamilies_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyFamilies_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTraits_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrTrait_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMaps_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrMap_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByUser_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Search]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrops_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Update]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCwrCrop_Delete]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxonomyCommonNames_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 12/7/2020 12:34:35 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_TaxnonomyGeniiSelect]
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxnonomyGeniiSelect]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxnonomyGeniiSelect]
	@taxonomy_family_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		*
	FROM
		taxonomy_genus tg
	WHERE
		tg.taxonomy_family_id = @taxonomy_family_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCommonNames_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCommonNames_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_common_name_id]
		,[taxonomy_genus_id]
		,[taxonomy_species_id]
		,[language_description]
		,[name]
		,[simplified_name]
		,[alternate_transcription]
		,[citation_id]
		,[note]
		,[created_date]
		,[created_by]
		,[modified_date]
		,[modified_by]
		,[owned_date]
		,[owned_by]
	FROM [gringlobal].[dbo].[taxonomy_common_name]
	WHERE taxonomy_species_id = @taxonomy_species_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Delete] 
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_crop_id INT = 0 OUTPUT,
	@crop_name nvarchar(150),
	@note nvarchar(max),
	@created_by int
AS
	BEGIN
	BEGIN TRY
		Insert into taxonomy_cwr_crop (crop_name,note,created_date,created_by,owned_date,owned_by)
		values(@crop_name,@note, GETDATE(),@created_by, GETDATE(),@created_by)
		SET @out_taxonomy_cwr_crop_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_cwr_crop_id,
		crop_name,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_crop tcc
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrop_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrop_Update]
@out_error_number INT = 0 OUTPUT,
@crop_name nvarchar(150),
@note nvarchar (MAX),
@modified_by int,
@taxonomy_cwr_crop_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_cwr_crop SET crop_name=@crop_name,note=@note,modified_date=GETDATE(),modified_by=@modified_by,owned_date=GETDATE(),owned_by=@modified_by 
	WHERE taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Delete] 
	@taxonomy_cwr_crop_id_list NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM	
		taxonomy_cwr_crop
	WHERE
		taxonomy_cwr_crop_id IN (@taxonomy_cwr_crop_id_list)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
	taxonomy_cwr_crop_id, 
	crop_name, 
	note, 
	(SELECT COUNT(taxonomy_cwr_map_id) 
	FROM taxonomy_cwr_map 
	WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
	tcc.created_date, 
	tcc.created_by, 
	(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name, 
	tcc.modified_date, tcc.modified_by, 
	(SELECT first_name + '' '' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name FROM taxonomy_cwr_crop tcc'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	--DECLARE @Results TABLE
	--(pvp_application_number INT,
	-- cultivar_name NVARCHAR(150),
 --    experimental_name NVARCHAR(150),
 --    pvp_crop_id INT,
	-- scientific_name NVARCHAR(150),
	-- common_name NVARCHAR(150),
 --    pvp_applicant_id INT,
	-- applicant_name NVARCHAR(150),
 --    application_date DATETIME2(7),
 --    is_certified_seed BIT,
 --    pvp_application_status_id INT,
	-- application_status NVARCHAR(120),
 --    status_date DATETIME2(7),
 --    certificate_issued_date DATETIME2(7),
 --    years_protected INT,
	-- expiration_date DATETIME2(7),
	-- months_remaining INT,
	-- accession_id INT)

	--INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	--SELECT *
	--FROM @Results
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCrops_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCrops_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByMonth_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByMonth_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(MONTH, -1, GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByUser_Select]
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		owned_by = @cooperator_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrCropsByWeek_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByWeek_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		created_date > DATEADD(DAY, -7, GETDATE()) 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id = @taxonomy_cwr_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_map_id INT = 0 OUTPUT,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@created_by int
AS
BEGIN
--BEGIN TRY
	Insert into taxonomy_cwr_map 
		(taxonomy_species_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		owned_date,
		owned_by)
	VALUES
		(
		 @taxonomy_species_id,
		 @taxonomy_cwr_crop_id,
		 @crop_common_name,
		 @is_crop,
		 @genepool_code,
		 @is_graftstock,
		 @is_potential,
		 @citation_id,
		 @note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_map_id = CAST(SCOPE_IDENTITY() AS INT)
--END TRY
--BEGIN CATCH
--	SELECT @out_error_number=ERROR_NUMBER()
--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT species_name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id int,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
BEGIN TRY
	UPDATE 
		[dbo].taxonomy_cwr_map 
	SET 
		taxonomy_species_id=@taxonomy_species_id,
		taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id,
		crop_common_name=@crop_common_name,
		is_crop=@is_crop,
		genepool_code=@genepool_code,
		is_graftstock=@is_graftstock,
		is_potential=@is_potential,
		citation_id=@citation_id,
		note=@note,
		modified_date= GETDATE(),
		modified_by=@modified_by,
		owned_date=GETDATE(),
		owned_by=@modified_by 
	WHERE 
		taxonomy_cwr_map_id=@taxonomy_cwr_map_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id_list INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_map
		WHERE
			taxonomy_cwr_map_id IN (@taxonomy_cwr_map_id_list)	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMaps_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMaps_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT
		taxonomy_species_id,
		(SELECT species_name 
		 FROM taxonomy_species 
		 WHERE taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_map_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + '' '' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_map tcm '

	SET @sql_statement = @sql_statement + @sql_where_clause

   EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrMapsByCrop_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMapsByCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_species_id,
		(SELECT 
			name
		 FROM
			taxonomy_species
		 WHERE
			taxonomy_species_id = tcm.taxonomy_species_id) AS species_name,
		taxonomy_cwr_crop_id,
		taxonomy_cwr_map_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcm.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_map tcm
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	ORDER BY
		crop_common_name ASC
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Delete] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DELETE FROM	
			taxonomy_cwr_trait
		WHERE
			taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Insert]
@out_error_number INT = 0 OUTPUT,
@out_taxonomy_cwr_trait_id INT = 0 OUTPUT,
@taxonomy_cwr_map_id int,
@trait_class_code nvarchar(20),
@is_potential nvarchar(1),
@breeding_type_code nvarchar(20),
@breeding_usage_note nvarchar(1000),
@ontology_trait_identifier nvarchar(20),
@citation_id int,
@note nvarchar(MAX),
@created_by int
AS
BEGIN
BEGIN TRY
	Insert into 
		taxonomy_cwr_trait 
		(taxonomy_cwr_map_id,
		 trait_class_code,
		 is_potential,
		 breeding_type_code,
		 breeding_usage_note,
		 ontology_trait_identifier,
		 citation_id,note,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by)
	values
		(@taxonomy_cwr_map_id,
		 @trait_class_code,
		 @is_potential, 
		 @breeding_type_code,
		 @breeding_usage_note,
		 @ontology_trait_identifier,
		 @citation_id,@note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_trait_id = CAST(SCOPE_IDENTITY() AS INT)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Select]
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,tct.is_potential
		,[breeding_type_code]
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,tct.modified_date
		,tct.modified_by
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	WHERE
		tct.taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTrait_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id int,
	@taxonomy_cwr_map_id int,
	@trait_class_code nvarchar(20),
	@is_potential nvarchar(1),
	@breeding_type_code nvarchar(20),
	@breeding_usage_note nvarchar(1000),
	@ontology_trait_identifier nvarchar(20),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
	BEGIN TRY
		UPDATE 
			[dbo].taxonomy_cwr_trait 
		SET 
			taxonomy_cwr_map_id=@taxonomy_cwr_map_id,
			trait_class_code=@trait_class_code,
			is_potential=@is_potential,
			breeding_type_code=@breeding_type_code,
			breeding_usage_note=@breeding_usage_note,
			ontology_trait_identifier=@ontology_trait_identifier,
			citation_id=@citation_id,
			note=@note,
			modified_date=GETDATE(),
			modified_by=@modified_by,
			owned_date=GETDATE(),
			owned_by=@modified_by 
		WHERE 
			taxonomy_cwr_trait_id=@taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyCwrTraits_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTraits_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,vtc.title AS trait_class_title
		,tct.is_potential
		,[breeding_type_code]
		,vbt.title AS breeding_type_title
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name
		,tct.modified_date
		,tct.modified_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	JOIN
		vw_taxonomy_breeding_types vbt
	ON
		tct.breeding_type_code = vbt.value
	JOIN
		vw_taxonomy_trait_classes vtc
	ON
		tct.trait_class_code = vtc.value
	WHERE
		tct.taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFamilies_Search] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT
		taxonomy_family_id,
      current_taxonomy_family_id,
      type_taxonomy_genus_id,
      suprafamily_rank_code,
      suprafamily_rank_name,
      family_name,
      family_authority,
      alternate_name,
      subfamily_name,
      tribe_name,
      subtribe_name,
    note
FROM
	taxonomy_family tf WHERE family_name LIKE ''A%'''

	SET @sql_statement = @sql_statement + @sql_where_clause

   EXECUTE sp_executesql @sql_statement
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFamilies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFamilies_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *
	FROM 
		taxonomy_family tf
	ORDER BY 
		tf.family_name
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFiscalYearTotals_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFiscalYearTotals_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @cooperator_id INT
DECLARE @start_date DATETIME2(7)
DECLARE @end_date DATETIME2(7)

SET @cooperator_id = 165283
SET @start_date = '9/30/2019'
SET @end_date = '10/1/2020'

select
	'Species Added' AS category,
	count(*) AS fiscal_year_total
from 
	taxonomy_species t
join 
	cooperator c 
on 
	t.created_by = c.cooperator_id
where 
	t.created_date > @start_date
and 
	t.created_date < @end_date
and 
	t.created_by = @cooperator_id
UNION
select 
	'Species Modified',
	count(*) modspcnt 
from 
	taxonomy_species t
join 
	cooperator c on t.modified_by = c.cooperator_id
where 
	t.modified_date > @start_date
and 
	t.modified_date < @end_date
and 
	t.modified_by = @cooperator_id
UNION
select
	'Species Verified',
	count(*) verspcnt from taxonomy_species t
join cooperator c on t.verifier_cooperator_id = c.cooperator_id
where t.name_verified_date > @start_date
and t.name_verified_date < @end_date
and t.verifier_cooperator_id = @cooperator_id
UNION 
select
	'Species Citations Added',
	count(*) newspcitcnt 
	from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_species_id is not null
UNION
select
	'Species Citations Edited',
	count(*) AS	modspcitcnt 
from citation ct
join cooperator c 
on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_species_id is not null

UNION
select 'Genus Citations Added', 
count(*) newgncitcnt from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION
select
	'Genus Citations Edited',
	count(*) modgncitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION

select
	'Families Added',
	count(*) newfamcitcnt 
	from citation ct
join 
	cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select 'Families Edited', count(*) modfamcitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select
	'Common Names Added',
	count(*) newcncnt 
from taxonomy_common_name cn
join cooperator c on cn.created_by = c.cooperator_id
where cn.created_date > @start_date
and cn.created_date < @end_date
and cn.created_by = @cooperator_id

UNION

select 
	'Common Names Edited', 
	count(*) modcncnt 
from taxonomy_common_name t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
	'Genii Added',
	count(*) newgncnt 
	from taxonomy_genus t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Genii Edited',
count(*) modgncnt 
from taxonomy_genus t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
'Distributions Added',
	count(*) newdistcnt 
	from taxonomy_geography_map t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Distributions Edited',
count(*) moddistcnt 
from taxonomy_geography_map t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select
	'Uses Added',
	count(*) newusecnt from taxonomy_use t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Uses Modified', count(*) 
modusecnt from taxonomy_use t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

--select created_by, count(*) newspcnt from taxonomy_species
--where created_date > '2016-09-30'
--and created_date < '2017-10-01'
--group by created_by





END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_id INT = 0 OUTPUT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(500),
	@is_shared BIT,
    @data_source NVARCHAR(150),
	@created_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	taxonomy_folder
			(
				title, 
				description, 
				note,
				is_shared,
				data_source,
				created_by, 
				created_date
			)
		VALUES 
			(
				@title, 
				@description, 
				@note,
				@is_shared,
				@data_source,
				@created_by, 
				GETDATE()
			)
		SELECT @out_taxonomy_folder_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		note,
		is_shared,
		data_source,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.modified_by) AS modified_by_name
	FROM 
		taxonomy_folder tf
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolder_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolder_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(2000),
	@is_shared BIT,
	@modified_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		UPDATE
			taxonomy_folder
		SET 
			title = @title, 
			description = @description, 
			note = @note,
			is_shared = @is_shared
		WHERE
			taxonomy_folder_id = @taxonomy_folder_id
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderCropForCWRItems_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		tfim.taxonomy_folder_id,
		tfim.taxonomy_folder_item_id,
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		FROM taxonomy_cwr_map 
		WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, tcc.modified_by, 
		(SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name 
	FROM 
		taxonomy_cwr_crop tcc
	JOIN
		taxonomy_folder_item_map tfim
	ON
		tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemCropMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemCropMaps_Select]
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		taxonomy_folder_item_id
		,taxonomy_folder_id
		,item_id
		taxonomy_cwr_crop_id, 
		crop_name, 
		note, 
		(SELECT COUNT(taxonomy_cwr_map_id) 
		 FROM taxonomy_cwr_map 
		 WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count, 
		tcc.created_date, 
		tcc.created_by, 
		(SELECT 
		 first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.created_by) AS created_by_name, 
		tcc.modified_date, 
		tcc.modified_by, 
		(SELECT first_name + ' ' + last_name 
		 FROM cooperator 
		 where cooperator_id = tcc.modified_by) AS modified_by_name 
	  FROM 
		taxonomy_folder_item_map tfim
	  JOIN
		taxonomy_cwr_crop tcc
ON
	tfim.item_id = tcc.taxonomy_cwr_crop_id
WHERE
	tfim.taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Delete]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Delete]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_folder_item_map_id INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		DELETE FROM
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_item_id = @taxonomy_folder_item_map_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_item_map_id INT = 0 OUTPUT,
	@taxonomy_folder_id INT,
	@data_source NVARCHAR(150),
	@item_id INT,
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	
			taxonomy_folder_item_map
			(taxonomy_folder_id,
			 data_source,
			 item_id,
			 created_by,
			 created_date)
		VALUES 
			(@taxonomy_folder_id,
			 @data_source,
			 @item_id,
			 @created_by,
			 GETDATE())
		SELECT @out_taxonomy_folder_item_map_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFolderItemMaps_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFolderItemMaps_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_item_id
      ,taxonomy_folder_id
      ,item_id
      ,created_by
      ,created_date
	FROM 
		taxonomy_folder_item_map
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyFoldersByUser_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyFoldersByUser_Select] 
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		data_source,
		note,
		is_shared,
		created_date,
		modified_date,
		(SELECT 
			COUNT(*) 
		FROM 
			taxonomy_folder_item_map
		WHERE
			taxonomy_folder_id = tf.taxonomy_folder_id) AS item_count
	FROM 
		taxonomy_folder tf
	WHERE
		created_by = @cooperator_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyGenii_Search] 
	@search_string NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		taxonomy_genus_id,
		current_taxonomy_genus_id,
		taxonomy_family_id,
		qualifying_code,
		hybrid_code,
		genus_name,
		genus_authority,
		subgenus_name,
		section_name,
		subsection_name,
		series_name,
		subseries_name,
		note,
		created_date,
		created_by,
		modified_date,
		modified_by,
		owned_date,
		owned_by,
		note,
		created_date,
		created_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.modified_by) AS modified_by_name
	FROM
		taxonomy_genus tg 
	WHERE 
		genus_name LIKE '%' + @search_string + '%'
	OR
		subgenus_name LIKE '%' + @search_string + '%'
	OR
		section_name LIKE '%' + @search_string + '%'
	OR
		subsection_name LIKE '%' + @search_string + '%'
	OR
		series_name LIKE '%' + @search_string + '%'
	OR
		subseries_name LIKE '%' + @search_string + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyGenii_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyGenii_Select]
	@taxonomy_family_id INT
AS
BEGIN
	SELECT
	   taxonomy_genus_id,
      current_taxonomy_genus_id,
      taxonomy_family_id,
      qualifying_code,
      hybrid_code,
      genus_name,
      genus_authority,
      subgenus_name,
      section_name,
      subsection_name,
      series_name,
      subseries_name,
      note,
      created_date,
      created_by,
      modified_date,
      modified_by,
      owned_date,
      owned_by,
      note,
	  created_date,
	  created_by,
      (SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.created_by) AS created_by_name,
	  modified_date,
	  modified_by,
	  (SELECT first_name + '' + last_name FROM cooperator WHERE cooperator_id = tg.modified_by) AS modified_by_name
	FROM
		taxonomy_genus tg
	WHERE
		taxonomy_family_id = @taxonomy_family_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Insert]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation (geography_id,regulation_type_code,regulation_level_code,description,url_1,url_2,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@geography_id,@regulation_type_code,@regulation_level_code,@description,@url_1,@url_2,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Select] 
	@taxonomy_regulation_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		taxonomy_regulation_id = @taxonomy_regulation_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulation_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulation_Update]
@out_error_number INT = 0 OUTPUT,
@geography_id int,
@regulation_type_code nvarchar(20),
@regulation_level_code nvarchar(20),
@description nvarchar(80),
@url_1 nvarchar(250),
@url_2 nvarchar(250),
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_id int
AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation SET geography_id=@geography_id,regulation_type_code=@regulation_type_code,regulation_level_code=@regulation_level_code,description=@description,url_1=@url_1,url_2=@url_2,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_id=@taxonomy_regulation_id AND geography_id=@geography_id AND regulation_type_code=@regulation_type_code AND regulation_level_code=@regulation_level_code AND description=@description AND url_1=@url_1 AND url_2=@url_2 AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Insert]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation_map (taxonomy_family_id,taxonomy_genus_id,taxonomy_species_id,taxonomy_regulation_id,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@taxonomy_family_id,@taxonomy_genus_id,@taxonomy_species_id,@taxonomy_regulation_id,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulationMap_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_TaxonomyRegulationMap_Update]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_map_id int

AS
BEGIN
BEGIN TRY
	UPDATE [dbo].taxonomy_regulation_map SET taxonomy_family_id=@taxonomy_family_id,taxonomy_genus_id=@taxonomy_genus_id,taxonomy_species_id=@taxonomy_species_id,taxonomy_regulation_id=@taxonomy_regulation_id,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_map_id=@taxonomy_regulation_map_id AND taxonomy_family_id=@taxonomy_family_id AND taxonomy_genus_id=@taxonomy_genus_id AND taxonomy_species_id=@taxonomy_species_id AND taxonomy_regulation_id=@taxonomy_regulation_id AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomyRegulations_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyRegulations_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Insert]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_species_id INT = 0 OUTPUT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	--BEGIN TRY
		INSERT INTO	
			taxonomy_species
			(
				current_taxonomy_species_id,
				is_specific_hybrid,
				species_name,
				species_authority,
				is_subspecific_hybrid,
				is_varietal_hybrid,
				variety_name,
				variety_authority,
				is_subvarietal_hybrid,
				subvariety_name,
				subvariety_authority,
				is_forma_hybrid,
				taxonomy_genus_id,
				life_form_code,
				is_name_pending,
				synonym_code,
				name_verified_date,
				name,
				name_authority,
				protologue,
				protologue_virtual_path,
				note,
				created_by,
				created_date,
				owned_by,
				owned_date
			)
			VALUES
			(
				@current_taxonomy_species_id,
				@is_specific_hybrid,
				@species_name,
				@species_authority,
				@is_subspecific_hybrid,
				@is_varietal_hybrid,
				@variety_name,
				@variety_authority,
				@is_subvarietal_hybrid,
				@subvariety_name,
				@subvariety_authority,
				@is_forma_hybrid,
				@taxonomy_genus_id,
				@life_form_code,
				@is_name_pending,
				@synonym_code,
				@name_verified_date,
				@name,
				@name_authority,
				@protologue,
				@protologue_virtual_path,
				@note,
				@created_by,
				GETDATE(),
				@created_by,
				GETDATE()
			)
		SET @out_taxonomy_species_id = CAST(SCOPE_IDENTITY() AS INT)
	--END TRY
	--BEGIN CATCH
	--	SELECT @out_error_number=ERROR_NUMBER()
	--END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Search] 
	@search_string NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	SELECT 
	taxonomy_species_id,
    current_taxonomy_species_id,
    nomen_number,
    is_specific_hybrid,
   CASE
		WHEN
			EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
		THEN 
			CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
		ELSE 
			ts.name
	END AS species_name,
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
    subspecies_name,
    subspecies_authority,
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
    taxonomy_genus_id,
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
    name,
    name_authority,
    protologue,
    protologue_virtual_path,
    note,
    site_note,
    alternate_name,
	(SELECT 
		COUNT(*) 
	 FROM 
		accession
	 WHERE 
		taxonomy_species_id = ts.taxonomy_species_id) AS accession_count,
    created_date,
	created_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
	modified_date,
	modified_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
    owned_date,
    owned_by,
	(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
FROM 
	taxonomy_species ts
WHERE
	name LIKE '%' + @search_string + '%'
OR
	species_name LIKE '%' + @search_string + '%'
OR
	alternate_name LIKE '%' + @search_string + '%' 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Select]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	
	SELECT 
		taxonomy_species_id,
		current_taxonomy_species_id,
		nomen_number,
		is_specific_hybrid,
		CASE
			WHEN
				EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN 
				CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
			ELSE 
				ts.name
		END AS name,
		ts.species_name,
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
		subspecies_name,
		subspecies_authority,
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
		ts.taxonomy_genus_id,
		tg.genus_name,
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
		name,
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
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
		ts.modified_date,
		ts.modified_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
		ts.owned_date,
		ts.owned_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
	FROM 
		taxonomy_species ts
	JOIN
		taxonomy_genus tg
	ON
		ts.taxonomy_genus_id = tg.taxonomy_genus_id
	WHERE
		taxonomy_species_id = @taxonomy_species_id 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpecies_Update]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpecies_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_species_id INT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@modified_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE	
			taxonomy_species
		SET
			current_taxonomy_species_id = @current_taxonomy_species_id,
			is_specific_hybrid = @is_specific_hybrid,
			species_name = @species_name,
			species_authority = @species_authority,
			is_subspecific_hybrid = @is_subspecific_hybrid,
			is_varietal_hybrid = @is_varietal_hybrid,
			variety_name = @variety_name,
			variety_authority = @variety_authority,
			is_subvarietal_hybrid = @is_subvarietal_hybrid,
			subvariety_name = @subvariety_name,
			subvariety_authority = @subvariety_authority,
			is_forma_hybrid = @is_forma_hybrid,
			taxonomy_genus_id = @taxonomy_genus_id,
			life_form_code = @life_form_code,
			is_name_pending = @is_name_pending,
			synonym_code = @synonym_code,
			name_verified_date = @name_verified_date,
			name = @name,
			name_authority = @name_authority,
			protologue = @protologue,
			protologue_virtual_path = @protologue_virtual_path,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_species_id = @taxonomy_species_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_TaxonomySpeciesByName_Search]    Script Date: 12/7/2020 12:34:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomySpeciesByName_Search] 
	@search_string NVARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		ts.taxonomy_species_id,
		CASE
			WHEN EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
			ELSE ts.name
		END AS species_text,
		CASE
			WHEN taxonomy_species_id = current_taxonomy_species_id THEN 'Y'
			ELSE 'N'
		END AS is_accepted_name
	FROM
		taxonomy_species ts
	WHERE
		name LIKE '%' + @search_string + '%'
	OR
		species_name LIKE '%' + @search_string + '%'
	OR
		alternate_name LIKE '%' + @search_string + '%' 
END
GO
