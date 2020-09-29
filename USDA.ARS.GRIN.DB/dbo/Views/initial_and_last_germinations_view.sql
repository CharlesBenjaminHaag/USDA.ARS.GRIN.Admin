


create view [dbo].[initial_and_last_germinations_view] as select
inventory_id , (select top 1 percent_viable from inventory_viability v  where
v.inventory_id=i.inventory_id order by tested_date)  as initial_percent_viable,
(select top 1 FORMAT( tested_date, tested_date_code, 'en-US' ) from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
) as formatted_initial_tested_date,
(select top 1 cast(tested_date as datetime2) from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
) as initial_tested_date,(select top 1 percent_viable from inventory_viability v  where
v.inventory_id=i.inventory_id order by tested_date desc)  as last_percent_viable,
(select top 1 FORMAT( tested_date, tested_date_code, 'en-US' ) from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
desc) as formatted_last_tested_date,
(select top 1 cast(tested_date as datetime2) from
inventory_viability v where v.inventory_id=i.inventory_id order by tested_date
desc) as last_tested_date
from inventory i ;

