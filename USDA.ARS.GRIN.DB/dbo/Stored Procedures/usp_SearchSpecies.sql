-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_SearchSpecies] 
	@sql_statement NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

   EXECUTE sp_executesql @sql_statement
END
