




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





