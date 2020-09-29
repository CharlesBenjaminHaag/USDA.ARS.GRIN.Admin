
 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Update]
	@out_error_number INT = 0 OUTPUT,
	@taxonomy_cwr_map_id int,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@modified_by int
AS
BEGIN
BEGIN TRY
	UPDATE 
		[dbo].taxonomy_cwr_map 
	SET 
		taxonomy_species_id=@taxonomy_species_id,
		taxonomy_cwr_crop_id=@taxonomy_cwr_crop_id,
		crop_common_name=@crop_common_name,
		is_crop=@is_crop,
		genepool_code=@genepool_code,
		is_graftstock=@is_graftstock,
		is_potential=@is_potential,
		citation_id=@citation_id,
		note=@note,
		modified_date= GETDATE(),
		modified_by=@modified_by,
		owned_date=GETDATE(),
		owned_by=@modified_by 
	WHERE 
		taxonomy_cwr_map_id=@taxonomy_cwr_map_id 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
