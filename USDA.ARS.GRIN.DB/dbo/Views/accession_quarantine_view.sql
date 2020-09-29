

 create view [dbo].[accession_quarantine_view] as select
 accession_number_part1,
 accession_number_part2,
 accession_number_part3,
 site_short_name,
 name,
 c2.organization + ' ' + c2.address_line1 +  ' ' + c2.address_line2 as organization,
 accession_quarantine_id
      ,q.accession_id
      ,quarantine_type_code
      ,progress_status_code
      ,custodial_cooperator_id
      ,entered_date
      ,established_date
      ,expected_release_date
      ,released_date
      ,q.note
      ,q.created_date
      ,q.created_by
      ,q.modified_date
      ,q.modified_by
      ,q.owned_date
      ,q.owned_by
	  from accession_quarantine q
	  join accession a on a.accession_id=q.accession_id
	  join cooperator c on a.owned_by=c.cooperator_id
	  join site s on s.site_id=c.site_id
	  join taxonomy_species t on a.taxonomy_species_id=t.taxonomy_species_id
	  join cooperator c2 on q.custodial_cooperator_id=c2.cooperator_id

