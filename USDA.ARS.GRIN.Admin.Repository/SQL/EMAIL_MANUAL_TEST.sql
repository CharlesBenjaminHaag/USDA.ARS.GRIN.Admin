USE gringlobal

-- Email Attributes
DECLARE @email_subject NVARCHAR(2000)
DECLARE @email_body NVARCHAR(4000)
DECLARE @email_sent BIT
DECLARE @email_recipients NVARCHAR(MAX)

SET @email_subject = 'NRR Review Notification: *** TEST ONLY ***'
SET @email_body = 'TEST EMAIL, PLEASE DISREGARD'
SET @email_recipients = 'ordersNCGR.davis@ars.usda.gov;tomas.ayala-silva@usda.gov;ricardo.goenaga@usda.gov;nc7orders@ars.usda.gov;lisa.burke@ars.usda.gov;jesse.schartner@ars.usda.gov;mwmarti1@wisc.edu;tiffany.fields@ars.usda.gov;ARS-S9Orders@ars.usda.gov;jessica_nifong@ncsu.edu'


EXEC msdb.dbo.sp_send_dbmail  
								@profile_name = 'GRIN-Global DB Mail',
								@from_address = 'gringlobal-orders@usda.gov',
								@reply_to = 'gringlobal-orders@usda.gov',
								@recipients = @email_recipients,
								@blind_copy_recipients = 'marty.reisinger@usda.gov;benjamin.haag@usda.gov',
								@body = @email_body,  
								@subject = @email_subject,
								@body_format = 'HTML'; 