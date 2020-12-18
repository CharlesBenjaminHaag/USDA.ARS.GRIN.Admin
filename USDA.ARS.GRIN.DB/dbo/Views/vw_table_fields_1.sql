/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [vw_table_fields]
AS
SELECT 
	st.sys_table_id,
    table_name,
	stf.field_name,
	stfl.title,
	REPLACE(title, ' ', '') AS formatted_title
FROM
	sys_table st
JOIN
	sys_table_field stf
ON
	st.sys_table_id = stf.sys_table_id
JOIN
	sys_table_field_lang stfl
ON
	stf.sys_table_field_id = stfl.sys_table_field_id
WHERE
	table_name LIKE 'taxonomy%'
AND
	stfl.sys_lang_id = 1
