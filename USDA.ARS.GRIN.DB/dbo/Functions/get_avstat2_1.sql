

CREATE FUNCTION [get_avstat2](@acid int) RETURNS char(20)

-- requires available inventory be from the accession site not any site

AS
BEGIN
  DECLARE @id INTEGER, @status nvarchar(60), @avail nvarchar(30)
  
  set @status=(select status_code from accession_view a where a.accession_id=@acid)
   
   if @status='INACTIVE' return 'Historical'
   else
    set @id=(select count(*) From inventory_view i,accession_view a 
	where a.accession_id=i.accession_id and a.site_short_name=i.site_short_name and i.is_available = 'Y' and is_distributable = 'Y' 
        and a.accession_id=@acid) 
   if @id > 0  set @avail = 'Available' else set @avail = 'Unavailable'
   
  return @avail
--  return @status
END





