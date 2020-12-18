

create view [taxgeo_site_view] as SELECT 1 AS [site_id]
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
  FROM [$(DatabaseName)].[site]
  WHERE site_short_name IN ('SYS')

