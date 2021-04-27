USE [gringlobal]
GO

ALTER TABLE [dbo].[code_value_lang]  WITH CHECK ADD  CONSTRAINT [fk_cvl_cv] FOREIGN KEY([code_value_id])
REFERENCES [dbo].[code_value] ([code_value_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[code_value_lang] CHECK CONSTRAINT [fk_cvl_cv]
GO


