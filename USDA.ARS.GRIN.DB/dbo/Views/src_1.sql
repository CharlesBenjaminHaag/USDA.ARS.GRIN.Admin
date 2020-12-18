

create view [src] as select
accession_source_id as srcno
,accession_number_part1 as acp
,accession_number_part2  as acno
,accession_number_part3 as acs
      ,s.accession_id as acid
      ,geography_id as geono
      ,acquisition_source_code
      ,source_type_code as srctype
      ,source_date as srcdate
      ,source_date_code as datefmt
      ,is_origin
      ,quantity_collected as quant
      ,unit_quantity_collected_code as units
      ,collected_form_code as cform
      ,number_plants_sampled as plants
      ,elevation_meters as elev
      ,collector_verbatim_locality locality
	  ,associated_species
      ,latitude
      ,longitude
      ,uncertainty
      ,formatted_locality
      ,georeference_datum as datum
      ,georeference_protocol_code as gstype
      ,georeference_annotation
      ,environment_description as habitat
      ,s.is_web_visible
      ,s.note as cmt
      ,s.created_date
      ,s.created_by
      ,s.modified_date
      ,s.modified_by
      ,s.owned_date
      ,s.owned_by,
	  (select country from geo where s.geography_id=geo.geono) as country,
	  (select state from geo where s.geography_id=geo.geono) as state
	   from accession_source s, accession a where s.accession_id=a.accession_id
      



