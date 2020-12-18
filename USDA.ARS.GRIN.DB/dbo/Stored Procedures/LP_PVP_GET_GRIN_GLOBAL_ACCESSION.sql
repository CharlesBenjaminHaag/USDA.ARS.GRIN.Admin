-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_PVP_GET_GRIN_GLOBAL_ACCESSION] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		ipr.acid,
		acc.site 
	FROM 
		acc,ipr
	WHERE 
		acc.acid=ipr.acid 
	AND 
		iprtype='PVP' 
	--AND 
	--	iprid='PVP $pvpno'
END
