﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFolder_Insert] 
	@out_error_number INT = 0 OUTPUT,
	@out_taxonomy_folder_id INT = 0 OUTPUT,
	@title NVARCHAR(250),
    @description NVARCHAR(MAX),
	@note NVARCHAR(500),
	@is_shared BIT,
    @data_source NVARCHAR(150),
	@created_by INT
AS
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		INSERT INTO	taxonomy_folder
			(
				title, 
				description, 
				note,
				is_shared,
				data_source,
				created_by, 
				created_date
			)
		VALUES 
			(
				@title, 
				@description, 
				@note,
				@is_shared,
				@data_source,
				@created_by, 
				GETDATE()
			)
		SELECT @out_taxonomy_folder_id = CAST(SCOPE_IDENTITY() AS INT)
	END TRY
	BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END