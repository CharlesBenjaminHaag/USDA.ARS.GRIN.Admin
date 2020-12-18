

create view [ipr] as select
accession_number_part1 as acp,
accession_number_part2 as acno,
accession_number_part3 as acs,
i.accession_id as acid,
type_code as iprtype,
ipr_crop_name as iprcrop,
ipr_number as iprid,
issued_date as issued,
expired_date as expired,
accepted_date as accepted,
expected_date as expected,
i.created_date as created,
i.owned_by as userid
from accession_ipr i, accession a where a.accession_id=i.accession_id;

