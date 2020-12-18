-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_SysUser_Insert]
	@out_error_number INT = 0 OUTPUT,
	@out_sys_user_id INT = 0 OUTPUT,
	@user_name nvarchar(50),
	@password nvarchar(2000),
	@cooperator_id INT,
	@is_enabled nvarchar(1)
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ADMIN_COOPERATOR_ID INT = 48

	BEGIN TRY
		-- ========================================================================
		-- USER
		-- ========================================================================
		INSERT INTO sys_user 
		(
		 user_name,
		 password,
		 is_enabled,
		 cooperator_id,
		 created_date,
		 created_by,
		 owned_date,
		 owned_by
		)
		VALUES
		(
		 @user_name,
		 @password,
		 'Y',
		 @cooperator_id,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID,
		 GETDATE(),
		 @ADMIN_COOPERATOR_ID
		)
		SET @out_sys_user_id = CAST(SCOPE_IDENTITY() AS INT)

		-- ========================================================================
		-- DEFAULT GROUPS
		-- ========================================================================
		INSERT INTO 
			sys_group_user_map
			(
				sys_group_id,
				sys_user_id,
				created_date,
				created_by,
				owned_date,
				owned_by
  			)
			VALUES
			(
				2,
				@out_sys_user_id,
				GETDATE(),
				@ADMIN_COOPERATOR_ID,
				GETDATE(),
				@ADMIN_COOPERATOR_ID
			)

		INSERT INTO 
		sys_group_user_map
		(
			sys_group_id,
			sys_user_id,
			created_date,
			created_by,
			owned_date,
			owned_by
  		)
		VALUES
		(
			3,
			@out_sys_user_id,
			GETDATE(),
			@ADMIN_COOPERATOR_ID,
			GETDATE(),
			@ADMIN_COOPERATOR_ID
		)
	END TRY
	BEGIN CATCH
		SELECT @out_error_number=ERROR_NUMBER()
	END CATCH
END
