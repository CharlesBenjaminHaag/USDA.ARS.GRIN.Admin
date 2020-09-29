
 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrTrait_Insert]
@out_error_number INT = 0 OUTPUT,
@out_taxonomy_cwr_trait_id INT = 0 OUTPUT,
@taxonomy_cwr_map_id int,
@trait_class_code nvarchar(20),
@is_potential nvarchar(1),
@breeding_type_code nvarchar(20),
@breeding_usage_note nvarchar(1000),
@ontology_trait_identifier nvarchar(20),
@citation_id int,
@note nvarchar(MAX),
@created_by int
AS
BEGIN
BEGIN TRY
	Insert into 
		taxonomy_cwr_trait 
		(taxonomy_cwr_map_id,
		 trait_class_code,
		 is_potential,
		 breeding_type_code,
		 breeding_usage_note,
		 ontology_trait_identifier,
		 citation_id,note,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by)
	values
		(@taxonomy_cwr_map_id,
		 @trait_class_code,
		 @is_potential, 
		 @breeding_type_code,
		 @breeding_usage_note,
		 @ontology_trait_identifier,
		 @citation_id,@note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_trait_id = CAST(SCOPE_IDENTITY() AS INT)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
