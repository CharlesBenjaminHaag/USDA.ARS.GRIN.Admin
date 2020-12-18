-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCwrCrops_Search] 
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
