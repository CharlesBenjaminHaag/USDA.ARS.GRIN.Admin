-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_RHIZOBIUM_GET_DETAIL]
	@host_plant_name NVARCHAR(254)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		[rhy_id]
		,COALESCE(synonym_1,synonym_2,synonym_3,synonym_4, genus_spp) AS identifier
		,[usda_acces]
		,[synonym_1]
		,[synonym_2]
		,[synonym_3]
		,[synonym_4]
		,[host_plant]
		,[common_nam]
		,[source]
		,[geo_source]
		,[serogroup]
		,[hosts_nodu]
		,[comments]
		,[genus_spp]
	FROM 
		rhy
	WHERE
		LTRIM(RTRIM(host_plant)) = LTRIM(RTRIM(@host_plant_name))
END
