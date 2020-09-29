
create view [dbo].[s9ivall] as 
SELECT
  imp.maintenance_name AS IMNAME,
  (SELECT s.site_short_name FROM site s
     INNER JOIN cooperator c ON c.site_id = s.site_id
       WHERE c.cooperator_id = a.owned_by
         ) AS ACCSITE,
  (SELECT s.site_short_name FROM site s
     INNER JOIN cooperator c ON c.site_id = s.site_id
       WHERE c.cooperator_id = i.owned_by
         ) AS IVSITE,
  i.is_distributable AS DISTRIBUTE,
  a.is_core AS CORE,
  a.accession_number_part1 AS ACP,
  a.accession_number_part2 AS ACNO,
  a.accession_number_part3 AS ACS,
  i.inventory_number_part1 AS IVP,
  i.inventory_number_part2 AS IVNO,
  i.inventory_number_part3 AS IVS,
  i.form_type_code AS IVT,
  ts.name AS TAXON,
  tg.genus_name AS GENUS,
  ts.species_name AS SPECIES,
  CASE
    WHEN ts.forma_name IS NOT NULL THEN ts.forma_rank_type
    WHEN ts.subvariety_name IS NOT NULL THEN 'subvar.'
    WHEN ts.variety_name IS NOT NULL THEN 'var.'
    WHEN ts.subspecies_name IS NOT NULL THEN 'subsp.'
    ELSE NULL
    END AS RANK,
  CASE
    WHEN ts.forma_name IS NOT NULL THEN ts.forma_name
    WHEN ts.subvariety_name IS NOT NULL THEN ts.subvariety_name
    WHEN ts.variety_name IS NOT NULL THEN ts.variety_name
    WHEN ts.subspecies_name IS NOT NULL THEN ts.subspecies_name
    ELSE NULL
    END AS SUBTAX,
  i.availability_status_code AS STATUS,
  i.availability_status_note AS STATCMT,
  (SELECT MAX(FORMAT(completed_date,completed_date_code))  FROM inventory_action
    WHERE action_name_code = 'HARVESTED' AND inventory_id = i.inventory_id) AS HARVESTED,
  i.hundred_seed_weight AS IVHSWT,
  i.quantity_on_hand AS ONHAND,
  s9si.increase_location_code AS INCRLOC,
  s9si.plot_number AS PLOTNO,
  s9si.virus_status_code AS VIRUS,
  s9si.pollination_procedure_code AS POLLEN,
  iv.percent_viable AS VIABLE,
  FORMAT(iv.tested_date,iv.tested_date_code) AS TESTED,
  a.is_backed_up AS BACKED,
  i.storage_location_part1 AS LOC1,
  i.storage_location_part2 AS LOC2,
  i.storage_location_part3 AS LOC3,
  i.storage_location_part4 AS LOC4,
  i.note AS IVCMT,
  FORMAT(a.initial_received_date,a.initial_received_date_code) AS ACCREC,
  (SELECT MAX(FORMAT(completed_date,completed_date_code)) FROM inventory_action
    WHERE action_name_code = 'RECEIVED' AND inventory_id = i.inventory_id) AS IVREC,
  i.distribution_default_form_code AS DFORM,
  i.distribution_default_quantity AS DQUANT,
  i.pathogen_status_code AS PSTATUS,
  (SELECT title FROM code_value_lang cvl
      INNER JOIN code_value cv ON cvl.code_value_id = cv.code_value_id AND cvl.sys_lang_id = 1
      INNER JOIN geography g ON cv.value = g.country_code AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE'
      INNER JOIN accession_source s ON g.geography_id = s.geography_id
        WHERE s.accession_source_id = (SELECT MIN(src.accession_source_id)
        FROM accession_source src
        WHERE a.accession_id = src.accession_id and src.is_origin = 'Y')) AS COUNTRY,
  (SELECT MIN(plant_name) from accession_inv_name an, inventory i
      WHERE i.inventory_id = an.inventory_id and i.accession_id = a.accession_id and
      plant_name_rank = (select MIN(plant_name_rank) from accession_inv_name an2, inventory i2
      WHERE an2.inventory_id = i2.inventory_id and i2.accession_id = a.accession_id)) AS TOPNAME,
  i.accession_id AS ACID,
  i.inventory_id AS IVID,
  (SELECT s.geography_id from accession_source s where a.accession_id = s.accession_id
      and s.accession_source_id = (select MIN(s2.accession_source_id) from accession_source s2
      WHERE a.accession_id = s2.accession_id and is_origin = 'Y')) AS GEOGRAPHY_ID
FROM inventory i
  INNER JOIN inventory_maint_policy imp ON i.inventory_maint_policy_id = imp.inventory_maint_policy_id
  INNER JOIN accession a on i.accession_id = a.accession_id
  INNER JOIN taxonomy_species ts ON a.taxonomy_species_id = ts.taxonomy_species_id
  INNER JOIN taxonomy_genus tg ON ts.taxonomy_genus_id = tg.taxonomy_genus_id
  LEFT JOIN s9_site_inventory s9si ON i.inventory_id = s9si.inventory_id
  LEFT JOIN inventory_viability iv ON i.inventory_id = iv.inventory_id and iv.tested_date =
    (SELECT MAX(tested_date) FROM inventory_viability iv WHERE iv.inventory_id = i.inventory_id)


