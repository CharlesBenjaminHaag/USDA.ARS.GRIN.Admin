
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_GenesysExport_Select]
	--@sampstat_code NVARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

SELECT
	a.accession_id as INTERNAL_ID,

	--DEBUG
	a.created_date,

	LTRIM(RTRIM(s.fao_institute_number)) as INSTCODE,
	ISNULL(a.doi,'') as DOI,
	TRIM(CONCAT(a.accession_number_part1, ' ', a.accession_number_part2, ' ' + a.accession_number_part3)) as ACCENUMB,
	ts.name as SPECIES_FULL,
	trim(concat(tg.hybrid_code, tg.genus_name)) as GENUS,
	ts.species_name as SPECIES,
	ISNULL(ts.species_authority,'') as SPAUTHOR,
	TRIM(SUBSTRING(ts.name, LEN(trim(concat(tg.hybrid_code, tg.genus_name)))+LEN(ts.species_name)+3, 1000)) as SUBTAXA,
	ISNULL(ts.name_authority,'') as SUBTAUTHOR,
	CONCAT('https://npgsweb.ars-grin.gov/gringlobal/accessiondetail?id=', a.accession_id) as ACCEURL,

	--Biological status of the accession
	(CASE 
		a.improvement_status_code
		WHEN 'WILD' THEN '100'
		WHEN 'CULTIVAR' THEN '500'
		WHEN 'CULTIVATED' THEN '999'
		WHEN 'LANDRACE' THEN '500'
		WHEN 'UNCERTAIN' THEN '999'
		WHEN 'BREEDING' THEN '410'
		WHEN 'CLONE' THEN '416'
		WHEN 'GENETIC' THEN '420'
	ELSE 
		'999'
	END) AS SAMPSTAT,
	ISNULL(a.note, '') AS REMARKS,
	
		-- Acquisition data
		a.initial_received_date, -- for comparison only
	CASE
		when a.initial_received_date is not null then
			case a.initial_received_date_code
				when null then 
					format(a.initial_received_date, 'yyyyMMdd')
				when 'YYYY-MM' then 
					format(a.initial_received_date, 'yyyyMM--')
				when 'YYYY' then 
					format(a.initial_received_date, 'yyyy--')
				else 
					format(a.initial_received_date, 'yyyyMMdd')
			end
		else null -- keep null
	END as ACQDATE,
	
	-- status
	CASE a.status_code
		when 'INACTIVE' then 'Y' -- add codes that mean historical accessions
		when 'INACTIVE2' then 'Y' -- add codes that mean historical accessions
		else 'N' -- not historic
	END as HISTORIC,
	
	-- collecting source
	ISNULL(src.collector_verbatim_locality,'') as COLLSITE,
	ISNULL(src.georeference_datum,'') as GEOREFMETH,
	ISNULL(src.uncertainty,'') as COORDUNCERT,
	src.latitude as DECLATITUDE,
	src.longitude as DECLONGITUDE,
	ISNULL(src_geo.country_code,'') as ORIGCTY		
FROM 
	accession a
inner join 
	taxonomy_species ts on ts.taxonomy_species_id=a.taxonomy_species_id
inner join 
	taxonomy_genus tg on tg.taxonomy_genus_id=ts.taxonomy_genus_id
inner join 
	cooperator O on O.cooperator_id=a.owned_by
inner join 
	site s on s.site_id=O.site_id
left outer join 
	accession_source src on src.accession_id=a.accession_id and src.is_origin='Y' and src.is_web_visible='Y'
left outer join 
	geography src_geo on src_geo.geography_id=src.geography_id
where
	a.is_web_visible='Y'
AND
	--ISNULL(a.improvement_status_code,'') = @sampstat_code
	a.created_date BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()
END

