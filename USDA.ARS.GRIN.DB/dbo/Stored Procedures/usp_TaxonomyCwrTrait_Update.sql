
 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_trait_id int,
	@taxonomy_cwr_map_id int,
	@trait_class_code nvarchar(20),
	@is_potential nvarchar(1),
	@breeding_type_code nvarchar(20),
	@breeding_usage_note nvarchar(1000),
	@ontology_trait_identifier nvarchar(20),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
	BEGIN TRY
		UPDATE 
			[dbo].taxonomy_cwr_trait 
		SET 
			taxonomy_cwr_map_id=@taxonomy_cwr_map_id,
			trait_class_code=@trait_class_code,
			is_potential=@is_potential,
			breeding_type_code=@breeding_type_code,
			breeding_usage_note=@breeding_usage_note,
			ontology_trait_identifier=@ontology_trait_identifier,
			citation_id=@citation_id,
			note=@note,
			modified_date=GETDATE(),
			modified_by=@modified_by,
			owned_date=GETDATE(),
			owned_by=@modified_by 
		WHERE 
			taxonomy_cwr_trait_id=@taxonomy_cwr_trait_id
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
	END
