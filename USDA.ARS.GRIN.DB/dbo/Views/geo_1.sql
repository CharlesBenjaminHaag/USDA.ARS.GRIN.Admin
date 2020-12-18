
create view [geo] as SELECT title as country,adm1 as
state,adm1_abbrev as st,geography_id as geono,current_geography_id as
validgeono,country_code as iso3 from code_value v,code_value_lang
l,geography g where l.code_value_id = v.code_value_id and
g.country_code=v.value and v.group_name='GEOGRAPHY_COUNTRY_CODE' and
sys_lang_id=1;

