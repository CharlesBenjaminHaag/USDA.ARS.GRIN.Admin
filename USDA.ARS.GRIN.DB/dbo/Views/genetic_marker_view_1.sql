create view [genetic_marker_view] as select c.name as crop,g.name as marker_name,
synonyms,repeat_motif,primers,assay_conditions,range_products,map_location,poly_type_code
from  crop c, genetic_marker g where
c.crop_id=g.crop_id

