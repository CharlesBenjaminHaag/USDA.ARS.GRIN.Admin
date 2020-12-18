-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_PVP_GET_DETAIL]
	@crop_description NVARCHAR(60)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[pvpo_catalog_id] ,
		[PVNUMBER] ,
		[VARIETY],
		[EXPERMENTALNAMESYNONYMS] ,
		T.description AS TAXON,
		crop_id ,
		pc.pvp_crop_desc AS CROP,
		pa.name AS APPLICANTOWNER,
		[APPLICATIONDATE] ,
		[CERTIFIEDSEED],
		ps.status_id,
		ps.description AS STATUS,
		[STATUSDATE] ,
		[DATEISSUED],
		[YEARSPROTECTED] ,
		[PAGES],
		[REFILEDUNDER1994PVPA] ,
		[AMENDMENTS] 
	FROM 
		pvpo_catalog pt
	JOIN
		pvp_crop pc
	ON
		pt.crop_id  = pc.pvp_crop_id
	JOIN
		pvp_applicant pa
	ON
		pt.applicant_id = pa.applicant_id
	JOIN 
		pvp_status ps
	ON
		pt.status_id = ps.status_id
	JOIN
		pvp_taxonomy T
	ON
		pt.taxonomy_id = T.taxonomy_id
	WHERE
		pc.pvp_crop_desc = @crop_description
END
