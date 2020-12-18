


-- drop view taxgeo_citation_view 

create view [taxgeo_citation_view] as 
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
  FROM [$(DatabaseName)].[citation]  where  taxonomy_species_id is not null





