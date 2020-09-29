-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_FoldersByUser_Select] 
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id
		,title
		,description
		,category
		,note
		,is_shared
		,created_date
	FROM 
		taxonomy_folder
	WHERE
		created_by = @cooperator_id
END
