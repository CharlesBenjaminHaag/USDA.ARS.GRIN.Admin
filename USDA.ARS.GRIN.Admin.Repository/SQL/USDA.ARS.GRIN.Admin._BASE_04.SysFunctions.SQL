USE [gringlobal]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNumericValue]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[GetNumericValue]
GO
/****** Object:  UserDefinedFunction [dbo].[get_obs_by_acid2]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_obs_by_acid2]
GO
/****** Object:  UserDefinedFunction [dbo].[get_obs_by_acid]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_obs_by_acid]
GO
/****** Object:  UserDefinedFunction [dbo].[get_nssl_seed_clone]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_nssl_seed_clone]
GO
/****** Object:  UserDefinedFunction [dbo].[get_images]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_images]
GO
/****** Object:  UserDefinedFunction [dbo].[get_coop_address]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_coop_address]
GO
/****** Object:  UserDefinedFunction [dbo].[get_avstat2]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_avstat2]
GO
/****** Object:  UserDefinedFunction [dbo].[get_avstat]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[get_avstat]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ts_taxon]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[fn_ts_taxon]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_init_cap]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[fn_init_cap]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_extract_integer]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[fn_extract_integer]
GO
/****** Object:  UserDefinedFunction [dbo].[CSVToTable]    Script Date: 5/24/2021 11:23:52 PM ******/
DROP FUNCTION IF EXISTS [dbo].[CSVToTable]
GO
/****** Object:  UserDefinedFunction [dbo].[CSVToTable]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CSVToTable] (@InStr VARCHAR(MAX))
RETURNS @TempTab TABLE
   (id int not null)
AS
BEGIN
    ;-- Ensure input ends with comma
	SET @InStr = REPLACE(@InStr + ',', ',,', ',')
	DECLARE @SP INT
DECLARE @VALUE VARCHAR(1000)
WHILE PATINDEX('%,%', @INSTR ) <> 0 
BEGIN
   SELECT  @SP = PATINDEX('%,%',@INSTR)
   SELECT  @VALUE = LEFT(@INSTR , @SP - 1)
   SELECT  @INSTR = STUFF(@INSTR, 1, @SP, '')
   INSERT INTO @TempTab(id) VALUES (@VALUE)
END
	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_extract_integer]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fn_extract_integer](@String VARCHAR(2000))
RETURNS VARCHAR(1000)
AS
BEGIN
DECLARE @Count INT
DECLARE @IntNumbers VARCHAR(1000)
SET @Count = 0
SET @IntNumbers = ''

WHILE @Count <= LEN(@String)
BEGIN
IF SUBSTRING(@String,@Count,1) >= '0'
AND SUBSTRING(@String,@Count,1) <= '9'
BEGIN
SET @IntNumbers = @IntNumbers + SUBSTRING(@String,@Count,1)
END
SET @Count = @Count + 1
END

RETURN @IntNumbers
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_init_cap]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_init_cap] ( @InputString varchar(4000) ) 
RETURNS VARCHAR(4000)
AS
BEGIN

DECLARE @Index          INT
DECLARE @Char           CHAR(1)
DECLARE @PrevChar       CHAR(1)
DECLARE @OutputString   VARCHAR(255)

SET @OutputString = LOWER(@InputString)
SET @Index = 1

WHILE @Index <= LEN(@InputString)
BEGIN
    SET @Char     = SUBSTRING(@InputString, @Index, 1)
    SET @PrevChar = CASE WHEN @Index = 1 THEN ' '
                         ELSE SUBSTRING(@InputString, @Index - 1, 1)
                    END

    IF @PrevChar IN (' ', ';', ':', '!', '?', ',', '.', '_', '-', '/', '&', '''', '(')
    BEGIN
        IF @PrevChar != '''' OR UPPER(@Char) != 'S'
            SET @OutputString = STUFF(@OutputString, @Index, 1, UPPER(@Char))
    END

    SET @Index = @Index + 1
END

RETURN @OutputString

END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_ts_taxon]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ts_taxon](@id int, @is_italics nvarchar(1), @is_author nvarchar(1)) RETURNS nvarchar(100) AS
BEGIN
	DECLARE @istart nvarchar(4) = '<i>'
	DECLARE @iend nvarchar(4) = '</i>'
	DECLARE @taxon nvarchar(100)
	IF @is_italics != 'Y'
	BEGIN
		SET @istart = ''
		SET @iend = ''
	END

	SET @taxon = (SELECT 
	CASE hybrid_code WHEN 'X' THEN '×' WHEN '+' THEN '+' ELSE '' END + @istart
	+ genus_name + ' '
	+ CASE is_specific_hybrid WHEN 'Y' THEN @iend+'×'+@istart ELSE '' END
	+ species_name + @iend 
	+ CASE WHEN @is_author = 'Y' THEN COALESCE (' '+species_authority, '') ELSE '' END
	+ CASE WHEN subspecies_name IS NOT NULL
		THEN ' subsp. '+@istart + subspecies_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+subspecies_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN variety_name IS NOT NULL
		THEN ' var. '+@istart + variety_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+variety_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN subvariety_name IS NOT NULL
		THEN ' subvar. '+@istart + subvariety_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+subvariety_authority, '') ELSE '' END ELSE '' END
	+ CASE WHEN forma_name IS NOT NULL
		THEN ' ' + forma_rank_type + ' '+@istart + forma_name + @iend + CASE WHEN @is_author = 'Y' THEN COALESCE (' '+forma_authority, '') ELSE '' END ELSE '' END
	AS taxon
  FROM taxonomy_species
  JOIN taxonomy_genus ON taxonomy_genus.taxonomy_genus_id = taxonomy_species.taxonomy_genus_id
  WHERE taxonomy_species_id = @id
)

	RETURN @taxon
END
GO
/****** Object:  UserDefinedFunction [dbo].[get_avstat]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[get_avstat](@acid int) RETURNS char

AS
BEGIN
   DECLARE @id INTEGER
   declare @avail char(1)

   set @id=(select count(*) From inventory where is_available = 'Y' and is_distributable = 'Y' 
        and accession_id=@acid)

   if @id > 0  set @avail = 'Y' else set @avail = 'N'
   return @avail
END


GO
/****** Object:  UserDefinedFunction [dbo].[get_avstat2]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[get_avstat2](@acid int) RETURNS char(20)

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





GO
/****** Object:  UserDefinedFunction [dbo].[get_coop_address]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- use gringlobal;
-- drop function get_coop_address;
CREATE FUNCTION [dbo].[get_coop_address](@cno int) RETURNS nvarchar(1000)

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
GO
/****** Object:  UserDefinedFunction [dbo].[get_images]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




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


GO
/****** Object:  UserDefinedFunction [dbo].[get_nssl_seed_clone]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop function get_nssl_seed_clone
-- calculates the life form of the accession based on ivt of nssl backup
CREATE FUNCTION [dbo].[get_nssl_seed_clone](@parm int) RETURNS nvarchar

AS
BEGIN
   DECLARE @id nvarchar(1)

   set @id= (select count(*) From iv where site = 'NSSL' and ivt = 'SD' and acid=@parm)
   if (@id > 0) set @id = 'S'
   else set @id = 'C'
   
   return @id



   RETURN @id
END
GO
/****** Object:  UserDefinedFunction [dbo].[get_obs_by_acid]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[get_obs_by_acid](@acid int, @dno int, @type nvarchar(1)) RETURNS nvarchar(4000)

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


GO
/****** Object:  UserDefinedFunction [dbo].[get_obs_by_acid2]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[get_obs_by_acid2](@acid int, @crop nvarchar(30), @trait nvarchar(40)) RETURNS nvarchar(4000)

AS
BEGIN
   DECLARE 
   @value nvarchar(200) = '',
   @values nvarchar(4000) = '',
   @ct int = 0,
   @type nvarchar(1),
   @dno int;
 
 select @dno=dno ,@type=(case usecode when 'Y' then 'C' else case obtype when 'CHAR' then 'S' else 'N' end  end) 
 from dsc where 
 crop = @crop  and dqname = @trait

 -- return @crop + @trait
 -- return cast(@dno as nvarchar(20))

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



GO
/****** Object:  UserDefinedFunction [dbo].[GetNumericValue]    Script Date: 5/24/2021 11:23:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetNumericValue]  
(@strAlphaNumeric VARCHAR(256))  
RETURNS VARCHAR(256)  
AS  
BEGIN  
DECLARE @intAlpha INT  
SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric)  
BEGIN  
WHILE @intAlpha > 0  
BEGIN  
SET @strAlphaNumeric = STUFF(@strAlphaNumeric, @intAlpha, 1, '' )  
SET @intAlpha = PATINDEX('%[^0-9]%', @strAlphaNumeric )  
END  
END  
RETURN ISNULL(@strAlphaNumeric,0)  
END  
GO
