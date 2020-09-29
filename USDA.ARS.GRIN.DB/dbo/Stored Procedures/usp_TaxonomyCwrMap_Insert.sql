
 CREATE PROCEDURE [dbo].[usp_TaxonomyCwrMap_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_cwr_map_id INT = 0 OUTPUT,
	@taxonomy_species_id int,
	@taxonomy_cwr_crop_id int,
	@crop_common_name nvarchar(100),
	@is_crop nvarchar(1),
	@genepool_code nvarchar(20),
	@is_graftstock nvarchar(1),
	@is_potential nvarchar(1),
	@citation_id int,
	@note nvarchar(MAX),
	@created_by int
AS
BEGIN
--BEGIN TRY
	Insert into taxonomy_cwr_map 
		(taxonomy_species_id,
		taxonomy_cwr_crop_id,
		crop_common_name,
		is_crop,
		genepool_code,
		is_graftstock,
		is_potential,
		citation_id,
		note,
		created_date,
		created_by,
		owned_date,
		owned_by)
	VALUES
		(
		 @taxonomy_species_id,
		 @taxonomy_cwr_crop_id,
		 @crop_common_name,
		 @is_crop,
		 @genepool_code,
		 @is_graftstock,
		 @is_potential,
		 @citation_id,
		 @note,
		 GETDATE(),
		 @created_by,
		 GETDATE(),
		 @created_by)
	SET @out_taxonomy_cwr_map_id = CAST(SCOPE_IDENTITY() AS INT)
--END TRY
--BEGIN CATCH
--	SELECT @out_error_number=ERROR_NUMBER()
--END CATCH
END
