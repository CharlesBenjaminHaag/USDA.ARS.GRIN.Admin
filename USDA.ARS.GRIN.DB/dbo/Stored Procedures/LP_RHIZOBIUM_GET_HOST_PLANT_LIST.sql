-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LP_RHIZOBIUM_GET_HOST_PLANT_LIST] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT
		host_plant
    FROM 
		rhy
	WHERE
		LEN(LTRIM(RTRIM(host_plant))) > 0
	AND
		host_plant IS NOT NULL
	ORDER BY
		host_plant ASC
END
