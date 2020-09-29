
CREATE FUNCTION [dbo].[fn_ts_taxon](@id int, @is_italics nvarchar(1), @is_author nvarchar(1)) RETURNS nvarchar(100) AS
BEGIN
	DECLARE @istart nvarchar(4) = '<i>'
	DECLARE @iend nvarchar(4) = '</i>'
	DECLARE @taxon nvarchar(100)
	IF @is_italics != 'Y'
	BEGIN
		SET @istart = ''
		SET @iend = ''
	END

	SET @taxon = (SELECT 
	CASE hybrid_code WHEN 'X' THEN '×' WHEN '+' THEN '+' ELSE '' END + @istart
	+ genus_name + ' '
	+ CASE is_specific_hybrid WHEN 'Y' THEN @iend+'×'+@istart ELSE '' END
	+ species_name + @iend 
	+ CASE WHEN @is_author = 'Y' THEN COALESCE (' '+species_authority, '') ELSE '' END
	+ CASE WHEN subspecies_name IS NOT NULL
		THEN ' subsp. '+@istart + subspecies_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+subspecies_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN variety_name IS NOT NULL
		THEN ' var. '+@istart + variety_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+variety_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN subvariety_name IS NOT NULL
		THEN ' subvar. '+@istart + subvariety_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+subvariety_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN forma_name IS NOT NULL
		THEN ' ' + forma_rank_type + ' '+@istart + forma_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+forma_authority, '') ELSE '' END ELSE '' END
	AS taxon
  FROM taxonomy_species
  JOIN taxonomy_genus ON taxonomy_genus.taxonomy_genus_id = taxonomy_species.taxonomy_genus_id
  WHERE taxonomy_species_id = @id
)

	RETURN @taxon
END
