


CREATE FUNCTION [get_obs_by_acid](@acid int, @dno int, @type nvarchar(1)) RETURNS nvarchar(4000)

AS
BEGIN
   DECLARE 
   @value nvarchar(200) = '',
   @values nvarchar(4000) = '',
   @ct int = 0;
 
  if @type = 'C' 
   DECLARE db_cursor CURSOR FOR  
    select  code from ob where acid = @acid and dno = @dno 
	else if @type = 'N'
   DECLARE db_cursor CURSOR FOR  
    select  cast(numeric_value as nvarchar(20)) from ob where acid = @acid and dno = @dno 
else
  DECLARE db_cursor CURSOR FOR  
    select  string_value from ob where acid = @acid and dno = @dno 


OPEN db_cursor  
 FETCH NEXT FROM db_cursor INTO @value

WHILE @@FETCH_STATUS = 0  
  BEGIN
  set @ct = @ct + 1
  if @ct > 1
    set @values = @values + ';' + @value
  else 
    set @values = @value

   FETCH NEXT FROM db_cursor INTO @value

 END
CLOSE db_cursor  
DEALLOCATE db_cursor 


return @values

END


