-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCwrTrait_Select]
	@taxonomy_cwr_trait_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,tct.is_potential
		,[breeding_type_code]
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,tct.modified_date
		,tct.modified_by
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	WHERE
		tct.taxonomy_cwr_trait_id = @taxonomy_cwr_trait_id
END
