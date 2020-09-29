-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPExpirationPeriods_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DISTINCT 
		sort_order, 
		category,
		(SELECT COUNT(*) FROM vw_pvp_applications_by_expiration WHERE sort_order = vpae.sort_order) AS count
	FROM 
		vw_pvp_applications_by_expiration vpae
	ORDER BY
		sort_order
END
