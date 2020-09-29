-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_TaxonomyCwrCropsByUser_Select]
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		taxonomy_cwr_crop_id,
		  crop_name,
		  note,
		  (SELECT COUNT(taxonomy_cwr_map_id) FROM taxonomy_cwr_map WHERE tcc.taxonomy_cwr_crop_id = taxonomy_cwr_map.taxonomy_cwr_crop_id) AS cwr_count,
		  created_date,
		  created_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.created_by) AS created_by_name,
		  modified_date,
		  modified_by,
		  (SELECT first_name + ' ' + last_name FROM cooperator where cooperator_id = tcc.modified_by) AS modified_by_name
	FROM
		taxonomy_cwr_crop tcc
	WHERE
		owned_by = @cooperator_id
END
