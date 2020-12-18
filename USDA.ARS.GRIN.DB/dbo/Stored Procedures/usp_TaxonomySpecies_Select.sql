-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomySpecies_Select] 
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	
	SELECT 
		taxonomy_species_id,
		current_taxonomy_species_id,
		nomen_number,
		is_specific_hybrid,
		CASE
			WHEN
				EXISTS (SELECT * FROM taxonomy_species ts2 WHERE ts.name = ts2.name AND ts.taxonomy_species_id != ts2.taxonomy_species_id)
			THEN 
				CONCAT(ts.name, CONCAT(' ', COALESCE(ts.name_authority, '')))
			ELSE 
				ts.name
		END AS name,
		ts.species_name,
		CASE
			WHEN 
				taxonomy_species_id = current_taxonomy_species_id 
			THEN
				'Y'
			ELSE 
				'N'
		END AS is_accepted_name,
		species_authority,
		is_subspecific_hybrid,
		subspecies_name,
		subspecies_authority,
		is_varietal_hybrid,
		variety_name,
		variety_authority,
		is_subvarietal_hybrid,
		subvariety_name,
		subvariety_authority,
		is_forma_hybrid,
		forma_rank_type,
		forma_name,
		forma_authority,
		ts.taxonomy_genus_id,
		tg.genus_name,
		priority1_site_id,
		priority2_site_id,
		curator1_cooperator_id,
		curator2_cooperator_id,
		restriction_code,
		life_form_code,
		common_fertilization_code,
		is_name_pending,
		synonym_code,
		verifier_cooperator_id,
		name_verified_date,
		name,
		name_authority,
		protologue,
		protologue_virtual_path,
		ts.note,
		site_note,
		alternate_name,
		(SELECT 
			COUNT(*) 
		 FROM 
			accession
		 WHERE 
			taxonomy_species_id = ts.taxonomy_species_id) AS accession_count,
		ts.created_date,
		ts.created_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.created_by) AS created_by_name,
		ts.modified_date,
		ts.modified_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.modified_by) AS modified_by_name,
		ts.owned_date,
		ts.owned_by,
		(SELECT first_name + '' + last_name FROM cooperator where cooperator_id = ts.owned_by) AS owned_by_name
	FROM 
		taxonomy_species ts
	JOIN
		taxonomy_genus tg
	ON
		ts.taxonomy_genus_id = tg.taxonomy_genus_id
	WHERE
		taxonomy_species_id = @taxonomy_species_id 
END
