-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_PVP_GET_APPLICATION_STATUS_LIST] 
AS
BEGIN
	SELECT 
		status_id,
		description
	FROM 
		pvp_status
	ORDER BY
		description ASC
END
