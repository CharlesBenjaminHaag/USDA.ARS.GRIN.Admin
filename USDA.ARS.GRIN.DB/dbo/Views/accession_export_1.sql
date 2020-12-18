



create view [accession_export] as 
SELECT
  a.accession_id,
 '<a onclick="javascript:return true;" href="~/accessiondetail.aspx?id=' + rtrim(cast(a.accession_id as varchar(12))) + '">View</a>' AS Url,
  rtrim(a.accession_number_part1) + ' ' + str(a.accession_number_part2,8,0) + ' ' + ltrim(isnull(accession_number_part3,' ')) AS Plant_ID,
  ts.name AS Species,
  (select top 1 plant_name from accession_inv_name where inventory_id in (select inventory_id from inventory i2 where a.accession_id=i2.accession_id) order by plant_name_rank) AS Plant_Name,
  year(a.initial_received_date) AS Received,
(select site_short_name from site where site_id = (select site_id from cooperator c where cooperator_id=a.owned_by)) as Site,
  aso.source_type_code AS Source_Type,
  FORMAT(source_date, source_date_code, 'en-US' ) AS Source_Date,
  cvl.title AS Source_Country,
g.adm1 as State_Province,
case aso.is_web_visible when 'N' then
  'Not publicly visible'
else
   aso.collector_verbatim_locality 
end as Collection_Site,
case  aso.is_web_visible when 'N' then
  null 
else
  cast(aso.latitude as nvarchar(20))
end  as Latitude,
case  aso.is_web_visible when 'N' then
  null 
else
  cast(aso.longitude as nvarchar(20))
end as Longitude,
case  aso.is_web_visible when 'N' then
  null
else
  cast(aso.elevation_meters as nvarchar(20))
end as Elevation, 
case  aso.is_web_visible when 'N' then
  null
else
  aso.environment_description
end as Habitat, 
a.improvement_status_code AS Biological_Status,
ap.description AS Pedigree,
a.note as Narrative,
case when exists (select inventory_id from inventory where is_distributable = 'Y' AND  is_available = 'Y' and accession_id = a.accession_id) then
		case 
			-- when sum(case when i.is_distributable = 'Y' AND i.is_available = 'Y' then 1 else 0 end) = 0 then ''
			when ts.restriction_code = 'NARCOTIC' then '<nobr><font color="red">Not Available</font></nobr>'
			when ts.restriction_code in ('WEED', 'RARE') then '<nobr><font color="orange">Contact Site</font></nobr>'
 		else 		
			concat('<nobr><a href="~/cartview.aspx?action=add&id=', convert(nvarchar, a.accession_id), '">Add to Cart</a></nobr>')
		end 	
	else
 		case when a.status_code = 'INACTIVE' then '<nobr><font color="red">INACTIVE</font></nobr>'
		else '<nobr><font color="red">Not Available</font></nobr>' end	
 	end as Availability
 FROM
    accession a
    INNER JOIN taxonomy_species ts
      ON  a.taxonomy_species_id = ts.taxonomy_species_id 
    LEFT JOIN accession_pedigree ap
      ON  ap.accession_id = a.accession_id 
    LEFT JOIN accession_source aso
      ON  aso.accession_id = a.accession_id 
          and  is_origin = 'Y' 
    LEFT JOIN geography g
      ON  aso.geography_id = g.geography_id 
    LEFT JOIN code_value cv
      ON  g.country_code = cv.value 
          and  cv.group_name like 'GEOGRAPHY_COUNTRY_CODE' 
    LEFT JOIN code_value_lang cvl
      ON  cv.code_value_id = cvl.code_value_id 
          and  cvl.sys_lang_id = 1 

WHERE
	 a.is_web_visible = 'Y'

