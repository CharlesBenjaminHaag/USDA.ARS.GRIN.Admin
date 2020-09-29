



CREATE FUNCTION [dbo].[get_images](@acid int) RETURNS nvarchar(max)

AS
BEGIN
   DECLARE 
   @image nvarchar(300),
   @images nvarchar(max) = '',
   @ct integer = 0;


   DECLARE db_cursor CURSOR FOR  
    select  replace(virtual_path,'http:','https:')  from accession_inv_attach t where category_code='IMAGE' 
 and t.inventory_id in (select i.inventory_id from inventory i where i.accession_id=@acid) and is_web_visible = 'Y'

 
OPEN db_cursor  
 FETCH NEXT FROM db_cursor INTO @image  

WHILE @@FETCH_STATUS = 0  
  BEGIN
  if substring(@image,1,4) = 'http'
   set @image = '<img src="' + @image + '" height="100" onclick = "window.open(this.src)">' 
 else
   set @image = '<img src="https://npgsweb.ars-grin.gov/gringlobal/uploads/images/' + @image + '" height="100" onclick = "window.open(this.src)">' 



  set @ct = @ct + 1
  if @ct > 1
    set @images = @images + '<img src="/gringlobal/images/spacer.png">' + @image
  else 
    set @images = replace(@image,'https://','https:///')

   FETCH NEXT FROM db_cursor INTO @image

 END
CLOSE db_cursor  
DEALLOCATE db_cursor 

-- if @images = '' set @images = '[No images available]'

return @images

END


