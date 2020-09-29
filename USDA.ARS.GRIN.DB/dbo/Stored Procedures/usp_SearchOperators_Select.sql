CREATE PROCEDURE usp_SearchOperators_Select 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		sys_search_operator_id,
		code,
		title,
		syntax
	FROM 
		sys_search_operator
END
