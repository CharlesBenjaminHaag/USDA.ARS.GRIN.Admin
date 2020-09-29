





create view [dbo].[ob] as select 
i.inventory_id as ivid,
i.inventory_number_part1 as ivp,
i.inventory_number_part2 as ivno,
i.inventory_number_part3 as ivs,
i.form_type_code as ivt,
o.is_archived,
accession_id as acid,
       (select accession_number_part1 from accession a where a.accession_id=i.accession_id) as acp, 
	   (select accession_number_part2 from accession a where a.accession_id=i.accession_id) as acno,
	   (select accession_number_part3 from accession a where a.accession_id=i.accession_id) as 
acs, r.name as crop, t.crop_trait_id as dno, coded_name as dqname, (select code from crop_trait_code 
c where c.crop_trait_code_id=o.crop_trait_code_id) as code, numeric_value, string_value, m.name as 
ename, m.method_id as eno, crop_trait_observation_id as obno,r.crop_id from method m,crop r, crop_trait t, crop_trait_observation o, inventory i 
where r.crop_id=t.crop_id and t.crop_trait_id = o.crop_trait_id and o.inventory_id=i.inventory_id 
and o.method_id=m.method_id




