USE [gringlobal]

ALTER TABLE [dbo].[taxonomy_family] DROP CONSTRAINT [fk_tf_tg]
GO

ALTER TABLE [dbo].[taxonomy_genus] DROP CONSTRAINT [fk_tg_cur_tgt]
GO

DROP INDEX [ndx_uniq_tg] ON [dbo].[taxonomy_genus]
GO

