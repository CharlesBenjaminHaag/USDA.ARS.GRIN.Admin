

-- ===============================================================================
-- Author		: Benjamin Haag
-- Create Date	: 5/17/2019
-- Description	: Returns all Rhyzobium records where one or more fields matches
--				  a specified search criterion.
--
-- Revision History
-- ================
-- Date			By				Description
-- ----		    --              -----------
-- ===============================================================================

CREATE PROCEDURE [LP_SEARCH_RHIZOBIUM]
   @searchString VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		rhy_id,
		COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier,
		usda_acces,
		synonym_1,
		synonym_2,
		synonym_3,
		synonym_4 ,
		host_plant ,
		common_nam,
		source,
		geo_source,
		serogroup,
		hosts_nodu,
		comments,
		genus_spp 
	FROM 
		rhy
	WHERE
	LEN(COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp)) > 0
	AND
	(
		LTRIM(RTRIM(rhy.synonym_1)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_2)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_3)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.synonym_4)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.host_plant)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.common_nam)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.geo_source)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.serogroup)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.hosts_nodu)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.comments)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%' 
	OR
		LTRIM(RTRIM(rhy.genus_spp)) LIKE '%' + LTRIM(RTRIM(@searchString)) + '%')
END
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_user]
GRANT EXECUTE ON LP_SEARCH_RHYZOBIUM TO [gg_search]
