

create view [vou] as select 
i.inventory_id as ivid,
inventory_number_part1 as ivp,
inventory_number_part2 as ivno,
inventory_number_part3 as ivs,
form_type_code as ivt,
accession_number_part1  as acp, 
accession_number_part2  as acno,
accession_number_part3  as acs,
a.accession_id as acid,
category_code as vtype,
virtual_path as vloc,
at.is_web_visible,
accession_inv_attach_id as vno,
thumbnail_virtual_path as thumbnail,
description as vcontent,
at.created_by,at.created_date,
at.owned_by,
at.owned_date
	from accession_inv_attach at
	 join inventory i on at.inventory_id=i.inventory_id 
	 join accession a on a.accession_id=i.accession_id

