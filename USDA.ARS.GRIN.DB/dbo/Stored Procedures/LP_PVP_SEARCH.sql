-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [LP_PVP_SEARCH] 
AS
BEGIN
	SELECT 
		[pvpo_catalog_id] ,
		[PVNUMBER] ,
		[EXPERMENTALNAMESYNONYMS] ,
		T.description AS TAXON,
		CR.pvp_crop_desc AS CROP,
		A.name AS APPLICANTOWNER,
		[APPLICATIONDATE] ,
		[CERTIFIEDSEED] ,
		s.status_id AS STATUS_ID,
		s.description AS STATUS,
		[STATUSDATE] ,
		[DATEISSUED],
		[YEARSPROTECTED] ,
		[PAGES],
		[REFILEDUNDER1994PVPA] ,
		[AMENDMENTS], 
		ISNULL(VARIETY, EXPERMENTALNAMESYNONYMS) AS VARIETY 
	FROM 
		pvpo_catalog C
	JOIN
		pvp_applicant A
	ON
		C.applicant_id = A.applicant_id
	JOIN
		pvp_status S
	ON
		C.status_id = S.status_id
	JOIN
		pvp_crop CR
	ON
		C.crop_id = CR.pvp_crop_id
	JOIN
	   pvp_taxonomy T
	ON
		C.taxonomy_id = T.taxonomy_id
END
