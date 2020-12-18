
create view [al] as select accession_inv_annotation_id  as alno,
a.accession_id as acid,
accession_number_part1  as acp, 
accession_number_part2  as acno,
accession_number_part3  as acs,
annotation_type_code as action, annotation_date as acted,old_taxonomy_species_id as oldtaxno,new_taxonomy_species_id as newtaxno
      ,(select name from taxonomy_species where taxonomy_species_id=an.old_taxonomy_species_id) as oldname
      ,(select name from taxonomy_species where taxonomy_species_id=an.new_taxonomy_species_id) as newname
      ,an.created_date as created
	  ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.created_by)  as created_by
      ,an.modified_date as modified
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.modified_by) as modified_by
      ,an.owned_date
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.owned_by) as owned_by
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
	  from accession_inv_annotation an, accession a, inventory i where
	  an.inventory_id=i.inventory_id and a.accession_id=i.accession_id


