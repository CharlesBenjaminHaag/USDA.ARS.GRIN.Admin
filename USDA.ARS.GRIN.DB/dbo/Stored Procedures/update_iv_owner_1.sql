-- drop procedure update_iv_owner;

create  procedure update_iv_owner
@oldcno int,
@newcno int as

-- iv area
update inventory set owned_by=@newcno where owned_by=@oldcno
update inventory_action set owned_by=@newcno where owned_by=@oldcno
update inventory_viability set owned_by=@newcno where owned_by=@oldcno
update inventory_quality_status set owned_by=@newcno where owned_by=@oldcno
update inventory_maint_policy set owned_by=@newcno where owned_by=@oldcno

-- acc_inv area
update accession_inv_annotation set owned_by=@newcno where owned_by=@oldcno
update accession_inv_attach set owned_by=@newcno where owned_by=@oldcno
update accession_inv_name set owned_by=@newcno where owned_by=@oldcno




