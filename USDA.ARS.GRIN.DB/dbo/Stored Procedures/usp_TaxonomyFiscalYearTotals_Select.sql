-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFiscalYearTotals_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @cooperator_id INT
DECLARE @start_date DATETIME2(7)
DECLARE @end_date DATETIME2(7)

SET @cooperator_id = 165283
SET @start_date = '9/30/2019'
SET @end_date = '10/1/2020'

select
	'Species Added' AS category,
	count(*) AS fiscal_year_total
from 
	taxonomy_species t
join 
	cooperator c 
on 
	t.created_by = c.cooperator_id
where 
	t.created_date > @start_date
and 
	t.created_date < @end_date
and 
	t.created_by = @cooperator_id
UNION
select 
	'Species Modified',
	count(*) modspcnt 
from 
	taxonomy_species t
join 
	cooperator c on t.modified_by = c.cooperator_id
where 
	t.modified_date > @start_date
and 
	t.modified_date < @end_date
and 
	t.modified_by = @cooperator_id
UNION
select
	'Species Verified',
	count(*) verspcnt from taxonomy_species t
join cooperator c on t.verifier_cooperator_id = c.cooperator_id
where t.name_verified_date > @start_date
and t.name_verified_date < @end_date
and t.verifier_cooperator_id = @cooperator_id
UNION 
select
	'Species Citations Added',
	count(*) newspcitcnt 
	from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_species_id is not null
UNION
select
	'Species Citations Edited',
	count(*) AS	modspcitcnt 
from citation ct
join cooperator c 
on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_species_id is not null

UNION
select 'Genus Citations Added', 
count(*) newgncitcnt from citation ct
join cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION
select
	'Genus Citations Edited',
	count(*) modgncitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_genus_id is not null

UNION

select
	'Families Added',
	count(*) newfamcitcnt 
	from citation ct
join 
	cooperator c on ct.created_by = c.cooperator_id
where ct.created_date > @start_date
and ct.created_date < @end_date
and ct.created_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select 'Families Edited', count(*) modfamcitcnt from citation ct
join cooperator c on ct.modified_by = c.cooperator_id
where ct.modified_date > @start_date
and ct.modified_date < @end_date
and ct.modified_by = @cooperator_id
and ct.taxonomy_family_id is not null

UNION

select
	'Common Names Added',
	count(*) newcncnt 
from taxonomy_common_name cn
join cooperator c on cn.created_by = c.cooperator_id
where cn.created_date > @start_date
and cn.created_date < @end_date
and cn.created_by = @cooperator_id

UNION

select 
	'Common Names Edited', 
	count(*) modcncnt 
from taxonomy_common_name t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
	'Genii Added',
	count(*) newgncnt 
	from taxonomy_genus t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Genii Edited',
count(*) modgncnt 
from taxonomy_genus t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select 
'Distributions Added',
	count(*) newdistcnt 
	from taxonomy_geography_map t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Distributions Edited',
count(*) moddistcnt 
from taxonomy_geography_map t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

UNION

select
	'Uses Added',
	count(*) newusecnt from taxonomy_use t
join cooperator c on t.created_by = c.cooperator_id
where t.created_date > @start_date
and t.created_date < @end_date
and t.created_by = @cooperator_id

UNION

select 'Uses Modified', count(*) 
modusecnt from taxonomy_use t
join cooperator c on t.modified_by = c.cooperator_id
where t.modified_date > @start_date
and t.modified_date < @end_date
and t.modified_by = @cooperator_id

--select created_by, count(*) newspcnt from taxonomy_species
--where created_date > '2016-09-30'
--and created_date < '2017-10-01'
--group by created_by





END
