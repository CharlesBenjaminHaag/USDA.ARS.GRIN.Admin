-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInvAttach_Search] 
	@batch_size INT = 0,	
	@sql_where_clause NVARCHAR(MAX) = ''
AS
BEGIN
	SET NOCOUNT ON;
	SET FMTONLY OFF;
	DECLARE @sqlStatement NVARCHAR(2000)
	DECLARE @batch_text NVARCHAR(20) = ' '

	IF (@batch_size > 0)
	BEGIN
		SET @batch_text = 'TOP ' + CONVERT(NVARCHAR(5),@batch_size)
	END

	SET @sqlStatement = ' SELECT ' + @batch_text + 
	   'aia.accession_inv_attach_id,        
	virtual_path,        
	thumbnail_virtual_path,        
	title,
	aia.owned_by,
	aia.created_date,
	aiav.image_thumbnail_url_is_valid,
	aiav.image_url_is_valid,
	aiav.created_date AS validated_date
FROM 
	accession_inv_attach aia
LEFT OUTER JOIN
	accession_inv_attach_validation aiav
ON
	aia.accession_inv_attach_id = aiav.accession_inv_attach_id'

	IF (LEN(LTRIM(RTRIM(@sql_where_clause))) > 0)
	BEGIN
		SET @sqlStatement = @sqlStatement + ' ' + @sql_where_clause
	END
	
	--DECLARE @Results TABLE
	--([accession_inv_attach_id] [int] IDENTITY(1,1) NOT NULL,
	-- [virtual_path] [nvarchar](255) NOT NULL,
	-- [thumbnail_virtual_path] [nvarchar](255) NULL,
	--[title] [nvarchar](500) NULL)

	--INSERT INTO @Results
	EXECUTE sp_executesql @sqlStatement

	--SELECT *
	--FROM @Results
END
