-- drop function get_nssl_seed_clone
-- calculates the life form of the accession based on ivt of nssl backup
CREATE FUNCTION get_nssl_seed_clone(@parm int) RETURNS nvarchar

AS
BEGIN
   DECLARE @id nvarchar(1)

   set @id= (select count(*) From iv where site = 'NSSL' and ivt = 'SD' and acid=@parm)
   if (@id > 0) set @id = 'S'
   else set @id = 'C'
   
   return @id



   RETURN @id
END
