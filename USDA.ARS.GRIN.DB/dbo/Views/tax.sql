


create view [dbo].[tax] as select taxonomy_species_id as taxno,current_taxonomy_species_id as validtaxno,
taxonomy_genus_id as gno,
(select hybrid_code from taxonomy_genus g where g.taxonomy_genus_id=t.taxonomy_genus_id) as genus_hybrid_code,
(select genus_name from taxonomy_genus g where g.taxonomy_genus_id=t.taxonomy_genus_id) as genus,
name as taxon, 
name_authority as taxauthor,
species_name as species, is_specific_hybrid,
subspecies_name as subsp, is_subspecific_hybrid,
variety_name as var, is_varietal_hybrid,
forma_name as forma,
(select site_short_name from site where site_id=priority1_site_id) as psite1,
(select site_short_name from site where site_id=priority2_site_id) as psite2,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=curator1_cooperator_id) as curator1,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=curator2_cooperator_id) as curator2,
restriction_code as rest,
protologue,
note
from taxonomy_species t




