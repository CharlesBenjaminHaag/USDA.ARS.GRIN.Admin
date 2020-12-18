
create view [hordeum_1] as 
select 
 genus,ord.orno,coop,coop.cno,cat,year(acted) as yr,count(*) as ct,acimpt,coop.country,
 (case coop.country when 'United States' Then 'Domestic'
 else 'Foreign' 
 end ) as category
 from coop, ord, oi,acc where oi.acid=acc.acid and coop.cno=ord.final and
   ord.orno=oi.orno and  oi.status in ('SHIPPED','INSPECT','PSHIP')
      and ord.ortype = 'DI' and year(oi.acted) between 2014 and 2015
          and acc.acid in (select acid from acc where genus='Hordeum') 
		  group by genus,ord.orno,coop,coop.cno,cat,year(acted),acimpt ,coop.country,
		  (case coop.country when 'United States' Then 'Domestic'
 else 'Foreign' end)
