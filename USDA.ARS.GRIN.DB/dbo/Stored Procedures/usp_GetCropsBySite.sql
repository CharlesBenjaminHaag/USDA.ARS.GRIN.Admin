-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCropsBySite] 
AS
BEGIN
	SET NOCOUNT ON;

SELECT 
	S.site_id,
	S.site_long_name,
	crop_id,
	(SELECT adm1 FROM geography WHERE geography_id = c.geography_id) AS STATE,
	C.city,
	CR.name,
	CR.owned_by
FROM 
	[gringlobal].[dbo].[crop] CR
LEFT JOIN
	cooperator C
ON
	 C.cooperator_id  = CR.owned_by
LEFT OUTER JOIN
	site S
ON
	s.site_id = C.site_id
WHERE 
	C.site_id IN (1,2,3,4,5,6,7,8,9,13,15,16,17,19,22,24,26,28,29,31,37,38,40,42)
ORDER BY 
	S.site_id ASC, 
	CR.name ASC

END
