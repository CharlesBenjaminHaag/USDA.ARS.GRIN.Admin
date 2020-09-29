-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Folder_Select] 
	@taxonomy_folder_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_folder_id,
		title,
		description,
		category,
		note,
		is_shared,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tf.modified_by) AS modified_by_name
	FROM 
		taxonomy_folder tf
	WHERE
		taxonomy_folder_id = @taxonomy_folder_id
END
