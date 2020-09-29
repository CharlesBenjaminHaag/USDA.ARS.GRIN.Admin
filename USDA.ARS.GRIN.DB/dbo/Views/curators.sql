
create view curators as select c.name as curator,t.name as species,site_short_name as site, maintenance_name from
inventory_maint_policy im
join inventory i on im.inventory_maint_policy_id = i.inventory_maint_policy_id
join accession a on a.accession_id=i.accession_id
join taxonomy_species t on t.taxonomy_species_id=a.taxonomy_species_id
join cooperator_view c on c.cooperator_id=im.curator_cooperator_id
group by c.name,t.name,site_short_name, maintenance_name

