-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_TaxonomySpeciesRelatedSpecies_Select
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	synonym_code,
	taxonomy_species_id,
	name
FROM taxonomy_species
WHERE 
	--taxonomy_species_id = @taxonomy_species_id
--AND 
	synonym_code = 'S'
UNION
SELECT 
	synonym_code,
	taxonomy_species_id,
	name
FROM taxonomy_species
WHERE 
	--taxonomy_species_id = @taxonomy_species_id
--AND 
	synonym_code = 'B'
ORDER BY
	synonym_code, name
END
