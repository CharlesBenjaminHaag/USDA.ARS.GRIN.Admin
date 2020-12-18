-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomySpecies_Update] 
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_species_id INT,
	@current_taxonomy_species_id INT,
	@is_specific_hybrid NVARCHAR(1),
	@species_name NVARCHAR(30),
	@species_authority NVARCHAR(100),
	@is_subspecific_hybrid NVARCHAR(1),
	@is_varietal_hybrid NVARCHAR(1),
	@variety_name NVARCHAR(30),
	@variety_authority NVARCHAR(100),
	@is_subvarietal_hybrid NVARCHAR(1),
	@subvariety_name NVARCHAR(30),
	@subvariety_authority NVARCHAR(100),
	@is_forma_hybrid NVARCHAR(1),
	@taxonomy_genus_id INT,
	@life_form_code NVARCHAR(20),
	@is_name_pending NVARcHAR(1),
	@synonym_code NVARCHAR(20),
	@name_verified_date DATETIME2(7),
	@name NVARCHAR(100),
	@name_authority NVARCHAR(100),
	@protologue NVARCHAR(500),
	@protologue_virtual_path NVARCHAR(255),
	@note NVARCHAR(100),
	@modified_by INT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE	
			taxonomy_species
		SET
			current_taxonomy_species_id = @current_taxonomy_species_id,
			is_specific_hybrid = @is_specific_hybrid,
			species_name = @species_name,
			species_authority = @species_authority,
			is_subspecific_hybrid = @is_subspecific_hybrid,
			is_varietal_hybrid = @is_varietal_hybrid,
			variety_name = @variety_name,
			variety_authority = @variety_authority,
			is_subvarietal_hybrid = @is_subvarietal_hybrid,
			subvariety_name = @subvariety_name,
			subvariety_authority = @subvariety_authority,
			is_forma_hybrid = @is_forma_hybrid,
			taxonomy_genus_id = @taxonomy_genus_id,
			life_form_code = @life_form_code,
			is_name_pending = @is_name_pending,
			synonym_code = @synonym_code,
			name_verified_date = @name_verified_date,
			name = @name,
			name_authority = @name_authority,
			protologue = @protologue,
			protologue_virtual_path = @protologue_virtual_path,
			note = @note,
			modified_by = @modified_by,
			modified_date = GETDATE()
		WHERE
			taxonomy_species_id = @taxonomy_species_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
