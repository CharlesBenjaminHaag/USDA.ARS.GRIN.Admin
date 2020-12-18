-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCommonNames_Select] 
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
	FROM [$(DatabaseName)].[taxonomy_common_name]
	WHERE taxonomy_species_id = @taxonomy_species_id
END
