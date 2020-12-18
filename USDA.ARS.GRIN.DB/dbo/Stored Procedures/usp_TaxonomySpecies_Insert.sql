-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomySpecies_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_species_id INT = 0 OUTPUT,
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
	@created_by INT
AS
BEGIN
	SET NOCOUNT ON;

	--BEGIN TRY
		INSERT INTO	
			taxonomy_species
			(
				current_taxonomy_species_id,
				is_specific_hybrid,
				species_name,
				species_authority,
				is_subspecific_hybrid,
				is_varietal_hybrid,
				variety_name,
				variety_authority,
				is_subvarietal_hybrid,
				subvariety_name,
				subvariety_authority,
				is_forma_hybrid,
				taxonomy_genus_id,
				life_form_code,
				is_name_pending,
				synonym_code,
				name_verified_date,
				name,
				name_authority,
				protologue,
				protologue_virtual_path,
				note,
				created_by,
				created_date,
				owned_by,
				owned_date
			)
			VALUES
			(
				@current_taxonomy_species_id,
				@is_specific_hybrid,
				@species_name,
				@species_authority,
				@is_subspecific_hybrid,
				@is_varietal_hybrid,
				@variety_name,
				@variety_authority,
				@is_subvarietal_hybrid,
				@subvariety_name,
				@subvariety_authority,
				@is_forma_hybrid,
				@taxonomy_genus_id,
				@life_form_code,
				@is_name_pending,
				@synonym_code,
				@name_verified_date,
				@name,
				@name_authority,
				@protologue,
				@protologue_virtual_path,
				@note,
				@created_by,
				GETDATE(),
				@created_by,
				GETDATE()
			)
		SET @out_taxonomy_species_id = CAST(SCOPE_IDENTITY() AS INT)
	--END TRY
	--BEGIN CATCH
	--	SELECT @out_error_number=ERROR_NUMBER()
	--END CATCH
END
