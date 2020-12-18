
-- 30/sep/2016 this version gets subtax and author from accession_view

create view [mcpd] as
select a.accession_id,
s.fao_institute_number INSTCODE,
rtrim(a.accession_number_part1) + ' ' + rtrim(CONVERT(char(8),a.accession_number_part2)) + ' ' + ltrim(isnull(accession_number_part3,' ')) ACCENUMB,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'COLLECTOR') COLLNUMB,
null as COLLCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_COLLECTED.accession_source_id order by c.organization) COLLNAME,
(select top 1 ltrim(coalesce(address_line1,'') + ' ' + coalesce(address_line2,'') + ' ' + coalesce(address_line3,'') + ' ' + coalesce(city,'') + ' ' + coalesce(postal_index,'') + ' ' + (select country_code from geography where geography_id = c.geography_id))  from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_COLLECTED.accession_source_id) COLLINSTADDRESS,
Null as COLLMISSID,
tg.genus_name GENUS,
ts.species_name SPECIES,
ts.species_authority SPAUTHOR,
(select subtaxon_name from accession_view av where av.accession_id=a.accession_id) as SUBTAXA, 
(select subtaxon_authority from accession_view av where av.accession_id=a.accession_id) as SUBTAUTHOR,
null as CROP,
(select top 1 plant_name from accession_inv_name where inventory_id in (select inventory_id from inventory i2 where a.accession_id=i2.accession_id) order by plant_name_rank) ACCENAME,
convert(varchar, a.initial_received_date, 112) ACQDATE,
g.country_code ORIGCTY,
cvl.title [COUNTRY NAME],
aso_COLLECTED.collector_verbatim_locality COLLSITE,
aso_COLLECTED.latitude DECLATITUDE,
aso_COLLECTED.longitude DECLONGITUDE,
aso_COLLECTED.uncertainty COORDUNCERT,
aso_COLLECTED.georeference_datum COORDDATUM,
aso_COLLECTED.georeference_protocol_code GEOREFMETH,
aso_COLLECTED.elevation_meters ELEVATION,
case when aso_collected.source_date is not null then
        case when aso_collected.source_date_code = 'YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + '----'
             when aso_collected.source_date_code = 'MM/YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + CONVERT(char(2),month(aso_collected.source_date)) + '--'
             when aso_collected.source_date_code = 'MM/DD/YYYY' then CONVERT(char(4),year(aso_collected.source_date)) + right('00' + rtrim(CONVERT(char(2),month(aso_collected.source_date))),2) + right('00' + rtrim(CONVERT(char(2),day(aso_collected.source_date))),2)
         else CONVERT(char(4),year(aso_collected.source_date)) + right('00' + rtrim(CONVERT(char(2),month(aso_collected.source_date))),2) + right('00'+ rtrim(CONVERT(char(2),day(aso_collected.source_date))),2) end end  COLLDATE,
(select top 1 note from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_BREDCODE.accession_source_id) BREDCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_BREDCODE.accession_source_id order by c.organization) BREDNAME,
(select case improvement_status_code 
   when 'BREEDING' then '410'
   when 'CLONE' then '416'
   when 'CULTIVAR' then '500'
   when 'CULTIVATED' then '300'
   when 'GENETIC' then '420'
   when 'LANDRACE' then '300'
   when 'WILD' then '100'
   else '999'
   end 

 from accession where accession_id = a.accession_id) SAMPSTAT,
rtrim(ltrim((select description from accession_pedigree where accession_id = a.accession_id and description is not null))) + case when (select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code like 'ANCEST')is null then '' else ';' + (select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code like 'ANCEST') end ANCEST,
 aso_COLLECTED.acquisition_source_code COLLSRC,
null as DONORCODE,
(select top 1 organization from accession_source_map asm inner join cooperator c on asm.cooperator_id = c.cooperator_id where accession_source_id = aso_DONORCODE.accession_source_id order by c.organization) DONORNAME,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'DONOR') DONORNUMB,
(select top 1 plant_name from accession_inv_name where inventory_id = i.inventory_id and category_code = 'OTHER') OTHERNUMB,
(case when a.backup_location1_site_id is not null and a.backup_location2_site_id is not null then (select fao_institute_number from site where site_id = a.backup_location1_site_id) + ';' + (select fao_institute_number from site where site_id = a.backup_location2_site_id)
      when a.backup_location1_site_id is not null and a.backup_location2_site_id is null then (select fao_institute_number from site where site_id = a.backup_location1_site_id)
      when a.backup_location1_site_id is null and a.backup_location2_site_id is not null then (select fao_institute_number from site where site_id = a.backup_location2_site_id)
      else
      null end) DUPLSITE,
(select top 1 m.name from inventory invp inner join method m on invp.preservation_method_id = m.method_id where accession_id = a.accession_id and form_type_code <> '**')  STORAGE,
case when exists (select type_code from accession_ipr where accession_id = a.accession_id and type_code='MTA-SMTA') then 1 else 0 end MLSSTAT,
RTRIM(ltrim(a.note)) REMARKS,
null as availability,
(case a.status_code   when 'ACTIVE' then 'N' else 'Y' end)  as historic,
'http://npgsweb.ars-grin.gov/gringlobal/accessiondetail.aspx?id=' + rtrim(cast(a.accession_id as varchar(12))) ACCEURL
from accession a  
inner join taxonomy_species ts on a.taxonomy_species_id = ts.taxonomy_species_id 
inner join taxonomy_genus tg on ts.taxonomy_genus_id = tg.taxonomy_genus_id
inner join inventory i on a.accession_id = i.accession_id and form_type_code = '**'
left join Accession_pedigree ap on ap.accession_id = a.accession_id
left join accession_source aso on aso.accession_id = a.accession_id and is_origin = 'Y'
left join accession_source aso_BREDCODE on aso_BREDCODE.accession_id = a.accession_id and aso_BREDCODE.source_type_code = 'DEVELOPED'
left join accession_source aso_COLLECTED on aso_COLLECTED.accession_id = a.accession_id and aso_COLLECTED.source_type_code = 'COLLECTED' and aso_COLLECTED.is_origin='Y'
left join accession_source aso_DONORCODE on aso_DONORCODE.accession_id = a.accession_id and aso_DONORCODE.source_type_code = 'DONATED'
left join cooperator coo on coo.cooperator_id = a.owned_by
left join site s on s.site_id = coo.site_id
left join geography g on aso_COLLECTED.geography_id = g.geography_id
left join code_value cv on g.country_code = cv.value and cv.group_name like 'GEOGRAPHY_COUNTRY_CODE'
left join code_value_lang cvl on cv.code_value_id = cvl.code_value_id and cvl.sys_lang_id = 1 
where a.status_code in ('ACTIVE','INACTIVE') and a.is_web_visible = 'Y'








