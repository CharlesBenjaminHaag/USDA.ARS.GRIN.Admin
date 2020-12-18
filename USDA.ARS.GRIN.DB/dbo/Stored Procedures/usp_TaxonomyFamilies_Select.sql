-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxonomyFamilies_Select]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *
	FROM 
		taxonomy_family tf
	ORDER BY 
		tf.family_name
END
