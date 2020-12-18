-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [LP_PVP_SEARCH_AVAILABLE] 
AS
BEGIN
	SET NOCOUNT ON;
SELECT 
	[pvpo_catalog_id] ,
	[PVNUMBER] ,
	[EXPERMENTALNAMESYNONYMS] ,
	[TAXON] ,
	crop_id ,
	applicant_id ,
	[APPLICATIONDATE] ,
	[CERTIFIEDSEED] ,
	status_id,
	[STATUSDATE] ,
	[DATEISSUED],
	[YEARSPROTECTED] ,
	[PAGES],
	[REFILEDUNDER1994PVPA] ,
	[AMENDMENTS], 
	ISNULL(VARIETY, EXPERMENTALNAMESYNONYMS) AS VARIETY,
	accession_id
FROM 
	pvpo_catalog c
JOIN	
	accession_ipr i
ON
	CAST(SUBSTRING(ipr_number,5,20) AS INT) = c.pvnumber
WHERE  
	i.type_code = 'PVP'  
and 
	ipr_number not like '%MP'
and 
	ipr_number not like '%FP'
and 
	ipr_number not like '%P1'
and 
	ipr_number not like '%P2'
and 
	ipr_number not like '%P3'
and 
	dbo.get_avstat(accession_id) = 'Y'
--and 
	--c.crop = '$crop'   
ORDER BY 
	cast(statusdate as date) desc 
END
