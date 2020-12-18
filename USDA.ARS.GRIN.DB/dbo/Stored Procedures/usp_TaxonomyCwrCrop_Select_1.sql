
CREATE PROCEDURE [usp_TaxonomyCwrCrop_Select]
	@taxonomy_cwr_crop_id INT
AS
BEGIN
	SELECT
		taxonomy_cwr_crop_id,
		crop_name,
		note,
		created_date,
		created_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.created_by) AS created_by_name,
		modified_date,
		modified_by,
		(SELECT first_name + ' ' + last_name FROM cooperator WHERE cooperator_id = tcc.modified_by) AS modified_by_name

	FROM
		taxonomy_cwr_crop tcc
	WHERE
		taxonomy_cwr_crop_id = @taxonomy_cwr_crop_id
	
END
