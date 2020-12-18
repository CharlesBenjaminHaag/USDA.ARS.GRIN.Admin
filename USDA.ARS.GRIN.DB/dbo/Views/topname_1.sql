

create view [topname] as select a1.accession_id, a1.accession_id as acid,
a1.accession_number_part1 as prefix, a1.accession_number_part2 as number,
a1.accession_number_part3 as suffix, (select top 1 plant_name as topname
from accession a, accession_inv_name an, inventory i where
a.accession_id=a1.accession_id and a.accession_id=i.accession_id and
an.inventory_id=i.inventory_id order by a.accession_id,plant_name_rank) as
topname from accession a1;

