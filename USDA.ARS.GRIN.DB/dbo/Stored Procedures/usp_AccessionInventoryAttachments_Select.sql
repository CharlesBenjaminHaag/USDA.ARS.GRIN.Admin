-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_AccessionInventoryAttachments_Select] 
	@batch_size INT,
	@status_code NVARCHAR(2) = ''
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @where_clause NVARCHAR(2000)
	DECLARE @sql_statement NVARCHAR(2000);

	SET @sql_statement = 'SELECT TOP ' + CONVERT(NVARCHAR(4),@batch_size) + 
	' accession_inv_attach_id,
	virtual_path,
	thumbnail_virtual_path,
	title,
	owned_by,
	created_date,
	image_url_is_valid,
	image_thumbnail_url_is_valid,
	validated_date,
	status_code,
	status_code_desc
FROM 
	vw_accession_inventory_attachments_by_validation'

IF (LEN(TRIM(@status_code)) > 0)
	BEGIN
		SET @sql_statement = @sql_statement + ' WHERE status_code =''' + @status_code + ''''
	END;

SET @sql_statement = @sql_statement + ' ORDER BY accession_inv_attach_id ASC';

DECLARE @Results TABLE
(
	[accession_inv_attach_id] [int] NOT NULL,
	virtual_path NVARCHAR(255),
	thumbnail_virtual_path NVARCHAR(255),
	title NVARCHAR(255),
	owned_by INT,
	[created_date] [datetime2](7),
	[image_url_is_valid] [int],
	[image_thumbnail_url_is_valid] [int],
	validated_date [datetime2](7),
	status_code NVARCHAR(4),
	status_code_desc NVARCHAR(20)
)

INSERT INTO @Results
	EXECUTE sp_executesql @sql_statement

SELECT 
	* 
FROM 
	@Results

END
