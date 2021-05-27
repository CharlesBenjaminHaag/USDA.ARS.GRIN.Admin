USE [gringlobal]
GO
/****** Object:  View [dbo].[web_order_request_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[web_order_request_view]
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_trait_classes]
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genus_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepools]
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_genepool_codes]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_trait_class_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_genepool_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_taxonomy_breeding_types]
GO
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_table_fields]
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_sys_application]
GO
/****** Object:  View [dbo].[vw_pvp_applications_by_expiration]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_pvp_applications_by_expiration]
GO
/****** Object:  View [dbo].[vw_nrr_orders]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_nrr_orders]
GO
/****** Object:  View [dbo].[vw_lookup_site_emails]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_site_emails]
GO
/****** Object:  View [dbo].[vw_lookup_cooperator_category]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_cooperator_category]
GO
/****** Object:  View [dbo].[vw_cgc_lookup_document_categories]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_cgc_lookup_document_categories]
GO
/****** Object:  View [dbo].[vw_accession_ipr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_accession_ipr]
GO
/****** Object:  View [dbo].[vou]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vou]
GO
/****** Object:  View [dbo].[via_final]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[via_final]
GO
/****** Object:  View [dbo].[vc_inventory]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vc_inventory]
GO
/****** Object:  View [dbo].[taxtorc]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxtorc]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_use_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_use_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_noxious_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_noxious_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_geography_map_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_geography_map_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_genus_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_genus_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_family_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_family_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_common_name_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_common_name_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_author_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_author_view]
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_alt_family_map_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_taxonomy_alt_family_map_view]
GO
/****** Object:  View [dbo].[taxgeo_species_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_species_view]
GO
/****** Object:  View [dbo].[taxgeo_site_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_site_view]
GO
/****** Object:  View [dbo].[taxgeo_site_qs_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_site_qs_view]
GO
/****** Object:  View [dbo].[taxgeo_region_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_region_view]
GO
/****** Object:  View [dbo].[taxgeo_geography_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_geography_view]
GO
/****** Object:  View [dbo].[taxgeo_geography_region_map_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_geography_region_map_view]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_tertiary_tu]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_tertiary_tu]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_tertiary_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_tertiary_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_secondary_tu]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_secondary_tu]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_secondary_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_secondary_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_quaternary_tu]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_quaternary_tu]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_quaternary_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_quaternary_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_progenitor_tu]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_progenitor_tu]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_progenitor_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_progenitor_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_primary_tu]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_primary_tu]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_primary_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_genetic_primary_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_crop_cwr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_crop_cwr]
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_crop_cm]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cwr_validation_crop_cm]
GO
/****** Object:  View [dbo].[taxgeo_cooperator2_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cooperator2_view]
GO
/****** Object:  View [dbo].[taxgeo_cooperator_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_cooperator_view]
GO
/****** Object:  View [dbo].[tax]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[tax]
GO
/****** Object:  View [dbo].[sys_table_field_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[sys_table_field_view]
GO
/****** Object:  View [dbo].[s9ivall]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[s9ivall]
GO
/****** Object:  View [dbo].[order_request_item_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[order_request_item_view]
GO
/****** Object:  View [dbo].[order_packing_report_SSRS]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[order_packing_report_SSRS]
GO
/****** Object:  View [dbo].[oact]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[oact]
GO
/****** Object:  View [dbo].[mbr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[mbr]
GO
/****** Object:  View [dbo].[iv]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[iv]
GO
/****** Object:  View [dbo].[ipr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[ipr]
GO
/****** Object:  View [dbo].[inventory_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[inventory_view]
GO
/****** Object:  View [dbo].[inventory_viability_final2]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[inventory_viability_final2]
GO
/****** Object:  View [dbo].[inventory_viability_final_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[inventory_viability_final_view]
GO
/****** Object:  View [dbo].[initial_and_last_germinations_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[initial_and_last_germinations_view]
GO
/****** Object:  View [dbo].[iact]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[iact]
GO
/****** Object:  View [dbo].[geography_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[geography_view]
GO
/****** Object:  View [dbo].[genetic_marker_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[genetic_marker_view]
GO
/****** Object:  View [dbo].[genetic_annotation_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[genetic_annotation_view]
GO
/****** Object:  View [dbo].[dsc]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[dsc]
GO
/****** Object:  View [dbo].[crop_trait_observation_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[crop_trait_observation_view]
GO
/****** Object:  View [dbo].[code]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[code]
GO
/****** Object:  View [dbo].[cd]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[cd]
GO
/****** Object:  View [dbo].[an]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[an]
GO
/****** Object:  View [dbo].[al]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[al]
GO
/****** Object:  View [dbo].[acit]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[acit]
GO
/****** Object:  View [dbo].[accession_quarantine_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[accession_quarantine_view]
GO
/****** Object:  View [dbo].[accession_flag]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[accession_flag]
GO
/****** Object:  View [dbo].[accession_export]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[accession_export]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recently_available]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_recently_available]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recent_applications]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_recent_applications]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_expired_this_week]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_expired_this_week]
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_available]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_ars_grin_pvp_available]
GO
/****** Object:  View [dbo].[vw_pvp_application_accession_map]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_pvp_application_accession_map]
GO
/****** Object:  View [dbo].[order_request_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[order_request_view]
GO
/****** Object:  View [dbo].[vw_lookup_geography]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_geography]
GO
/****** Object:  View [dbo].[vw_lookup_code_value]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[vw_lookup_code_value]
GO
/****** Object:  View [dbo].[taxgeo_literature_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_literature_view]
GO
/****** Object:  View [dbo].[taxgeo_citation_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[taxgeo_citation_view]
GO
/****** Object:  View [dbo].[smbr]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[smbr]
GO
/****** Object:  View [dbo].[hordeum_1]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[hordeum_1]
GO
/****** Object:  View [dbo].[web_order_request_item_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[web_order_request_item_view]
GO
/****** Object:  View [dbo].[s9_cucumis]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[s9_cucumis]
GO
/****** Object:  View [dbo].[acc]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[acc]
GO
/****** Object:  View [dbo].[ob]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[ob]
GO
/****** Object:  View [dbo].[web_qry_orders]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[web_qry_orders]
GO
/****** Object:  View [dbo].[web_qry_order_items]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[web_qry_order_items]
GO
/****** Object:  View [dbo].[ord]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[ord]
GO
/****** Object:  View [dbo].[oi]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[oi]
GO
/****** Object:  View [dbo].[curators]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[curators]
GO
/****** Object:  View [dbo].[cooperator_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[cooperator_view]
GO
/****** Object:  View [dbo].[mcpd]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[mcpd]
GO
/****** Object:  View [dbo].[accession_view]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[accession_view]
GO
/****** Object:  View [dbo].[topname]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[topname]
GO
/****** Object:  View [dbo].[src]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[src]
GO
/****** Object:  View [dbo].[im]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[im]
GO
/****** Object:  View [dbo].[coop]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[coop]
GO
/****** Object:  View [dbo].[geo]    Script Date: 5/26/2021 9:18:35 PM ******/
DROP VIEW IF EXISTS [dbo].[geo]
GO
/****** Object:  View [dbo].[geo]    Script Date: 5/26/2021 9:18:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[geo] as SELECT title as country,adm1 as
state,adm1_abbrev as st,geography_id as geono,current_geography_id as
validgeono,country_code as iso3 from code_value v,code_value_lang
l,geography g where l.code_value_id = v.code_value_id and
g.country_code=v.value and v.group_name='GEOGRAPHY_COUNTRY_CODE' and
sys_lang_id=1;

GO
/****** Object:  View [dbo].[coop]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop view coop
-- go

create view [dbo].[coop] as select 
cooperator_id as cno,
current_cooperator_id as validcno,
site_id,
last_name as lname,
title,
first_name as fname,
job,
organization as org,
organization_abbrev as orgid,
address_line1 as add1,
address_line2 as add2,
address_line3 as add3,
city,
postal_index as zip,
geography_id as geono,
(select country from geo where geono=c.geography_id) as country,
(select state from geo where geono=c.geography_id) as state,
(select st from geo where geono=c.geography_id) as state_code,
secondary_organization,
secondary_organization_abbrev,
secondary_address_line1,
secondary_address_line2,
secondary_address_line3,
secondary_city,
secondary_postal_index,
secondary_geography_id,
primary_phone as phone1,
secondary_phone as phone2,
fax,
email,
secondary_email,
status_code as active,
category_code as cat,
organization_region_code as arsregion,
discipline_code as discipline,
last_name + ', ' + SUBSTRing(first_name,1,1) + '., ' + isnull(organization,'') as coop,
note as cmt,
sys_lang_id,
web_cooperator_id,
created_date,
created_by,
modified_date,
modified_by,
owned_date,
owned_by,
(select first_name + ' ' + last_name from cooperator d where d.cooperator_id=c.owned_by) as person,
(select site_short_name from site where site.site_id=c.site_id) as site
from cooperator c;




GO
/****** Object:  View [dbo].[im]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[im] as select
inventory_maint_policy_id as imno,
maintenance_name as imname,
form_type_code as ivt,
quantity_on_hand_unit_code as munits,
web_availability_note,
is_auto_deducted as debit,
distribution_default_form_code as dform,
distribution_default_quantity as dquant,
distribution_unit_code as dunits,
distribution_critical_quantity as dcritical,
regeneration_critical_quantity as rcritical,
regeneration_method_code as regen,
curator_cooperator_id as cno,
(select coop from coop where cno=curator_cooperator_id) as curator,
note as cmt, created_date,
created_by, modified_date, modified_by, owned_date, owned_by
,(select coop from coop where cno=im.owned_by) as owner
 ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=im.owned_by)) as site 
from inventory_maint_policy im;
GO
/****** Object:  View [dbo].[src]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[src] as select
accession_source_id as srcno
,accession_number_part1 as acp
,accession_number_part2  as acno
,accession_number_part3 as acs
      ,s.accession_id as acid
      ,geography_id as geono
      ,acquisition_source_code
      ,source_type_code as srctype
      ,source_date as srcdate
      ,source_date_code as datefmt
      ,is_origin
      ,quantity_collected as quant
      ,unit_quantity_collected_code as units
      ,collected_form_code as cform
      ,number_plants_sampled as plants
      ,elevation_meters as elev
      ,collector_verbatim_locality locality
	  ,associated_species
      ,latitude
      ,longitude
      ,uncertainty
      ,formatted_locality
      ,georeference_datum as datum
      ,georeference_protocol_code as gstype
      ,georeference_annotation
      ,environment_description as habitat
      ,s.is_web_visible
      ,s.note as cmt
      ,s.created_date
      ,s.created_by
      ,s.modified_date
      ,s.modified_by
      ,s.owned_date
      ,s.owned_by,
	  (select country from geo where s.geography_id=geo.geono) as country,
	  (select state from geo where s.geography_id=geo.geono) as state
	   from accession_source s, accession a where s.accession_id=a.accession_id
      



GO
/****** Object:  View [dbo].[topname]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[topname] as select a1.accession_id, a1.accession_id as acid,
a1.accession_number_part1 as prefix, a1.accession_number_part2 as number,
a1.accession_number_part3 as suffix, (select top 1 plant_name as topname
from accession a, accession_inv_name an, inventory i where
a.accession_id=a1.accession_id and a.accession_id=i.accession_id and
an.inventory_id=i.inventory_id order by a.accession_id,plant_name_rank) as
topname from accession a1;

GO
/****** Object:  View [dbo].[accession_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[accession_view] as/****** Script for SelectTopNRows command from SSMS  ******/

