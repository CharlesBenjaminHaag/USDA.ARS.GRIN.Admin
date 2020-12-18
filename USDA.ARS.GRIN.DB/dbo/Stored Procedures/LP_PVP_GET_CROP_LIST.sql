-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_PVP_GET_CROP_LIST] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		pvp_crop_id,
		pvp_crop_desc
	FROM 
		pvp_crop
	ORDER BY 
		pvp_crop_desc ASC
END
