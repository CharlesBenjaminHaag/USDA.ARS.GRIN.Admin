
create view crop_trait_observation_view as 
SELECT
  cto.crop_trait_observation_id,
  rtrim(a.accession_number_part1 + ' ' + cast(a.accession_number_part2 as nvarchar(20)) + ' ' + isnull(a.accession_number_part3,'')) as accession,
  inventory_number_part1 + ' ' + cast(inventory_number_part2 as nvarchar(20)) +  rtrim(' ' + isnull(inventory_number_part3,'')) + ' ' + form_type_code as inventory,
  (select name from crop c where c.crop_id=ct.crop_id) as crop,
  (select ctl.title from crop_trait_lang ctl where ctl.crop_trait_id=ct.crop_trait_id) as 'crop trait',
  (select title from crop_trait_code_lang ctcl where ctcl.crop_trait_code_id = cto.crop_trait_code_id) AS 'coded value',
  (select ctc.code from crop_trait_code ctc where ctc.crop_trait_code_id = cto.crop_trait_code_id) AS 'trait code',  
  cto.numeric_value as 'numeric value',
  cto.string_value as 'text value',
  (select m.name from method m where m.method_id=cto.method_id) as method,
  cto.is_archived as 'is archived?',
  cto.data_quality_code as 'data quality',
  cto.original_value as 'original value',
  cto.frequency,
  cto.rank,
  cto.mean_value as 'mean value',
  cto.maximum_value as 'maximum value',
  cto.minimum_value as 'minimum value',
  cto.standard_deviation as 'standard deviation',
  cto.sample_size as 'sample size',
  cto.note,
  (SELECT name FROM taxonomy_species t  WHERE t.taxonomy_species_id = a.taxonomy_species_id) AS taxon,
  format(cto.created_date,'MM/dd/yyyy') as 'created date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.created_by) as 'created by',
  format(cto.modified_date,'MM/dd/yyyy') as 'modified date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.modified_by) as 'modified by',
  format(cto.owned_date,'MM/dd/yyyy') as 'owned date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.owned_by) as 'owned by'

FROM
    crop_trait_observation cto
    JOIN inventory i ON  i.inventory_id = cto.inventory_id 
	join accession a on a.accession_id = i.accession_id
    JOIN crop_trait ct ON  ct.crop_trait_id = cto.crop_trait_id 
