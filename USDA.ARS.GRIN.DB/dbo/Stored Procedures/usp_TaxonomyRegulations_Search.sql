-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyRegulations_Search]
	@search_text NVARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sql_statement NVARCHAR(2000)
	SET @sql_statement = 'SELECT 
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
		tr.geography_id = g.geography_id'

	SET @sql_statement = @sql_statement + ' ' + @search_text

   EXECUTE sp_executesql @sql_statement


	
END
