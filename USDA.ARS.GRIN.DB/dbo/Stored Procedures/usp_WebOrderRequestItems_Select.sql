-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_WebOrderRequestItems_Select] 
	@web_order_request_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	wori.web_cooperator_id,
	web_order_request_id,
	sequence_number,
	a.accession_id,
	LTRIM(RTRIM(LTRIM(COALESCE(accession_number_part1, '') + ' ') + LTRIM(COALESCE(convert(varchar, accession_number_part2), '') + ' ') + COALESCE(accession_number_part3, ''))) AS accession_text,
	wori.status_code,
	c.site_id,
	s.site_long_name,
	wori.name,
	ISNULL(quantity_shipped,0) AS quantity_shipped,
	unit_of_shipped_code,
	(SELECT TOP 1
		title 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = unit_of_shipped_code 
	 AND 
		cvl.sys_lang_id = 1 
	 AND 
		group_name = 'UNIT_OF_QUANTITY') AS unit_of_shipped,
	distribution_form_code,
	(SELECT TOP 1
		description 
	 FROM 
		code_value_lang cvl
	 JOIN 
		code_value cv 
	 ON 
		cvl.code_value_id = cv.code_value_id
	 WHERE 
		value = distribution_form_code 
	 AND cvl.sys_lang_id = 1) AS distribution_form,
	curator_note,
	user_note,
	ts.taxonomy_species_id,
	ts.name AS species_name
FROM
    web_order_request_item wori
JOIN
	accession a
ON
	wori.accession_id = a.accession_id
JOIN
	cooperator c
ON
	a.owned_by = c.cooperator_id
JOIN
	site s
ON
	c.site_id = s.site_id
JOIN
	taxonomy_species ts
ON
	a.taxonomy_species_id = ts.taxonomy_species_id
WHERE
	web_order_request_id = @web_order_request_id
  

END
