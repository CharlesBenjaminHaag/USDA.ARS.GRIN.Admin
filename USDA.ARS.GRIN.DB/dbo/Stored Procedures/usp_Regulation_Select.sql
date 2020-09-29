-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Regulation_Select] 
	@taxonomy_regulation_id INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		taxonomy_regulation_id,
		tr.geography_id,
		COALESCE(adm1, adm2, adm3) AS geography_description,
		regulation_type_code,
		regulation_level_code,
		description,
		url_1,
		url_2,
		tr.note,
		tr.created_date,
		tr.created_by,
		tr.modified_date,
		tr.modified_by
	FROM 
		taxonomy_regulation tr
	JOIN
		geography g
	ON
		tr.geography_id = g.geography_id
	WHERE
		taxonomy_regulation_id = @taxonomy_regulation_id
END
