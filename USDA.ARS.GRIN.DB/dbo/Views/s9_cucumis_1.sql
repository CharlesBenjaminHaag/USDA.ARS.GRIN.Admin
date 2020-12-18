create view [s9_cucumis] as
select acp,acno,acs,acid
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29001 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS VINELENGTH
,stuff((SELECT ';' + code  FROM ob WHERE dno=29002 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS MATURITY
,stuff((SELECT ';' + code  FROM ob WHERE dno=29003 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSHAPE
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29004 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITLEN
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29005 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITDIAM
,stuff((SELECT ';' + code  FROM ob WHERE dno=29006 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSURF
,stuff((SELECT ';' + code  FROM ob WHERE dno=29007 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITCOLOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29008 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS DMILDEW
,stuff((SELECT ';' + code  FROM ob WHERE dno=29009 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS PMILDEW
,stuff((SELECT ';' + code  FROM ob WHERE dno=29010 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FLESHCOLOR
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29011 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FLESHDEPTH
,stuff((SELECT ';' + code  FROM ob WHERE dno=29012 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSET
,stuff((SELECT ';' + code  FROM ob WHERE dno=29013 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS FRUITSPOT
,stuff((SELECT ';' + cast(numeric_value as nvarchar(20))  FROM ob WHERE dno=29015 and ob.acid=acc.acid ORDER BY numeric_value  FOR XML PATH('')),1,1,'')  AS FRUITWGT
,stuff((SELECT ';' + code  FROM ob WHERE dno=29016 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS PLANTHABIT
,stuff((SELECT ';' + code  FROM ob WHERE dno=29017 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFORMITY
,stuff((SELECT ';' + code  FROM ob WHERE dno=29018 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS VIGOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29019 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS CAVITYCOLO
,stuff((SELECT ';' + code  FROM ob WHERE dno=29020 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSIZE
,stuff((SELECT ';' + code  FROM ob WHERE dno=29021 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSHAPE
,stuff((SELECT ';' + code  FROM ob WHERE dno=29022 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFCOLOR
,stuff((SELECT ';' + code  FROM ob WHERE dno=29023 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS UNIFSURF
,stuff((SELECT ';' + code  FROM ob WHERE dno=29024 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS STRIPECOL
,stuff((SELECT ';' + code  FROM ob WHERE dno=29025 and ob.acid=acc.acid ORDER BY code  FOR XML PATH('')),1,1,'')  AS IMAGE
from acc
			group by acp,acno,acs,acid
