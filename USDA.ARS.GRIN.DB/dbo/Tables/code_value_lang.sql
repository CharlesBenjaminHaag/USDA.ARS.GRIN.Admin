CREATE TABLE [dbo].[code_value_lang] (
    [code_value_lang_id] INT            IDENTITY (1, 1) NOT NULL,
    [code_value_id]      INT            NOT NULL,
    [sys_lang_id]        INT            NOT NULL,
    [title]              NVARCHAR (500) NOT NULL,
    [description]        NVARCHAR (MAX) NULL,
    [created_date]       DATETIME2 (7)  NOT NULL,
    [created_by]         INT            NOT NULL,
    [modified_date]      DATETIME2 (7)  NULL,
    [modified_by]        INT            NULL,
    [owned_date]         DATETIME2 (7)  NOT NULL,
    [owned_by]           INT            NOT NULL,
    CONSTRAINT [PK_code_value_lang] PRIMARY KEY CLUSTERED ([code_value_lang_id] ASC),
    CONSTRAINT [fk_cvl_created] FOREIGN KEY ([created_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cvl_cv] FOREIGN KEY ([code_value_id]) REFERENCES [dbo].[code_value] ([code_value_id]),
    CONSTRAINT [fk_cvl_modified] FOREIGN KEY ([modified_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cvl_owned] FOREIGN KEY ([owned_by]) REFERENCES [dbo].[cooperator] ([cooperator_id]),
    CONSTRAINT [fk_cvl_sl] FOREIGN KEY ([sys_lang_id]) REFERENCES [dbo].[sys_lang] ([sys_lang_id])
);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cvl_created]
    ON [dbo].[code_value_lang]([created_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cvl_cv]
    ON [dbo].[code_value_lang]([code_value_id] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cvl_modified]
    ON [dbo].[code_value_lang]([modified_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cvl_owned]
    ON [dbo].[code_value_lang]([owned_by] ASC);


GO
CREATE NONCLUSTERED INDEX [ndx_fk_cvl_sl]
    ON [dbo].[code_value_lang]([sys_lang_id] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ndx_uniq_cvl]
    ON [dbo].[code_value_lang]([code_value_id] ASC, [sys_lang_id] ASC);


GO
CREATE STATISTICS [_dta_stat_661577395_3_1]
    ON [dbo].[code_value_lang]([sys_lang_id], [code_value_lang_id]);


GO
CREATE STATISTICS [_dta_stat_661577395_1_2]
    ON [dbo].[code_value_lang]([code_value_lang_id], [code_value_id]);


GO
CREATE STATISTICS [_dta_stat_661577395_2_3_1]
    ON [dbo].[code_value_lang]([code_value_id], [sys_lang_id], [code_value_lang_id]);

