-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyGenii_Select]
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
