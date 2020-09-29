


create view [dbo].[inventory_viability_final_view] as select
inventory_id , (select top 1 percent_viable from inventory_viability v  where
v.inventory_id=i.inventory_id order by tested_date desc)  as last_percent_viable,
(select top 1 FORMAT( tested_date, tested_date_code, 'en-US' ) from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
desc) as formatted_last_tested_date,
(select top 1 tested_date from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
desc) as last_tested_date
from inventory i ;