SELECT  -- include is_avail and origin
      accession_id
      ,[accession_number_part1] as accession_prefix
      ,[accession_number_part2] as accession_number
      ,[accession_number_part3] as accession_suffix
	  ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site_short_name
      ,dbo.get_avstat(accession_id) as is_available
	  ,(select top 1 country from src where src.acid=a.accession_id and is_origin = 'Y') as origin
	  ,(select top 1 srctype from src where src.acid=a.accession_id and is_origin = 'Y') as source_type_code
	  ,(select topname from topname t where a.accession_id=t.accession_id) as topname
      ,is_web_visible
      ,[is_core] 
      ,[is_backed_up] 
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code] 
      ,[life_form_code] 
      ,[improvement_status_code] 
      ,[reproductive_uniformity_code] 
      ,[initial_received_form_code] 
      ,[initial_received_date] 
      ,[initial_received_date_code] 
      ,[taxonomy_species_id] 
      ,[note]
      ,[created_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by)  as created_by
      ,[modified_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by
      ,[owned_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by
      ,(select name from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as name
      ,(select genus_name from taxonomy_genus where taxonomy_genus_id = (select taxonomy_genus_id from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id)) as genus_name
      ,(select case when (is_specific_hybrid = 'Y') then 'x ' +  species_name else species_name end
         from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as species_name
		,(select case 
         when  (forma_name is not null)  then 'f. ' + forma_name 
         else
           case 
	         when (variety_name is not null) then 'var. ' + variety_name 
	         else
	           case 
		         when (subspecies_name is not null) then 'subsp. ' + subspecies_name 
	           end
	       end
        end 
		from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtaxon_name
      ,(select case 
         when  (forma_name is not null)  then  forma_authority
         else
           case 
	         when (variety_name is not null) then variety_authority
	         else
	           case 
		         when (subspecies_name is not null) then  subspecies_authority
	           end
	       end
        end 
		from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtaxon_authority
		FROM [gringlobal].[dbo].[accession] a


GO
/****** Object:  View [dbo].[mcpd]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 30/sep/2016 this version gets subtax and author from accession_view

create view [dbo].[mcpd] as
select a.accession_id,
s.fao_institute_number INSTCODE,
rtrim(a.accession_number_part1) + ' ' + rtrim(CONVERT(char(8),a.accession_number_part2)) + ' ' + ltrim(isnull(accession_number_part3,' ')) ACCENUMB,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'COLLECTOR') COLLNUMB,
null as COLLCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_COLLECTED.accession_source_id order by c.organization) COLLNAME,
(select top 1 ltrim(coalesce(address_line1,'') + ' ' + coalesce(address_line2,'') + ' ' + coalesce(address_line3,'') + ' ' + coalesce(city,'') + ' ' + coalesce(postal_index,'') + ' ' + (select country_code from geography where geography_id = c.geography_id))  from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_COLLECTED.accession_source_id) COLLINSTADDRESS,
Null as COLLMISSID,
tg.genus_name GENUS,
ts.species_name SPECIES,
ts.species_authority SPAUTHOR,
(select subtaxon_name from accession_view av where av.accession_id=a.accession_id) as SUBTAXA, 
(select subtaxon_authority from accession_view av where av.accession_id=a.accession_id) as SUBTAUTHOR,
null as CROP,
(select top 1 plant_name from accession_inv_name where inventory_id in (select inventory_id from inventory i2 where a.accession_id=i2.accession_id) order by plant_name_rank) ACCENAME,
convert(varchar, a.initial_received_date, 112) ACQDATE,
g.country_code ORIGCTY,
cvl.title [COUNTRY NAME],
aso_COLLECTED.collector_verbatim_locality COLLSITE,
aso_COLLECTED.latitude DECLATITUDE,
aso_COLLECTED.longitude DECLONGITUDE,
aso_COLLECTED.uncertainty COORDUNCERT,
aso_COLLECTED.georeference_datum COORDDATUM,
aso_COLLECTED.georeference_protocol_code GEOREFMETH,
aso_COLLECTED.elevation_meters ELEVATION,
case when aso_collected.source_date is not null then
        case when aso_collected.source_date_code = 'YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + '----'
             when aso_collected.source_date_code = 'MM/YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + CONVERT(char(2),month(aso_collected.source_date)) + '--'
             when aso_collected.source_date_code = 'MM/DD/YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + right('00' + rtrim(CONVERT(char(2),month(aso_collected.source_date))),2) + right('00' + rtrim(CONVERT(char(2),day(aso_collected.source_date))),2)
         else CONVERT(char(4),year(aso_collected.source_date)) + right('00' + rtrim(CONVERT(char(2),month(aso_collected.source_date))),2) + right('00'+ rtrim(CONVERT(char(2),day(aso_collected.source_date))),2) end end  COLLDATE,
(select top 1 note from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_BREDCODE.accession_source_id) BREDCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_BREDCODE.accession_source_id order by c.organization) BREDNAME,
(select case improvement_status_code 
   when 'BREEDING' then '410'
   when 'CLONE' then '416'
   when 'CULTIVAR' then '500'
   when 'CULTIVATED' then '300'
   when 'GENETIC' then '420'
   when 'LANDRACE' then '300'
   when 'WILD' then '100'
   else '999'
   end 

 from accession where accession_id = a.accession_id) SAMPSTAT,
rtrim(ltrim((select description from accession_pedigree where accession_id = a.accession_id and description is not null))) + case when (select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code like 'ANCEST')is null then '' else ';' + (select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code like 'ANCEST') end ANCEST,
 aso_COLLECTED.acquisition_source_code COLLSRC,
null as DONORCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_DONORCODE.accession_source_id order by c.organization) DONORNAME,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'DONOR') DONORNUMB,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'OTHER') OTHERNUMB,
(case when a.backup_location1_site_id is not null and a.backup_location2_site_id is not null then (select fao_institute_number from site where site_id = a.backup_location1_site_id) + ';' + (select fao_institute_number from site where site_id = a.backup_location2_site_id)
      when a.backup_location1_site_id is not null and a.backup_location2_site_id is null then (select fao_institute_number from site where site_id = a.backup_location1_site_id)
      when a.backup_location1_site_id is null and a.backup_location2_site_id is not null then (select fao_institute_number from site where site_id = a.backup_location2_site_id)
      else
      null end) DUPLSITE,
(select top 1 m.name from inventory invp inner join method m on invp.preservation_method_id = m.method_id where accession_id = a.accession_id and form_type_code <> '**')  STORAGE,
case when exists (select type_code from accession_ipr where accession_id = a.accession_id and type_code='MTA-SMTA') then 1 else 0 end MLSSTAT,
RTRIM(ltrim(a.note)) REMARKS,
null as availability,
(case a.status_code   when 'ACTIVE' then 'N' else 'Y' end)  as historic,
'http://npgsweb.ars-grin.gov/gringlobal/accessiondetail.aspx?id=' + rtrim(cast(a.accession_id as varchar(12))) ACCEURL
from accession a  
inner join taxonomy_species ts on a.taxonomy_species_id = ts.taxonomy_species_id 
inner join taxonomy_genus tg on ts.taxonomy_genus_id = tg.taxonomy_genus_id
inner join inventory i on a.accession_id = i.accession_id and form_type_code = '**'
left join Accession_pedigree ap on ap.accession_id = a.accession_id
left join accession_source aso on aso.accession_id = a.accession_id and is_origin = 'Y'
left join accession_source aso_BREDCODE on aso_BREDCODE.accession_id = a.accession_id and aso_BREDCODE.source_type_code = 'DEVELOPED'
left join accession_source aso_COLLECTED on aso_COLLECTED.accession_id = a.accession_id and aso_COLLECTED.source_type_code = 'COLLECTED' and aso_COLLECTED.is_origin='Y'
left join accession_source aso_DONORCODE on aso_DONORCODE.accession_id = a.accession_id and aso_DONORCODE.source_type_code = 'DONATED'
left join cooperator coo on coo.cooperator_id = a.owned_by
left join site s on s.site_id = coo.site_id
left join geography g on aso_COLLECTED.geography_id = g.geography_id
left join code_value cv on g.country_code = cv.value and cv.group_name like 'GEOGRAPHY_COUNTRY_CODE'
left join code_value_lang cvl on cv.code_value_id = cvl.code_value_id and cvl.sys_lang_id = 1 
where a.status_code in ('ACTIVE','INACTIVE') and a.is_web_visible = 'Y'








GO
/****** Object:  View [dbo].[cooperator_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


;

create view [dbo].[cooperator_view] as select 
cooperator_id ,
current_cooperator_id ,
(select site_short_name from site where site.site_id=c.site_id) as site_short_name,
last_name,
title,
first_name,
job,
organization ,
organization_abbrev,
address_line1,
address_line2 ,
address_line3,
city,
postal_index,
(select country from geo where geono=c.geography_id) as country,
(select state from geo where geono=c.geography_id) as state,
(select st from geo where geono=c.geography_id) as state_code,primary_phone,
secondary_phone ,
fax,
email,
secondary_email,
status_code,
category_code,
organization_region_code,
discipline_code,
COALESCE(c.last_name,'') + ', ' + COALESCE(c.first_name,'') + ', ' + COALESCE(c.organization,'') as name,
c.note as cmt,
sys_lang_id,
web_cooperator_id,
c.created_date,
c.created_by,
c.modified_date,
c.modified_by,
c.owned_date,
c.owned_by
from cooperator c
GO
/****** Object:  View [dbo].[curators]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[curators] as select c.name as curator,t.name as species,site_short_name as site, maintenance_name from
inventory_maint_policy im
join inventory i on im.inventory_maint_policy_id = i.inventory_maint_policy_id
join accession a on a.accession_id=i.accession_id
join taxonomy_species t on t.taxonomy_species_id=a.taxonomy_species_id
join cooperator_view c on c.cooperator_id=im.curator_cooperator_id
group by c.name,t.name,site_short_name, maintenance_name

GO
/****** Object:  View [dbo].[oi]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[oi] as select 
order_request_item_id as itno,
order_request_id as orno,
web_order_request_item_id,
(select order_type_code from order_request ord where oi.order_request_id=ord.order_request_id) as ortype,
sequence_number as oino,
name as item,
quantity_shipped as quant,
quantity_shipped_unit_code as units,
distribution_form_code as dform,
oi.status_code as status,
status_date as acted,
oi.inventory_id as ivid,
inventory_number_part1 as ivp,
inventory_number_part2 as ivno,
inventory_number_part3 as ivs,
form_type_code as ivt,
external_taxonomy as taxon,
source_cooperator_id as cno,
a.accession_id as acid,
accession_number_part1 as acp,
accession_number_part2 as acno,
accession_number_part3 as acs,
oi.note as cmt,
web_user_note,
oi.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.created_by) as created_by,
oi.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.modified_by) as modified_by,
oi.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.owned_by) as owned_by,
oi.owned_by as owned_by_id,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=oi.owned_by)) as site
from order_request_item oi, inventory i, accession a
where oi.inventory_id=i.inventory_id and i.accession_id=a.accession_id


GO
/****** Object:  View [dbo].[ord]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[ord] as select
order_request_id as orno,
original_order_request_id as origno,
web_order_request_id,
local_number as localno,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=o.owned_by)) as site,
order_type_code as ortype,
(select count(*) from order_request_item oi where oi.order_request_id=o.order_request_id) as items,
ordered_date as ordered,
intended_use_code,
intended_use_note,
completed_date,
requestor_cooperator_id as orderer,
ship_to_cooperator_id as shipto,
final_recipient_cooperator_id as final,
(select fname + ' ' + lname + ', ' + org + ' - ' + isnull(city,' ') from coop where cno=final_recipient_cooperator_id) as recipient,
(select country from coop where cno=final_recipient_cooperator_id) as country,
order_obtained_via as reqref,
feedback_id,
special_instruction,
note as cmt,
created_date,
created_by,
modified_date,
modified_by,
owned_date,
owned_by
from order_request o;




GO
/****** Object:  View [dbo].[web_qry_order_items]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- current good one

create view [dbo].[web_qry_order_items] as 

select site,isnull(UARS,0) as UARS, isnull(UFED,0) as UFED, isnull(STA,0) as STA, isnull(UCOM,0) as UCOM, isnull(UPRU,0) as UPRU , 
isnull(UIND,0) as UIND, isnull(UAID,0) as UAID, isnull(INT,0)as INT, isnull(FGEN,0) as FGEN,
 isnull(FCOM,0) as FCOM, isnull(FPRU,0) as FPRU, isnull(FIND,0) as FIND,
 isnull(UARS,0)+isnull(UFED,0)+isnull(STA,0)+isnull(UCOM,0)+isnull(UPRU,0)+isnull(UIND,0)+isnull(UAID,0)
+isnull(INT,0)+isnull(FGEN,0)+isnull(FCOM,0)+isnull(FPRU,0)+isnull(FIND,0) AS '{TOTAL}',received,ortype from

(
   select ' ' + ord.site as site,cat,ISNULL(COUNT(*),0) XCOUNT,cast(oi.acted as datetime2) as received,ord.ortype
  from ord,oi,coop where ord.orno=oi.orno and ord.final=coop.cno -- and ord.ortype in ('DI','RP') 
  and oi.status in ('INSPECT','PSHIP','SHIPPED') -- and year(oi.acted) = 2017 
	  group by ' ' + ord.site,cat,cast(oi.acted as datetime2),ord.ortype
) src
pivot
(
 sum(xcount)
  for cat in ([UARS], [UFED], [STA], [UCOM], [UPRU] , [UIND], [UAID], [INT], [FGEN], [FCOM], [FPRU], [FIND])
  
) piv

GO
/****** Object:  View [dbo].[web_qry_orders]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- current good one

create view [dbo].[web_qry_orders] as 

select site,isnull(UARS,0) as UARS, isnull(UFED,0) as UFED, isnull(STA,0) as STA, isnull(UCOM,0) as UCOM, isnull(UPRU,0) as UPRU , 
isnull(UIND,0) as UIND, isnull(UAID,0) as UAID, isnull(INT,0)as INT, isnull(FGEN,0) as FGEN,
 isnull(FCOM,0) as FCOM, isnull(FPRU,0) as FPRU, isnull(FIND,0) as FIND,
 isnull(UARS,0)+isnull(UFED,0)+isnull(STA,0)+isnull(UCOM,0)+isnull(UPRU,0)+isnull(UIND,0)+isnull(UAID,0)
+isnull(INT,0)+isnull(FGEN,0)+isnull(FCOM,0)+isnull(FPRU,0)+isnull(FIND,0) AS '{TOTAL}',received,ortype from

(
   select ' ' + ord.site as site,cat,ISNULL(COUNT(distinct ord.orno),0) XCOUNT,cast(oi.acted as datetime2) as received,ord.ortype
  from ord,oi,coop where ord.orno=oi.orno and ord.final=coop.cno -- and ord.ortype in ('DI','RP') 
  and oi.status in ('INSPECT','PSHIP','SHIPPED') -- and year(oi.acted) = 2017 
	  group by ' ' + ord.site,cat,cast(oi.acted as datetime2),ord.ortype
) src
pivot
(
 sum(xcount)
  for cat in ([UARS], [UFED], [STA], [UCOM], [UPRU] , [UIND], [UAID], [INT], [FGEN], [FCOM], [FPRU], [FIND])
  
) piv


GO
/****** Object:  View [dbo].[ob]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create view [dbo].[ob] as select 
i.inventory_id as ivid,
i.inventory_number_part1 as ivp,
i.inventory_number_part2 as ivno,
i.inventory_number_part3 as ivs,
i.form_type_code as ivt,
o.is_archived,
accession_id as acid,
       (select accession_number_part1 from accession a where a.accession_id=i.accession_id) as acp, 
	   (select accession_number_part2 from accession a where a.accession_id=i.accession_id) as acno,
	   (select accession_number_part3 from accession a where a.accession_id=i.accession_id) as 
acs, r.name as crop, t.crop_trait_id as dno, coded_name as dqname, (select code from crop_trait_code 
c where c.crop_trait_code_id=o.crop_trait_code_id) as code, numeric_value, string_value, m.name as 
ename, m.method_id as eno, crop_trait_observation_id as obno,r.crop_id from method m,crop r, crop_trait t, crop_trait_observation o, inventory i 
where r.crop_id=t.crop_id and t.crop_trait_id = o.crop_trait_id and o.inventory_id=i.inventory_id 
and o.method_id=m.method_id




GO
/****** Object:  View [dbo].[acc]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[acc] as/****** Script for SelectTopNRows command from SSMS  ******/

SELECT  [accession_id] as acid
      ,accession_id
      ,[accession_number_part1] as acp
      ,[accession_number_part2] as acno
      ,[accession_number_part3] as acs
      ,[is_core] as core
      ,[is_backed_up] as is_backed_up
      ,[backup_location1_site_id]
      ,[backup_location2_site_id]
      ,[status_code] 
      ,[life_form_code] as lifeform
      ,[improvement_status_code] as acimpt
      ,[reproductive_uniformity_code] as uniform
      ,[initial_received_form_code] acform
      ,[initial_received_date] as received
      ,[initial_received_date_code] datefmt
      ,[taxonomy_species_id] as taxno
      ,[note]
      ,[created_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by)  as created_by
      ,[modified_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by
      ,[owned_date]
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
      ,is_web_visible
      ,(select name from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as taxon
      ,(select genus_name from taxonomy_genus where taxonomy_genus_id = (select taxonomy_genus_id from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id)) as genus
      ,(select case when (is_specific_hybrid = 'Y') then 'x ' +  species_name else species_name end
         from taxonomy_species where taxonomy_species_id=a.taxonomy_species_id) as species
      ,(select case 
         when  (forma_name is not null)  then 'f. ' + forma_name 
         else
           case 
	         when (variety_name is not null) then 'var. ' + variety_name
	         else
	           case 
		         when (subspecies_name is not null) then 
				    case
					   when is_subspecific_hybrid = 'Y' then 'nothosubsp. ' + subspecies_name
					   else 'subsp. ' + subspecies_name
				    end
	           end
	       end
        end from taxonomy_species  where taxonomy_species_id=a.taxonomy_species_id) as subtax
		-- dbo.get_avstat(accession_id) as availability
		FROM [gringlobal].[dbo].[accession] a





GO
/****** Object:  View [dbo].[s9_cucumis]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[s9_cucumis] as
select acp,acno,acs,acid
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29001 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS VINELENGTH
,stuff((SELECT ';' + code  FROM ob WHERE dno=29002 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS MATURITY
,stuff((SELECT ';' + code  FROM ob WHERE dno=29003 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSHAPE
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29004 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITLEN
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29005 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITDIAM
,stuff((SELECT ';' + code  FROM ob WHERE dno=29006 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSURF
,stuff((SELECT ';' + code  FROM ob WHERE dno=29007 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITCOLOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29008 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS DMILDEW
,stuff((SELECT ';' + code  FROM ob WHERE dno=29009 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS PMILDEW
,stuff((SELECT ';' + code  FROM ob WHERE dno=29010 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FLESHCOLOR
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29011 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FLESHDEPTH
,stuff((SELECT ';' + code  FROM ob WHERE dno=29012 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSET
,stuff((SELECT ';' + code  FROM ob WHERE dno=29013 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSPOT
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29015 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITWGT
,stuff((SELECT ';' + code  FROM ob WHERE dno=29016 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS PLANTHABIT
,stuff((SELECT ';' + code  FROM ob WHERE dno=29017 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFORMITY
,stuff((SELECT ';' + code  FROM ob WHERE dno=29018 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS VIGOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29019 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS CAVITYCOLO
,stuff((SELECT ';' + code  FROM ob WHERE dno=29020 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSIZE
,stuff((SELECT ';' + code  FROM ob WHERE dno=29021 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSHAPE
,stuff((SELECT ';' + code  FROM ob WHERE dno=29022 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFCOLOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29023 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSURF
,stuff((SELECT ';' + code  FROM ob WHERE dno=29024 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS STRIPECOL
,stuff((SELECT ';' + code  FROM ob WHERE dno=29025 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS IMAGE
from acc
			group by acp,acno,acs,acid
GO
/****** Object:  View [dbo].[web_order_request_item_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[web_order_request_item_view] as
	select
	web_order_request_item_id,
wor.web_cooperator_id,
wor.web_order_request_id,
wori.status_code,
cast (wor.ordered_date as datetime2) as ordered_date,
a.accession_id,
	accession_prefix as prefix,
	accession_number as number,
	accession_suffix as suffix,
	site_short_name as site,

wori.name,
a.name as taxon,
quantity_shipped,
sequence_number,
unit_of_shipped_code,
distribution_form_code,
curator_note,
user_note,
wori.created_date,
wori.created_by,
wori.modified_date,
wori.modified_by,
wori.owned_date,
wori.owned_by
	from web_order_request_item wori
	join accession_view a on a.accession_id=wori.accession_id
	join web_order_request wor on wor.web_order_request_id=wori.web_order_request_id


GO
/****** Object:  View [dbo].[hordeum_1]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[hordeum_1] as 
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
GO
/****** Object:  View [dbo].[smbr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[smbr] as select accession_source_id as srcno, m.cooperator_id as cno, lname,  fname,  org,
country, state, cat from accession_source_map m
join coop c on m.cooperator_id=c.cno


GO
/****** Object:  View [dbo].[taxgeo_citation_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- drop view taxgeo_citation_view 

create view [dbo].[taxgeo_citation_view] as 
SELECT  [citation_id]
      ,[literature_id]
      ,[citation_title]
      ,[author_name]
      ,[citation_year]
      ,[reference]
      ,[doi_reference]
      ,[url]
      ,[title]
      ,[description]
      ,[accession_id]
      ,[method_id]
      ,[taxonomy_species_id]
      ,[taxonomy_genus_id]
      ,[taxonomy_family_id]
      ,[accession_ipr_id]
      ,[accession_pedigree_id]
      ,[genetic_marker_id]
      ,[type_code]
      ,[unique_key]
	  ,[is_accepted_name]
      ,[note]
      ,[created_date]
      ,4 as created_by
      ,modified_date
      ,case when modified_by is not null then 4 else null end as modified_by
      ,[owned_date]
      ,4 as owned_by
  FROM [gringlobal].[dbo].[citation]  where  taxonomy_species_id is not null





GO
/****** Object:  View [dbo].[taxgeo_literature_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop view taxgeo_literature_view

create view [dbo].[taxgeo_literature_view] as select
literature_id,
abbreviation,
standard_abbreviation,
reference_title,
editor_author_name,
literature_type_code,
publication_year,
publisher_name,
publisher_location,
url,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by 
from literature where literature_id in (select distinct literature_id from taxgeo_citation_view)
GO
/****** Object:  View [dbo].[vw_lookup_code_value]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW
	[dbo].[vw_lookup_code_value]
AS
SELECT
	cv.code_value_id,
	cv.group_name,
	cv.value,
	cvl.title,
	cvl.description,
	cv.created_date,
	cv.modified_date
FROM
	code_value cv
JOIN
	code_value_lang cvl
ON
	cv.code_value_id = cvl.code_value_id
WHERE
	cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_lookup_geography]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_geography]
AS
SELECT 
	r.continent,
	r.subcontinent,
	(SELECT title FROM vw_lookup_code_value WHERE value = g.country_code AND group_name = 'GEOGRAPHY_COUNTRY_CODE') As country_name,
	g.adm1,
	(SELECT title FROM vw_lookup_code_value WHERE value = g.adm1_type_code AND group_name = 'GEOGRAPHY_ADMIN1_TYPE') AS adm1_type,
	g.adm2,
	g.adm2_type_code
	--geography_id,
	--country_code,
	--adm1,
	--adm1_type_code,
	--adm2,
	--adm2_type_code
  FROM 
	geography g
	LEFT OUTER JOIN
	geography_region_map grm
	ON
		g.geography_id = grm.geography_id
	LEFT OUTER JOIN	
		region r
	ON
		grm.region_id = r.region_id
--ORDER BY
--	continent,
--	subcontinent,
--	country_name, 
--	g.adm1
 
GO
/****** Object:  View [dbo].[order_request_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- drop view order_request_view

CREATE view [dbo].[order_request_view] as select
order_request_id,
original_order_request_id,
c.site_short_name,
web_order_request_id,
local_number,
order_type_code,
ordered_date,
intended_use_code,
intended_use_note,
completed_date,
requestor_cooperator_id,
ship_to_cooperator_id,
final_recipient_cooperator_id,
c2.name,
c2.city,
c2.state,
c2.country,
c2.category_code
,order_obtained_via
,feedback_id
,special_instruction
,note
,o.created_date
,o.created_by
,o.modified_date
,o.modified_by
,o.owned_date
,o.owned_by from order_request o
join cooperator_view c on c.cooperator_id=o.owned_by
join cooperator_view c2 on c2.cooperator_id=o.final_recipient_cooperator_id

GO
/****** Object:  View [dbo].[vw_pvp_application_accession_map]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vw_pvp_application_accession_map]
AS
SELECT  
	pa.pvp_application_number,
	ai.ipr_number,
	ai.accession_ipr_id,
	ai.accession_id
FROM
	pvp_application pa
JOIN
	accession_ipr ai
ON
	pa.pvp_application_number = dbo.fn_extract_integer(ipr_number)
WHERE type_code = 'PVP'  
	and ipr_number not like '%MP'
    and ipr_number not like '%FP'
	and ipr_number not like '%P1'
	and ipr_number not like '%P2'
	and ipr_number not like '%P3'
	and dbo.get_avstat(ai.accession_id) = 'Y'

--,cast(substring(ipr_number,5,20) as int) AS pv_number
--,[accession_ipr_id]
--      ,ai.accession_id
--      ,[type_code]
--      ,[ipr_number]
--      ,[ipr_crop_name]
--      ,[ipr_full_name]
--      ,[issued_date]
--      ,[expired_date]
--      ,[cooperator_id]
--      --,[note]
--      ,[accepted_date]
--      ,[expected_date]
--      --,[created_date]
--      --,[created_by]
--      --,[modified_date]
--      --,[modified_by]
--      --,[owned_date]
--      --,[owned_by]
--  FROM [gringlobal].[dbo].[accession_ipr] ai
--  JOIN
--	accession a
--	ON 
--	ai.accession_id = a.accession_id
--	LEFT JOIN
--	pvp_application pa
--ON
--	pa.pvp_application_number = cast(substring(ipr_number,5,20) as int)
--  WHERE type_code = 'PVP'  
--	and ipr_number not like '%MP'
--    and ipr_number not like '%FP'
--	and ipr_number not like '%P1'
--	and ipr_number not like '%P2'
--	and ipr_number not like '%P3'
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_available]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ars_grin_pvp_available]
AS
SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE
	vpam.accession_id IS NOT NULL
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_expired_this_week]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ars_grin_pvp_expired_this_week]
AS
SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) >= DATEADD(day, -7, GETDATE())
	AND (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) < GETDATE()
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recent_applications]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ars_grin_pvp_recent_applications]
AS
SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	
	WHERE
	 DATEDIFF(month,cast(application_date as date),GETDATE()) BETWEEN 1 AND 3
GO
/****** Object:  View [dbo].[vw_ars_grin_pvp_recently_available]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ars_grin_pvp_recently_available]
AS
SELECT 
	 pa.pvp_application_number
     ,[cultivar_name]
     ,[experimental_name]
     ,pa.pvp_common_name_id
	 ,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,vpam.accession_id
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_pvp_application_accession_map vpam
	ON
		pa.pvp_application_number = vpam.pvp_application_number
	WHERE
		vpam.accession_id IS NOT NULL
	AND
		pas.pvp_application_status_id != 18
	AND
		DATEDIFF(month,status_date,GETDATE()) < 6
	AND 
		status_date < getdate()
GO
/****** Object:  View [dbo].[accession_export]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[accession_export] as 
SELECT
  a.accession_id,
 '<a onclick="javascript:return true;" href="~/accessiondetail.aspx?id=' + rtrim(cast(a.accession_id as varchar(12))) + '">View</a>' AS Url,
  rtrim(a.accession_number_part1) + ' ' + str(a.accession_number_part2,8,0) + ' ' + ltrim(isnull(accession_number_part3,' ')) AS Plant_ID,
  ts.name AS Species,
  (select top 1 plant_name from accession_inv_name where inventory_id in (select inventory_id from inventory i2 where a.accession_id=i2.accession_id) order by plant_name_rank) AS Plant_Name,
  year(a.initial_received_date) AS Received,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as Site,
  aso.source_type_code AS Source_Type,
  FORMAT(source_date, source_date_code, 'en-US' ) AS Source_Date,
  cvl.title AS Source_Country,
g.adm1 as State_Province,
case aso.is_web_visible when 'N' then
  'Not publicly visible'
else
   aso.collector_verbatim_locality 
end as Collection_Site,
case  aso.is_web_visible when 'N' then
  null 
else
  cast(aso.latitude as nvarchar(20))
end  as Latitude,
case  aso.is_web_visible when 'N' then
  null 
else
  cast(aso.longitude as nvarchar(20))
end as Longitude,
case  aso.is_web_visible when 'N' then
  null
else
  cast(aso.elevation_meters as nvarchar(20))
end as Elevation, 
case  aso.is_web_visible when 'N' then
  null
else
  aso.environment_description
end as Habitat, 
a.improvement_status_code AS Biological_Status,
ap.description AS Pedigree,
a.note as Narrative,
case when exists (select inventory_id from inventory where is_distributable = 'Y' AND  is_available = 'Y' and accession_id = a.accession_id) then
		case 
			-- when sum(case when i.is_distributable = 'Y' AND i.is_available = 'Y' then 1 else 0 end) = 0 then ''
			when ts.restriction_code = 'NARCOTIC' then '<nobr><font color="red">Not Available</font></nobr>'
			when ts.restriction_code in ('WEED', 'RARE') then '<nobr><font color="orange">Contact Site</font></nobr>'
 		else 		
			concat('<nobr><a href="~/cartview.aspx?action=add&id=', convert(nvarchar, a.accession_id), '">Add to Cart</a></nobr>')
		end 	
	else
 		case when a.status_code = 'INACTIVE' then '<nobr><font color="red">INACTIVE</font></nobr>'
		else '<nobr><font color="red">Not Available</font></nobr>' end	
 	end as Availability
 FROM
    accession a
    INNER JOIN taxonomy_species ts
      ON  a.taxonomy_species_id = ts.taxonomy_species_id 
    LEFT JOIN accession_pedigree ap
      ON  ap.accession_id = a.accession_id 
    LEFT JOIN accession_source aso
      ON  aso.accession_id = a.accession_id 
          and  is_origin = 'Y' 
    LEFT JOIN geography g
      ON  aso.geography_id = g.geography_id 
    LEFT JOIN code_value cv
      ON  g.country_code = cv.value 
          and  cv.group_name like 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl
      ON  cv.code_value_id = cvl.code_value_id 
          and  cvl.sys_lang_id = 1 

WHERE
	 a.is_web_visible = 'Y'

GO
/****** Object:  View [dbo].[accession_flag]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[accession_flag] as
SELECT
   accession_id,
   accession_number_part1,
   accession_number_part2,
   accession_number_part3,
   status_code,
   CASE a.status_code
      WHEN 'ACTIVE' THEN 'Y'
	  ELSE 'N'
   END AS is_active,
   CASE WHEN EXISTS (SELECT inventory_id FROM inventory WHERE accession_id = a.accession_id AND is_distributable = 'Y' AND is_available = 'Y')
      THEN 'Y'
	  ELSE 'N'
   END AS is_available,
   CASE WHEN EXISTS (SELECT i.inventory_id FROM inventory i INNER JOIN accession_inv_attach aia ON i.inventory_id = aia.inventory_id WHERE i.accession_id = a.accession_id AND aia.category_code = 'IMAGE')
      THEN 'Y'
	  ELSE 'N'
   END AS is_image,
   (SELECT s.site_short_name FROM cooperator c INNER JOIN site s ON s.site_id = c.site_id WHERE c.cooperator_id = a.owned_by) AS site
FROM accession a

GO
/****** Object:  View [dbo].[accession_quarantine_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 create view [dbo].[accession_quarantine_view] as select
 accession_number_part1,
 accession_number_part2,
 accession_number_part3,
 site_short_name,
 name,
 c2.organization + ' ' + c2.address_line1 +  ' ' + c2.address_line2 as organization,
 accession_quarantine_id
      ,q.accession_id
      ,quarantine_type_code
      ,progress_status_code
      ,custodial_cooperator_id
      ,entered_date
      ,established_date
      ,expected_release_date
      ,released_date
      ,q.note
      ,q.created_date
      ,q.created_by
      ,q.modified_date
      ,q.modified_by
      ,q.owned_date
      ,q.owned_by
	  from accession_quarantine q
	  join accession a on a.accession_id=q.accession_id
	  join cooperator c on a.owned_by=c.cooperator_id
	  join site s on s.site_id=c.site_id
	  join taxonomy_species t on a.taxonomy_species_id=t.taxonomy_species_id
	  join cooperator c2 on q.custodial_cooperator_id=c2.cooperator_id

GO
/****** Object:  View [dbo].[acit]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[acit] as select * from citation where accession_id is
not null

GO
/****** Object:  View [dbo].[al]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[al] as select accession_inv_annotation_id  as alno,
a.accession_id as acid,
accession_number_part1  as acp, 
accession_number_part2  as acno,
accession_number_part3  as acs,
annotation_type_code as action, annotation_date as acted,old_taxonomy_species_id as oldtaxno,new_taxonomy_species_id as newtaxno
      ,(select name from taxonomy_species where taxonomy_species_id=an.old_taxonomy_species_id) as oldname
      ,(select name from taxonomy_species where taxonomy_species_id=an.new_taxonomy_species_id) as newname
      ,an.created_date as created
	  ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.created_by)  as created_by
      ,an.modified_date as modified
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.modified_by) as modified_by
      ,an.owned_date
      ,(select last_name + ', ' + first_name from cooperator where cooperator_id=an.owned_by) as owned_by
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
	  from accession_inv_annotation an, accession a, inventory i where
	  an.inventory_id=i.inventory_id and a.accession_id=i.accession_id


GO
/****** Object:  View [dbo].[an]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- drop view an
create view [dbo].[an] as select
accession_inv_name_id as anno,
i.inventory_id as ivid,
i.inventory_number_part1 as ivp,
i.inventory_number_part2 as ivno,
i.inventory_number_part3 as ivs,
i.form_type_code as ivt,
i.accession_id as acid,
accession_number_part1 as acp,
accession_number_part2 as acno,
accession_number_part3 as acs,
category_code as idtype,
plant_name as plantid,
plant_name_rank as idrank,
(select group_name from name_group g where an.name_group_id=g.name_group_id) as agname,
name_group_id,
an.is_web_visible,
an.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.created_by) as created_by,
an.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.modified_by) as modified_by,
an.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=an.owned_by) as owned_by,
an.owned_by as owned_by_id
from accession a, inventory i, accession_inv_name an where
a.accession_id=i.accession_id and an.inventory_id=i.inventory_id;



GO
/****** Object:  View [dbo].[cd]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[cd] as select name as crop, c.crop_id as cropno,coded_name as 
dqname,d.crop_trait_id as dno,code,title as def,cd.crop_trait_code_id, crop_trait_code_lang_id from crop c, crop_trait d, crop_trait_code cd, 
crop_trait_code_lang l where c.crop_id=d.crop_id and d.crop_trait_id=cd.crop_trait_id and 
cd.crop_trait_code_id=l.crop_trait_code_id
GO
/****** Object:  View [dbo].[code]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[code] as select v.code_value_id,code_value_lang_id,group_name,value,title,description from code_value v, code_value_lang l where v.code_value_id=l.code_value_id and sys_lang_id = 1 



GO
/****** Object:  View [dbo].[crop_trait_observation_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[crop_trait_observation_view] as 
SELECT
  cto.crop_trait_observation_id,
  rtrim(a.accession_number_part1 + ' ' + cast(a.accession_number_part2 as nvarchar(20)) + ' ' + isnull(a.accession_number_part3,'')) as accession,
  inventory_number_part1 + ' ' + cast(inventory_number_part2 as nvarchar(20)) +  rtrim(' ' + isnull(inventory_number_part3,'')) + ' ' + form_type_code as inventory,
  (select name from crop c where c.crop_id=ct.crop_id) as crop,
  (select ctl.title from crop_trait_lang ctl where ctl.crop_trait_id=ct.crop_trait_id) as 'crop trait',
  (select title from crop_trait_code_lang ctcl where ctcl.crop_trait_code_id = cto.crop_trait_code_id) AS 'coded value',
  (select ctc.code from crop_trait_code ctc where ctc.crop_trait_code_id = cto.crop_trait_code_id) AS 'trait code',  
  cto.numeric_value as 'numeric value',
  cto.string_value as 'text value',
  (select m.name from method m where m.method_id=cto.method_id) as method,
  cto.is_archived as 'is archived?',
  cto.data_quality_code as 'data quality',
  cto.original_value as 'original value',
  cto.frequency,
  cto.rank,
  cto.mean_value as 'mean value',
  cto.maximum_value as 'maximum value',
  cto.minimum_value as 'minimum value',
  cto.standard_deviation as 'standard deviation',
  cto.sample_size as 'sample size',
  cto.note,
  (SELECT name FROM taxonomy_species t  WHERE t.taxonomy_species_id = a.taxonomy_species_id) AS taxon,
  format(cto.created_date,'MM/dd/yyyy') as 'created date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.created_by) as 'created by',
  format(cto.modified_date,'MM/dd/yyyy') as 'modified date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.modified_by) as 'modified by',
  format(cto.owned_date,'MM/dd/yyyy') as 'owned date',
  (select last_name + ',' + first_name + ',' + isnull(organization,'') from cooperator c where c.cooperator_id = cto.owned_by) as 'owned by'

FROM
    crop_trait_observation cto
    JOIN inventory i ON  i.inventory_id = cto.inventory_id 
	join accession a on a.accession_id = i.accession_id
    JOIN crop_trait ct ON  ct.crop_trait_id = cto.crop_trait_id 
GO
/****** Object:  View [dbo].[dsc]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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



GO
/****** Object:  View [dbo].[genetic_annotation_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create view [dbo].[genetic_annotation_view] as select c.name as crop, g.name as marker_name, m.name  as dataset,
  assay_method
      ,scoring_method
      ,control_values
      ,observation_alleles_count
      ,max_gob_alleles
      ,size_alleles
      ,unusual_alleles from crop c, genetic_marker g, method m, genetic_annotation a
	  where g.crop_id=c.crop_id and g.genetic_marker_id=a.genetic_marker_id and a.method_id=m.method_id
GO
/****** Object:  View [dbo].[genetic_marker_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[genetic_marker_view] as select c.name as crop,g.name as marker_name,
synonyms,repeat_motif,primers,assay_conditions,range_products,map_location,poly_type_code
from  crop c, genetic_marker g where
c.crop_id=g.crop_id

GO
/****** Object:  View [dbo].[geography_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[geography_view] as SELECT vl.title as country,adm1 as
state,geography_id ,current_geography_id ,country_code
from geography g
join  code_value v on g.country_code=v.value and v.group_name='GEOGRAPHY_COUNTRY_CODE'
join code_value_lang vl on vl.code_value_id = v.code_value_id and vl.sys_lang_id=1




GO
/****** Object:  View [dbo].[iact]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[iact] as
SELECT 
       inventory_action_id as iactno
      ,a.inventory_id as ivid
      ,[inventory_number_part1] as ivp
      ,[inventory_number_part2] as ivno
      ,[inventory_number_part3] as ivs
      ,[form_type_code] as ivt
	  ,action_name_code as event
	  ,started_date
	  ,completed_date
	  ,quantity as quant
	  ,quantity_unit_code as units
	  ,form_code as iform
	  ,method_id as ename
    ,a.note,
a.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.created_by) as created_by,
a.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.modified_by) as modified_by,
a.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=a.owned_by) as owned_by,
a.owned_by as owned_by_id,
      (select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as site
  FROM [gringlobal].[dbo].[inventory_action] a, inventory i where a.inventory_id=i.inventory_id



GO
/****** Object:  View [dbo].[initial_and_last_germinations_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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

GO
/****** Object:  View [dbo].[inventory_viability_final_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



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



GO
/****** Object:  View [dbo].[inventory_viability_final2]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create view [dbo].[inventory_viability_final2] as select
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


GO
/****** Object:  View [dbo].[inventory_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[inventory_view] as
SELECT 
        a.accession_number_part1  as accession_prefix 
	   ,a.accession_number_part2  as accession_number
	   ,a.accession_number_part3  as accession_suffix
      ,[inventory_id] 
      ,[inventory_number_part1] as inventory_prefix
      ,[inventory_number_part2] as inventory_number
      ,[inventory_number_part3] as inventory_suffix
      ,[form_type_code]
      ,i.inventory_number_part1 + isnull(rtrim(' ' + CONVERT(NVARCHAR, i.inventory_number_part2)),'') + isnull(RTRIM(' ' + i.inventory_number_part3),'') + ' ' + i.form_type_code AS inventory
      ,(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=i.owned_by)) as site_short_name
      ,(select maintenance_name from inventory_maint_policy where i.inventory_maint_policy_id=inventory_maint_policy_id) as maintenance_name
      ,[is_distributable]
      ,[storage_location_part1]
      ,[storage_location_part2]
      ,[storage_location_part3]
      ,[storage_location_part4]
      ,[latitude] 
      ,[longitude]
      ,[is_available]
      ,[web_availability_note] 
      ,[availability_status_code]
      ,[availability_status_note]
      ,[availability_start_date] 
      ,[availability_end_date]
	  ,[quantity_on_hand]
      ,[quantity_on_hand_unit_code]
      ,[is_auto_deducted]
      ,[distribution_default_form_code]
      ,[distribution_default_quantity]
      ,[distribution_unit_code]
      ,[distribution_critical_quantity]
      ,[regeneration_critical_quantity]
      ,[pathogen_status_code]
      ,a.accession_id
	  ,[parent_inventory_id] 
      ,[backup_inventory_id]
      ,[rootstock]
      ,[hundred_seed_weight]
      ,[pollination_method_code]
      ,[pollination_vector_code]
      ,[preservation_method_id]
      ,[regeneration_method_id]
      ,[plant_sex_code]
      ,[propagation_date]
      ,[propagation_date_code]
      ,i.note,
i.created_date,
i.created_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.created_by) as created_by_name,
i.modified_date,
i.modified_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.modified_by) as modified_by_name,
i.owned_date,
i.owned_by as owned_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.owned_by) as owned_by_name
  FROM [gringlobal].[dbo].[inventory] i
  join accession a on a.accession_id=i.accession_id


GO
/****** Object:  View [dbo].[ipr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[ipr] as select
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

GO
/****** Object:  View [dbo].[iv]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop view iv
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[iv] as
SELECT 
       (select accession_number_part1 from accession a where a.accession_id=i.accession_id) as acp, 
	   (select accession_number_part2 from accession a where a.accession_id=i.accession_id) as acno,
	   (select accession_number_part3 from accession a where a.accession_id=i.accession_id) as acs
      ,[inventory_id] as ivid
      ,[inventory_number_part1] as ivp
      ,[inventory_number_part2] as ivno
      ,[inventory_number_part3] as ivs
      ,[form_type_code] as ivt
      ,i.inventory_number_part1 + isnull(rtrim(' ' + CONVERT(NVARCHAR, i.inventory_number_part2)),'') + isnull(RTRIM(' ' + i.inventory_number_part3),'') + ' ' + i.form_type_code AS inventory
      ,(select maintenance_name from inventory_maint_policy where i.inventory_maint_policy_id=inventory_maint_policy_id) as imname
      ,[is_distributable] as distribute
      ,[storage_location_part1] as loc1
      ,[storage_location_part2] as loc2
      ,[storage_location_part3] as loc3
      ,[storage_location_part4] as loc4
      ,[latitude] 
      ,[longitude]
      ,[is_available] as avail
      ,[web_availability_note] 
      ,[availability_status_code] as status
      ,[availability_status_note] as status_note
      ,[availability_start_date] 
      ,[availability_end_date]
	  ,[quantity_on_hand] as onhand
      ,[quantity_on_hand] as quant
      ,[quantity_on_hand_unit_code] as unit
      ,[is_auto_deducted] as debit
      ,[distribution_default_form_code] as dform
      ,[distribution_default_quantity] as dquant
      ,[distribution_unit_code] as dunit
      ,[distribution_critical_quantity] as dcrit
      ,[regeneration_critical_quantity] as rquant
      ,[pathogen_status_code] as pstat
      ,[accession_id] as acid
      ,[parent_inventory_id] 
      ,[backup_inventory_id]
      ,[rootstock]
      ,[hundred_seed_weight] as ivhswt
      ,[pollination_method_code]
      ,[pollination_vector_code]
      ,[preservation_method_id]
      ,[regeneration_method_id]
      ,[plant_sex_code]
      ,[propagation_date]
      ,[propagation_date_code]
      ,[note],
i.created_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.created_by) as created_by,
i.modified_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.modified_by) as modified_by,
i.owned_date,
(select last_name + ', ' + first_name from cooperator where cooperator_id=i.owned_by) as owned_by,
i.owned_by as owned_by_id,
      (select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=i.owned_by)) as site
  FROM [gringlobal].[dbo].[inventory] i


GO
/****** Object:  View [dbo].[mbr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[mbr] as select
cooperator_map_id,
 first_name as FNAME                                              
 ,last_name as LNAME                                             
 ,organization_abbrev as orgid
 ,m.note as cmt                                               
,group_tag as cgid                                     
   ,(select site_short_name from site where site.site_id=g.site_id) as site                             
 ,m.cooperator_id as CNO  
 ,m.cooperator_group_id                                      
 ,m.created_by                                              
 ,m.modified_by                                            
 ,m.owned_by from cooperator c, cooperator_group g, cooperator_map m where
 c.cooperator_id=m.cooperator_id and m.cooperator_group_id = g.cooperator_group_id          
 
GO
/****** Object:  View [dbo].[oact]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop view oact;
create view [dbo].[oact] as select
order_request_action_id as oactno,
action_name_code as action,
started_date as acted,
completed_date as completed,
action_information as actid,
order_request_id as orno,
(select site_short_name from site s, cooperator c where s.site_id=c.site_id and c.cooperator_id=o.owned_by) as site,
note as cmt,
created_date as created,
created_by as create_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.created_by) as created_user,
modified_date as modified,
modified_by as modify_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.modified_by) as modified_user, 
owned_date as owned,
owned_by as owner_id,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=o.created_by) as owned_user
from order_request_action o
GO
/****** Object:  View [dbo].[order_packing_report_SSRS]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[order_packing_report_SSRS] AS
WITH xori AS (SELECT order_request_id, order_request_item_id, inventory_id, status_code
		FROM order_request_item
		WHERE order_request_item_id IN (null)
	UNION SELECT order_request_id, order_request_item_id, inventory_id, status_code
		FROM order_request_item
		WHERE order_request_id IN (320676)
)
, oipr AS (SELECT order_request_id, STRING_AGG(type_code + ' - ' + description, '$ ') AS ipr_disclaimer
   FROM (SELECT DISTINCT xori.order_request_id, type_code, COALESCE(description, title, '') AS description
      FROM xori
	  JOIN inventory xi ON xi.inventory_id = xori.inventory_id
	  JOIN accession_ipr ai ON ai.accession_id = xi.accession_id
	  JOIN code_value cv ON cv.value = ai.type_code AND cv.group_name = 'ACCESSION_RESTRICTION_TYPE'
	  JOIN code_value_lang cvl ON cvl.code_value_id = cv.code_value_id AND cvl.sys_lang_id = 1
	  WHERE xori.status_code != 'CANCEL' AND ai.expired_date IS NULL
   ) xai GROUP BY order_request_id
)
, opvp AS (SELECT DISTINCT xori.order_request_id, 'xPVP' AS xpvp_disclaimer
	FROM xori
	JOIN inventory xi ON xi.inventory_id = xori.inventory_id
	JOIN accession_ipr ai ON ai.accession_id = xi.accession_id
	JOIN code_value cv ON cv.value = ai.type_code AND cv.group_name = 'ACCESSION_RESTRICTION_TYPE'
	JOIN code_value_lang cvl ON cvl.code_value_id = cv.code_value_id AND cvl.sys_lang_id = 1
	WHERE type_code = 'PVP' AND ai.expired_date IS NOT NULL AND xori.status_code != 'CANCEL'
)
, treg AS (SELECT rtf.family_name, rtg.genus_name, rts.species_name, rts.subspecies_name, rts.variety_name, rts.subvariety_name, rts.forma_name
		, tr.regulation_type_code, g.country_code, g.adm1, cvl.title
	FROM taxonomy_regulation_map trm
	LEFT JOIN taxonomy_regulation tr ON tr.taxonomy_regulation_id = trm.taxonomy_regulation_id
	LEFT JOIN geography g ON g.geography_id = tr.geography_id
	LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE'
	LEFT JOIN code_value_lang cvl ON cv.code_value_id = cvl.code_value_id and cvl.sys_lang_id = 1
	LEFT JOIN taxonomy_species ts ON ts.taxonomy_species_id = trm.taxonomy_species_id
	LEFT JOIN taxonomy_species rts ON rts.taxonomy_species_id = ts.current_taxonomy_species_id
	LEFT join taxonomy_genus tg ON tg.taxonomy_genus_id = trm.taxonomy_genus_id
	LEFT JOIN taxonomy_genus rtg ON rtg.taxonomy_genus_id = COALESCE(rts.taxonomy_genus_id, tg.current_taxonomy_genus_id)
	LEFT JOIN taxonomy_family rtf ON rtf.taxonomy_family_id = COALESCE(rtg.taxonomy_family_id, trm.taxonomy_family_id)
)
SELECT
 oi.order_request_item_id,
 oi.order_request_id,
 c1.first_name AS first_name_1,
 c1.last_name AS last_name_1,
 c1.organization AS organization_1,
 c1.address_line1 AS address_line1_1,
 c1.address_line2 AS address_line2_1,
 c1.address_line3 AS address_line3_1,
 c1.city AS city_1,
 g1.adm1 AS adm1_1,
 c1.postal_index AS postal_index_1,
 g1.country_code AS country_code_1,
 c1.primary_phone AS primary_phone_1,
 c1.email AS email_1,
 c2.first_name AS first_name_2,
 c2.last_name AS last_name_2,
 c2.organization AS organization_2,
 c2.address_line1 AS address_line1_2,
 c2.address_line2 AS address_line2_2,
 c2.address_line3 AS address_line3_2,
 c2.city AS city_2,
 g2.adm1 AS adm1_2,
 c2.postal_index AS postal_index_2,
 g2.country_code AS country_code_2,
 c2.primary_phone AS primary_phone_2,
 c2.email AS email_2,
 c3.first_name AS first_name_3,
 c3.last_name AS last_name_3,
 c3.organization AS organization_3,
 c3.address_line1 AS address_line1_3,
 c3.address_line2 AS address_line2_3,
 c3.address_line3 AS address_line3_3,
 c3.city AS city_3,
 g3.adm1 AS adm1_3,
 c3.postal_index AS postal_index_3,
 g3.country_code AS country_code_3,
 c3.primary_phone AS primary_phone_3,
 c3.email AS email_3,
 (SELECT site_long_name FROM site where site_id = (SELECT site_id FROM cooperator where cooperator_id = o.owned_by)) as site_long_name,
 c4.organization AS organization_4,
 c4.address_line1 AS address_line1_4,
 c4.address_line2 AS address_line2_4,
 c4.address_line3 AS address_line3_4,
 c4.city AS city_4,
 g4.adm1 AS adm1_4,
 c4.postal_index AS postal_index_4,
 g4.country_code AS country_code_4,
 c4.primary_phone AS primary_phone_4,
 c4.email AS email_4,
 o.web_order_request_id,
 oi.sequence_number,
 o.local_number,
 a.accession_id,
 (SELECT LTRIM(RTRIM(LTRIM(COALESCE(a.accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, a.accession_number_part2), '') + ' ') + COALESCE(a.accession_number_part3, ''))) FROM accession a WHERE i.accession_id = a.accession_id) AS accession, 
 i.availability_status_code,
 i.availability_status_note,
 a.improvement_status_code,
 i.inventory_id,
 (SELECT LTRIM(RTRIM(LTRIM(COALESCE(i.inventory_number_part1, '') + ' ') + LTRIM(COALESCE(CONVERT(NVARCHAR, i.inventory_number_part2), '') + ' ') + LTRIM(COALESCE(i.inventory_number_part3, '') + ' ') + COALESCE(i.form_type_code, '')))) AS inventory,
 oi.name,
 oi.external_taxonomy,
 i.quantity_on_hand,
 i.is_distributable,
 i.distribution_default_quantity,
 i.distribution_default_form_code,
 oi.quantity_shipped,
 oi.quantity_shipped_unit_code,
 oi.status_code,
 status_date,
 oi.note,
 ora.note as action_note,
 o.completed_date,
 (SELECT ipr_disclaimer FROM oipr WHERE order_request_id = oi.order_request_id) AS ipr_disclaimer,
(SELECT SUBSTRING((SELECT ', ' + ipr6.type_code AS [text()] FROM accession_ipr ipr6 where ipr6.accession_id = i.accession_id AND ipr6.expired_date IS NULL
  ORDER BY ipr6.accession_id FOR XML PATH('')), 3, 1000)) as ipr_restriction,
(SELECT SUBSTRING((SELECT ', ' + iq.quarantine_type_code + ' = ' + iq.progress_status_code AS [text()] FROM accession_quarantine iq
  WHERE iq.accession_id = i.accession_id AND iq.released_date IS NULL ORDER BY iq.accession_id FOR XML PATH ('')), 3, 1000)) AS quarantine_restriction,
(SELECT STRING_AGG(regtext, '$ ') FROM
     (SELECT DISTINCT COALESCE(adm1, '') AS regtext
		FROM treg
		WHERE regulation_type_code IN ('SEED', 'TERRESTRIAL', 'AQUATIC', 'PARASITIC')
		  AND treg.family_name = tf.family_name
		  AND COALESCE(treg.genus_name, tg.genus_name) = tg.genus_name
		  AND COALESCE(treg.species_name, ts.species_name) = ts.species_name
		  AND COALESCE(treg.subspecies_name, ts.subspecies_name, '') = COALESCE(ts.subspecies_name, '')
		  AND COALESCE(treg.variety_name, ts.variety_name, '')= COALESCE(ts.variety_name, '')
		  AND COALESCE(treg.subvariety_name, ts.subvariety_name, '')= COALESCE(ts.subvariety_name, '')
		  AND COALESCE(treg.forma_name, ts.forma_name, '')= COALESCE(ts.forma_name, '')
		  AND treg.country_code = g3.country_code AND COALESCE(treg.adm1, g3.adm1, '') = COALESCE(g3.adm1,'') 		
	) disttreg
  ) AS noxious_restriction, 
(SELECT TOP 1 regulation_type_code
	FROM treg
		WHERE regulation_type_code IN ('CITESI', 'CITESII', 'CITESIII', 'FWE', 'FWT')
		  AND treg.family_name = tf.family_name
		  AND COALESCE(treg.genus_name, tg.genus_name) = tg.genus_name
		  AND COALESCE(treg.species_name, ts.species_name) = ts.species_name
		  AND COALESCE(treg.subspecies_name, ts.subspecies_name, '') = COALESCE(ts.subspecies_name, '')
		  AND COALESCE(treg.variety_name, ts.variety_name, '')= COALESCE(ts.variety_name, '')
		  AND COALESCE(treg.subvariety_name, ts.subvariety_name, '')= COALESCE(ts.subvariety_name, '')
		  AND COALESCE(treg.forma_name, ts.forma_name, '')= COALESCE(ts.forma_name, '')
		 ) AS rare_restriction,
(SELECT TOP 1 regulation_type_code
	FROM treg
		WHERE regulation_type_code IN ('NARCOTIC')
		  AND treg.family_name = tf.family_name
		  AND COALESCE(treg.genus_name, tg.genus_name) = tg.genus_name
		  AND COALESCE(treg.species_name, ts.species_name) = ts.species_name
		  AND COALESCE(treg.subspecies_name, ts.subspecies_name, '') = COALESCE(ts.subspecies_name, '')
		  AND COALESCE(treg.variety_name, ts.variety_name, '')= COALESCE(ts.variety_name, '')
		  AND COALESCE(treg.subvariety_name, ts.subvariety_name, '')= COALESCE(ts.subvariety_name, '')
		  AND COALESCE(treg.forma_name, ts.forma_name, '')= COALESCE(ts.forma_name, '')  
  )  AS restriction_code,
(SELECT TOP 1 percent_viable FROM inventory_viability iv WHERE iv.inventory_id = i.inventory_id
  ORDER BY iv.tested_date DESC, inventory_viability_id DESC) AS percent_viable,
(SELECT TOP 1 tested_date FROM inventory_viability iv WHERE iv.inventory_id = i.inventory_id
  ORDER BY iv.tested_date DESC) AS tested_date,
(SELECT s.geography_id FROM accession_source s WHERE i.accession_id = s.accession_id AND s.accession_source_id = (SELECT MIN(s2.accession_source_id)
  FROM accession_source s2 WHERE i.accession_id = s2.accession_id AND is_origin = 'Y')) AS geography_id,
(SELECT DISTINCT 'xPVP' FROM accession_ipr ipr5 WHERE ipr5.accession_id = i.accession_id AND ipr5.type_code = 'PVP' and ipr5.expired_date IS NOT NULL) as xpvp_warning,
(SELECT xpvp_disclaimer FROM opvp WHERE order_request_id = oi.order_request_id) AS xpvp_disclaimer,
(SELECT maintenance_name FROM inventory_maint_policy WHERE inventory_maint_policy_id = i.inventory_maint_policy_id) AS crop_name,
(SELECT top 1 plant_name from accession_inv_name ain
  join inventory i2 on i2.inventory_id = ain.inventory_id and i2.accession_id = a.accession_id
  and ain.name_group_id IN (40, 41, 44, 47, 48, 50, 51) and ain.category_code = 'SITE') as citr_name,
(SELECT COALESCE(cvl.title, g.country_code)
   FROM accession_source src
   INNER JOIN geography g ON g.geography_id = src.geography_id
   LEFT JOIN code_value cv ON g.country_code = cv.value AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE'
   LEFT JOIN code_value_lang cvl ON  cv.code_value_id = cvl.code_value_id AND  cvl.sys_lang_id = 1
  WHERE src.accession_source_id = (SELECT MIN(accession_source_id) FROM accession_source WHERE accession_id = i.accession_id AND is_origin = 'Y')) AS origin,
  i.storage_location_part1,
  i.storage_location_part2,
  i.storage_location_part3,
  i.storage_location_part4,
  a.accession_number_part1,
  a.accession_number_part2,
  a.accession_number_part3,
  i.inventory_number_part1,
  i.inventory_number_part2,
  i.inventory_number_part3,
  i.form_type_code,
  oi.created_date,
  oi.created_by,
  oi.modified_date,
  oi.modified_by,
  oi.owned_date,
  oi.owned_by
FROM
    xori
    INNER JOIN order_request_item oi ON oi.order_request_item_id = xori.order_request_item_id
    INNER JOIN order_request o ON o.order_request_id = oi.order_request_id
    INNER JOIN inventory i ON oi.inventory_id = i.inventory_id
    INNER JOIN accession a ON a.accession_id = i.accession_id
    INNER JOIN taxonomy_species ts ON ts.taxonomy_species_id = a.taxonomy_species_id
    INNER JOIN taxonomy_genus tg ON tg.taxonomy_genus_id = ts.taxonomy_genus_id
    INNER JOIN taxonomy_family tf ON tf.taxonomy_family_id = tg.taxonomy_family_id
    LEFT  JOIN cooperator c1 ON o.requestor_cooperator_id = c1.cooperator_id
    LEFT  JOIN geography g1 ON c1.geography_id = g1.geography_id
    LEFT  JOIN cooperator c2 ON o.ship_to_cooperator_id = c2.cooperator_id
    LEFT  JOIN geography g2 ON c2.geography_id = g2.geography_id
    LEFT  JOIN cooperator c3 ON o.final_recipient_cooperator_id = c3.cooperator_id
    LEFT  JOIN geography g3 ON c3.geography_id = g3.geography_id
    LEFT  JOIN cooperator c4 ON o.owned_by = c4.cooperator_id
    LEFT  JOIN geography g4 ON c4.geography_id = g4.geography_id 
    LEFT  JOIN order_request_action AS ora ON ora.order_request_action_id = 
              (SELECT MAX(order_request_action_id) FROM order_request_action 
                     WHERE order_request_id = o.order_request_id AND action_name_code = 'SHIPPED')


GO
/****** Object:  View [dbo].[order_request_item_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- drop view order_request_item_view

create view [dbo].[order_request_item_view] as select 
order_request_item_id ,
order_request_id ,
web_order_request_item_id,
(select order_type_code from order_request ord where oi.order_request_id=ord.order_request_id) as order_type,
sequence_number ,
name,
quantity_shipped ,
quantity_shipped_unit_code ,
distribution_form_code ,
oi.status_code ,
status_date ,
oi.inventory_id,
inventory_number_part1 as inventory_prefix,
inventory_number_part2 as inventory_number,
inventory_number_part3 as inventory_suffix,
form_type_code ,
external_taxonomy as taxon,
source_cooperator_id ,
a.accession_id as acid,
accession_number_part1 as acccession_prefix,
accession_number_part2 as accession_number,
accession_number_part3 as accession_suffix,
oi.note,
web_user_note,
oi.created_date,
oi.created_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.created_by) as created_by_name,
oi.modified_date,
oi.modified_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.modified_by) as modified_by_name,
oi.owned_date,
oi.owned_by,
(select last_name + ', ' + first_name from cooperator where cooperator_id=oi.owned_by) as owned_by_name,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=oi.owned_by)) as site
from order_request_item oi
join inventory i on oi.inventory_id=i.inventory_id
join  accession a on i.accession_id=a.accession_id




GO
/****** Object:  View [dbo].[s9ivall]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[s9ivall] as 
SELECT
  imp.maintenance_name AS IMNAME,
  (SELECT s.site_short_name FROM site s
     INNER JOIN cooperator c ON c.site_id = s.site_id
       WHERE c.cooperator_id = a.owned_by
         ) AS ACCSITE,
  (SELECT s.site_short_name FROM site s
     INNER JOIN cooperator c ON c.site_id = s.site_id
       WHERE c.cooperator_id = i.owned_by
         ) AS IVSITE,
  i.is_distributable AS DISTRIBUTE,
  a.is_core AS CORE,
  a.accession_number_part1 AS ACP,
  a.accession_number_part2 AS ACNO,
  a.accession_number_part3 AS ACS,
  i.inventory_number_part1 AS IVP,
  i.inventory_number_part2 AS IVNO,
  i.inventory_number_part3 AS IVS,
  i.form_type_code AS IVT,
  ts.name AS TAXON,
  tg.genus_name AS GENUS,
  ts.species_name AS SPECIES,
  CASE
    WHEN ts.forma_name IS NOT NULL THEN ts.forma_rank_type
    WHEN ts.subvariety_name IS NOT NULL THEN 'subvar.'
    WHEN ts.variety_name IS NOT NULL THEN 'var.'
    WHEN ts.subspecies_name IS NOT NULL THEN 'subsp.'
    ELSE NULL
    END AS RANK,
  CASE
    WHEN ts.forma_name IS NOT NULL THEN ts.forma_name
    WHEN ts.subvariety_name IS NOT NULL THEN ts.subvariety_name
    WHEN ts.variety_name IS NOT NULL THEN ts.variety_name
    WHEN ts.subspecies_name IS NOT NULL THEN ts.subspecies_name
    ELSE NULL
    END AS SUBTAX,
  i.availability_status_code AS STATUS,
  i.availability_status_note AS STATCMT,
  (SELECT MAX(FORMAT(completed_date,completed_date_code))  FROM inventory_action
    WHERE action_name_code = 'HARVESTED' AND inventory_id = i.inventory_id) AS HARVESTED,
  i.hundred_seed_weight AS IVHSWT,
  i.quantity_on_hand AS ONHAND,
  s9si.increase_location_code AS INCRLOC,
  s9si.plot_number AS PLOTNO,
  s9si.virus_status_code AS VIRUS,
  s9si.pollination_procedure_code AS POLLEN,
  iv.percent_viable AS VIABLE,
  FORMAT(iv.tested_date,iv.tested_date_code) AS TESTED,
  a.is_backed_up AS BACKED,
  i.storage_location_part1 AS LOC1,
  i.storage_location_part2 AS LOC2,
  i.storage_location_part3 AS LOC3,
  i.storage_location_part4 AS LOC4,
  i.note AS IVCMT,
  FORMAT(a.initial_received_date,a.initial_received_date_code) AS ACCREC,
  (SELECT MAX(FORMAT(completed_date,completed_date_code)) FROM inventory_action
    WHERE action_name_code = 'RECEIVED' AND inventory_id = i.inventory_id) AS IVREC,
  i.distribution_default_form_code AS DFORM,
  i.distribution_default_quantity AS DQUANT,
  i.pathogen_status_code AS PSTATUS,
  (SELECT title FROM code_value_lang cvl
      INNER JOIN code_value cv ON cvl.code_value_id = cv.code_value_id AND cvl.sys_lang_id = 1
      INNER JOIN geography g ON cv.value = g.country_code AND cv.group_name = 'GEOGRAPHY_COUNTRY_CODE'
      INNER JOIN accession_source s ON g.geography_id = s.geography_id
        WHERE s.accession_source_id = (SELECT MIN(src.accession_source_id)
        FROM accession_source src
        WHERE a.accession_id = src.accession_id and src.is_origin = 'Y')) AS COUNTRY,
  (SELECT MIN(plant_name) from accession_inv_name an, inventory i
      WHERE i.inventory_id = an.inventory_id and i.accession_id = a.accession_id and
      plant_name_rank = (select MIN(plant_name_rank) from accession_inv_name an2, inventory i2
      WHERE an2.inventory_id = i2.inventory_id and i2.accession_id = a.accession_id)) AS TOPNAME,
  i.accession_id AS ACID,
  i.inventory_id AS IVID,
  (SELECT s.geography_id from accession_source s where a.accession_id = s.accession_id
      and s.accession_source_id = (select MIN(s2.accession_source_id) from accession_source s2
      WHERE a.accession_id = s2.accession_id and is_origin = 'Y')) AS GEOGRAPHY_ID
FROM inventory i
  INNER JOIN inventory_maint_policy imp ON i.inventory_maint_policy_id = imp.inventory_maint_policy_id
  INNER JOIN accession a on i.accession_id = a.accession_id
  INNER JOIN taxonomy_species ts ON a.taxonomy_species_id = ts.taxonomy_species_id
  INNER JOIN taxonomy_genus tg ON ts.taxonomy_genus_id = tg.taxonomy_genus_id
  LEFT JOIN s9_site_inventory s9si ON i.inventory_id = s9si.inventory_id
  LEFT JOIN inventory_viability iv ON i.inventory_id = iv.inventory_id and iv.tested_date =
    (SELECT MAX(tested_date) FROM inventory_viability iv WHERE iv.inventory_id = i.inventory_id)


GO
/****** Object:  View [dbo].[sys_table_field_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[sys_table_field_view] as select f.sys_table_field_id,table_name,field_ordinal as sequence,field_name,field_type,field_purpose,title,
description,sys_lang_id  ,group_name
from sys_table_field f
join sys_table t on t.sys_table_id=f.sys_table_id
left join sys_table_field_lang l on l.sys_table_field_id =f.sys_table_field_id


GO
/****** Object:  View [dbo].[tax]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[tax] as select taxonomy_species_id as taxno,current_taxonomy_species_id as validtaxno,
taxonomy_genus_id as gno,
(select hybrid_code from taxonomy_genus g where g.taxonomy_genus_id=t.taxonomy_genus_id) as genus_hybrid_code,
(select genus_name from taxonomy_genus g where g.taxonomy_genus_id=t.taxonomy_genus_id) as genus,
name as taxon, 
name_authority as taxauthor,
species_name as species, is_specific_hybrid,
subspecies_name as subsp, is_subspecific_hybrid,
variety_name as var, is_varietal_hybrid,
forma_name as forma,
(select site_short_name from site where site_id=priority1_site_id) as psite1,
(select site_short_name from site where site_id=priority2_site_id) as psite2,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=curator1_cooperator_id) as curator1,
(select last_name + ', ' + first_name from cooperator c where c.cooperator_id=curator2_cooperator_id) as curator2,
restriction_code as rest,
protologue,
note
from taxonomy_species t




GO
/****** Object:  View [dbo].[taxgeo_cooperator_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- drop view taxgeo_cooperator_view

create view  [dbo].[taxgeo_cooperator_view] as 
select 4  as cooperator_id
      , 4 as current_cooperator_id
      ,1 as site_id
      ,null as last_name
      ,null as title
      ,null as first_name
      ,'NPGS Taxonomist' as job
      ,'USDA-ARS' as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,'Beltsville' as city
      ,'20705' as postal_index
      ,1020 as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,'UARS' as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,'Various NPGS Taxonomists' as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  

	  union
	  select 1  as cooperator_id
      , 1 as current_cooperator_id
      ,1 as site_id
      ,'SYSTEM' as last_name
      ,null as title
      ,'(Default)' as first_name
      ,'(Built in default account)' as job
      ,null as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,null as city
      ,null as postal_index
      ,null as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,null as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,null as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  

	  union
	  select 48  as cooperator_id
      , 48 as current_cooperator_id
      ,1 as site_id
      ,'SYSTEM' as last_name
      ,null as title
      ,'Administrator' as first_name
      ,'(Built in Administrator account)' as job
      ,null as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,null as city
      ,null as postal_index
      ,null as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,null as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,null as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  

	  union
	  select 829  as cooperator_id
      , 829 as current_cooperator_id
      ,1 as site_id
      ,'SYSTEM' as last_name
      ,null as title
      ,'Guest' as first_name
      ,'(Anonymous login for web site)' as job
      ,null as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,null as city
      ,null as postal_index
      ,null as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,null as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,null as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  

	  union
	  select 830  as cooperator_id
      , 830 as current_cooperator_id
      ,1 as site_id
      ,'Tester' as last_name
      ,null as title
      ,'Feedback Owner' as first_name
      ,null as job
      ,null as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,null as city
      ,null as postal_index
      ,null as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,null as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,null as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  

	  union
	  select 831  as cooperator_id
      , 831 as current_cooperator_id
      ,1 as site_id
      ,'Tester' as last_name
      ,null as title
      ,'Feedback Submitter' as first_name
      ,null as job
      ,null as organization
      ,null as organization_abbrev
      ,null as address_line1
      ,null as address_line2
      ,null as address_line3
      ,null as city
      ,null as postal_index
      ,null as geography_id
      ,null as secondary_organization
      ,null as secondary_organization_abbrev
      ,null as secondary_address_line1
      ,null as secondary_address_line2
      ,null as secondary_address_line3
      ,null as secondary_city
      ,null as secondary_postal_index
      ,null as secondary_geography_id
      ,null as primary_phone
      ,null as secondary_phone
      ,null as fax
      ,null as email
      ,null as secondary_email
      ,null as status_code
      ,null as category_code
      , null as organization_region_code
      ,null as discipline_code
      ,null as note
      , 1 as sys_lang_id
      ,null as web_cooperator_id
      ,getutcdate() as created_date
      ,1 as created_by
      ,null as modified_date
      ,null as modified_by
      ,getutcdate() as owned_date
      ,1 as owned_by  





GO
/****** Object:  View [dbo].[taxgeo_cooperator2_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view  [dbo].[taxgeo_cooperator2_view] as 
SELECT cooperator_id, current_cooperator_id
	, 1 AS site_id
	, last_name, title, first_name, job, organization, organization_abbrev
	, address_line1, address_line2, address_line3, city, postal_index, geography_id
	, null as secondary_organization, null as secondary_organization_abbrev
	, null as secondary_address_line1, null as secondary_address_line2, null as secondary_address_line3
	, null as secondary_city, null as secondary_postal_index, null as secondary_geography_id
	, primary_phone
	, null as secondary_phone, null as fax
	, email
	, null as secondary_email
	, status_code, category_code, organization_region_code, discipline_code,note
	, sys_lang_id
	, null as web_cooperator_id
	, created_date, 1 as created_by
	, modified_date, null as modified_by
	, owned_date, 1 as owned_by  
FROM cooperator WHERE cooperator_id IN (1,4,48,829)
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_crop_cm]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_crop_cm] AS
SELECT *
FROM 
	taxonomy_crop_map CM
WHERE 
	common_crop_name IS NOT NULL
AND
	LEN(LTRIM(RTRIM(common_crop_name))) > 0
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_crop_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_crop_cwr]
AS
SELECT * 
FROM 
	taxonomy_cwr
WHERE
	is_crop = 'Y'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_primary_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_primary_cwr]
AS
SELECT CWR.*, CM.is_primary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Primary'
AND
	CM.is_primary_genepool = 'Y'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_primary_tu]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_primary_tu]
AS
SELECT 'PRIMARY' AS USAGE, * 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%PRIMARY%'
AND
	economic_usage_code = 'GENETIC'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_progenitor_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_progenitor_cwr]
AS
SELECT 
	taxonomy_cwr_id,
	taxonomy_species_id,
	crop_name,
	is_crop,
	genepool_code,
	modified_date
FROM 
	taxonomy_cwr
WHERE
	genepool_code = 'Progenitor'

GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_progenitor_tu]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_progenitor_tu]
AS
SELECT *
FROM 
	taxonomy_use
WHERE
	usage_type LIKE '%progenitor%'
AND
	economic_usage_code = 'GENETIC'

GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_quaternary_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_quaternary_cwr]
AS
SELECT CWR.*, CM.is_quaternary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Quaternary'
AND
	CM.is_quaternary_genepool = 'Y'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_quaternary_tu]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_quaternary_tu]
AS
SELECT 'QUATERNARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%QUATERNARY%'
AND
	economic_usage_code = 'GENETIC'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_secondary_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_secondary_cwr]
AS
SELECT 
	CWR.*, 
	CM.is_secondary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Secondary'
AND
	CM.is_secondary_genepool = 'Y'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_secondary_tu]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_secondary_tu]
AS
SELECT 'SECONDARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%SECONDARY%'
AND
	economic_usage_code = 'GENETIC'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_tertiary_cwr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_tertiary_cwr]
AS
SELECT CWR.*, CM.is_tertiary_genepool
FROM
	taxonomy_cwr CWR
JOIN
	taxonomy_crop_map CM
ON
	CWR.taxonomy_species_id = CM.taxonomy_species_id
WHERE
	genepool_code = 'Tertiary'
AND
	CM.is_tertiary_genepool = 'Y'
GO
/****** Object:  View [dbo].[taxgeo_cwr_validation_genetic_tertiary_tu]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[taxgeo_cwr_validation_genetic_tertiary_tu]
AS
SELECT 'TERTIARY' AS USAGE,* 
FROM
	taxonomy_use
WHERE 
	usage_type LIKE '%TERTIARY%'
AND
	economic_usage_code = 'GENETIC'
GO
/****** Object:  View [dbo].[taxgeo_geography_region_map_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_geography_region_map_view] as 
select
geography_region_map_id,
geography_id,
region_id,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from geography_region_map
GO
/****** Object:  View [dbo].[taxgeo_geography_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- drop view taxgeo_geography_view
create view [dbo].[taxgeo_geography_view] as 
select 
geography_id,
current_geography_id,
country_code,
adm1,
adm1_type_code,
adm1_abbrev,
adm2,
adm2_type_code,
adm2_abbrev,
adm3,
adm3_type_code,
adm3_abbrev,
adm4,
adm4_type_code,
adm4_abbrev,
changed_date,
is_valid,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
 from geography where geography_id in (select geography_id from taxonomy_geography_map union 
select geography_id from geography_region_map) or is_valid = 'Y'

GO
/****** Object:  View [dbo].[taxgeo_region_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_region_view] as select
region_id,
continent,
subcontinent,
sequence_number,
continent_abbreviation,
subcontinent_abbreviation,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from region
GO
/****** Object:  View [dbo].[taxgeo_site_qs_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_site_qs_view] as select
 1 as site_id,
'SYS' as site_short_name,
'SYSTEM' as site_long_name,
null as provider_identifier,
null as organization_abbrev,
'N' is_internal,
'N' as is_distribution_site,
null as type_code,
null as fao_institute_number,
null as note,
getutcdate() as created_date,
1 as created_by,
null as modified_date,
null as modified_by,
getutcdate() as owned_date,
1 as owned_by

GO
/****** Object:  View [dbo].[taxgeo_site_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[taxgeo_site_view] as SELECT 1 AS [site_id]
      ,[site_short_name]
      ,[site_long_name]
      ,[provider_identifier]
      ,[organization_abbrev]
      ,[is_internal]
      ,[is_distribution_site]
      ,[type_code]
      ,[fao_institute_number]
      ,[note]
      ,[created_date]
      ,1 AS [created_by]
      ,[modified_date]
      ,[modified_by]
      ,[owned_date]
      ,1 AS [owned_by]
  FROM [gringlobal].[dbo].[site]
  WHERE site_short_name IN ('SYS')

GO
/****** Object:  View [dbo].[taxgeo_species_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- drop view taxgeo_species_view

create view [dbo].[taxgeo_species_view] as 
SELECT  [taxonomy_species_id]
      ,[current_taxonomy_species_id]
      ,[nomen_number]
      ,[is_specific_hybrid]
      ,[species_name]
      ,[species_authority]
      ,[is_subspecific_hybrid]
      ,[subspecies_name]
      ,[subspecies_authority]
      ,[is_varietal_hybrid]
      ,[variety_name]
      ,[variety_authority]
      ,[is_subvarietal_hybrid]
      ,[subvariety_name]
      ,[subvariety_authority]
      ,[is_forma_hybrid]
      ,[forma_rank_type]
      ,[forma_name]
      ,[forma_authority]
      ,[taxonomy_genus_id]
      ,null as priority1_site_id
      ,null as priority2_site_id
      ,null as curator1_cooperator_id
      ,null as curator2_cooperator_id
      ,[restriction_code]
      ,[life_form_code]
      ,[common_fertilization_code]
      ,[is_name_pending]
      ,[synonym_code]
      ,case when verifier_cooperator_id is not null then 4 else null end as verifier_cooperator_id
      ,[name_verified_date]
      ,[name]
      ,[name_authority]
      ,[protologue]
      ,[protologue_virtual_path]
      ,[note]
      ,[site_note]
      ,[alternate_name]
      ,[created_date]
      ,4 as created_by
      ,[modified_date]
      ,case when modified_by is not null then 4 else null end as modified_by
	   ,[owned_date]
      ,4 as owned_by
  FROM [gringlobal].[dbo].[taxonomy_species]


GO
/****** Object:  View [dbo].[taxgeo_taxonomy_alt_family_map_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[taxgeo_taxonomy_alt_family_map_view] as select 
taxonomy_alt_family_map_id,
taxonomy_genus_id,
taxonomy_family_id,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_alt_family_map




GO
/****** Object:  View [dbo].[taxgeo_taxonomy_author_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_author_view] as select 
taxonomy_author_id,
short_name,
full_name,
short_name_expanded_diacritic,
full_name_expanded_diacritic,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_author


GO
/****** Object:  View [dbo].[taxgeo_taxonomy_common_name_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_common_name_view] as select
taxonomy_common_name_id,
taxonomy_genus_id,
taxonomy_species_id,
language_description,
name,
simplified_name,
alternate_transcription,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_common_name

GO
/****** Object:  View [dbo].[taxgeo_taxonomy_family_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_family_view] as select
taxonomy_family_id,
current_taxonomy_family_id,
type_taxonomy_genus_id,
suprafamily_rank_code,
suprafamily_rank_name,
family_name,
family_authority,
alternate_name,
subfamily_name,
tribe_name,
subtribe_name,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_family

GO
/****** Object:  View [dbo].[taxgeo_taxonomy_genus_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- drop view taxgeo_taxonomy_genus_view

create view [dbo].[taxgeo_taxonomy_genus_view] as select 
taxonomy_genus_id,
current_taxonomy_genus_id,
taxonomy_family_id,
qualifying_code,
hybrid_code,
genus_name,
genus_authority,
subgenus_name,
section_name,
subsection_name,
series_name,
subseries_name,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_genus


GO
/****** Object:  View [dbo].[taxgeo_taxonomy_geography_map_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_geography_map_view] as
select 
taxonomy_geography_map_id,
taxonomy_species_id,
geography_id,
geography_status_code,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by from taxonomy_geography_map
GO
/****** Object:  View [dbo].[taxgeo_taxonomy_noxious_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_noxious_view] as select 
taxonomy_noxious_id,
taxonomy_species_id,
geography_id,
noxious_type_code,
noxious_level_code,
url,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_noxious

GO
/****** Object:  View [dbo].[taxgeo_taxonomy_use_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[taxgeo_taxonomy_use_view] as select 
taxonomy_use_id,
taxonomy_species_id,
economic_usage_code,
usage_type,
plant_part_code,
citation_id,
note,
created_date,
4 as created_by,
modified_date,
case when modified_by is not null then 4 else null end as modified_by,
owned_date,
4 as owned_by
from taxonomy_use

GO
/****** Object:  View [dbo].[taxtorc]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[taxtorc] as select t.name as species,t.taxonomy_species_id,c.name as crop,c.crop_id
from crop c
join taxonomy_crop_map m on m.crop_id=c.crop_id
join taxonomy_species t on t.taxonomy_species_id=m.taxonomy_species_id
GO
/****** Object:  View [dbo].[vc_inventory]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*
   Schema change to create a view for calculated non-base inventory fields for dataviews
*/
CREATE VIEW [dbo].[vc_inventory] AS
SELECT
	i.inventory_id,

	(SELECT site_id FROM cooperator WHERE cooperator_id = i.owned_by) AS site_id,

	(SELECT taxonomy_species_id FROM accession WHERE accession_id = i.accession_id) AS taxonomy_species_id,

	(select s.geography_id from accession_source s where i.accession_id = s.accession_id and accession_source_id = 
		(select MIN(accession_source_id) from accession_source s2 where i.accession_id = s2.accession_id and is_origin = 'Y')) AS geography_id,

	(SELECT MIN(plant_name)
		FROM accession_inv_name an2 JOIN inventory i2 ON i2.inventory_id = an2.inventory_id
		WHERE i2.accession_id = i.accession_id AND plant_name_rank =
			(SELECT MIN(plant_name_rank)
			FROM accession_inv_name an3 JOIN inventory i3 ON an3.inventory_id = i3.inventory_id
			WHERE i3.accession_id = i.accession_id)
	) AS plant_name,

	CASE
        WHEN EXISTS (SELECT * FROM accession_inv_name WHERE inventory_id = i.inventory_id)
        THEN (SELECT MIN(plant_name) FROM accession_inv_name WHERE inventory_id = i.inventory_id AND plant_name_rank =
                        (SELECT MIN(plant_name_rank) FROM accession_inv_name WHERE inventory_id = i.inventory_id))
        ELSE NULL
	END AS inv_name,

	iv.percent_viable,
	iv.tested_date,

	(1 + 0) * i.quantity_on_hand * iv.percent_viable / 100 AS pure_live_seed,

	CONCAT (
		CONCAT(inventory_number_part1, 
			CASE WHEN inventory_number_part2 IS NULL THEN '' 
				ELSE CONCAT(' ', CONVERT(NVARCHAR, inventory_number_part2), '')END)
	, CONCAT(CASE WHEN inventory_number_part3 IS NULL OR LTRIM(RTRIM(inventory_number_part3)) = ''
				THEN '' ELSE CONCAT(' ', LTRIM(RTRIM(inventory_number_part3))) END
		, (SELECT CASE WHEN cvl.title IS NOT NULL THEN CONCAT(' ', cvl.title) ELSE CONCAT(' ', form_type_code) END
			FROM code_value cv JOIN code_value_lang cvl ON cvl.code_value_id = cv.code_value_id
			WHERE cv.group_name = 'GERMPLASM_FORM' AND cv.value = form_type_code AND cvl.sys_lang_id = 1))
	) AS inventory_id_string

FROM
    inventory i
    LEFT JOIN inventory_viability iv ON inventory_viability_id =
        (SELECT MAX(inventory_viability_id) FROM inventory_viability WHERE inventory_id = i.inventory_id AND tested_date =
            (SELECT MAX(tested_date) FROM inventory_viability WHERE inventory_id = i.inventory_id))
GO
/****** Object:  View [dbo].[via_final]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[via_final] as select
inventory_id as ivid, (select top 1 percent_viable from inventory_viability where
inventory_id=i.inventory_id order by tested_date desc)  as last_germ,
(select top 1 CONVERT (varchar(10),tested_date,101) from
inventory_viability where inventory_id=i.inventory_id order by tested_date
desc) as last_date from inventory i ;

GO
/****** Object:  View [dbo].[vou]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vou] as select 
i.inventory_id as ivid,
inventory_number_part1 as ivp,
inventory_number_part2 as ivno,
inventory_number_part3 as ivs,
form_type_code as ivt,
accession_number_part1  as acp, 
accession_number_part2  as acno,
accession_number_part3  as acs,
a.accession_id as acid,
category_code as vtype,
virtual_path as vloc,
at.is_web_visible,
accession_inv_attach_id as vno,
thumbnail_virtual_path as thumbnail,
description as vcontent,
at.created_by,at.created_date,
at.owned_by,
at.owned_date
	from accession_inv_attach at
	 join inventory i on at.inventory_id=i.inventory_id 
	 join accession a on a.accession_id=i.accession_id

GO
/****** Object:  View [dbo].[vw_accession_ipr]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_accession_ipr]
AS
SELECT 
	TRY_PARSE(substring(ipr_number,5,20) AS INT) AS pv_number,
	accession_id
FROM 
	accession_ipr ai
WHERE
	ai.type_code = 'PVP'  
AND 
	ipr_number not like '%MP'
AND 
	ipr_number not like '%FP'
AND 
	ipr_number not like '%P1'
AND 
	ipr_number not like '%P2'
AND 
	ipr_number not like '%P3'
AND 
	dbo.get_avstat(ai.accession_id) = 'Y'
AND
	TRY_PARSE(substring(ipr_number,5,20) AS INT) IS NOT NULL
GO
/****** Object:  View [dbo].[vw_cgc_lookup_document_categories]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_cgc_lookup_document_categories]
AS
SELECT
		cv.code_value_id,
		cvl.code_value_lang_id,
		cv.group_name,
		cv.value,
		cvl.title,
		cvl.description,
		cv.created_date,
		cv.modified_date
	FROM
		code_value cv
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cv.group_name = 'CGC_DOCUMENT_CATEGORY'
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_lookup_cooperator_category]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_cooperator_category]
AS
SELECT 
	cv.code_value_id,
	cv.value,
	cvl.title,
	cvl.description
FROM 
	code_value cv
JOIN
	code_value_lang cvl
ON
	cv.code_value_id = cvl.code_value_id
WHERE 
	cv.group_name = 'COOPERATOR_CATEGORY'
AND
	cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_lookup_site_emails]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_lookup_site_emails]
AS
SELECT
	s.site_short_name,
 case s.site_short_name 
      when 'BRW' then 'lj.grauke@ars.usda.gov'
     -- when 'CLO' then 'merrelyn.spinks@ars.usda.gov'
      when 'COR' then 'Missy.Fix@ars.usda.gov'
      when 'COT' then 'james.frelichowski@ars.usda.gov;janna.love@ars.usda.gov'  
      when 'DAV' then 'ordersNCGR.davis@ars.usda.gov'
      when 'DBMU' then 'benjamin.haag@usda.gov'
      when 'DLEG' then 'mjohnson@ag.arizona.edu'
     -- when 'FLAX' then 'nc7mb@ars-grin.gov'
     -- when 'FRA' then 'esnake@mis.net'
      when 'GEN' then 'dawn.dellefave@ars.usda.gov;ben.gutierrez@ars.usda.gov'
      --grin:
      --gsho:
      when 'GSOR' then 'lorie.bernhardt@ars.usda.gov'
      when 'GSPI' then 'barbara.hellier@ars.usda.gov;alec.mccall@wsu.edu;stoutd@wsu.edu;lisa.taylor@usda.gov'
      --gstr:
      when 'GSZE' then 'maize@uiuc.edu'
      when 'HILO' then 'Carol.MayoRiley@ars.usda.gov;Tracie.Matsumoto@ars.usda.gov'
      when 'MAY' then 'tomas.ayala-silva@usda.gov;ricardo.goenaga@usda.gov'
      when 'MIA' then 'Mike.Winterstein@usda.gov;Ricardo.Goenaga@usda.gov'
      when 'NA' then 'kevin.conrad@ars.usda.gov'
      when 'NC7' then 'nc7orders@ars.usda.gov;lisa.burke@ars.usda.gov'
      when 'NE9' then 'Joanne.Labate@ARS.USDA.GOV;sherri.tennies@ars.usda.gov'
      when 'NR6' then 'jesse.schartner@ars.usda.gov;mwmarti1@wisc.edu'
      when 'NSGC' then 'harold.bockelman@ars.usda.gov'
      when 'NSSL' then 'renee.white@ars.usda.gov'
      when 'OPGC' then 'stieve.1@osu.edu'
      --orders:
     -- when 'PALM' then 'danny.barney@ars.usda.gov'
      when 'PARL' then 'Claire.Heinitz@ars.usda.gov'
      when 'PEO' then 'karen.williams@ars.usda.gov'
     -- when 'PGQO' then 'steven.a.king@aphis.usda.gov'
      --puborder:
      when 'RIV' then 'Robert.krueger@ars.usda.gov'
      when 'SBML' then 'melanie.schori@ars.usda.gov'
      when 'SOY' then 'Todd.Bedford@ars.usda.gov;esther.peregrine@ars.usda.gov'
      when 'S9' then 'tiffany.fields@ars.usda.gov;ARS-S9Orders@ars.usda.gov'
      when 'TGRC' then 'trchetelat@ucdavis.edu'
      when 'TOB' then 'jessica_nifong@ncsu.edu'
      when 'W6' then 'stoutd@wsu.edu;barbara.hellier@ars.usda.gov;lisa.taylor@usda.gov;david.vanklaveren@wsu.edu;alec.mccall@wsu.edu;'      
      else 'benjamin.haag@usda.gov'
   end as email
	  FROM site s
GO
/****** Object:  View [dbo].[vw_nrr_orders]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_nrr_orders]
AS
SELECT 
	wc.email,
	--COUNT(*)
	worq.created_date,
	(SELECT COUNT (DISTINCT accession_id) FROM web_order_request_item WHERE web_order_request_id = worq.web_order_request_id) AS accessions,
	ora.order_request_action_id,
	ora.action_name_code,
	ora.completed_date,
	orq.order_request_id,
	orq.web_order_request_id,
	worq.status_code,
	worq.intended_use_note,
	worq.intended_use_code,
	worq.special_instruction,
	worq.web_cooperator_id
FROM
	order_request_action ora
JOIN
	order_request orq
ON
	ora.order_request_id = orq.order_request_id
JOIN
	web_order_request worq
ON
	orq.web_order_request_id = worq.web_order_request_id
JOIN
	web_cooperator wc
ON
	worq.web_cooperator_id = wc.web_cooperator_id
WHERE
	ora.action_information LIKE '%NRR%' AND ora.action_name_code = 'CANCEL'
--ORDER BY created_date DESC

--GROUP BY email ORDER BY COUNT(*) DESC

--SELECT * FROM order_request WHERE requestor_cooperator_id IN
--(SELECT cooperator_id FROM cooperator WHERE email = 'kuchipudipavani999@gmail.com'
--)

--SELECT * FROM web_order_request WHERE web_cooperator_id IN
--(SELECT web_cooperator_id FROM web_cooperator WHERE email = 'kuchipudipavani999@gmail.com')


GO
/****** Object:  View [dbo].[vw_pvp_applications_by_expiration]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_pvp_applications_by_expiration]
AS
	SELECT 
		1 AS sort_order,
	'Expiring Within 6 Months' AS category
	,[pvp_application_number]
    ,[cultivar_name]
    ,[experimental_name]
    ,pa.pvp_common_name_id
	,pc.name AS common_name
   ,scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101))  AS months_remaining
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	WHERE
	  certificate_issued_date IS NOT NULL
	AND
		pa.pvp_application_status_id = 18
	AND		
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) >= GETDATE()
	AND
		DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) <=6

		UNION

		SELECT 
		2 AS sort_order,
	'Expiring Within 1 Year' AS category
	,[pvp_application_number]
    ,[cultivar_name]
    ,[experimental_name]
    ,pa.pvp_common_name_id
	,pc.name AS common_name
     ,pa.scientific_name
     ,pa.pvp_applicant_id
	 ,papp.name AS applicant_name
     ,[application_date]
     ,[is_certified_seed]
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,[status_date]
     ,[certificate_issued_date]
     ,[years_protected]
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) AS months_remaining
	FROM 
		[gringlobal].[dbo].[pvp_application] pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	WHERE
	  certificate_issued_date IS NOT NULL
	AND
		pa.pvp_application_status_id = 18
	AND		
		convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) >= GETDATE()
	AND
		DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) <=12
GO
/****** Object:  View [dbo].[vw_sys_application]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_sys_application]
AS
SELECT
		sys_application_id,
		sg.sys_group_id,
		sg.group_tag,
		code,
		title,
		description,
		url,
		color_code,
		image_file_name
	FROM
		sys_application sa
	JOIN
		sys_group sg
	ON
		sa.sys_group_id = sg.sys_group_id
	
GO
/****** Object:  View [dbo].[vw_sys_table_fields]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_sys_table_fields]
AS
SELECT table_name, field_name, field_type, field_purpose FROM sys_table st
JOIN
sys_table_field stf
ON
st.sys_table_id = stf.sys_table_id
WHERE table_name LIKE 'taxonomy%'

GO
/****** Object:  View [dbo].[vw_table_fields]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_table_fields]
AS
SELECT 
	st.sys_table_id,
    table_name,
	stf.field_name,
	stfl.title,
	REPLACE(title, ' ', '') AS formatted_title
FROM
	sys_table st
JOIN
	sys_table_field stf
ON
	st.sys_table_id = stf.sys_table_id
JOIN
	sys_table_field_lang stfl
ON
	stf.sys_table_field_id = stfl.sys_table_field_id
WHERE
	table_name LIKE 'taxonomy%'
AND
	stfl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_taxonomy_breeding_types]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_breeding_types]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_BREEDING_TYPE'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_breeding_type_lookup]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_breeding_type_lookup]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_BREEDING_TYPE'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_genepool_lookup]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_genepool_lookup]
AS

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_cwr_trait_class_lookup]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_cwr_trait_class_lookup]
AS
SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_TRAIT_CLASS'
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[vw_taxonomy_genepool_codes]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genepool_codes]
AS

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_genepools]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genepools]
AS
	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		--group_name LIKE '%CWR%'
	 group_name = 'CWR_GENEPOOL'
	AND
		cvl.sys_lang_id = 1
	
GO
/****** Object:  View [dbo].[vw_taxonomy_genus_lookup]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_genus_lookup]
AS
SELECT 
	tg.taxonomy_genus_id,
	LTRIM(RTRIM(COALESCE(tg.genus_name, '')))
	+ CASE COALESCE(convert(nvarchar, tg.subgenus_name), '') WHEN '' THEN '' ELSE '' + ' subg. ' + LTRIM(RTRIM(tg.subgenus_name)) END
	+ CASE COALESCE(convert(nvarchar, tg.section_name), '') WHEN '' THEN '' ELSE '' + ' sect. ' + LTRIM(RTRIM(tg.section_name)) END
	+ CASE COALESCE(convert(nvarchar, tg.subsection_name), '') WHEN '' THEN '' ELSE '' + ' subsect. ' + LTRIM(RTRIM(tg.subsection_name)) END
	 + CASE COALESCE(convert(nvarchar, tg.series_name), '') WHEN '' THEN '' ELSE '' + ' ser. ' + LTRIM(RTRIM(tg.series_name)) END
	 + CASE COALESCE(convert(nvarchar, tg.subseries_name), '') WHEN '' THEN '' ELSE '' + ' subser. ' + LTRIM(RTRIM(tg.subseries_name)) END
	 + CASE WHEN EXISTS (SELECT * FROM taxonomy_genus WHERE genus_name = tg.genus_name 
			AND COALESCE(subgenus_name, '') = COALESCE(tg.subgenus_name, '')
			AND COALESCE(section_name, '') = COALESCE(tg.section_name, '')
			AND COALESCE(subsection_name, '') = COALESCE(tg.subsection_name, '')
			AND COALESCE(series_name, '') = COALESCE(tg.series_name, '')
			AND COALESCE(subseries_name, '') = COALESCE(tg.subseries_name, '')
			AND taxonomy_genus_id != tg.taxonomy_genus_id)
		THEN ' ' + genus_authority
		ELSE '' END
	AS genus_name,
	tg.genus_authority,
	CASE 
		WHEN 
			taxonomy_genus_id = current_taxonomy_genus_id OR qualifying_code = '~'
		THEN 'Y' 
		ELSE 'N' 
	END AS is_accepted_genus
FROM
  taxonomy_genus tg

--WHERE
  --((tg.created_date > COALESCE(:createddate, '1753-01-01'))
   --OR (tg.modified_date > COALESCE(:modifieddate, '1753-01-01'))
   --OR (tg.taxonomy_genus_id IN (:valuemember))
   --OR (tg.taxonomy_genus_id BETWEEN :startpkey AND :stoppkey)
 --)
GO
/****** Object:  View [dbo].[vw_taxonomy_trait_classes]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_taxonomy_trait_classes]
AS
SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
	   group_name = 'CWR_TRAIT_CLASS'
	AND
		cvl.sys_lang_id = 1
GO
/****** Object:  View [dbo].[web_order_request_view]    Script Date: 5/26/2021 9:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[web_order_request_view] as select last_name,first_name,organization, r.* from web_order_request r, web_cooperator c 
where r.web_cooperator_id=c.web_cooperator_id
GO
