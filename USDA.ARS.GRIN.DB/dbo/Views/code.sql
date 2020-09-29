

create view [dbo].[code] as select v.code_value_id,code_value_lang_id,group_name,value,title,description from code_value v, code_value_lang l where v.code_value_id=l.code_value_id and sys_lang_id = 1 



