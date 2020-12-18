
 CREATE PROCEDURE [usp_TaxonomyRegulationMap_Insert]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar(MAX),
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int  
AS
BEGIN
BEGIN TRY
	Insert into taxonomy_regulation_map (taxonomy_family_id,taxonomy_genus_id,taxonomy_species_id,taxonomy_regulation_id,note,created_date,created_by,modified_date,modified_by,owned_date,owned_by)
	values(@taxonomy_family_id,@taxonomy_genus_id,@taxonomy_species_id,@taxonomy_regulation_id,@note,@created_date,@created_by,@modified_date,@modified_by,@owned_date,@owned_by)
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
