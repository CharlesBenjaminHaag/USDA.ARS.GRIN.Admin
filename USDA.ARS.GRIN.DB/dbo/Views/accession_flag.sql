
create view dbo.accession_flag as
SELECT
   accession_id,
   accession_number_part1,
   accession_number_part2,
   accession_number_part3,
   status_code,
   CASE a.status_code
      WHEN 'ACTIVE' THEN 'Y'
	  ELSE 'N'
   END AS is_active,
   CASE WHEN EXISTS (SELECT inventory_id FROM inventory WHERE accession_id = a.accession_id AND is_distributable = 'Y' AND is_available = 'Y')
      THEN 'Y'
	  ELSE 'N'
   END AS is_available,
   CASE WHEN EXISTS (SELECT i.inventory_id FROM inventory i INNER JOIN accession_inv_attach aia ON i.inventory_id = aia.inventory_id WHERE i.accession_id = a.accession_id AND aia.category_code = 'IMAGE')
      THEN 'Y'
	  ELSE 'N'
   END AS is_image,
   (SELECT s.site_short_name FROM cooperator c INNER JOIN site s ON s.site_id = c.site_id WHERE c.cooperator_id = a.owned_by) AS site
FROM accession a

