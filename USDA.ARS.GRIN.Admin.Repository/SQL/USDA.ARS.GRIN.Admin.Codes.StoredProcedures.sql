USE [gringlobal]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValuesByGroupName_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeValuesByGroupName_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValues_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeValues_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeDetail_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_CodeDetail_Select]
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Insert]    Script Date: 4/11/2021 5:16:00 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[usp_Code_Insert]
GO
/****** Object:  StoredProcedure [dbo].[usp_Code_Insert]    Script Date: 4/11/2021 5:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Code_Insert]
	@group_name NVARCHAR(100),
	@code_value NVARCHAR(20),
	@title NVARCHAR(500),
	@description NVARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_COOPERATOR_ID INT = 48
	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @new_code_value_id INT

	BEGIN TRY
	INSERT INTO
		code_value
		(
			group_name,
			value,
			created_date,
			created_by,
			owned_date,
			owned_by
		)
		VALUES
		(
			@group_name,
			@code_value,
			GETDATE(),
			@CONST_COOPERATOR_ID,
			GETDATE(),
			@CONST_COOPERATOR_ID
		)
		SET @new_code_value_id = CAST(SCOPE_IDENTITY() AS INT)

		INSERT INTO 
			code_value_lang
			(
				code_value_id,
				sys_lang_id,
				title,
				description,
				created_date,
				created_by,
				owned_date,
				owned_by
			)
			VALUES
			(
				@new_code_value_id,
				@CONST_SYS_LANG_ID,
				@title,
				@description,
				GETDATE(),
				@CONST_COOPERATOR_ID,
				GETDATE(),
				@CONST_COOPERATOR_ID
			)
			END TRY
			BEGIN CATCH
				IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION
			END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeDetail_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeDetail_Select]
	@value NVARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		value = @value
	AND
		cvl.sys_lang_id = 1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValues_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeValues_Select]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1
	DECLARE @CONST_GROUP_NAME NVARCHAR(20) = 'TAXONOMY'

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		(group_name LIKE '%' + @CONST_GROUP_NAME + '%'
	OR
		group_name LIKE '%CWR%')
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name, value
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CodeValuesByGroupName_Select]    Script Date: 4/11/2021 5:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_CodeValuesByGroupName_Select]
	@group_name NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CONST_SYS_LANG_ID INT = 1

	SELECT  
		cv.code_value_id,
		group_name,
		value,
		cvl.title,
		cvl.description
	FROM 
		code_value cv
	JOIN
		code_value_Lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE 
		group_name LIKE '%' + @group_name + '%'
	AND
		cvl.sys_lang_id = @CONST_SYS_LANG_ID
	ORDER BY 
		group_name ASC, value ASC
END
GO
