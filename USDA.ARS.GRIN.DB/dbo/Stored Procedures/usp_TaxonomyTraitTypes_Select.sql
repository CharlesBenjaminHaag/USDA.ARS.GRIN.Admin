-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_TaxonomyTraitTypes_Select
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  
		DISTINCT 
			trait_class_code, 
			breeding_type_code,
			cvl.title AS breeding_type_title
	FROM 
		[$(DatabaseName)].[taxonomy_cwr_trait] tct
	JOIN
		code_value cv
	ON
		tct.breeding_type_code = cv.value
	JOIN
		code_value_lang cvl
	ON
		cv.code_value_id = cvl.code_value_id
	WHERE
		cvl.sys_lang_id = 1
END
