-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFamilies_Search] 
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
