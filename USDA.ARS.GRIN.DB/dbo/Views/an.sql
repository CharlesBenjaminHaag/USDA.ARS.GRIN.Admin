


-- drop view an
create view [dbo].[an] as select
accession_inv_name_id as anno,
i.inventory_id as ivid,
i.inventory_number_part1 as ivp,
i.inventory_number_part2 as ivno,
i.inventory_number_part3 as ivs,
i.form_type_code as ivt,
i.accession_id as acid,
accession_number_part1 as acp,
accession_number_part2 as acno,
accession_number_part3 as acs,
category_code as idtype,
plant_name as plantid,
plant_name_rank as idrank,
(select group_name from name_group g where an.name_group_id=g.name_group_id) as agname,
name_group_id,
an.is_web_visible,
an.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.created_by) as created_by,
an.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.modified_by) as modified_by,
an.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.owned_by) as owned_by,
an.owned_by as owned_by_id
from accession a, inventory i, accession_inv_name an where
a.accession_id=i.accession_id and an.inventory_id=i.inventory_id;



