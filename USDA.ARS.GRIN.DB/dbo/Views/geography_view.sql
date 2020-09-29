



create view [dbo].[geography_view] as SELECT vl.title as country,adm1 as
state,geography_id ,current_geography_id ,country_code
from geography g
join  code_value v on g.country_code=v.value and v.group_name='GEOGRAPHY_COUNTRY_CODE'
join code_value_lang vl on vl.code_value_id = v.code_value_id and vl.sys_lang_id=1




