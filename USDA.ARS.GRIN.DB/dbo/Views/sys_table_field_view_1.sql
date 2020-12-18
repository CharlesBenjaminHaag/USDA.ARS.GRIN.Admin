

/****** Script for SelectTopNRows command from SSMS  ******/
create view [sys_table_field_view] as select f.sys_table_field_id,table_name,field_ordinal as sequence,field_name,field_type,field_purpose,title,
description,sys_lang_id  ,group_name
from sys_table_field f
join sys_table t on t.sys_table_id=f.sys_table_id
left join sys_table_field_lang l on l.sys_table_field_id =f.sys_table_field_id


