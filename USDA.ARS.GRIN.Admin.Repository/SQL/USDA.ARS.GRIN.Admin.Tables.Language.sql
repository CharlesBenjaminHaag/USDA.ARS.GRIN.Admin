ALTER TABLE taxonomy_common_name
ADD taxonomy_language_id INT

UPDATE taxonomy_common_name 
SET taxonomy_language_id = tl.taxonomy_language_id 
FROM taxonomy_language tl
WHERE language_description = tl.title


SELECT * FROM taxonomy_common_name