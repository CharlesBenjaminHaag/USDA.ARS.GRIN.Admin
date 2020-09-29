-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PVPSearch] 
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	SET @sqlStatement = 'SELECT 
	 pa.pvp_application_number
     ,cultivar_name
     ,experimental_name
     ,pa.pvp_common_name_id
	 ,pa.scientific_name
	 ,pc.name AS common_name
     ,pa.pvp_applicant_id
	 ,papp.name
     ,application_date
     ,is_certified_seed
     ,pas.pvp_application_status_id
	 ,pas.description AS application_status
     ,status_date
     ,certificate_issued_date
     ,years_protected
	 ,convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101) AS expiration_date
	 ,CASE
		WHEN (convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)  > GETDATE())
		THEN DATEDIFF(month,GETDATE(),convert(nvarchar(12),dateadd(year,years_protected,cast(certificate_issued_date as date)),101)) 
	 END AS months_remaining
	 ,vi.accession_id
	FROM 
		pvp_application pa
	JOIN
		pvp_common_name pc
	ON
		pa.pvp_common_name_id = pc.pvp_common_name_id
	JOIN
		pvp_application_status pas
	ON
		pa.pvp_application_status_id = pas.pvp_application_status_id
	JOIN
		pvp_applicant papp
	ON
		pa.pvp_applicant_id = papp.pvp_applicant_id
	LEFT JOIN
		vw_accession_ipr vi
	ON
		pa.pvp_application_number = vi.pv_number'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	DECLARE @Results TABLE
	(pvp_application_number INT,
	 cultivar_name NVARCHAR(150),
     experimental_name NVARCHAR(150),
     pvp_crop_id INT,
	 scientific_name NVARCHAR(150),
	 common_name NVARCHAR(150),
     pvp_applicant_id INT,
	 applicant_name NVARCHAR(150),
     application_date DATETIME2(7),
     is_certified_seed BIT,
     pvp_application_status_id INT,
	 application_status NVARCHAR(120),
     status_date DATETIME2(7),
     certificate_issued_date DATETIME2(7),
     years_protected INT,
	 expiration_date DATETIME2(7),
	 months_remaining INT,
	 accession_id INT)

	INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	SELECT *
	FROM @Results
END
