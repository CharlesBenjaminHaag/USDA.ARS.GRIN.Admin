


 --drop view dsc;

create view [dbo].[dsc] as select
d.crop_trait_id as dno,
crop_id as cropno,
(select name from crop  where crop_id = d.crop_id) as crop,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=d.owned_by)) as site,
coded_name as dqname,
title,
is_peer_reviewed as cac,
category_code as dcat,data_type_code as obtype,
is_coded as usecode,is_archived
from crop_trait d
left join crop_trait_lang l on d.crop_trait_id=l.crop_trait_id



