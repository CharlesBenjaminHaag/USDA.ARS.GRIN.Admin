USE [gringlobal]
GO
/****** Object:  Trigger [dbo].[tr_scan_web_order_items]    Script Date: 8/1/2021 6:34:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER TRIGGER [dbo].[tr_scan_web_order_items] ON [dbo].[web_order_request_item]
AFTER INSERT
AS
	BEGIN TRY
		-- Web Order Request Attributes
		DECLARE @web_order_request_id INT
		DECLARE @web_order_request_intended_use_code NVARCHAR(20)
		DECLARE @web_order_request_intended_use_note NVARCHAR(MAX)
		DECLARE @web_order_request_item_cnt INT
		DECLARE @web_order_request_genera_cnt INT
		
		-- Web Cooperator Attributes
		DECLARE @web_cooperator_id INT
		DECLARE @web_cooperator_status_code NVARCHAR(20)
		DECLARE @web_cooperator_email NVARCHAR(100)
		
		-- Email Attributes
		DECLARE @email_subject NVARCHAR(2000)
		DECLARE @email_body NVARCHAR(4000)
		DECLARE @email_sent BIT
		DECLARE @web_order_request_action_id INT
		DECLARE @error_code INT

		-- Email Template
		DECLARE @email_template_subject NVARCHAR(500)
		DECLARE @email_template_body NVARCHAR(MAX)

		DECLARE @risk_factor_count INT = 0
		DECLARE @cancelled_order_count INT = 0
		
		-- Get web cooperator and web order attributes to evaluate.
		SELECT
			@web_order_request_id = web_order_request_id,
			@web_cooperator_id = web_cooperator_id
		FROM
			inserted
		
		SELECT
			@web_order_request_intended_use_code = intended_use_code,
			@web_order_request_intended_use_note = intended_use_note	
		FROM
			web_order_request
		WHERE
			web_order_request_id = @web_order_request_id

		SELECT
			@web_cooperator_email = email,
			@web_cooperator_status_code = status_code
		FROM
			web_cooperator
		WHERE
			web_cooperator_id = @web_cooperator_id

		IF (@web_cooperator_email NOT LIKE '%.gov') AND (@web_cooperator_email NOT LIKE '%.edu')
			BEGIN
				SET @risk_factor_count = @risk_factor_count + 1
				EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_EMAIL', 'Non-official email address.', 1
				
				-- ===================================================================
				-- NRR FLAG: COOPERATOR FLAG
				-- ===================================================================
				IF (@web_cooperator_status_code = 'FLAGGED')
					BEGIN
						SET @risk_factor_count = @risk_factor_count + 1
						EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_COOP', 'Cooperator has been flagged.', 1
					END

				-- ===================================================================
				-- NRR FLAG: INTENDED USE
				-- ===================================================================
				IF (@web_order_request_intended_use_code LIKE '%home%') 
				OR (@web_order_request_intended_use_note LIKE '%home%') 
				OR (@web_order_request_intended_use_note LIKE '%garden%')
				OR (@web_order_request_intended_use_note LIKE '%home%garden%')
					BEGIN
						SET @risk_factor_count = @risk_factor_count + 1
						EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_USE', 'Intended use is other than research.', 1
					END

				-- ===================================================================
				-- NRR FLAG: EMAIL DOMAIN
				-- ===================================================================
				--IF (@web_cooperator_email NOT LIKE '%.gov') AND (@web_cooperator_email NOT LIKE '%.edu')
				--	BEGIN
				--		SET @risk_factor_count = @risk_factor_count + 1
				--		EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_EMAIL', 'Non-official email address.', 1
				--	END

				-- ===================================================================
				-- NRR FLAG: HISTORY OF CANCELLED ORDERS
				-- ===================================================================
				SELECT @cancelled_order_count =	COUNT(*)
				FROM 
					web_order_request wor
				JOIN
					web_cooperator wc
				ON
					wor.web_cooperator_id = wc.web_cooperator_id
				WHERE 
					wor.status_code = 'CANCELED'
				AND
					wc.web_cooperator_id = @web_cooperator_id
				IF (@cancelled_order_count > 0)
					BEGIN
						SET @risk_factor_count = @risk_factor_count + 1
						EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_HISTORY', 'Requestor has prior cancelled orders.', 1
					END

				-- ===================================================================
				-- NRR FLAG: DISTINCT GENERA COUNT
				-- ===================================================================
				SET @web_order_request_genera_cnt  = (SELECT 
														COUNT(DISTINCT ts.taxonomy_genus_id)
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
													JOIN taxonomy_species ts
												ON
													a.taxonomy_species_id = ts.taxonomy_species_id
														WHERE 
														web_order_request_id IN 
														(SELECT 
															web_order_request_id 
															FROM 
															inserted))
				IF (@web_order_request_genera_cnt > 2)
					BEGIN
						SET @risk_factor_count = @risk_factor_count + 1
						EXEC usp_WebOrderRequestAction_Insert @error_code OUTPUT, @web_order_request_action_id, @web_order_request_id, 'NRR_FLAG_GENERA', 'Request entails germplasm of more than one genus.', 1
					END

				IF (@risk_factor_count > 0)
					BEGIN
						SELECT 
							@email_template_subject = REPLACE(subject,'[ID_HERE]',CONVERT(NVARCHAR, @web_order_request_id)),	
							@email_template_body = REPLACE(body,'[ID_HERE]',CONVERT(NVARCHAR, @web_order_request_id)) 
						FROM email_template
						WHERE category_code = 'NRR'
						
						SET @email_sent = (SELECT email_sent FROM web_order_request WHERE web_order_request_id = @web_order_request_id)
						IF (@email_sent = 0)
							BEGIN
								EXEC msdb.dbo.sp_send_dbmail  
								@profile_name = 'GRIN-Global DB Mail',  
								@recipients = 'benjamin.haag@usda.gov;marty.reisinger@usda.gov',  
								@body = @email_template_body,  
								@subject = @email_template_subject,
								@body_format = 'HTML'; 

								-- Set flag.
								UPDATE
									web_order_request
								SET
									email_sent = 1
								WHERE
									@web_order_request_id = @web_order_request_id
							END

				IF (@risk_factor_count > 0)
					BEGIN
						UPDATE 
							web_order_request 
						SET 
							status_code = 'NRR_FLAG',
							modified_by = 48,
							modified_date = GETDATE()
						WHERE 
							web_order_request_id IN 
							(SELECT web_order_request_id FROM inserted);
					END
					END
		END
	END TRY
	BEGIN CATCH
		ROLLBACK;
		INSERT INTO 
			dbo.sys_db_error
		VALUES
		  (SUSER_SNAME(),
		   ERROR_NUMBER(),
		   ERROR_STATE(),
		   ERROR_SEVERITY(),
		   ERROR_LINE(),
		   ERROR_PROCEDURE(),
		   ERROR_MESSAGE(),
		   GETDATE());
	END CATCH

 
