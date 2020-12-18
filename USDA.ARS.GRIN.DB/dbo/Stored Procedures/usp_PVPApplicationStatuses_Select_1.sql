-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_PVPApplicationStatuses_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_application_status_id AS id,
		description AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_application_status_id = s.pvp_application_status_id) AS count
	FROM
		pvp_application_status s
	ORDER BY title
END
