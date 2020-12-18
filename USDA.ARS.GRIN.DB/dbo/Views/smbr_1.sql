

create view [smbr] as select accession_source_id as srcno, m.cooperator_id as cno, lname,  fname,  org,
country, state, cat from accession_source_map m
join coop c on m.cooperator_id=c.cno


