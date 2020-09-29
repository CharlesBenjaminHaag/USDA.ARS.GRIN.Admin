-- use gringlobal;
-- drop function get_coop_address;
CREATE FUNCTION get_coop_address(@cno int) RETURNS nvarchar(1000)

AS
BEGIN
   DECLARE 
   @last_name nvarchar(100),
   @first_name nvarchar(100),
   @organization nvarchar(100),
   @address_line1 nvarchar(100),
   @address_line2 nvarchar(100),
   @address_line3 nvarchar(100),
   @city nvarchar(60),
   @state nvarchar(60),
   @country nvarchar(60),
   @postal_index nvarchar(40),
   @address nvarchar(1000),
   @buffer nvarchar(200);
   

   select @last_name = lname, @first_name = fname, @organization = org, @address_line1 = add1, @address_line2 = add2, @address_line3 = add3,
   @city=city, @state=state, @country=country, @postal_index=zip
    from coop where cno=@cno;

   set @buffer = ltrim(isnull(@first_name,' ') + ' ' + isnull(@last_name,' '));
   if @buffer is not null  set @address = @buffer + '<br>';
   if @organization is not null set @address = @address + @organization + '<br>';
   if @address_line1 is not null set @address = @address + @address_line1 + '<br>';
   if @address_line2 is not null set @address = @address + @address_line2 + '<br>';
   if @address_line3 is not null set @address = @address + @address_line3 + '<br>';

   if @city is not null or @state is not null  
     if @city is not null and @state is not null   set @address = @address + @city + ', ' + @state + '<br>';
	 else if @city is not null and @state is null  set @address = @address + @city  + '<br>';
     else set @address = @address + @state + '<br>';
   if @country is not null set @address = @address + @country + '<br>';
   if @postal_index is not null set @address = @address + @postal_index + '<br>';

   RETURN @address;
END
