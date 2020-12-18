
 CREATE PROCEDURE [usp_TaxonomyRegulationMap_Update]
@out_error_number INT = 0 OUTPUT,
@taxonomy_family_id int,
@taxonomy_genus_id int,
@taxonomy_species_id int,
@taxonomy_regulation_id int,
@note nvarchar,
@created_date datetime2,
@created_by int,
@modified_date datetime2,
@modified_by int,
@owned_date datetime2,
@owned_by int ,
@taxonomy_regulation_map_id int

AS
BEGIN
BEGIN TRY
	UPDATE taxonomy_regulation_map SET taxonomy_family_id=@taxonomy_family_id,taxonomy_genus_id=@taxonomy_genus_id,taxonomy_species_id=@taxonomy_species_id,taxonomy_regulation_id=@taxonomy_regulation_id,note=@note,created_date=@created_date,created_by=@created_by,modified_date=@modified_date,modified_by=@modified_by,owned_date=@owned_date,owned_by=@owned_by 
	WHERE taxonomy_regulation_map_id=@taxonomy_regulation_map_id AND taxonomy_family_id=@taxonomy_family_id AND taxonomy_genus_id=@taxonomy_genus_id AND taxonomy_species_id=@taxonomy_species_id AND taxonomy_regulation_id=@taxonomy_regulation_id AND note=@note AND created_date=@created_date AND created_by=@created_by AND modified_date=@modified_date AND modified_by=@modified_by AND owned_date=@owned_date AND owned_by=@owned_by
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
