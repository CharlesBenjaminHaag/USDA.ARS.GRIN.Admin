-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_CitationsBySpecies_Select]
	@taxonomy_species_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		cit.citation_id,
		COALESCE(l.abbreviation, '')
			+ CASE WHEN l.abbreviation IS NOT NULL AND cit.type_code IS NOT NULL THEN '. ' ELSE '' END
			+ CASE cit.type_code
				WHEN 'MEDICINE' THEN 'MED'
				WHEN 'RELATIVE' THEN 'CWR'
				WHEN 'NODULATION' THEN 'NOD'
				ELSE '' END
			+ COALESCE(CASE WHEN l.abbreviation IS NULL AND cit.type_code IS NULL THEN '' ELSE '. ' END
			+ CONVERT(NVARCHAR, cit.citation_year), '')
			+ COALESCE(CASE WHEN l.abbreviation IS NULL AND cit.type_code IS NULL AND cit.citation_year IS NULL THEN '' ELSE '. ' END 
			+ COALESCE(cit.citation_title, cit.title), '')
			+ COALESCE('. ' + cit.author_name, '')
			+ COALESCE( '; ' + cit.reference, '')
		AS citation_text,
		cit.title,
		l.literature_id,
		l.reference_title,
		cit.taxonomy_species_id,
		ts.current_taxonomy_species_id
	FROM
		citation cit
	LEFT JOIN 
		literature l 
	ON 
		cit.literature_id = l.literature_id
	INNER JOIN 
		taxonomy_species ts 
	ON 
		cit.taxonomy_species_id = ts.taxonomy_species_id
	WHERE
		cit.taxonomy_species_id = @taxonomy_species_id
	ORDER BY
		citation_text ASC
END
