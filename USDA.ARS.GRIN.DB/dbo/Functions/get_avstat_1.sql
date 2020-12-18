
CREATE FUNCTION [get_avstat](@acid int) RETURNS char

AS
BEGIN
   DECLARE @id INTEGER
   declare @avail char(1)

   set @id=(select count(*) From inventory where is_available = 'Y' and is_distributable = 'Y' 
        and accession_id=@acid)

   if @id > 0  set @avail = 'Y' else set @avail = 'N'
   return @avail
END


