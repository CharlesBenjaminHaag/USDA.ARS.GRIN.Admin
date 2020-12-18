create view [mbr] as select
cooperator_map_id,
 first_name as FNAME                                              
 ,last_name as LNAME                                             
 ,organization_abbrev as orgid
 ,m.note as cmt                                               
,group_tag as cgid                                     
   ,(select site_short_name from site where site.site_id=g.site_id) as site                             
 ,m.cooperator_id as CNO  
 ,m.cooperator_group_id                                      
 ,m.created_by                                              
 ,m.modified_by                                            
 ,m.owned_by from cooperator c, cooperator_group g, cooperator_map m where
 c.cooperator_id=m.cooperator_id and m.cooperator_group_id = g.cooperator_group_id          
 
