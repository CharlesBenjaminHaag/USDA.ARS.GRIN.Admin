/*
   Schema change to create a view for calculated non-base inventory fields for dataviews
*/
CREATE VIEW [vc_inventory] AS
SELECT
	i.inventory_id,

	(SELECT site_id FROM cooperator WHERE cooperator_id = i.owned_by) AS site_id,

	(SELECT taxonomy_species_id FROM accession WHERE accession_id = i.accession_id) AS taxonomy_species_id,

	(select s.geography_id from accession_source s where i.accession_id = s.accession_id and accession_source_id = 
		(select MIN(accession_source_id) from accession_source s2 where i.accession_id = s2.accession_id and is_origin = 'Y')) AS geography_id,

	(SELECT MIN(plant_name)
		FROM accession_inv_name an2 JOIN inventory i2 ON i2.inventory_id = an2.inventory_id
		WHERE i2.accession_id = i.accession_id AND plant_name_rank =
			(SELECT MIN(plant_name_rank)
			FROM accession_inv_name an3 JOIN inventory i3 ON an3.inventory_id = i3.inventory_id
			WHERE i3.accession_id = i.accession_id)
	) AS plant_name,

	CASE
        WHEN EXISTS (SELECT * FROM accession_inv_name WHERE inventory_id = i.inventory_id)
        THEN (SELECT MIN(plant_name) FROM accession_inv_name WHERE inventory_id = i.inventory_id AND plant_name_rank =
                        (SELECT MIN(plant_name_rank) FROM accession_inv_name WHERE inventory_id = i.inventory_id))
        ELSE NULL
	END AS inv_name,

	iv.percent_viable,
	iv.tested_date,

	(1 + 0) * i.quantity_on_hand * iv.percent_viable / 100 AS pure_live_seed,

	CONCAT (
		CONCAT(inventory_number_part1, 
			CASE WHEN inventory_number_part2 IS NULL THEN '' 
				ELSE CONCAT(' ', CONVERT(NVARCHAR, inventory_number_part2), '')END)
	, CONCAT(CASE WHEN inventory_number_part3 IS NULL OR LTRIM(RTRIM(inventory_number_part3)) = ''
				THEN '' ELSE CONCAT(' ', LTRIM(RTRIM(inventory_number_part3))) END
		, (SELECT CASE WHEN cvl.title IS NOT NULL THEN CONCAT(' ', cvl.title) ELSE CONCAT(' ', form_type_code) END
			FROM code_value cv JOIN code_value_lang cvl ON cvl.code_value_id = cv.code_value_id
			WHERE cv.group_name = 'GERMPLASM_FORM' AND cv.value = form_type_code AND cvl.sys_lang_id = 1))
	) AS inventory_id_string

FROM
    inventory i
    LEFT JOIN inventory_viability iv ON inventory_viability_id =
        (SELECT MAX(inventory_viability_id) FROM inventory_viability WHERE inventory_id = i.inventory_id AND tested_date =
            (SELECT MAX(tested_date) FROM inventory_viability WHERE inventory_id = i.inventory_id))
