
create view [cd] as select name as crop, c.crop_id as cropno,coded_name as 
dqname,d.crop_trait_id as dno,code,title as def,cd.crop_trait_code_id, crop_trait_code_lang_id from crop c, crop_trait d, crop_trait_code cd, 
crop_trait_code_lang l where c.crop_id=d.crop_id and d.crop_trait_id=cd.crop_trait_id and 
cd.crop_trait_code_id=l.crop_trait_code_id
