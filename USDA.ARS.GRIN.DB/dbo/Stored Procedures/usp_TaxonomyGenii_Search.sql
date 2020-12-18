-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyGenii_Search] 
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
