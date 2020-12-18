-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomySpeciesByName_Search] 
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
