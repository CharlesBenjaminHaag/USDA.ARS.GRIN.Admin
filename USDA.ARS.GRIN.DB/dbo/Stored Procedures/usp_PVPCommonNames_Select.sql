-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPCommonNames_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_common_name_id AS id,
		name AS title,
		(SELECT COUNT(*) FROM pvp_application WHERE pvp_common_name_id = c.pvp_common_name_id) AS count
	FROM
		pvp_common_name c
	ORDER BY name
END
