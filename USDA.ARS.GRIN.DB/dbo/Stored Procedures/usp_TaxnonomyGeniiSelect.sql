-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [usp_TaxnonomyGeniiSelect]
	@taxonomy_family_id INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		*
	FROM
		taxonomy_genus tg
	WHERE
		tg.taxonomy_family_id = @taxonomy_family_id
END
