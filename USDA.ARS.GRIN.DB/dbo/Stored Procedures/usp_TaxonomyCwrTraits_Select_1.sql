-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyCwrTraits_Select]
	@taxonomy_cwr_map_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		 [taxonomy_cwr_trait_id]
		,tct.taxonomy_cwr_map_id
		,tcm.taxonomy_cwr_crop_id
		,tcm.taxonomy_species_id
		,[trait_class_code]
		,vtc.title AS trait_class_title
		,tct.is_potential
		,[breeding_type_code]
		,vbt.title AS breeding_type_title
		,[breeding_usage_note]
		,[ontology_trait_identifier]
		,tct.citation_id
		,tct.note
		,tct.created_date
		,tct.created_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.created_by) AS created_by_name
		,tct.modified_date
		,tct.modified_by
		,(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tct.modified_by) AS modified_by_name
	FROM 
		taxonomy_cwr_trait tct
	JOIN
		taxonomy_cwr_map tcm
	ON
		tct.taxonomy_cwr_map_id = tcm.taxonomy_cwr_map_id
	JOIN
		vw_taxonomy_breeding_types vbt
	ON
		tct.breeding_type_code = vbt.value
	JOIN
		vw_taxonomy_trait_classes vtc
	ON
		tct.trait_class_code = vtc.value
	WHERE
		tct.taxonomy_cwr_map_id = @taxonomy_cwr_map_id
END
