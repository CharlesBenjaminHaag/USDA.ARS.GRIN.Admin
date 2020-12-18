-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_InventoryOwner_Update]
	@inventory_id INT,
	@cooperator_id INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE 
		inventory 
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_action
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_viability
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		inventory_quality_status
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_annotation
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_attach
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

	UPDATE 
		accession_inv_name
	SET 
		owned_by = @cooperator_id,
		owned_date = GETDATE()
	WHERE
		inventory_id = @inventory_id

END
