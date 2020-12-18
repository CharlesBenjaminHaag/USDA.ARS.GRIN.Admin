-- ===========================================================================================
-- Author		: Benjamin Haag
-- Create Date	: 7/22/2019
-- Description	: Returns a list of all species in the taxonomy_species table.
-- Revision History
-- ================
-- Date			By			Description
-- ----			--			-----------
-- ===========================================================================================
CREATE PROCEDURE [usp_GetSpeciesList] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
	[taxonomy_species_id] ,
	[current_taxonomy_species_id] ,
	[nomen_number] ,
	[is_specific_hybrid] ,
	[species_name] ,
	[species_authority] ,
	[is_subspecific_hybrid] ,
	[subspecies_name] ,
	[subspecies_authority] ,
	[is_varietal_hybrid] ,
	[variety_name] ,
	[variety_authority] ,
	[is_subvarietal_hybrid] L,
	[subvariety_name] ,
	[subvariety_authority] ,
	[is_forma_hybrid] ,
	[forma_rank_type] ,
	[forma_name] ,
	[forma_authority] ,
	[taxonomy_genus_id] ,
	[priority1_site_id] ,
	[priority2_site_id] ,
	[curator1_cooperator_id] ,
	[curator2_cooperator_id] ,
	[restriction_code] ,
	[life_form_code] ,
	[common_fertilization_code] ,
	[is_name_pending] ,
	[synonym_code] ,
	[verifier_cooperator_id] ,
	[name_verified_date] ,
	[name] [,
	[name_authority] ,
	[protologue] ,
	[protologue_virtual_path] ,
	[note] ,
	[site_note] ,
	[alternate_name] ,
	[created_date],
	[created_by] ,
	[modified_date] ,
	[modified_by] ,
	[owned_date] ,
	[owned_by] 
	FROM
		taxonomy_species
	WHERE
		species_name LIKE 'AA%'
	ORDER BY
		species_name ASC
END
