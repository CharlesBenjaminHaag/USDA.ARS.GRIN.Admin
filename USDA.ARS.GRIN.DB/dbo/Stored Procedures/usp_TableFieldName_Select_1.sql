-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TableFieldName_Select]
	@title NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		field_name
	FROM 
		vw_table_fields
	WHERE
		formatted_title = @title
END
