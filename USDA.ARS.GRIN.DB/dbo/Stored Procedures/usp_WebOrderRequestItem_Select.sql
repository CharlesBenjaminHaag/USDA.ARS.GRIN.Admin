-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_WebOrderRequestItem_Select] 
	@web_order_request_item_id INT
AS
BEGIN
	SET NOCOUNT ON;
SELECT
	wori.web_order_request_item_id,
	web_cooperator_id,
	web_order_request_id,
	sequence_number,
	accession_id,
	status_code,
	(SELECT c.site_id FROM cooperator c JOIN accession a ON a.owned_by = c.cooperator_id AND a.accession_id = wori.accession_id) AS site_id,
	name,
	quantity_shipped,
	unit_of_shipped_code,
	distribution_form_code,
	curator_note,
	user_note,
	(SELECT taxonomy_species_id FROM accession WHERE accession_id = wori.accession_id) AS taxonomy_species_id,
	created_date,
	created_by,
	modified_date,
	modified_by,
	owned_date,
	owned_by
FROM
    web_order_request_item wori
WHERE
	web_order_request_item_id = @web_order_request_item_id
  

END
