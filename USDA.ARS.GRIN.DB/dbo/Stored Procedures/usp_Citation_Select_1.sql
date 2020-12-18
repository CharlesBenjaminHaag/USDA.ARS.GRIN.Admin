-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_Citation_Select] 
	@citation_id INT
AS

BEGIN
	SET NOCOUNT ON;
	SELECT 
		[citation_id]
	  ,c.literature_id
	  ,l.reference_title
      ,[citation_title]
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,c.url
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
      ,c.note
	FROM
		citation c
	JOIN
		literature l
	ON
		c.literature_id = l.literature_id
	WHERE
		c.citation_id = @citation_id
END
