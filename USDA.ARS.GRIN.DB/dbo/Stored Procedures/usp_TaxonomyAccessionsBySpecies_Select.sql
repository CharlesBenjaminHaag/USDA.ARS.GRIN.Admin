-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_TaxonomyAccessionsBySpecies_Select
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT  [accession_id]
      ,[doi]
	  ,accession_id
	,LTRIM(RTRIM(LTRIM(COALESCE(accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, accession_number_part2), '') + ' ') + COALESCE(accession_number_part3, ''))) AS accession_text

      ,[accession_number_part1]
      ,[accession_number_part2]
      ,[accession_number_part3]
      ,[is_core]
      ,[is_backed_up]
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code]
      ,[life_form_code]
      ,[improvement_status_code]
      ,[reproductive_uniformity_code]
      ,[initial_received_form_code]
      ,[initial_received_date]
      ,[initial_received_date_code]
      ,[taxonomy_species_id]
      ,[is_web_visible]
      ,[note]
      ,[created_date]
      ,[created_by]
      ,[modified_date]
      ,[modified_by]
      ,[owned_date]
      ,[owned_by]
FROM 
	[$(DatabaseName)].[accession]
WHERE
	accession.status_code = 'ACTIVE'
AND
	accession.taxonomy_species_id = @taxonomy_species_id
END

