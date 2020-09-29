create view taxtorc as select t.name as species,t.taxonomy_species_id,c.name as crop,c.crop_id
from crop c
join taxonomy_crop_map m on m.crop_id=c.crop_id
join taxonomy_species t on t.taxonomy_species_id=m.taxonomy_species_id