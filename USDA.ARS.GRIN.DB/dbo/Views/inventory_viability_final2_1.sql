



create view [inventory_viability_final2] as select
inventory_id , (select top 1 percent_viable from inventory_viability where
inventory_id=i.inventory_id order by tested_date desc)  as percent_viable,
(select top 1 FORMAT(tested_date, tested_date_code, 'en-US' ) from
inventory_viability where inventory_id=i.inventory_id order by tested_date
desc) as tested_date,
(select name from inventory_viability_rule where inventory_viability_rule_id = 
   (select inventory_viability_rule_id from inventory_viability v where v.inventory_viability_id =
      (select top 1 inventory_viability_id from inventory_viability v2 where
         v2.inventory_id=i.inventory_id order by tested_date desc))) as name
from inventory i ;


