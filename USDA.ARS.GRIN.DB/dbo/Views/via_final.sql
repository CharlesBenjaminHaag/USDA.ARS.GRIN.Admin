

create view [dbo].[via_final] as select
inventory_id as ivid, (select top 1 percent_viable from inventory_viability where
inventory_id=i.inventory_id order by tested_date desc)  as last_germ,
(select top 1 CONVERT (varchar(10),tested_date,101) from
inventory_viability where inventory_id=i.inventory_id order by tested_date
desc) as last_date from inventory i ;
