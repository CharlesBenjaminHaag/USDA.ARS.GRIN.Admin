CREATE PROCEDURE [usp_SearchOperators_Select] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_search_operator_id,
		title,
		syntax
	FROM 
		sys_search_operator
END
